<?php
//echo $test;
session_id($_GET['sessionID']);
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
$username = $_SESSION['username'];
$password = $_SESSION['password'];

$name = mysqli_real_escape_string($con,$_GET["cName"]);
$age = mysqli_real_escape_string($con,$_GET["cAge"]);
$grade = mysqli_real_escape_string($con,$_GET["cGrade"]);
$EI = mysqli_real_escape_string($con,$_GET["EI"]);
$OS = mysqli_real_escape_string($con,$_GET["OS"]);
$LF = mysqli_real_escape_string($con,$_GET["LF"]);
$AC = mysqli_real_escape_string($con,$_GET["AC"]);
$PI = mysqli_real_escape_string($con,$_GET["PI"]);
$CU = mysqli_real_escape_string($con,$_GET["CU"]);
$_SESSION["childDesc1"] = array($name,$age,$grade,$EI,$OS,$LF,$AC,$PI,$CU);

if(!$con) //if connection not established
{
	die('Could not connect: '.mysqli_error($con));
}

mysqli_select_db($con,'IDP')or die('cannot select db');
$finduser = "select * from users where username='$username' and password='$password';";
$results = mysqli_query($con,$finduser);
$userArray = $results->fetch_row();

if($count == 1)
{
	$array = ["session_id"=>session_id()];
	$array["childDesc1"] = $_SESSION["childDesc1"];
	echo json_encode($array);
}
else
{
	session_destroy();
}

?>