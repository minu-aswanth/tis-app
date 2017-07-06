<?php
include 'dblinker.php';

function login(){
try {
	$name = $_POST['name'];
	$link = linkToTIS();
    $handle=$link->prepare("DELETE FROM `tis_accident_action_setup` WHERE `name` = '$name'"); 
    $handle->execute();
    $handle1=$link->prepare("DELETE FROM `tis_accident_action_relation` WHERE `action_name` = '$name'"); 
    $handle1->execute();
	return "success";
}

catch(Exception $e){
        return 'F';
    }
}
echo login();
?>