<?php
include 'dblinker.php';

function login(){
try {
	$actionID = $_POST['actionID'];
	
	$link = linkToTIS();
    
    $handle=$link->prepare("DELETE FROM `re_actions` WHERE `DummyId`='$actionID'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
