<?php
include 'dblinker.php';

function login(){
try {

	$messageID = $_POST['messageID'];

	$link = linkToTIS();
    $handle=$link->prepare("SELECT * FROM `utmc_vms_messages_support_static` where MessageID = '$messageID' AND active=1"); 
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
