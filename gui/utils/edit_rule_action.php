<?php
include 'dblinker.php';

function login(){
try {
	$message = $_POST['message'];
	$action = $_POST['action'];
	$device = $_POST['device'];
	$actionID = $_POST['actionID'];
	$slide = $_POST['slide'];
	
	$link = linkToTIS();
    
    $handle=$link->prepare("UPDATE `re_actions` SET `Command`='$message',`Action`='$action',`Device`='$device',`slide`='$slide' WHERE `DummyId`='$actionID'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
