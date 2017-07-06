<?php
include 'dblinker.php';

function login(){
try {
	$scn = $_POST['scn'];
	$link = linkToTIS();
    $handle=$link->prepare("DELETE FROM `utmc_cctv_static` WHERE `SystemCodeNumber` = '$scn'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>