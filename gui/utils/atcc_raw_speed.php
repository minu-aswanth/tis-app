<?php
include 'dblinker.php';

function login(){
try {

	$link = linkToTIS();
	$query = "SELECT SCN,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_1,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=2, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_2,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=3, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_3,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=4, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_4,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=5, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_5,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=6, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_6,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=7, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_7,
		ROUND(AVG(IF(Lane = 1 AND ClassByAxle=8, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_class_8,
		ROUND(AVG(IF(Lane = 1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_1_total,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_1,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=2, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_2,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=3, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_3,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=4, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_4,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=5, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_5,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=6, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_6,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=7, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_7,
		ROUND(AVG(IF(Lane = 2 AND ClassByAxle=8, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_class_8,
		ROUND(AVG(IF(Lane = 2, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_2_total,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_1,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=2, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_2,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=3, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_3,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=4, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_4,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=5, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_5,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=6, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_6,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=7, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_7,
		ROUND(AVG(IF(TowardsToll = 1 AND ClassByAxle=8, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_class_8,
		ROUND(AVG(IF(TowardsToll = 1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ttoll_total,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_1,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=2, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_2,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=3, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_3,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=4, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_4,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=5, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_5,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=6, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_6,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=7, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_7,
		ROUND(AVG(IF(Lane = 3 AND ClassByAxle=8, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_class_8,
		ROUND(AVG(IF(Lane = 3, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_3_total,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_1,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=2, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_2,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=3, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_3,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=4, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_4,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=5, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_5,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=6, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_6,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=7, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_7,
		ROUND(AVG(IF(Lane = 4 AND ClassByAxle=8, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_class_8,
		ROUND(AVG(IF(Lane = 4, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS lane_4_total,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=1, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_1,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=2, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_2,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=3, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_3,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=4, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_4,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=5, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_5,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=6, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_6,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=7, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_7,
		ROUND(AVG(IF(TowardsToll = 0 AND ClassByAxle=8, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_class_8,
		ROUND(AVG(IF(TowardsToll = 0, (CASE WHEN Speed <> 0 THEN Speed ELSE NULL END), NULL)),1) AS ftoll_total
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
