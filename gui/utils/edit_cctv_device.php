<?php
include 'dblinker.php';

function add_cctv_device(){
try {
    $scn = $_POST['scn'];
	$short_descrip = $_POST['shortDescription'];
	//$long_descrip = $_POST['longDescription'];
	//$ds_type_id = $_POST['dataSourceTypeID'];
	$northing = $_POST['latitude'];
	$easting = $_POST['longitude'];
	//$deletion_date = $_POST['deletionDate'];
	$ip = $_POST['ipAddress'];
	$pip = $_POST['pipAddress'];
	$port = $_POST['port'];
	$place= $_POST['place'];
	//$del_date = $_POST['deletionDate'];
	//$qs_id = $_POST['qualityStatementID'];
	$link = linkToTIS();
	$active = 1;
	$handle=$link->prepare("UPDATE `utmc_cctv_static` SET `ShortDescription` = '$short_descrip', `Northing`='$northing', `Easting`='$easting', `IPAddress`='$ip', `PublicIPAddress`='$pip', `Port`='$port', `Place`='$place', `LastUpdated`=now()  WHERE `utmc_cctv_static`.`SystemCodeNumber` = '$scn'");
	$handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo add_cctv_device();
?>