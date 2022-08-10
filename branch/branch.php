<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_POST['brand_id'])) {  
      $hour = $_POST['brand_id']; 


      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
      $query = "SELECT brand_id, location, phone, linkmap, imgmap from tbl_brand_detail";
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['Branch'] = array();

         
          while ($row = mysqli_fetch_assoc($result)) {
             array_push($response["data"]['Branch'], $row);  
          } 
         echo json_encode($response);  

      } else {  

         $response["status"] = array("code"=>400,"message"=>"Missing error");

         echo json_encode($response);  

      }  

   }  
?> 