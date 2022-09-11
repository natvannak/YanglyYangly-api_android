
<?php  
 define('DB_USER', "root");  
 define('DB_PASSWORD', "root"); 
 define('DB_DATABASE', "fbis"); 
 define('DB_SERVER', "localhost");
class Database {   
    function __construct() {  
        $this->connect();
    }    
    function __destruct() {  
        $this->close();  
    }  
    function connect() {  
        $con = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD,DB_DATABASE) or die(mysqli_connect_error());  
        return $con;  
    }   
    function close() {  
        mysqli_close($this->connect()); 
    }  
}  
?>  
