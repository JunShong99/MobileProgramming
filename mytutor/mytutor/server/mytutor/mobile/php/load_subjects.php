<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$results_per_page = 5;
$pageno = (int)$_POST['pageno'];
$search = $_POST['search'];

$page_first_result = ($pageno - 1) * $results_per_page;

$sqlloadsubject = "SELECT * FROM tbl_subjects WHERE subject_name LIKE '%$search%'";
$result = $conn->query($sqlloadsubject);
$number_of_result = $result->num_rows;
$number_of_page = ceil($number_of_result / $results_per_page);
$sqlloadsubject = $sqlloadsubject . " LIMIT $page_first_result , $results_per_page";
$result = $conn->query($sqlloadsubject);

if ($result->num_rows > 0) {
    //do something
    $subjects["subjects"] = array();
    while ($row = $result->fetch_assoc()) {
        $subjectlist = array();
        $subjectlist['subject_id'] = $row['subject_id'];
        $subjectlist['subject_name'] = $row['subject_name'];
        $subjectlist['subject_description'] = $row['subject_description'];
        $subjectlist['subject_price'] = $row['subject_price'];
        $subjectlist['tutor_id'] = $row['tutor_id'];
        $subjectlist['subject_sessions'] = $row['subject_sessions'];
        $subjectlist['subject_rating'] = $row['subject_rating'];
        array_push($subjects["subjects"],$subjectlist);
    }
    $response = array('status' => 'success', 'pageno'=>"$pageno",'numofpage'=>"$number_of_page", 'data' => $subjects);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'pageno'=>"$pageno",'numofpage'=>"$number_of_page", 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>
