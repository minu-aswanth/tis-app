<?php
include 'dblinker.php';

function login(){
try {
	$elementID = $_POST['elementID'];
	
	$link = linkToTIS();
    
    $handle=$link->prepare("DELETE FROM `re_rules` WHERE `DummyId`='$elementID'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
