<?php

include 'dblinker.php';

function get_plan_list(){
	try {
		$group_scn = $_POST['group_scn'];
		$signal_scn = $_POST['signal_scn'];

		$link = linkToTIS();
	    $handle=$link->prepare("SELECT * FROM `plans` WHERE `Group_SCN` = :group_scn"); 
	    $handle->bindParam(':group_scn', $group_scn);
	    $handle->execute();

	    $plan_list= array();
	    while ($row = $handle->fetch(PDO::FETCH_ASSOC)){
	    	$handle2=$link->prepare("SELECT * FROM `offsets` WHERE `Plan_SCN` = :plan_scn"); 
		    $handle2->bindParam(':plan_scn', $row["PlanSCN"]);
		    $handle2->execute();

		    $handle3=$link->prepare("SELECT * FROM `signal_timings` WHERE `Plan_SCN` = :plan_scn AND `SignalSCN` = :signal_scn"); 
		    $handle3->bindParam(':signal_scn', $signal_scn);
		    $handle3->bindParam(':plan_scn', $row["PlanSCN"]);
		    $handle3->execute();


		    $plan_object = array("PlanSCN"=>$row["PlanSCN"],"CycleTime"=>$row["CycleTime"],"Offsets"=>$handle2->fetchall(PDO::FETCH_ASSOC),"StageTime"=>$handle3->fetchall(PDO::FETCH_ASSOC));
		    array_push($plan_list, $plan_object);
	    }
	    

	    return json_encode($plan_list);
	}
	catch(Exception $e){
        return "F";
    }
}
echo get_plan_list();
?>