<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if(isset($_GET['id'])){
      require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php'; 
      $db = new Database();  
      $query = "SELECT * from tbl_news where id = " . $_GET['id'];
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['news_detail'] = array();
         
         array_push($response["data"]['news_detail'], mysqli_fetch_assoc($result));  
          
       
      } else {  

         $response["status"] = array("code"=>400,"message"=>"No Data");
  

      }  

   } else{
      $response["status"] = array("code"=>400,"message"=>"Empty ID");
   }
   
   echo json_encode($response);   
?> 