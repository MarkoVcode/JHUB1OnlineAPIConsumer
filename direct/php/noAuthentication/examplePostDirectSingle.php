<?php
$url = 'http://192.168.56.30:8189/api/v1/direct/edc_address0/mySensor/23424234'; // this is the URL of the request

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                   $r = curl_exec($ch);
	curl_close($ch);

echo "\n---JSON RESPONSE FROM JHUB1 Online---\n\n";
echo $r;
echo "\n\n-------------------------------------\n";
?>
