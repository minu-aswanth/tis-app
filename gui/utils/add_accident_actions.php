<?php
include 'dblinker.php';

function add_vms_device(){
try {
    $name = $_POST['name'];
    $list = $_POST['list'];
    //print_r($list);
    //echo $list[1]["item"];
	$count= (int)count($list);
	$link = linkToTIS();
	$handler=$link->prepare("SELECT * FROM `tis_accident_action_setup` WHERE name='$name'");
	$handler->execute();
	$result = $handler->fetchall(PDO::FETCH_ASSOC);
	$length = count($result);
	if ($length == 0) {
		$handle=$link->prepare("INSERT INTO `tis_accident_action_setup`(`name`) VALUES ('$name')");
		$handle->execute();
		for($i=0;$i<$count;$i++){
			$type_name = $list[$i]["item"];
			$type_relation = $list[$i]["value"];
			$handle1=$link->prepare("INSERT INTO `tis_accident_action_relation`(`action_name`,`type_name`,`type_relation`) VALUES ('$name','$type_name','$type_relation')");
			$handle1->execute();
		}
		return "Action is Added";
	}else{
		return "Action Already Exists";
	}
}

catch(Exception $e){
        return 'F';
    }
}

echo add_vms_device();

?>