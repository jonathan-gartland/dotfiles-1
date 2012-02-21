#!/usr/bin/perl

use lib '/web/perl';
use lib '/web/layout/perl';
use lib '/web/housing/perl';
use lib '/web/epscor/perl';

use lib '/sshfs/lithium/usr/lib/perl5/site_perl';
use lib '/sshfs/lithium/web/perl';
use lib '/sshfs/lithium/web/housing/perl';
use lib '/sshfs/lithium/web/epscor/perl';

my $rv = 0;

for (@ARGV) {
  if (-f $_) {
    $rv = require $_;
  }
  elsif (-d $_) {
    foreach my $fn (`find ./ -name '*.pm'`) {
      chomp $fn;
      $rv = require $fn;
    }
  }
}

exit $rv;
