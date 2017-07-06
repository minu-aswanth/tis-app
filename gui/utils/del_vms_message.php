<?php
include 'dblinker.php';

function login(){
try {
	$scn = $_POST['scn'];
	$slide = $_POST['slide'];
	$userid = $_POST['username'];
	$link = linkToTIS();

	//$handle=$link->prepare("DELETE FROM `utmc_vms_message_list_support_static` WHERE `SystemCodeNumber` = '$scn' and `slide`='$slide'");
	$handle-$link->prepare("UPDATE `utmc_vms_message_list_support_static` SET `active`=0,`deletionUser`='$userid',`UpdationTime`=now(),`DeletionTime`=now() WHERE `SystemCodeNumber` = '$scn' and `slide`='$slide' and active=1"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>