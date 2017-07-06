<?php
include 'dblinker.php';

function add_atcc_device(){
try {
    $scn = $_POST['scn'];
	$northing = $_POST['latitude'];
	$easting = $_POST['longitude'];
	$ip = $_POST['ipAddress'];
	$place= $_POST['place'];
	
	$link = linkToTIS();
	$handle=$link->prepare("INSERT INTO `utmc_ecb_static`(`SystemCodeNumber`, `IPAddress`, `Northing`, `Easting`, `Place`) VALUES ('$scn','$ip','$northing', '$easting', '$place')");
	$handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo add_atcc_device();
?>