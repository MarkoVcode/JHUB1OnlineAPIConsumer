#!/usr/bin/perl
use strict;
use Data::Dumper;
use LWP::UserAgent;

my $url = "http://192.168.56.30:8189/api/v1/direct/edc_address0";

my $ua = LWP::UserAgent->new;
 
# set custom HTTP request header fields
my $req = HTTP::Request->new(POST => $url);
$req->header('content-type' => 'application/json');

# add POST data to HTTP request body
my $post_data = '{"values": [{ "name": "name01", "value": "11" },{ "name": "name02", "value": "32" }]}';
$req->content($post_data);
 
my $resp = $ua->request($req);

print "\n---JSON REQUEST TO JHUB1 Online------\n\n";
print $post_data;
print "\n\n---JSON RESPONSE FROM JHUB1 Online---\n\n";
print $resp->decoded_content;
print "\n\n-------------------------------------\n";
