<?php
include 'dblinker.php';

function get_latest(){
	try {
		$link = linkToTis();
		$handle=$link->prepare("select A.SCN, A.Speed, A.Lane, B.binName from `tis_detector_dynamic_vbv` A, tis_detector_class_config B where A.ClassByAxle = B.binNumber AND `TimeStamp` >= date_sub(now() - interval 95 second, interval 5 second) AND `TimeStamp` < now() - interval 95 second"); 
		if($handle->rowCount() > 1){
			return "";
		}
		$handle->execute();
		$result=$handle->fetchAll(PDO::FETCH_ASSOC);
		return json_encode($result);
	}

	catch(Exception $e){
	        return "F";
	    }
	}

	echo get_latest();
?>