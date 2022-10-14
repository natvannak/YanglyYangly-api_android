<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   
   if (isset($_POST['device_token']) && isset($_POST['notification_id'])) { 
     
    require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';   

    $db = new Database();  
    $conn = $db->connect();
    $device_token = mysqli_real_escape_string($conn,$_POST['device_token']);
    $notification_id = $_POST['notification_id'];

    
    
    $query = "INSERT INTO `tbl_notification_token_device`(`token_device`,`notification_id`) VALUES ('$device_token',$notification_id);";
    
    $result = mysqli_query($conn,$query);  
    
    if ($result) {  

        $response["status"] = array("code"=>200,"message"=>"success");   

    } else {  

        $response["status"] = array("code"=>204,"message"=>mysqli_error($conn));

    }  

   } else{
      $response["status"] = array("code"=>400,"message"=>mysqli_error($conn));
   } 
   echo json_encode($response);    
?> 