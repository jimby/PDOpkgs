<?php
include_once includes/classCore.php;

/* new */
$wlocation = "%Carp%";    

$stmt = $pdo->prepare('SELECT wname,wlocation FROM warehouses WHERE wlocation like :wlocation');
$stmt->bindParam(':wlocation', $wlocation);
$stmt->execute();

while ($row = $query->fetch(PDO::FETCH_ASSOC))
{
    echo $row['wname'].', '.$row['wlocation'].'<br>';
}

