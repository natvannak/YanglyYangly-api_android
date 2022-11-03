<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';  

   if (isset($_POST['device_token'])) {  
      $db = new Database();  
      $conn = $db->connect();
      $device_token = mysqli_real_escape_string($conn,$_POST['device_token']);
      
      $query = "SELECT COUNT(*) as unread FROM tbl_notification_token_device WHERE token_device = '$device_token' AND `unread` = 1";
      
      $result = mysqli_query($conn,$query);  
      
      if (mysqli_num_rows($result) > 0) {  

         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['notifications'] = array();
         $row = mysqli_fetch_assoc($result);
         array_push($response["data"]['notifications'], $row);  
      } 
      else {  
         $response["status"] = array("code"=>204,"message"=>"No Data");
      }
   } else{
      $response["status"] = array("code"=>400,"message"=>"Field required");
   }

   echo json_encode($response);    

   
?> 