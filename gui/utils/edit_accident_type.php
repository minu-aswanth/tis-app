<?php
include 'dblinker.php';

function add_vms_device(){
try {
    $name = $_POST['name'];
	$num = $_POST['num'];
	$link = linkToTIS();
	
	$handle=$link->prepare("UPDATE `tis_accident_type_setup` SET `action` = '$num' WHERE `name` = '$name'");
	$handle->execute();

	return "success";
}

catch(Exception $e){
        return 'F';
    }
}
echo add_vms_device();
?>