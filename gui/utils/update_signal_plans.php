<?php

include 'dblinker.php';

function update_group(){
	try {
		$group_scn = $_POST['group_scn'];
		$signal_scn = $_POST['signal_scn'];
		$link = linkToTIS();
		$handle=$link->prepare("UPDATE `utmc_traffic_signal_static` SET `Group_SCN`= :group_scn WHERE `SCN`= :signal_scn");
		$handle->bindParam(':group_scn', $group_scn);
		$handle->bindParam(':signal_scn', $signal_scn);
		$handle->execute();

		$handle=$link->prepare("DELETE FROM `signal_timings` WHERE `SignalSCN` = :signal_scn");
		$handle->bindParam(':signal_scn', $signal_scn);
		$handle->execute();

		$handle=$link->prepare("SELECT SignalID FROM `utmc_traffic_signal_static` WHERE `SCN`= :signal_scn");
		$handle->bindParam(':signal_scn', $signal_scn);
		$handle->execute();
		$row = $handle->fetch(PDO::FETCH_ASSOC);
		$signal_id = $row["SignalID"];

		$plan_info = json_decode($_POST['plan_info']);
		// print_r($plan_info);
		foreach ($plan_info as $plan) {
			$plan_scn = $plan->plan_scn;
			$i = 1;
			foreach ($plan->timings as $time) {
				$handle=$link->prepare("INSERT INTO `signal_timings`(`SignalID`, `SignalSCN`, `Plan_SCN`, `StageNumber`, `StageTime`) VALUES (:signal_id, :signal_scn, :plan_scn, :stage_number, :stage_time)");
				$handle->bindParam(':signal_id', $signal_id);
				$handle->bindParam(':signal_scn', $signal_scn);
				$handle->bindParam(':plan_scn', $plan_scn);
				$handle->bindParam(':stage_number', $i);
				$handle->bindParam(':stage_time', $time);
				$handle->execute();
				$i++;
			}

			$k = 1;
			foreach ($plan->inter_stage_timings as $time) {
				$handle=$link->prepare("UPDATE `signal_timings` SET `InterStageTime`= :inter_stage_time WHERE (`SignalSCN` = :signal_scn AND `StageNumber` = :stage_number) AND (`Plan_SCN` =:plan_scn)");
				$handle->bindParam(':inter_stage_time', $time);
				$handle->bindParam(':signal_scn', $signal_scn);
				$handle->bindParam(':stage_number', $k);
				$handle->bindParam(':plan_scn', $plan_scn);
				$handle->execute();
				$k++;
			}
		}
		
		return "success";
	}
	catch(Exception $e){
        return "F";
    }
}
echo update_group();
?>