<?php
include 'dblinker.php';

function view_report(){
	try {
		$scn = $_POST['SystemCodeNumber'];
		$mid = $_POST["MainID"];
		$table = "utmc_".$mid."_relation";
		$link = linkToTIS();
		$handle = $link->prepare("SELECT * FROM `$table` WHERE SystemCodeNumber='$scn'");
		$handle->execute();
		$result=$handle->fetchall(PDO::FETCH_ASSOC);
		return json_encode($result);
	}
	catch(Exception $e){
	        return $e;
	}
}
echo view_report();
?>