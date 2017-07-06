<?php
include 'dblinker.php';

function login(){
try {

	$link = linkToTIS();
    $handle=$link->prepare("SELECT * FROM `tis_accident_action_setup`"); 
    $handle->execute();
	$result=$handle->fetchall(PDO::FETCH_ASSOC);
	$arr = array();
	for ($i=0; $i <count($result) ; $i++) { 
		$name= $result[$i]["name"];
		$time= $result[$i]["updated_time"];
		$handle1 = $link->prepare("SELECT * FROM `tis_accident_action_relation` WHERE `action_name`='$name' AND `type_relation`='true'"); 
		$handle1->execute();
		$result1 = $handle1->fetchall(PDO::FETCH_ASSOC);
		$list = array();
		for ($j=0; $j <count($result1) ; $j++) { 
			//echo $result1[$j]["type_name"];
			$list[$j] = $result1[$j]["type_name"];
		}
		$arr[] = array('name' => $name,'list'=>$list,'updated_time'=>$time);
	}
	return json_encode($arr);
}

catch(Exception $e){
        return 'F';
    }
}
echo login();
?>
