<?php
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
if(!$con) //if connection not established
{
	die('Could not connect: '.mysqli_error($con));
}
$username = mysqli_real_escape_string($con,$_GET['registerUsername']);
$password = mysqli_real_escape_string($con,$_GET['registerPassword']);

mysqli_select_db($con,'IDP')or die('cannot select db');

$finduser = "select * from users where username='$username' and password='$password';";
$results = mysqli_query($con,$finduser);
$count = mysqli_num_rows($results);
if($count == 1)
{
	mysqli_close($con);
	$array = ["Logged in"=>"Not Logged in","session_id"=>NULL];
	echo json_encode($array);
	session_destroy();
}
else
{
$newuser = "insert into users (username,password,masterUserID,masterPassword,childrenPriv,childrenIDP,childrenBehHist,childrenDesc,familySchedPriv,behaviorPriv,conRewPriv) values('$username','$password','$username','$password',2,TRUE,TRUE,TRUE,2,2,2);";
mysqli_query($con,$newuser)or die('error submitting to database: '.mysqli_error($con));
$finduser = "select * from users where username='$username' and password='$password';";
$results = mysqli_query($con,$finduser);
$count = mysqli_num_rows($results);

mysqli_close($con);
if($count == 1)
{
	$_SESSION['username'] = $username;
	$_SESSION['password'] = $password;
	$array = ["Logged in"=>"Logged in","session_id"=>session_id()];
	echo json_encode($array);
}
else
{
	$array = ["Logged in"=>"Not Logged in","session_id"=>NULL];
	echo json_encode($array);
	session_destroy();
}
}



?>
