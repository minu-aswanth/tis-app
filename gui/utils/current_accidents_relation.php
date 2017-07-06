<?php
include 'dblinker.php';

function current_accidents_relation(){
	try {
		$scn = $_POST['scn'];
		$mid = $_POST["MainID"];
		$table = "utmc_".$mid."_relation";
		$link = linkToTIS();
	    $handle=$link->prepare("SELECT * FROM `$table` WHERE `SystemCodeNumber`='$scn'");
	    $handle->execute();

		$result=$handle->fetchall(PDO::FETCH_ASSOC);
		
		return json_encode($result);
	}
	catch(Exception $e){
        return "F";
    }
}
echo current_accidents_relation();
?>