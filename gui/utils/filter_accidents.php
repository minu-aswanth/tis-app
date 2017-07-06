<?php
include 'dblinker.php';

function filter_accidents(){
	try {
		$accident_type = $_POST['AccidentType'];
		$table = "utmc_".$accident_type."_static";
		$table_type = "utmc_".$accident_type."_types";
		$start_time = $_POST['StartTime'];
		$end_time = $_POST['EndTime'];
		$severity = $_POST['Severity'];
		$link = linkToTIS();

	    $handle=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`,`accident_type` AS 'AccidentType', `Northing`, `Easting`, `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `CreatedBy`, `ReportedBy` FROM `$table` INNER JOIN `$table_type` ON `$table_type`.`accident_type_id`=`$table`.`TypeID` WHERE `$table`.`TypeID`=`$table_type`.`accident_type_id` AND `Severity`>'$severity' AND `$table`.`AccidentTime` BETWEEN '$start_time' AND '$end_time'");
	    $handle->execute();
		$result=$handle->fetchall(PDO::FETCH_ASSOC);
		return json_encode($result);
	}
	catch(Exception $e){
        return "F";
    }
}
echo filter_accidents();
?>