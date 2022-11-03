<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   date_default_timezone_set("Asia/Bangkok");
   $response = array();  
   // $notitication_value = array();
   if (isset($_POST['device_token'])) { 
    require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php'; 
    
    $db = new Database();  
    $conn = $db->connect();
    $device_token = mysqli_real_escape_string($conn,$_POST['device_token']);
    $createdate = date('Y-m-d H:i:s'); 
    

    $query = "INSERT INTO `tbl_registered_device_token`(`device_token`,`create_date`) VALUES ('$device_token','$createdate');";
    
    $result = mysqli_query($conn,$query);  
    
    if ($result) {  

        $response["status"] = array("code"=>200,"message"=>"success");
          

    } else {  

        $response["status"] = array("code"=>204,"message"=>mysqli_error($conn));

    }  

   } else{
      $response["status"] = array("code"=>400,"message"=>"Undefined array key");
   } 
   echo json_encode($response);    
?> 