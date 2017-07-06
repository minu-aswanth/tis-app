<?php
include 'dblinker.php';

function login(){
try {

	$link = linkToTIS();
    $handle=$link->prepare("Select A.SystemCodeNumber, B.topLineText, B.midLineText, B.botLineText, A.slide, A.time FROM `utmc_vms_message_list_support_static` A, `utmc_vms_messages_support_static` B WHERE A.MessageID = B.MessageID AND A.active = 1 and B.active=1 order by A.SystemCodeNumber DESC , A.slide DESC"); 
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
