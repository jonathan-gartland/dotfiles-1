#!/usr/local/bin/perl

# ----------------------------------------------------------------------
#   050621 rea  Added code to "purge recyclebin" when clearing db.
#   050316 rea  Added print of import cmd when debuging.
#		Also added capability of filter to match/replace multiple cases
#		on a single line.
#   031209 rea  updated "new" and "filter_db" routines to use filter_tblsp_map
#   031113 rea  Untested namespace change and fork instead of bg system call.
#   031024 rea  Changed filter code to alter the linein variable so 
#		that multiple changes could be made on a single input line.
#		Added ORDER BY to clear_db object select to fix order
#		conflicts during cleanup.
#   031023 rea  Added hardcoded tablespace names for SPEDIS.
#   031010 rea  Added options: nolog, noconsistent, no2Glimit, debug
#		added import options of "grants=n touser=$username"
#		added filter command that does tablespace mapping
#TODO: Consider Adding USER mapping to "filter" (mainly needed for triggers).
#		should fix triggers reference the OLD user name.
#NOTE: DBA user dumps require DBA user import?

#   031009 rea  Changed to using fifo (named pipe) in export & import to:
#		avoid duplicating data space
#		so I don't have to change the export at all only import.
#		Set error logs to print to STDERR.
#   031008 rea  Added auto gzip, consistent=y and 2G limit
#		made sure exp request for input is NOT a hang by </dev/null
#		Should the default behavior be to display LOG file? in html?
#   031001 rea	modified to run on Fusion from /usr/local/bin/perl
#		All work done in export:
#		  logs errors instead of running in the	background.  
#		  prints error log if return value bad.
#		  made oracle_connect accept return as default for this system
#   030930 rea@sr.unh.edu	Modified to prompt for arguments
# Original coding by Phil Collins.
# ----------------------------------------------------------------------

package rea::Oracle::Snapshot;

=head1 NAME

rea::Oracle::Snapshot - import, export, clone databases

=head1 SYNOPSIS

 # command shell usage
  .../OraSnapshot.pm  clear  oracle_connect username password

  .../OraSnapshot.pm  import oracle_connect username password

  .../OraSnapshot.pm  export oracle_connect username password

  .../OraSnapshot.pm  clone src_oracle_connect src_username src_password \
                      dest_oracle_connect dest_username dest_password

 # perl module usage

  use rea::Oracle::Snapshot;

  # all will throw meaningful exceptions on errors
  my $o = rea::Oracle::Snapshot->new({ debug => 1 });
  $o->clear_db  ($connect, $user, $password);
  $o->import_db ($connect, $user, $password, $file);
  $o->export_db ($connect, $user, $password, $file);
  $o->clone_db  ($src_connect,  $src_user,  $src_password,
                 $dest_connect, $dest_user, $dest_password);

 # notes

  Command line usage with only one argument prompts for the other arguments
  
  An empty connect string uses the default connect.

  An export filename ending in .gz is automatically compressed with gzip. 

  Options include: -verbose, -debug, -nolog, -noconsistent, -no2Glimit
		   -tables tbl,tbl2

=cut

use DBI;
use IO::File;
use strict;
# use warnings;

my @valid_options =
    ( 'verbose', 'debug', 'nolog', 'no2Glimit','noconsistent','tables' );

# -------------------- new --------------------
sub new {
  my $pack = shift;
  my $opts = shift || {};

  foreach my $k ( @valid_options ) {
      $opts->{ $k } ||= 0;
  }

  $opts->{filter_tblsp_map} ||= {};	# tablespace hash: old key -> new value

  return bless $opts, $pack;
}

# -------------------- clone_db --------------------
sub clone_db {
  my $o = shift;
  die "invalid number of arguments\n" if $#_ != 5;

  my $source_oracle_connect = shift || die "please provide a source connect";
  my $source_username = shift || die "please provide a source username";
  my $source_password = shift || die "please provide a source password";
  my $destination_oracle_connect = shift || die "please provide a dest connect";
  my $destination_username = shift || die "please provide a dest username";
  my $destination_password = shift || die "please provide a dest password";

  my $tmp_filename = "/tmp/DBUTIL_".$$."_TMP.dmp.gz"; 
  $o->export_db($source_oracle_connect, $source_username, 
              $source_password, $tmp_filename);
  $o->import_db($destination_oracle_connect, $destination_username, 
              $destination_password, $tmp_filename);
  unlink $tmp_filename;

  return undef;
}
# ------------------------- export_db -------------------------
sub export_db {
  my $o = shift;
  die "invalid number of arguments\n" if $#_ != 3;

  my $oracle_connect = shift;
  my $username = shift || die "please supply username";
  my $password = shift || die "please provide a password";
  my $filename = shift || die "please provide a filename";

  my $tmp_file = "/tmp/DBUTIL_".$$.".fifo";
  unlink $filename;

  my $use_file = $filename;

  if( $filename =~ /.gz\Z/i ) {
      unlink $tmp_file;
      system( 'mkfifo', $tmp_file )
	  && die "can't mkfifo $tmp_file: $!";
      system( "gzip -c < $tmp_file > $filename \&" )
	  && die "can't gzip $tmp_file to $filename: $!";
      $use_file = $tmp_file;
  }

  my $cmd = "exp $username/$password";
  $cmd .= "\@$oracle_connect " if( defined($oracle_connect)
				   && "$oracle_connect" ne '' );
  $cmd .= " < /dev/null ";	# added to force error on input requests
  $cmd .= " file=$use_file ";   # I don't know how to make this go to stdout
  
  $cmd .= " rows=Y grants=Y compress=Y indexes=Y ";
  $cmd .= " consistent=Y " unless( $o->{'noconsistent'} );
  $cmd .= " filesize=2G " unless( $o->{'no2Glimit'} );
  $cmd .=
      ( $o->{'tables'} )
	  ? " tables=\\($o->{'tables'}\\)  "
	  : " owner=$username ";

  print STDERR "export cmd = $cmd\n" if( $o->{'debug'} );

  my $logfile = $filename . '.log';
  $cmd .= " 2> $logfile" unless $o->{'verbose'};  

  my $rv = system ($cmd);

  if( ! $o->{'verbose'} && $rv != 0 ) {
      print STDERR "Command was:\n$cmd\n\n";
      print STDERR "Logfile follows:\n\n";
      open (LOG, "<$logfile");
      print STDERR "$_\n" while ( <LOG> );
  }

  die "oracle export returned $rv\n" if( $rv != 0 );

  die "could not find exported file after oracle export\n"
      unless( -f $filename );

  unlink $tmp_file or die "could not delete stale export fifo\n";

  unlink $logfile or die "could not delete log of export\n"
      if ( $o->{'nolog'} );

  return undef;
}

# ------------------------- import_db -------------------------
sub import_db {
  my $o = shift;
  die "invalid number of arguments\n" if $#_ != 3;

  my $oracle_connect = shift;
  my $username = shift || die "please provide a username";
  my $password = shift || die "please provide a password";
  my $filename = shift || die "please provide a filename";

  die "could not find import file!\n" unless( -f $filename );

  $o->clear_db($oracle_connect,$username,$password);


  my $tmp_file = "/tmp/DBUTIL_".$$.".fifo";

  my $use_file = $tmp_file;
  
  unlink $tmp_file;

  system( 'mkfifo', $tmp_file )
      && die "can't mkfifo $tmp_file: $!";

#fork here

  my $childpid = fork();

  if ( $childpid == 0 ) {	# If I'm the child

      my $inpipe;
      if( $filename =~ /.gz\Z/i ) {
	  $inpipe .= "gzip -cd $filename |";
      } else {
	  $inpipe .= "< $filename";
      }
      
      my $outfile = "> $tmp_file";
      
      print STDERR "child import filter: IN: $inpipe OUT: $outfile\n"
	  if( $o->{'debug'} );

      my $inFH = new IO::File;
      my $outFH = new IO::File;
      $inFH->open( $inpipe )
	  or die "CHILD INPUT $inpipe: $!";
      $outFH->open( $outfile )
	  or die "CHILD OUTPUT $outfile: $!";

      $o->filter_db( $inFH, $outFH );

      $outFH->close();
      $inFH->close();
      exit 0;	# The child process has completed its role.
  }  

  $use_file = $tmp_file;

  my $cmd = "imp $username/$password";
  $cmd .= "\@$oracle_connect " unless( "$oracle_connect" eq '' );
  $cmd .= " < /dev/null ";
  $cmd .= " file=$use_file "; 
  $cmd .= " grants=n touser=$username ";
   
# TODO: add foruser= hook to this and only do full=y if below or new NOT set.
  $cmd .= 
      ( $o->{'tables'} )
	  ? " tables=\\($o->{'tables'}\\)  "
	  : " full=y ";

  my $logfile = $filename . '.import.log';
  $cmd .= " 2> $logfile" unless $o->{'verbose'};  

  print STDERR "import cmd = $cmd\n" if( $o->{'debug'} );

  my $rv = system ($cmd);
  kill(9, $childpid); 

  if( ! $o->{'verbose'} && $rv != 0 ) {
      print STDERR "Command was:\n$cmd\n\n";
      print STDERR "Logfile follows:\n\n";
      open (LOG, "<$logfile");
      print STDERR "$_\n" while ( <LOG> );
  }

  die "oracle import returned $rv\n" if( $rv != 0 );

  unlink $tmp_file or die "could not delete stale import fifo\n";
  
  unlink $logfile or die "could not delete log of import\n"
      if ( $o->{'nolog'} );

  return undef;
}

# ------------------------- clear_db -------------------------
# clear all data owned by oracle user
sub clear_db {
  my $o = shift;
  die "invalid number of arguments\n" if $#_ != 2;

  my $oracle_connect = shift;
  my $username = shift || die "please provide a username";
  my $password = shift || die "please provide a password";

  my $dbh = DBI->connect( "dbi:Oracle:" . $oracle_connect,
			  $username, $password,
			  {PrintError => 1, RaiseError => 1, AutoCommit => 1});
  die "could not instantiate dbh for user $username\n" if ! $dbh;

  # Removes all the previously dropped tables so we don't attempt to drop bin$*
  $dbh->do("purge recyclebin");

  # drop everything
  my $sth = $dbh->prepare("
    SELECT object_name, object_type 
    FROM user_objects
    WHERE object_type NOT IN ('INDEX','LOB','PACKAGE BODY')
    ORDER BY DECODE (object_type,
      'TRIGGER',1,
      'SYNONYM',2, 'VIEW',2,
      'PACKAGE',3,
      'PROCEDURE',4,
      'FUNCTION',5,
      99)");

  $sth->execute();
  while ( my ($name, $type) = $sth->fetchrow_array()) {
    my $sql = "DROP $type $name";
    $sql .= " CASCADE CONSTRAINTS" if ($type eq "TABLE");
    print "$sql\n" if $o->{'verbose'};
    $dbh->do($sql);
  }
  $sth->finish();

  # Removes all the tables dropped above from the recyclebin.
  $dbh->do("purge recyclebin");

  # make sure everything is gone
  my ($count) = $dbh->selectrow_array("SELECT count(*) FROM user_objects");
  $dbh->disconnect();
  die "clear_db found $count objects after removing them all!" if $count > 0;

  return undef;
}

# ------------------------- filter_db -------------------------
# clear all data owned by oracle user
sub filter_db {
  my $o = shift;
  # die "invalid number of arguments\n" if $#_ != 1;
  my $inFH = shift;
  my $outFH = shift;

#   $inFH = STDIN unless( defined( $inFH ) );
#   $outFH = STDOUT unless( defined( $outFH ) );
  
  my $tblsp_map = $o->{filter_tblsp_map};

  my $linein;
  while( $linein = <$inFH> ) {
      if ( $linein =~ /\A(alter|create)/i ) {
	  my $newline = '';  # We must ensure that "$inline" ends up here.

	  while( $linein ne '' ) {
	      if ( $linein =~ /tablespace \"(\w+)\"/i ) {
		  $newline .= $`;		# line upto match
		  if( $o->{'debug'} ) {
		      print STDERR "(ALTER|CREATE) ... $&";
		      if( exists( $tblsp_map->{$1} ) ) {
			  print STDERR " -> $tblsp_map->{$1}\n";
		      } else {
			  print STDERR " -> <DEFAULT>\n";
		      }
		  }
		  $newline .= 'TABLESPACE "' . $tblsp_map->{$1} . '"'
		      if( exists( $tblsp_map->{$1} ) ); 
		  $linein = "$'";
	      } else { # no tablespace "X" found.
		  $newline .= $linein;
		  $linein = '';
	      }
	  }

	  # The idea here is to leave "$linein" such that other match/replaces
	  # could be done, if we ever needed them.
	  $linein = $newline;

      } # (alter|create) ...

      print $outFH $linein;
  }

  return undef;
}

# ------------------------- 1 -------------------------
# end of module lib routines
return 1 if caller;

package main;
# rea? TODO		use warnings;
use strict;

# ------------------------- print_help -------------------------
# print usage
sub print_help {
  print "
USAGE: 
------
$0 <options> clear oracle_connect username password 

$0 <options> import oracle_connect username password filename

$0 <options> export oracle_connect username password filename

$0 <options> clone
    source_oracle_connect        source_username        source_password \
    destination_oracle_connect   destination_username   destination_password

<options>
  -verbose	print out SQL and import/export LOG.
  -debug	print out commands and pipes when they are run
  -nolog        do not leave .log AND/OR .import.log files behind
  -no2Glimit	allow the export of files larger than 2GB (before gzip)
  -noconsistent Do not attempt consistent DB export (saves ?rollback? space)
  -tables t1,t2:p2,t3	Comma seperated list of tables ( :partition )
\n";
  return undef;
}

# ------------------------- main -------------------------

my $o = rea::Oracle::Snapshot->new();

# list methods that are allowed to be called
my %allowable_methods = (
  'clone' => 'clone_db',
  'export' => 'export_db',
  'import' => 'import_db',
  'clear' => 'clear_db',
  'filter' => 'filter_db'
);

# handle optional options
my %validOptions = map { ( '-'.$_ => $_ ) }  @valid_options;
while (defined $ARGV[0] && exists( $validOptions{$ARGV[0]} ) ) {
    $o->{ $validOptions{$ARGV[0]} } = 1;
    if( $ARGV[0] =~ /-tables/i ) {
	$o->{ $validOptions{$ARGV[0]} } = $ARGV[1];
	shift @ARGV;
    }
    shift @ARGV;
} 

# dispatch command
my $cmd = shift @ARGV;
if (defined $cmd && exists $allowable_methods{$cmd}) {
  my $method = $allowable_methods{ $cmd };
  eval {
      my @meth_args = ( @ARGV );

      if ( $#meth_args == -1 ) { # only the command was given
	  if ( $cmd eq 'clear' ) {
	      push( @meth_args,
		    &prompt_with_default( 'oracle_connect' ), 
		    &prompt_with_default( 'username to clear' ),
		    &prompt_with_default( 'password', undef, {noecho=>1} ) );
	  } 
	  if ( $cmd eq 'export' || $cmd eq 'clone'  ) {
	      push( @meth_args,
		    &prompt_with_default( 'read from oracle_connect'),
		    &prompt_with_default( 'read from username'),
		    &prompt_with_default( 'read from password', undef,
					  {noecho=>1} ) );
	  }
	  if ( $cmd eq 'import' || $cmd eq 'clone'  ) {
	      push( @meth_args,
		    &prompt_with_default( 'overwrite oracle_connect' ),
		    &prompt_with_default( 'overwrite username' ), 
		    &prompt_with_default( 'overwrite password', undef,
					  {noecho=>1} ) );
	  }
	  if ( $cmd eq 'export' || $cmd eq 'import'  ) {
	      push @meth_args, &prompt_with_default( "$cmd filename" );
	  }
      }

      $o->$method( @meth_args );
  };
  if ($@) {
    my $err = $@;
    unlink "/tmp/DBUTIL_".$$."_TMP*";
    print STDERR "ERROR:\n$@\n\n";
    &print_help if $err =~ /invalid\ number\ of\ arguments/;
  }
} else {
    print STDERR "command \"$cmd\" not recognized\n" if( defined( $cmd ) );
    &print_help;
}

print STDERR "Normal Termination.\n" if $o->{'debug'};


# ------------------------- prompt_with_default -------------------------
sub prompt_with_default ($;$$) {
    my ($prmpt, $dflt, $opts) = @_;
   
    print "$prmpt";
    print "[$dflt]" if (defined $dflt);
    print ':  ';

    system "stty -echo" if( defined( $opts ) && exists( $opts->{noecho} ) );

    my $input = <STDIN>;
    chomp $input;

    if( defined( $opts ) && exists( $opts->{noecho} ) ) {
	system "stty echo";
	print "\n";
    }

    $input = $dflt 
        if ( defined $dflt && ! defined($input) || $input eq '' );

    return $input;
}
