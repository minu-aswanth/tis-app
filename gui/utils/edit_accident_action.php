<?php
include 'dblinker.php';

function add_vms_device(){
try {
    $name = $_POST['name'];
	$list = $_POST['list'];
	$link = linkToTIS();
	$count= (int)count($list);
	
	$handle=$link->prepare("DELETE FROM `tis_accident_action_relation` WHERE `action_name` = '$name'");
	$handle->execute();

	for($i=0;$i<$count;$i++){
		$type_name = $list[$i]["item"];
		$type_relation = $list[$i]["value"];
		$handle1=$link->prepare("INSERT INTO `tis_accident_action_relation`(`action_name`,`type_name`,`type_relation`) VALUES ('$name','$type_name','$type_relation')");
		$handle1->execute();
	}
	return "success";
}

catch(Exception $e){
        return $e;
    }
}
echo add_vms_device();
?>