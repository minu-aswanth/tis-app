<?php
include 'dblinker.php';

function add_accident(){
	try {
		$scn = $_POST['SystemCodeNumber'];
		$mid = $_POST["MainID"];
		$type_id = $_POST['TypeId'];
		$table = "utmc_".$mid."_relation";
		$action = $_POST["Action"];
		$checklist = $_POST["Checklist"];
		$count= (int)count($checklist);
		$link = linkToTIS();
		$date = date('Y-m-d H:i:s');

		for($i=0;$i<$count;$i++){
			$type_name = $checklist[$i]["item"];
			$type_relation = $checklist[$i]["value"];
			echo $type_name."::".$type_relation;
			$false ="false";
			$handle = $link->prepare("INSERT INTO `$table` (`SystemCodeNumber`, `Type`, `Action`, `Checklist_type`, `Informed`, `Informed_time`, `Arrived`, `Resolved`) VALUES ('$scn','$mid','$action','$type_name','$type_relation','$date','$false','$false')");
			$handle->execute();
		}
		return "success";
	}
	catch(Exception $e){
	        return $e;
	}
}
echo add_accident();
?>