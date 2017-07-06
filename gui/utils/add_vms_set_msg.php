<?php
include 'dblinker.php';

function add_vms_device(){
try {
	$topLine = $_POST['topLine'];
	$midLine = $_POST['midLine'];
	$botLine = $_POST['botLine'];
	$fontSize = $_POST['fontSize'];
	$category = $_POST['category'];
	$commandPhrase = $_POST['commandPhrase'];
	$messageText = $topLine.' '.$midLine.' '.$botLine;

	$link = linkToTIS();

	$handle=$link->prepare("INSERT INTO `utmc_vms_messages_support_static`(`MessageText`,`Category`, `CommandPhrase`,`topLineText`, `midLineText`, `botLineText`, `fontSize`,active) VALUES ('$messageText','$category','$commandPhrase','$topLine','$midLine','$botLine','$fontSize',1)");
	$handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo add_vms_device();
?>