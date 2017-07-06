<?php
include 'dblinker.php';

function login(){
try {

	$link = linkToTIS();
	$query = "SELECT SCN,
				COUNT(IF(Lane = 1 AND ClassByAxle=1, 1, NULL)) AS lane_1_class_1,
				COUNT(IF(Lane = 1 AND ClassByAxle=2, 1, NULL)) AS lane_1_class_2,
				COUNT(IF(Lane = 1 AND ClassByAxle=3, 1, NULL)) AS lane_1_class_3,
				COUNT(IF(Lane = 1 AND ClassByAxle=4, 1, NULL)) AS lane_1_class_4,
				COUNT(IF(Lane = 1 AND ClassByAxle=5, 1, NULL)) AS lane_1_class_5,
				COUNT(IF(Lane = 1 AND ClassByAxle=6, 1, NULL)) AS lane_1_class_6,
				COUNT(IF(Lane = 1 AND ClassByAxle=7, 1, NULL)) AS lane_1_class_7,
				COUNT(IF(Lane = 1 AND ClassByAxle=8, 1, NULL)) AS lane_1_class_8,
				COUNT(IF(Lane = 1, 1, NULL)) AS lane_1_total,
				COUNT(IF(Lane = 2 AND ClassByAxle=1, 1, NULL)) AS lane_2_class_1,
				COUNT(IF(Lane = 2 AND ClassByAxle=2, 1, NULL)) AS lane_2_class_2,
				COUNT(IF(Lane = 2 AND ClassByAxle=3, 1, NULL)) AS lane_2_class_3,
				COUNT(IF(Lane = 2 AND ClassByAxle=4, 1, NULL)) AS lane_2_class_4,
				COUNT(IF(Lane = 2 AND ClassByAxle=5, 1, NULL)) AS lane_2_class_5,
				COUNT(IF(Lane = 2 AND ClassByAxle=6, 1, NULL)) AS lane_2_class_6,
				COUNT(IF(Lane = 2 AND ClassByAxle=7, 1, NULL)) AS lane_2_class_7,
				COUNT(IF(Lane = 2 AND ClassByAxle=8, 1, NULL)) AS lane_2_class_8,
				COUNT(IF(Lane = 2, 1, NULL)) AS lane_2_total,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=1, 1, NULL)) AS ttoll_class_1,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=2, 1, NULL)) AS ttoll_class_2,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=3, 1, NULL)) AS ttoll_class_3,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=4, 1, NULL)) AS ttoll_class_4,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=5, 1, NULL)) AS ttoll_class_5,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=6, 1, NULL)) AS ttoll_class_6,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=7, 1, NULL)) AS ttoll_class_7,
				COUNT(IF(TowardsToll = 1 AND ClassByAxle=8, 1, NULL)) AS ttoll_class_8,
				COUNT(IF(TowardsToll = 1, 1, NULL)) AS ttoll_total,
				COUNT(IF(Lane = 3 AND ClassByAxle=1, 1, NULL)) AS lane_3_class_1,
				COUNT(IF(Lane = 3 AND ClassByAxle=2, 1, NULL)) AS lane_3_class_2,
				COUNT(IF(Lane = 3 AND ClassByAxle=3, 1, NULL)) AS lane_3_class_3,
				COUNT(IF(Lane = 3 AND ClassByAxle=4, 1, NULL)) AS lane_3_class_4,
				COUNT(IF(Lane = 3 AND ClassByAxle=5, 1, NULL)) AS lane_3_class_5,
				COUNT(IF(Lane = 3 AND ClassByAxle=6, 1, NULL)) AS lane_3_class_6,
				COUNT(IF(Lane = 3 AND ClassByAxle=7, 1, NULL)) AS lane_3_class_7,
				COUNT(IF(Lane = 3 AND ClassByAxle=8, 1, NULL)) AS lane_3_class_8,
				COUNT(IF(Lane = 3, 1, NULL)) AS lane_3_total,
				COUNT(IF(Lane = 4 AND ClassByAxle=1, 1, NULL)) AS lane_4_class_1,
				COUNT(IF(Lane = 4 AND ClassByAxle=2, 1, NULL)) AS lane_4_class_2,
				COUNT(IF(Lane = 4 AND ClassByAxle=3, 1, NULL)) AS lane_4_class_3,
				COUNT(IF(Lane = 4 AND ClassByAxle=4, 1, NULL)) AS lane_4_class_4,
				COUNT(IF(Lane = 4 AND ClassByAxle=5, 1, NULL)) AS lane_4_class_5,
				COUNT(IF(Lane = 4 AND ClassByAxle=6, 1, NULL)) AS lane_4_class_6,
				COUNT(IF(Lane = 4 AND ClassByAxle=7, 1, NULL)) AS lane_4_class_7,
				COUNT(IF(Lane = 4 AND ClassByAxle=8, 1, NULL)) AS lane_4_class_8,
				COUNT(IF(Lane = 4, 1, NULL)) AS lane_4_total,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=1, 1, NULL)) AS ftoll_class_1,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=2, 1, NULL)) AS ftoll_class_2,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=3, 1, NULL)) AS ftoll_class_3,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=4, 1, NULL)) AS ftoll_class_4,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=5, 1, NULL)) AS ftoll_class_5,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=6, 1, NULL)) AS ftoll_class_6,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=7, 1, NULL)) AS ftoll_class_7,
				COUNT(IF(TowardsToll = 0 AND ClassByAxle=8, 1, NULL)) AS ftoll_class_8,
				COUNT(IF(TowardsToll = 0, 1, NULL)) AS ftoll_total
				FROM tis_detector_dynamic_vbv WHERE TimeStamp > (now() - INTERVAL 15 MINUTE) GROUP BY SCN ORDER by SCN DESC"; // It shall be 15 minutes but in BFHL project, server clock is 4 minutes ahead so getting last 19 minutes information.
    $handle=$link->prepare($query); 
    $handle->execute();
	$result=$handle->fetchall(PDO::FETCH_ASSOC);
	return json_encode($result);
}

catch(Exception $e){
        return "F";
    }
}
echo login();
?>
