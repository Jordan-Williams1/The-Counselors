<?php
session_start();
$username = $_POST['registerUsername'];
$password = $_POST['registerPassword'];

$username = mysqli->real_escape_string($username);
$username = mysqli->real_escape_string($password);

$con = mysqli_connect('localhost','ubuntu','ITC4602016');
if(!$con) //if connection not established
{
	die('Could not connect: '.mysqli_error());
}

mysqli_select_db('IDP')or die('cannot select db');

$newuser = "INSERT INTO users (username,password,masterUserID,childrenPriv,childrenIDP,childrenBehHist,childrenDesc,familySchedPriv,behaviorPriv,conRewPriv)
 values('$username','$password','$username','$password',2,TRUE,TRUE,TRUE,2,2,2);";
mysqli_query($newuser)or die('error submitting to database: '.mysqli_error());
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
	echo "Invalid username or password";
	session_destroy();
}
?>
