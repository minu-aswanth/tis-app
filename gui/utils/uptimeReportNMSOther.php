<?php
  include 'dblinker.php';

  $startDate = $_POST['formatted_startDate'];
  $endDate = $_POST['formatted_endDate'];
  $module = $_POST['deviceType'];
  $scn = $_POST['scn'];

  $query = "SELECT `IPAddress`, COUNT(IF(online = '1', 1, NULL)) as OnlineCount, COUNT(IF(online = '0', 1, NULL)) as OfflineCount, COUNT(IF(online IN ('1','0'), 1, NULL)) as TotalCount FROM nms_ip_fault WHERE LastUpdated > '$startDate' AND LastUpdated < '$endDate' ";

  if($scn != "All" && strlen($scn) != 0){
    $query=$query."AND IPAddress = '$scn' ";
  }

  $query=$query."GROUP BY `IPAddress`";

  $link = linkToTIS();
  $handle=$link->prepare($query);
  $handle->execute();
  $result=$handle->fetchall(PDO::FETCH_ASSOC);
  echo json_encode($result);

?>