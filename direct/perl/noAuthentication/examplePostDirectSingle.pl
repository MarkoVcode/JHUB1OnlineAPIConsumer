#!/usr/bin/perl
use strict;
use Data::Dumper;
use LWP::UserAgent;

my $url = "http://192.168.56.30:8189/api/v1/direct/edc_address0/mySensor/23";

my $ua = LWP::UserAgent->new;
 
# set custom HTTP request header fields
my $req = HTTP::Request->new(POST => $url);

my $resp = $ua->request($req);

print "\n---JSON RESPONSE FROM JHUB1 Online---\n\n";
print $resp->decoded_content;
print "\n\n-------------------------------------\n";
