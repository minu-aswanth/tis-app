<?php
include 'dblinker.php';

function get_accidents(){
	try {
		$link = linkToTIS();
	    $handle=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `accident_type` as 'AccidentType', `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy` FROM `utmc_accident_static` inner join `utmc_accident_types` on `utmc_accident_types`.`accident_type_id`=`utmc_accident_static`.`TypeID` WHERE `Active`=1");
	    $handle->execute();
	    $handle1=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `accident_type` as 'AccidentType', `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy` FROM `utmc_event_static` inner join `utmc_event_types` on `utmc_event_types`.`accident_type_id`=`utmc_event_static`.`TypeID` WHERE `Active`=1");
	    $handle1->execute();
	    $handle2=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `accident_type` as 'AccidentType', `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy` FROM `utmc_incident_static` inner join `utmc_incident_types` on `utmc_incident_types`.`accident_type_id`=`utmc_incident_static`.`TypeID` WHERE `Active`=1");
	    $handle2->execute();
	    $handle3=$link->prepare("SELECT `SystemCodeNumber`, `ShortDescription`, `LongDescription`, `Northing`, `Easting`, `accident_type` as 'AccidentType', `CreationDate`, `AccidentTime`, `EndDate`, `Severity`, `ReportedBy`, `CreatedBy` FROM `utmc_roadwork_static` inner join `utmc_roadwork_types` on `utmc_roadwork_types`.`accident_type_id`=`utmc_roadwork_static`.`TypeID` WHERE `Active`=1");
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
echo get_accidents();
?>