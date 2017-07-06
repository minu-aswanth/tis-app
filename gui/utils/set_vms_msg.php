<?php
include 'dblinker.php';

function vms_set_msg(){
try {
    $vms = $_POST['vms'];
	$msg = $_POST['msg'];
	$slide = $_POST['slide'];
	$time = $_POST['time'];
	$userid = $_POST['username'];

	$link = linkToTIS();
	$handle=$link->prepare("SELECT MessageID from `utmc_vms_messages_support_static` where MessageText='$msg' and active=1");
	$handle->execute();
	$result_roles=$handle->fetch(PDO::FETCH_ASSOC);
	$msgId = $result_roles["MessageID"];

	//$msgId = NULL;

	$handle_1=$link->prepare("SELECT SystemCodeNumber FROM `utmc_vms_message_list_support_static` WHERE `SystemCodeNumber`='$vms' and `slide`='$slide' and active=1");
	$handle_1->execute();
	$result_roles_1=$handle_1->fetch(PDO::FETCH_ASSOC);
	$scn = $result_roles_1["SystemCodeNumber"];

	if(strcmp($vms, $scn) == 0){
		return "duplicate";
	}else{
		if($msgId === NULL){
			return "MessageID";
		} else{
			//$handle_final=$link->prepare("INSERT INTO `utmc_vms_message_list_support_static`(`SystemCodeNumber`, `MessageID`,`slide`, `time`) VALUES ('$vms','$msgId','$slide','$time')");
			$handle_final=$link->prepare("INSERT INTO `utmc_vms_message_list_support_static`(`active`, `SystemCodeNumber`, `MessageID`, `slide`, `time`, `creationUser`, `CreationTime`, `UpdationTime`) VALUES(1,'$vms','$msgId','$slide','$time','$userid',now(),now())");
			$handle_final->execute();

			return "success";		
		}
		
	}
	
}

catch(Exception $e){
        return "F";
    }
}
echo vms_set_msg();
?>