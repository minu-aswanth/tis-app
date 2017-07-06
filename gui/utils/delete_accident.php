<?php
include 'dblinker.php';

function delete_accident(){
	try {
		$scn = $_POST['SystemCodeNumber'];
		$link = linkToTIS();
		$handle=$link->prepare("update `utmc_accident_static` set `Active`=0 where `SystemCodeNumber`='$scn'");
		$handle->execute();
		return "success";
	}
	catch(Exception $e){
	        return "F";
	}
}
echo delete_accident();
?>