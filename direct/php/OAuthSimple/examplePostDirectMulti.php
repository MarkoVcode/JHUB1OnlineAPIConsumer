<?php
    include ('./OAuthSimple.php');
$key = "edc_this-is-my-user-key"; // this is your consumer key
$secret = "edc_this-is-my-user-secret-key"; // this is your secret key
$url = 'http://192.168.56.30:8189/api/v1/direct/edc_address0'; // this is the URL of the request
    $oauth = new OAuthSimple($key,$secret);
    $sample2Results = $oauth->sign(Array('action'=>'POST',
                                         'path'=>$url,
                                         'parameters'=>null));
print_r($sample2Results);

$authHeader = "Authorization: " . $sample2Results['header'];

$data = array("values" => array(array("name" => "name", "value" => "value"),array("name" => "name", "value" => "value")));

/* JSON payload:
{
    "values":[
        {
            "name":"name",
            "value":"value"
        },
        {
            "name":"name",
            "value":"value"
        }
    ]
}
*/


$data_string = json_encode($data);  

$ch = curl_init();
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_URL, $sample2Results['signed_url']);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string); 
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    $authHeader,                                                             
    'Content-Type: application/json',                                                                                
    'Content-Length: ' . strlen($data_string))                                                                       
);
$r = curl_exec($ch);
curl_close($ch);

echo "\n---JSON REQUEST TO JHUB1 Online------\n\n";
echo $data_string;
echo "\n\n---JSON RESPONSE FROM JHUB1 Online---\n\n";
echo $r;
echo "\n\n-------------------------------------\n";
?>
