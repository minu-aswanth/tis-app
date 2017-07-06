<?php
include 'dblinker.php';

function update_accident(){
	try {
		$scn = $_POST['SystemCodeNumber'];
		$mid = $_POST["MainID"];
		$table = "utmc_".$mid."_relation";
		$checklist = $_POST["Checklist"];
		$value = $_POST["Value"];
		$value_time =  $value."_time";
		$link = linkToTIS();
		$date = date('Y-m-d H:i:s');
		$handle = $link->prepare("UPDATE `$table` SET `$value`='true',`$value_time`='$date'WHERE `SystemCodeNumber`='$scn' AND `Checklist_type`='$checklist'");
		$handle->execute();
		return "success";
	}
	catch(Exception $e){
	        return $e;
	}
}
echo update_accident();
?>