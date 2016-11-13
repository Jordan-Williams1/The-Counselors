<?php
session_start();
$username = $_POST['registerUsername'];
$password = $_POST['registerPassword'];

$username = mysqli->real_escape_string($username);
$username = mysqli->real_escape_string($password);

$con = mysqli_connect('localhost','ubuntu','ITC4602016');
if(!$con) //if connection not established
{
	die('Could not connect: '.mysql_error());
}

mysql_select_db('IDP')or die('cannot select db');

$newuser = "insert into users(userID,username,password,masterUserID) values(@lastIDUserTable+1,'$username','$password');";
mysql_query($newuser)or die('error submitting to database: '.mysql_error());
$LastID = "SET @lastIDUserTable = LAST_INSERT_ID();"
mysql_query($newuser)or die('error submitting to database: '.mysql_error());
mysql_close($con);
$_SESSION['error'] = '';
$_SESSION['account'] = 'Your account has been created!';
header("location:index.php");
?>
