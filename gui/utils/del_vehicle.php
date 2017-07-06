<?php
include 'dblinker.php';

function login(){
try {
	$name = $_POST['name'];
	$link = linkToTIS();
    $handle=$link->prepare("DELETE FROM `tis_vehicle_setup` WHERE `name` = '$name'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>