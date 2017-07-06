<?php
include 'dblinker.php';

function get_signals(){
	try {
		$link = linkToTIS();
	    $handle=$link->prepare("SELECT * FROM `utmc_traffic_signal_static` "); 
	    $handle->execute();
		$result=$handle->fetchall(PDO::FETCH_ASSOC);
		return json_encode($result);
	}
	catch(Exception $e){
        return "F";
    }
}
echo get_signals();
?>
