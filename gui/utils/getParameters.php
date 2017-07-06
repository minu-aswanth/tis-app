<?php
include 'dblinker.php';

function get_vms(){
try {

	$link = linkToTIS();
    $handle=$link->prepare("SELECT name,code FROM gorakhpur.parameter"); 
    $handle->execute();
	$result=$handle->fetchall(PDO::FETCH_ASSOC);
	return json_encode($result);
}

catch(Exception $e){
        return "F";
    }
}
echo get_vms();
?>
