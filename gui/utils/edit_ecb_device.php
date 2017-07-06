<?php
include 'dblinker.php';

function add_ecb_device(){
try {
    $scn = $_POST['scn'];
	$northing = $_POST['latitude'];
	$easting = $_POST['longitude'];
	$ip = $_POST['ipAddress'];
	$place= $_POST['place'];

	$link = linkToTIS();

	$handle=$link->prepare("UPDATE `utmc_ecb_static` SET `IPAddress`='$ip',`Northing`='$northing',`Easting`='$easting',`Place`='$place' WHERE `SystemCodeNumber` = '$scn'");
	$handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo add_ecb_device();
?>