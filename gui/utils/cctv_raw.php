<?php
include 'dblinker.php';

function login(){
try {

	$link = linkToTIS();
    $handle=$link->prepare("SELECT SystemCodeNumber,IPAddress,PublicIPAddress,Port FROM `utmc_cctv_static` ORDER BY SystemCodeNumber DESC"); 
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
