#!/usr/bin/perl
use strict;
use Data::Dumper;
use LWP::UserAgent;
use OAuthSimple;

my $url = "http://192.168.56.30:8189/api/v1/direct/edc_address0";
my $key = "edc_this-is-my-user-key";
my $secret = "edc_this-is-my-user-secret-key";

my $oauth = new OAuthSimple($key, $secret);
$oauth->setAction("POST");
$oauth->setURL($url);
my $signElems = $oauth->sign();

print(Dumper($signElems));

my $ua = LWP::UserAgent->new;
 
# set custom HTTP request header fields
my $req = HTTP::Request->new(POST => $url);
$req->header('content-type' => 'application/json');
$req->header('Authorization' => $signElems->{header});

# add POST data to HTTP request body
my $post_data = '{"values": [{ "name": "name01", "value": "11" },{ "name": "name02", "value": "32" }]}';
$req->content($post_data);
 
my $resp = $ua->request($req);

print "\n---JSON REQUEST TO JHUB1 Online------\n\n";
print $post_data;
print "\n\n---JSON RESPONSE FROM JHUB1 Online---\n\n";
print $resp->decoded_content;
print "\n\n-------------------------------------\n";
