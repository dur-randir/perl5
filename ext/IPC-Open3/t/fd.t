#!./perl

BEGIN { require "../../t/test.pl"; }
use strict;
use warnings;

plan 1;

# [perl #76474]
ok !runperl(
     switches => ['-MIPC::Open3', '-w'],
     prog => 'open3(q _<&1_, my $out, undef, $ENV{PERLEXE})',
     stderr => 1,
   ),
   "dup STDIN in a child process by using its file descriptor";
