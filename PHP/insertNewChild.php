<?php
$jsonC = json_decode($_POST['json'],true);
echo $jsonC;
session_id($jsonC['params']['session_ID']);
session_start();
$con = mysqli_connect('localhost','root','ITC4602016');
$username = $_SESSION['username'];
$password = $_SESSION['password'];
$_SESSION['consequences'] = $jsonC;

//echo json_encode($jsonC);

$child1 = $_SESSION["childDesc1"];
$child2 = $_SESSION["childDesc2"];

mysqli_select_db($con,'IDP')or die('cannot select db');

$finduser = "select * from users where username='$username' and password='$password';";
$results = mysqli_query($con,$finduser);
$count = mysqli_num_rows($results);
if($count ~= 1)
{
	mysqli_close($con);
	$array = ["Logged in"=>"Not Logged in","session_id"=>NULL];
	echo json_encode($array);
	session_destroy();
}
else
{
$newChild = "INSERT INTO child (username,password,name,age,grade,ExtrovertIntrovert,OutgoingShy,LeaderFollower,ActiveCalm,PlannerImpulsive,CaringUncaring,PersonalityNotes,Strengths,Weaknesses,MaturityLevel,Interests,DisciplineWorked,DisciplineNotWorked) values($child1[0],$child1[1],$child1[2],$child1[3],$child1[4],$child1[5],$child1[6],$child1[7],$child1[8],$child2[0],$child2[1],$child2[2],$child2[3],$child2[4],$child2[5]);"

mysqli_query($con,$newChild)or die('error submitting to database: '.mysqli_error($con));

//$latestChild = mysqli_insert_id($con);

//$newBehavior = "insert into behaviors (childID,desiredBehavior,problemBehavior) values ('$latestChild',)";

//mysqli_query($con,$newChild)or die('error submitting to database: '.mysqli_error($con));


mysqli_close($con);
echo json_encode($jsonC);
}



?>
