<?php
include 'dblinker.php';

function login(){
try {
	$elementID = $_POST['elementID'];
	$module = $_POST['module'];
	$scn = $_POST['scn'];
	$variable = $_POST['variable'];
	$profileID = $_POST['profileID'];
	$bound = $_POST['bound'];
	
	$link = linkToTIS();

	$handle=$link->prepare("UPDATE `re_rules` SET `ObjectName`='$module',`SystemCodeNumber`='$scn',`VariableName`='$variable',`ProfileId`='$profileID',`Threshold`='$bound' WHERE `DummyId`='$elementID'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
