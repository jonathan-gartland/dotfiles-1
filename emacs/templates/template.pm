package XXX;

use strict;
use warnings "all";
use Data::Dumper;
use Carp;
use Exporter;
use Apache2::Const qw(:common);
use SQL::Abstract;
# use Lib::HCGS::AppLog::ApplicationLog;
# use Lib::HCGS::Util;

use base 'Exporter';
our $VERSION = "1.0";
our @EXPORT_OK = qw();

sub new {
    my $class  = shift;
    my $self   = bless {}, $class;
    my $module = __PACKAGE__;

    my $args = shift
      or croak "$module No Argument object provided!";

    $self->{args} = $args;
    ($self->{r}, $self->{dbh}, $self->{priv}, $self->{form}, $self->{html}, $self->{js}) = $args->allArgs();
    $self->{form_name} = '';
    $self->{sql} = SQL::Abstract->new();
    # $self->{applog} = Lib::HCGS::AppLog::ApplicationLog->new($args);
    # $self->{util} = Lib::HCGS::Util->new($self->{args});
    return $self;
}

sub execute {
    my ($self) = @_;
}

sub handler {
}

1;
