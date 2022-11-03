<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';  

   if (isset($_POST['device_token'])) {  
      $db = new Database();  
      $conn = $db->connect();
      $device_token = mysqli_real_escape_string($conn,$_POST['device_token']);
      
      $query = "SELECT tbl_notification_token_device.notification_id,tbl_news.title, tbl_news.image, tbl_news.short_description,tbl_news.description, tbl_type_news.title as type_news,tbl_notification_token_device.unread  FROM tbl_notification_token_device
      LEFT JOIN tbl_news ON tbl_news.id = tbl_notification_token_device.notification_id
      INNER JOIN tbl_type_news ON tbl_type_news.id = tbl_news.type_id
      WHERE tbl_notification_token_device.token_device = '$device_token' AND tbl_notification_token_device.`unread` = 1
      ORDER BY tbl_notification_token_device.id DESC LIMIT 10;";
      
      $result = mysqli_query($conn,$query);  
      
      if (mysqli_num_rows($result) > 0) {  

         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['notifications'] = array();
         while($row = mysqli_fetch_assoc($result)){
            array_push($response["data"]['notifications'], $row); 
         }
          
      } 
      else {  
         $response["status"] = array("code"=>204,"message"=>"No Data");
      }
   } else{
      $response["status"] = array("code"=>400,"message"=>"Field required");
   }

   echo json_encode($response);    

   
?> 