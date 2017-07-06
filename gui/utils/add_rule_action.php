<?php
include 'dblinker.php';

function login(){
try {
	$message = $_POST['message'];
	$action = $_POST['action'];
	$device = $_POST['device'];
	$slide = $_POST['slide'];
	$ruleID = $_POST['ruleID'];
	
	$link = linkToTIS();
    
    $handle=$link->prepare("INSERT INTO `re_actions`(`RuleId`, `Command`, `Action`, `Device`,`slide`) VALUES ('$ruleID','$message','$action','$device','$slide')"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
