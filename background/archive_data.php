<?php
include '../gui/utils/dblinker.php';

function archive_data(){
	try {
		$link = linkToTis();
		$handle_archive=$link->prepare("insert into `tis_detector_dynamic_vbv_archived` select * from `tis_detector_dynamic_vbv` where `TimeStamp` <= date_sub(now(), interval 61 DAY)"); 
		$handle_archive->execute();
		$handle_delete=$link->prepare("delete from `tis_detector_dynamic_vbv` where `TimeStamp` <= date_sub(now(), interval 61 DAY)");
		$handle_delete->execute();
		return "success";
	}

	catch(Exception $e){
	        return "F";
	    }
	}

	echo archive_data();
?>