<?php
include 'dblinker.php';

function login(){
try {

	$link = linkToTIS();
    $handle=$link->prepare("SELECT SystemCodeNumber,MsgId,MsgTxt,slide,time,LastUpdated FROM `utmc_vms_dynamic` ORDER BY SystemCodeNumber desc,slide desc"); 
    $handle->execute();
	$result=$handle->fetchall(PDO::FETCH_ASSOC);
	return json_encode($result);
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
