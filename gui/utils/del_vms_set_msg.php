<?php
include 'dblinker.php';

function login(){
try {
	$messageID = $_POST['messageID'];
	$link = linkToTIS();
    $handle=$link->prepare("UPDATE `utmc_vms_messages_support_static` SET `active`=0 WHERE `MessageID` = '$messageID'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>