<?php
//echo $test;
session_id($_GET['sessionID']);
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
$username = $_SESSION['username'];
$password = $_SESSION['password'];

if(!$con) //if connection not established
{
	die('Could not connect: '.mysqli_error($con));
}

mysqli_select_db($con,'IDP')or die('cannot select db');
$finduser = "select * from users where username='$username' and password='$password';";
$results = mysqli_query($con,$finduser);
$userArray = $results->fetch_row();

$json = array();

$json["session_id"] = session_id();
$json["childPriv"] = $userArray[4];
$json["schedPriv"] = $userArray[8];
$json["behavPriv"] = $userArray[9];
$json["CRPriv"] = $userArray[10];

$masterU = $userArray[2];
$masterP = $userArray[3];

$findChild = "select * from child where username='$masterU' and password='$masterP';";
$results = mysqli_query($con,$finduser);
$count = 0;
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
      $json["children"][$count] = $row[3];
}

echo json_encode($json);

?>