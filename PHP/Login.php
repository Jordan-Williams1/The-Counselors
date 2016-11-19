<?php
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
$username = mysqli_real_escape_string($con,$_GET['loginUsername']);
$password = mysqli_real_escape_string($con,$_GET['loginPassword']);



if(!$con) //if connection not established
{
	die('Could not connect: '.mysqli_error($con));
}

mysqli_select_db($con,'IDP')or die('cannot select db');
$finduser = "select * from users where username='$username' and password='$password';";
$results = mysqli_query($con,$finduser);
$count = mysqli_num_rows($results);

mysqli_close($con);
if($count == 1)
{
	$_SESSION['username'] = $username;
	$_SESSION['password'] = $password;
	echo $_SESSION['username'];
	echo $_SESSION['password'];
	echo "Logged in";
}
else
{
	echo "Invalid username or password";
	session_destroy();
}
?>