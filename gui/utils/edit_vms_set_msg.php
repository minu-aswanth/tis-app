<?php
include 'dblinker.php';

function add_vms_set_msg(){
try {
    $messageID = $_POST['messageID'];
	$topLine = $_POST['topLine'];
	$midLine = $_POST['midLine'];
	$botLine = $_POST['botLine'];
	$fontSize = $_POST['fontSize'];
	$category = $_POST['category'];
	$commandPhrase = $_POST['commandPhrase'];
	$link = linkToTIS();

	$handle=$link->prepare("UPDATE `utmc_vms_messages_support_static` SET `Category`='$category',`CommandPhrase`='$commandPhrase',`topLineText`='$topLine',`midLineText`='$midLine',`botLineText`='$botLine',`fontSize`='$fontSize' WHERE `utmc_vms_messages_support_static`.`MessageID` = '$messageID' AND active=1");
	$handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo add_vms_set_msg();
?>