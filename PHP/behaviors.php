<?php
//echo $test;
session_id($_GET['sessionID']);
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
$username = $_SESSION['username'];
$password = $_SESSION['password'];
$json = json_decode($_SESSION['Pparams'],true);
$array = $json

if(!$con) //if connection not established
{
	die('Could not connect: '.mysqli_error($con));
}

mysqli_select_db($con,'IDP')or die('cannot select db');
$finduser = "select * from users where username='$username' and password='$password';";
$results = mysqli_query($con,$finduser);
$userArray = $results->fetch_row();
$count = mysqli_num_rows($results);

if($count == 1)
{
	$array = ["session_id"=>session_id()];
	$array["behaviors"] = $_SESSION["behaviors"];
	echo json_encode($array);
}
else
{
	session_destroy();
}

?>