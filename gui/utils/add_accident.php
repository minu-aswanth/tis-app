<?php
include 'dblinker.php';

function add_accident(){
	try {
		//echo "asdasd";
		$scn = $_POST['SystemCodeNumber'];
		$short_description = $_POST['ShortDescription'];
		$long_description = $_POST['LongDescription'];
		$northing = $_POST['Northing'];
		$easting = $_POST['Easting'];
		$type_id = $_POST['TypeID'];
		$accident_time = $_POST['AccidentTime'];
		$created_by = $_POST['CreatedBy'];
		$end_date = "2416-12-19 19:00:07";
		$severity = $_POST['Severity'];
		$reported_by = $_POST['ReportedBy'];
		$mid = $_POST["MainID"];
		$table = "utmc_".$mid."_static";
		$action = $_POST["Action"];
		echo $table;
		//$modified_by = $_POST['ModifiedBy'];
		$isedit = $_POST['isedit'];
		$link = linkToTIS();
		$handle=$link->prepare("select count(*) as count from `$table` where `SystemCodeNumber`='$scn'");
		$handle->execute();
		$result=$handle->fetch(PDO::FETCH_ASSOC);
		$check = (int) $result['count'];
		if($isedit==0 && $check == 1){
			return "duplicate";
		}
		else{
			$handle=$link->prepare("delete from `$table` where `SystemCodeNumber`='$scn'");

			$handle->execute();
			
			$handle=$link->prepare("INSERT INTO `$table` (`SystemCodeNumber`, `Name`, `ShortDescription`, `LongDescription`, `DataSourceTypeID`, `Northing`, `Easting`, `NetworkLinkReference`, `TransportLinkReference`,`Action`,`Type`, `TypeID`, `LinkDistance`, `CreationDate`, `DeletionDate`, `QualityStatementID`, `LocationDesc`, `AccidentTime`, `EndDate`, `Severity`, `ZoneAffected`, `LanesAffected`, `DiversionInForce`, `DiversionRoute`, `ReportedBy`, `ConfirmedBy`, `ConfirmedDate`, `Phase`, `CreatedBy`, `StatisticsDate`, `VehicleCount`, `LightConditions`, `RoadConditions`, `WeatherConditions`, `Active`) VALUES ('$scn', NULL, '$short_description', '$long_description', NULL, '$northing', '$easting', NULL, NULL, '$action','$mid','$type_id', NULL, CURRENT_TIMESTAMP, NULL, NULL, NULL, '$accident_time', '$end_date', '$severity', NULL, NULL, NULL, NULL, '$reported_by', NULL, NULL, NULL, '$created_by',NULL, NULL, NULL, NULL, NULL, 1);");
			$handle->execute();

			return "success";
		}
	}
	catch(Exception $e){
	        return $e;
	}
}
echo add_accident();
?>