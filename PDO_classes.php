<?php
class Core
{
    public $dbh; // handle of the db connexion
    private static $instance;

    private function __construct()
    {
        // building data source name from config
        $dsn = 'mysql:host=' . Config::read('db.host') .
               ';dbname='    . Config::read('db.basename') .
               ';port='      . Config::read('db.port') .
               ';connect_timeout=15';
        // getting DB user from config                
        $user = Config::read('db.user');
        // getting DB password from config                
        $password = Config::read('db.password');

        $this->dbh = new PDO($dsn, $user, $password);
    }

    public static function getInstance()
    {
        if (!isset(self::$instance))
        {
            $object = __CLASS__;
            self::$instance = new $object;
        }
        return self::$instance;
    }
    public function _clone() {
        trigger_error('Clone is not allowed.', E_USER_ERROR);
    }
    
    public function _wakeup() {
        trigger_error('Deserializing is not allowed.',E_USER_ERROR);
    }

    // others global functions
    public function FindWarehouseByLocation($mlocation) {
        $mlocation = '%'.$mlocation.'%';
        $core = Core::getInstance();
        $stmt = $core->dbh->prepare("select wname,wlocation from warehouses where wlocation like ?");
        $stmt->bindParam(1,$mlocation);
           
        if ($result=$stmt->execute()) {
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return ($data);
        }
        else {
            return null;
        }
    }
}

class Config
{
    static $confArray;

    public static function read($name)
    {
        return self::$confArray[$name];
    }

    public static function write($name, $value)
    {
        self::$confArray[$name] = $value;
    }

}

// db
Config::write('db.host', '127.0.0.1');
Config::write('db.port', '3306');
Config::write('db.basename', 'ship_rcv');
Config::write('db.user', 'phpuser');
Config::write('db.password', 'phpuserpw');

//$id = 2;
//$sql = "select wname, wlocation from warehouses where wid = :id";

//$core = Core::getInstance();
//$stmt = $core->dbh->prepare($sql);
//$stmt->bindParam(':id', $this->id, PDO::PARAM_INT);
//$stmt->bindParam(':id', $id, PDO::PARAM_INT);
//if ($stmt->execute()) {
//        //$o = $stmt->fetch(PDO::FETCH_ASSOC);
//        //echo $row['wname'].', '.$row['wlocation'].'<br';
 //       //print_r($o);
//        //print_r(\n);
//    while ($rows = $stmt->fetch(PDO::FETCH_ASSOC)) {
//        echo $rows[wname].'; '.$rows[wlocation].'<br';
//    }
//        
//}