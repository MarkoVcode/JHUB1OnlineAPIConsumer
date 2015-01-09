#!/usr/bin/perl
use strict;
use Data::Dumper;
use LWP::UserAgent;
use OAuthSimple;

my $url = "http://192.168.56.30:8189/api/v1/direct/edc_address0/mySensor/23";

my $oauth = new OAuthSimple("edc_this-is-my-user-key", "edc_this-is-my-user-secret-key");
$oauth->setAction("POST");
$oauth->setURL($url);
my $signElems = $oauth->sign();


print(Dumper($signElems));

my $ua = LWP::UserAgent->new;
 
# set custom HTTP request header fields
my $req = HTTP::Request->new(POST => $url);
#$req->header('content-type' => 'application/json');
$req->header('Authorization' => $signElems->{header});

#print(Dumper($req));

 
# add POST data to HTTP request body
#my $post_data = '{ "name": "Dan", "address": "NY" }';
#$req->content($post_data);
 
my $resp = $ua->request($req);
if ($resp->is_success) {
    my $message = $resp->decoded_content;
    print "Received reply: $message\n";
}
else {
    print "HTTP POST error code: ", $resp->code, "\n";
    print "HTTP POST error message: ", $resp->message, "\n";
}







#print(Dumper($oauth));


#print(Dumper($signElems));
