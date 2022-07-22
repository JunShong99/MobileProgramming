<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$email = $_POST['email'];
$password = sha1($_POST['password']);
$otp = '1';
$sqllogin = "SELECT * FROM tbl_infor WHERE user_email = '$email' AND user_password = '$password' AND user_otp='$otp'";
$result = $conn->query($sqllogin);
$numrow = $result->num_rows;

if ($numrow > 0) {
    while ($row = $result->fetch_assoc()) {

        $admin['user_id'] = $row['user_id'];
        $admin['email'] = $row['user_email'];
        $admin['name'] = $row['user_name'];
        $admin['number'] = $row['user_number'];
        $admin['password'] = $row['user_password'];
        $admin['address'] = $row['user_address'];
        $admin['otp'] = $row['user_otp'];

    }
    $response = array('status' => 'success', 'data' => $admin);
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

?>