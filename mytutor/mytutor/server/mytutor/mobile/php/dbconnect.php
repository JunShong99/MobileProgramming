<?php
$servername = "localhost";
$username   = "angrycom_mytutor_admin";
$password   = "Jn121625@@";
$dbname     = "angrycom_mytutor";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>