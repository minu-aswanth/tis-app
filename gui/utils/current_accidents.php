<?php
include 'dblinker.php';

function current_accidents(){
	try {
		$current_time = $_POST['current_time'];
		$link = linkToTIS();
	    $handle=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `Type`, `Action`, `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy`, case when `EndDate` is null and '$current_time'>`AccidentTime` then 0 when '$current_time' between `AccidentTime` and `EndDate` then 0 else 1 end as `isold` FROM `utmc_accident_static` WHERE `Active`=1");
	    $handle->execute();

	    $handle1=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `Type`, `Action`, `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy`, case when `EndDate` is null and '$current_time'>`AccidentTime` then 0 when '$current_time' between `AccidentTime` and `EndDate` then 0 else 1 end as `isold` FROM `utmc_event_static` WHERE `Active`=1");
	    $handle1->execute();

	    $handle2=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `Type`, `Action`, `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy`, case when `EndDate` is null and '$current_time'>`AccidentTime` then 0 when '$current_time' between `AccidentTime` and `EndDate` then 0 else 1 end as `isold` FROM `utmc_incident_static` WHERE `Active`=1");
	    $handle2->execute();

	    $handle3=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `Type`, `Action`, `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy`, case when `EndDate` is null and '$current_time'>`AccidentTime` then 0 when '$current_time' between `AccidentTime` and `EndDate` then 0 else 1 end as `isold` FROM `utmc_roadwork_static` WHERE `Active`=1");
	    $handle3->execute();

		$result=$handle->fetchall(PDO::FETCH_ASSOC);
		$result1=$handle1->fetchall(PDO::FETCH_ASSOC);
		$result2=$handle2->fetchall(PDO::FETCH_ASSOC);
		$result3=$handle3->fetchall(PDO::FETCH_ASSOC);
		
		return json_encode(array_merge($result,$result1,$result2,$result3));
	}
	catch(Exception $e){
        return "F";
    }
}
echo current_accidents();
?>