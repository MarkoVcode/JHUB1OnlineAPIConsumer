<?php
    include ('./OAuthSimple.php');
#error_reporting(E_ALL);

$key = "edc_this-is-my-user-keyqqqqqq"; // this is your consumer key
$secret = "edc_this-is-my-user-secret-key"; // this is your secret key
$url = 'http://192.168.56.30:8189/api/v1/direct/edc_address0/mySensor/23424234'; // this is the URL of the request


    $oauth = new OAuthSimple($key,$secret);
    $sample2Results = $oauth->sign(Array('action'=>'POST',
                                         'path'=>$url,
                                         'parameters'=>null));

print_r($sample2Results);

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_URL, $sample2Results['signed_url']);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
	$authHeader = "Authorization: " . $sample2Results['header'];
	curl_setopt($ch, CURLOPT_HTTPHEADER, array($authHeader));
	$r = curl_exec($ch);
	curl_close($ch);

echo "\n---JSON RESPONSE FROM JHUB1 Online---\n\n";
echo $r;
echo "\n\n-------------------------------------\n";
?>
