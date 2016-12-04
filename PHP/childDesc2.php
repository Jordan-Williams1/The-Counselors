<?php
//echo $test;
session_id($_GET['sessionID']);
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
$username = $_SESSION['username'];
$password = $_SESSION['password'];

