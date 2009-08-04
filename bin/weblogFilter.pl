#!/usr/bin/perl
use strict;

#if ( /132\.177\.241\.(?:84|35|86)/ )

while (<STDIN>)
{
    chomp;
    s/\\n/\n/g;
    s/\\t/\t/g;
    s/^\[[^\]]*\]\s*\[[^\]]*\]\s*\[[^\]]*\]\s*//;
    s/\,\ referer\:\ http\:.*$//;
    print $_."\n";
}
