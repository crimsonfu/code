#!/usr/bin/env perl
use strict;
use warnings;
use v5.10;
use Data::Dumper;
use YAML;
use JSON;

# declare some variables
#
# thanks to autovivification, we don't need to concern ourselves
# with defining up front what we are going to put into them
# http://en.wikipedia.org/wiki/Autovivification
#
my $data1;
my $data2;
my $data3;
my $data4;

while ( my $line = <> ) {

    my ( $id, $pri, $type ) = split( /\s/, $line );

    # in $data1, build a hash, counting how many of each type
    $data1->{$type}++;

    # in $data2, build a hash of arrays with id's for each type
    push @{ $data2->{$type} }, $id;

    # in $data3, combine all data above into one data structure
    $data3->{counts}{$type}++;
    push @{ $data3->{id_by_type}{$type} }, $id;

    # in data4, build a simple array of all id's
    push @$data4, $id;
}

my $final = [ $data1, $data2, $data3, $data4 ];

say to_json($final);
