<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';  

   $db = new Database();  
   $query = "SELECT n.*, t.title as title_type from tbl_news as n inner join tbl_type_news as t on t.id = n.type_id ORDER BY n.id DESC";
   

   $result = mysqli_query($db->connect(),$query);  
   
   if (mysqli_num_rows($result) > 0) {  

      $response["status"] = array("code"=>200,"message"=>"success");
      $response["data"] = array();  
      $response["data"]['news'] = array();

      
         while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['news'], $row);  
         } 
      echo json_encode($response);  

   } 
   else {  

      $response["status"] = array("code"=>204,"message"=>"No Data");

   }  

   echo json_encode($response);    

   
?> 