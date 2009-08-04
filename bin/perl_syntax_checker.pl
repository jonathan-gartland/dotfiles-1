#!/usr/bin/perl
use lib '/usr/local/apache/lib/perl';
use lib '/webdev/events/api';
use lib '/web/seagrant-development/perl';
require '/usr/local/apache/conf/startup.pl';

my $rv = 0;

for (@ARGV) {
  if (-f $_) {
    $rv = require $_;
  }
  elsif (-d $_) {
    foreach my $fn (`find '$_' -name '*.pm'`) {
      chomp $fn;
      $rv = require $fn;
    }
  }
}

exit $rv;
