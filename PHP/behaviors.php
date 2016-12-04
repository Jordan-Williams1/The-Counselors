<?php
//echo $test;
$json = json_decode($_POST['json'],true);
session_id($json['session_ID']);
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
$username = $_SESSION['username'];
$password = $_SESSION['password'];
$array = $json;

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