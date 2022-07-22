<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$email = addslashes($_POST['email']);
$name = addslashes($_POST['name']);
$number = $_POST['number'];
$password = sha1($_POST['password']);
$address = $_POST['address'];
$otp = rand(10000,99999);
$base64image = $_POST['image'];
$sqlinsert = "INSERT INTO `tbl_infor`(`user_email`, `user_name`, `user_number`, `user_password`, `user_address`,`user_otp`) VALUES ('$email','$name','$number','$password','$address','$otp')";

if ($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    $filename = mysqli_insert_id($conn);
    $decoded_string = base64_decode($base64image);
    $path = '../assets/products/' . $filename . '.jpg';
    $is_written = file_put_contents($path, $decoded_string);
    sendMail($email,$otp,$password);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}


function sendMail($tutoremail,$otp,$pass){
    $to = $tutoremail;
    $subject = "myTutor";
    $message = "
    <html>
    <head>
    <title></title>
    </head>
    <body>
    <h3>Thank you for your registration - PLEASE DO NOT REPLY TO THIS EMAIL</h3>
    <p></p><br><br>
        <a href='https://angrycomii.com/mytutor/mobile/php/verify.php?email=$tutoremail&otp=$otp'>Click here to verify your account</a><br><br>
    </p>
    <table>
    <tr>
    <th>Your Email</th>
    <th>Key/Password</th>
    </tr>
    <tr>
    <td>$tutoremail</td>
    <td>$pass</td>
    </tr>
    </table>
    <br>
    <p>TERMS AND CONDITION <br>Single license for the person who made the purchase. The publication and it resources are protected by Copyright law. No part of this publication may be reproduced, 
        shared, distributed, or transmitted in any form or by any means, including, photocopying, recording, or other electronic or mechanical methods with 
        the prior written permission of the author. By downloading this copy you are agreeing to the terms and conditions and can be subjected to law if violated and permanent ban from accessing the resource</p>
    </body>
    </html>
    ";
    
    // Always set content-type when sending HTML email
    $headers = "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
    
    // More headers
    $headers .= 'From: <shaun@angrycomii.com>' . "\r\n";
    
    mail($to,$subject,$message,$headers);
}


?>

