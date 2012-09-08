#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

my @solutions = qw{
  pdurbin.pl
  pdurbin.rb
};

my $num_tests = scalar @solutions;

done_testing($num_tests);

my $expected = `cat t/expected.txt`;

my $got;

for my $solution (@solutions) {
    $got = `./$solution t/input.txt | python -m json.tool`;
    is( $got, $expected, $solution );
}
