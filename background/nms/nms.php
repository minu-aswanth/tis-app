<?php
exec("crontab -l > ./job.txt");

$rows = file("./job.txt");
$blacklist = "pingHTMS.jar";

foreach($rows as $key => $row) {
    if(preg_match("/($blacklist)/", $row)) {
        unset($rows[$key]);
    }
}

file_put_contents("./job.txt", implode("\n", $rows));
exec("crontab ./job.txt");
$para = $argv[1];
exec("./shell.sh $para");
?>