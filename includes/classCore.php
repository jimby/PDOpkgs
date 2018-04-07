<?php
$host = 'localhost';
$db   = 'ship_rcv';
$user = 'phpuser';
$pass = 'phpuserpw';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$opt = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false
];

/* debug stalls here*/
$pdo = new PDO($dsn, $user, $pass, $opt);
/* debug stalls here */

/* new */
$search = '%Carp%';
//$search = "%$search%";
$stmt  = $pdo->prepare("SELECT * FROM warehouses  WHERE wlocation LIKE :search");
$stmt->execute([$search]);
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($data as $row)
{
    echo $row['wname'].', '.$row['wlocation'].'<cr>';
    
}
//$data = $stmt->fetchAll();
/*new */

//$stmt = $pdo->query('SELECT wname FROM warehouses ');
//while ($row = $data)
//{
//    echo $row['wname'] . "<br>";
//}