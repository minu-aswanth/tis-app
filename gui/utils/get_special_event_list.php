<?php
include 'dblinker.php';

function get_special_event(){
try {
    $group_scn = $_POST['group_scn'];
	
    $link = linkToTIS();
    $handle=$link->prepare("SELECT DISTINCT Date,TimeTable_SCN FROM `special_event` WHERE `Group_SCN` = :group_scn ");
    $handle->bindParam(':group_scn', $group_scn);
    $handle->execute();

    $result = array();
    while ($row = $handle->fetch(PDO::FETCH_ASSOC)){
        $handle2 = $link->prepare("SELECT special_event. * , time_tables.StartTime, time_tables.EndTime FROM special_event INNER JOIN time_tables ON (special_event.TimeTable_SCN = time_tables.TimeTableSCN AND special_event.Slot_Order = time_tables.SlotOrder) AND (special_event.Date = :date_day AND special_event.Group_SCN = :group_scn)"); 
        $handle2->bindParam(':date_day', $row["Date"]);
        $handle2->bindParam(':group_scn', $group_scn);
        $handle2->execute();

        $day_object = array("day"=>$row["Date"],"timetable_scn"=>$row["TimeTable_SCN"],"plan_info"=>$handle2->fetchall(PDO::FETCH_ASSOC));
        array_push($result, $day_object);
    }

    return json_encode($result);
}

catch(Exception $e){
        return "F";
    }
}
echo get_special_event();
?>