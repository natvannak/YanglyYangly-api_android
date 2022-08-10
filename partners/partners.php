<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_POST['id'])) {  
      $hour = $_POST['id']; 


      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
      $query = "SELECT id, logo from tbl_partners";
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['partners'] = array();

         
          while ($row = mysqli_fetch_assoc($result)) {
             array_push($response["data"]['partners'], $row);  
          } 
         echo json_encode($response);  

      } else {  

         $response["status"] = array("code"=>400,"message"=>"Missing error");

         echo json_encode($response);  

      }  

   }  
?> 