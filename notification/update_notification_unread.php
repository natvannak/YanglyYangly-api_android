<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';  

   if (isset($_POST['token_device']) && isset($_POST['notification_id'])) {  
      $db = new Database();  
      $conn = $db->connect();
      $token_device = mysqli_real_escape_string($conn,$_POST['token_device']);
      $notification_id = $_POST['notification_id'];

      $query = "UPDATE `tbl_notification_token_device` SET `unread` = 0 WHERE token_device = '$token_device' AND `notification_id` = $notification_id";
      
      $result = mysqli_query($conn,$query);  
      
      if ($result) {  

         $response["status"] = array("code"=>200,"message"=>"success");

      } 
      else {  
         $response["status"] = array("code"=>204,"message"=>"Update Fail");
      }
   } else{
      $response["status"] = array("code"=>400,"message"=>$_POST['token_device']);
   }

   echo json_encode($response);    

   
?> 