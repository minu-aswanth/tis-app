<?php
include 'dblinker.php';

function add_vms_device(){
try {
    $name = $_POST['name'];
	$nor = $_POST['nor'];
	$eas = $_POST['eas'];
	$type = $_POST['type'];
	$link = linkToTIS();
	
	$handle=$link->prepare("UPDATE `tis_vehicle_setup` SET `Northing`='$nor',`Easting`='$eas',`VehicleType`='$type' WHERE `name`='$name'");
	$handle->execute();

	return "success";
}

catch(Exception $e){
        return 'F';
    }
}
echo add_vms_device();
?>