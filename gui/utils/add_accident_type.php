<?php
include 'dblinker.php';
function add_vms_device(){
try {
    $name = $_POST['name'];
	$num = $_POST['num'];
	$link = linkToTIS();
	$handle=$link->prepare("SELECT * FROM `tis_accident_type_setup` WHERE name='$name'");
	$handle->execute();
	$result=$handle->fetchall(PDO::FETCH_ASSOC);
	$length = count($result);
	//echo $length;
	if ($length == 0) {
		$handle1=$link->prepare("INSERT INTO `tis_accident_type_setup` (`name`,`action`) VALUES ('$name','$num')");
		$handle1->execute();
		return "Updated Successfully";
	}else{
		return "Name Already Exists";
	}
}

catch(Exception $e){
        return $e;
    }
}

echo add_vms_device();
?>