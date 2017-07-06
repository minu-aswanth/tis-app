<?php
include 'dblinker_met.php';

function metAdapter(){
	try {
		
		$link = linkToTIS();

		$handle=$link->prepare("SELECT SystemCodeNumber, TypeID FROM `utmc_meteorological_static` order by SystemCodeNumber DESC"); 
	    $handle->execute();
		
		while($row = $handle->fetch()){

			$TypeID = $row['TypeID'];
			$SystemCodeNumber = $row['SystemCodeNumber'];

			$handle2=$link->prepare("INSERT INTO `tis_meteorological_dynamic_dump`(`PTemp_C_Avg`, `AirTC_Avg`, `RH`, `WS_ms_Avg`, `WindDir`, TT_C_Avg, SBT_C_Avg, `Visibility`, `BattV_Avg`, `SystemCodeNumber`) VALUES (
			(select `value` as `PTemp_C_Avg` from wscada_gujrat.`wscada_data_raw` where `category`='2031' and `device`= $TypeID order by timestamp desc limit 1) , 
			(select `value` as `AirTC_Avg` from wscada_gujrat.`wscada_data_raw` where `category`='5' and `device`=$TypeID order by timestamp desc limit 1), 
			(select `value` as `RH` from wscada_gujrat.`wscada_data_raw` where `category`='3' and `device`=$TypeID order by timestamp desc limit 1), 
			(select `value`  as `WS_ms_Avg` from wscada_gujrat.`wscada_data_raw` where `category`='2001' and `device`=$TypeID order by timestamp desc limit 1), 
			(select `value`  as `WindDir` from wscada_gujrat.`wscada_data_raw` where `category`='2011' and `device`=$TypeID order by timestamp desc limit 1), 
			(select `value`  as `TT_C_Avg` from wscada_gujrat.`wscada_data_raw` where `category`='2032' and `device`=$TypeID order by timestamp desc limit 1), 
			(select `value`  as `SBT_C_Avg` from wscada_gujrat.`wscada_data_raw` where `category`='11' and `device`=$TypeID order by timestamp desc limit 1), 
			(select `value`  as `Visibility` from wscada_gujrat.`wscada_data_raw` where `category`='10010' and `device`=$TypeID order by timestamp desc limit 1), 
			(select `value`  as `BattV_Avg` from wscada_gujrat.`wscada_data_raw` where `category`='14' and `device`=$TypeID order by timestamp desc limit 1), 
			'$SystemCodeNumber')");

			$handle2->execute();

	    }

	    return "success";
	    
	}
	catch(Exception $e){
        return $e;
    }
}
echo metAdapter();
?>
