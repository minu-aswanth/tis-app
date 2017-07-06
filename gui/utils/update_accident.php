<?php
include 'dblinker.php';

function update_accident(){
	try {
		$scn = $_POST['SystemCodeNumber'];
		$mid = $_POST["MainID"];
		$table = "utmc_".$mid."_static";
		$link = linkToTIS();
		$date = date('Y-m-d H:i:s');
		$handle = $link->prepare("UPDATE `$table` SET `EndDate`='$date' WHERE `SystemCodeNumber`='$scn'");
		$handle->execute();
		return "success";
	}
	catch(Exception $e){
	        return $e;
	}
}
echo update_accident();
?>