<?php
include 'dblinker.php';

function login(){
try {
	$module = $_POST['module'];
	$scn = $_POST['scn'];
	$variable = $_POST['variable'];
	$profileID = $_POST['profileID'];
	$bound = $_POST['bound'];
	$ruleID = $_POST['ruleID'];
	
	$link = linkToTIS();

	$handle=$link->prepare("INSERT INTO `re_rules`(`RuleId`, `ObjectName`, `SystemCodeNumber`, `VariableName`, `ProfileId`, `Threshold`) VALUES ('$ruleID','$module','$scn','$variable','$profileID','$bound')"); 
    $handle->execute();
	return json_encode("success");
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
