#!/bin/bash

includes="-I/sshfs/lithium/web/perl
          -I/sshfs/lithium/web/housing/perl 
          -I/sshfs/lithium/web/epscor/perl"
for file in "$@"; do perl -c $includes $file; done
