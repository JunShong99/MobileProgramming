<?php
error_reporting(0);

$email = $_GET['email'];
$name = $_GET['name']; 
$mobile = $_GET['mobile']; 
$amount = $_GET['amount'];
$status="Order Confirmed";


$api_key='a83a07e4-0a7c-4f82-a356-93e57d349af8';
$collection_id='q9lnsah3';
$host='https://www.billplz-sandbox.com/api/v3/bills';

$data = array(
    'collection_id' => $collection_id,
    'email' => $email,
    'name'=> $name,
    'mobile'=> $mobile,
    'amount' => ($amount + 1) * 100, // RM20
	'description' => 'Payment for order by '.$name,
    'callback_url' => "http://angrycomii.com/mytutor/mobile/php/return_url",
    'redirect_url' => "http://angrycomii.com/mytutor/mobile/php/payment_update.php?email=$email&mobile=$mobile&amount=$amount&name=$name", 
    );
    
$process = curl_init($host);
curl_setopt($process, CURLOPT_HEADER, 0);
curl_setopt($process, CURLOPT_USERPWD, $api_key . ":");
curl_setopt($process, CURLOPT_TIMEOUT, 30);
curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($process, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($process, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($process, CURLOPT_POSTFIELDS, http_build_query($data) );

$return = curl_exec($process);
curl_close($process);

$bill = json_decode($return, true);

echo "<pre>".print_r($bill,true)."</pre>";
header("Location:{$bill['url']}");

?>































