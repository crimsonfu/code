#!/usr/bin/perl
use strict;
use warnings;
use RPC::XML::Client;
use Data::Dumper;

my $cli = RPC::XML::Client->new('http://cobbler/cobbler_api');

if (@ARGV) {

    my $query = $ARGV[0];
    my $host_ref = $cli->simple_request( 'get_system', $query );

    if ( $host_ref eq qw{~} ) {
        print "Error: couldn't find host \"$query\"\n";
        exit 1;
    }

    #print Dumper $host_ref;

    my $profile        = ${$host_ref}{'profile'};
    my $virt_file_size = ${$host_ref}{'virt_file_size'};
    my $eth0ip         = ${$host_ref}{'interfaces'}{'eth0'}{'ip_address'};
    my $eth0mac        = ${$host_ref}{'interfaces'}{'eth0'}{'mac_address'};
    my $eth0bridge     = ${$host_ref}{'interfaces'}{'eth0'}{'virt_bridge'};
    print
"$query $profile eth0: ip: $eth0ip mac: $eth0mac bridge: $eth0bridge virt_file_size: $virt_file_size\n";
}
else {
    my $resp = $cli->simple_request('get_systems');
    my %hash = map { $_->{'name'} => $_ } @{$resp};

    # print Data::Dumper->Dump([\%hash], [qw(*hash)]);

    for my $system ( sort keys %hash ) {
        my $virt_type = $hash{$system}->{'virt_type'};
        my $eth0ip    = $hash{$system}->{'interfaces'}{'eth0'}{'ip_address'}
          || 'UNKNOWN';
        my $eth0mac = $hash{$system}->{'interfaces'}{'eth0'}{'mac_address'}
          || 'UNKNOWN';
        printf( "%-11s %-16s %-18s %s\n",
            $virt_type, $eth0ip, $eth0mac, $system );
    }
}
