<?php
include 'dblinker.php';

function login(){
try {
	$scn = $_POST['scn'];
	$link = linkToTIS();
	echo("DELETE FROM `utmc_ecb_static` WHERE `SystemCodeNumber` = '$scn'");
    $handle=$link->prepare("DELETE FROM `utmc_ecb_static` WHERE `SystemCodeNumber` = '$scn'"); 
    $handle->execute();
	return "success";
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>