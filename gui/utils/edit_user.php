<?php
include 'dblinker.php';

function add_vms_device(){
try {
    $id = $_POST['id'];
	$username = $_POST['username'];
	$role = $_POST['role'];
	$module = $_POST['module'];
	
	$link = linkToTIS();
	
	$handle=$link->prepare("UPDATE `utmc_vms_static` SET `ShortDescription` = '$short_descrip', `LongDescription` = '$long_descrip', `DataSourceTypeID` = '$ds_type_id', `Northing`='$northing', `Easting`='$easting', `DeletionDate`='$deletion_date', `IPAddress`='$ip', `Port`='$port', `Place`='$place', `DeletionDate`='$del_date', `QualityStatementID`='$qs_id',`LastUpdated`=now()  WHERE `utmc_vms_static`.`SystemCodeNumber` = '$scn'");
	$handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo add_vms_device();
?>