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
	$handle=$link->prepare("INSERT INTO `utmc_cctv_static` (`SystemCodeNumber`, `ShortDescription`, `Northing`, `Easting`, `IPAddress`,PublicIPAddress, `Port`, `Place`, `Active`,`CreationDate`) VALUES ('$scn', '$short_descrip', '$northing', '$easting', '$ip', '$pip','$port', '$place', '$active',now())");

	$handle->execute();
	
	$handle2=$link->prepare("INSERT INTO `tis_cctv_fault`(`SystemCodeNumber`, `LastUpdated`, `online`, `time`) VALUES ('$scn',now(),1,0)");
	$handle2->execute();
	
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo add_cctv_device();
?>