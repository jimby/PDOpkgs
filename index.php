<?php
require_once "PDO_classes.php";
$mlocation = "r";
$data=Core::getInstance()->FindWarehouseByLocation($mlocation);
//while ($data) {
//    echo $data[wname].'; '.$data[wlocation].'<br';
//}

foreach ($data as $row){
    echo $row[wname].",".$row[wlocation].'<br>';
}