<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['month'])) {  
      $month = $_GET['month'];   


      require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
      // connecting to db  
      $db = new Database();  
       $query = "SELECT * FROM tbl_holiday WHERE MONTH(date) = ".$month;
      //$query = "SELECT * FROM tbl_holiday";
      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['holiday'] = array();

         
          while ($row = mysqli_fetch_assoc($result)) {
             array_push($response["data"]['holiday'], $row);  
          } 


      } else {  

         $response["status"] = array("code"=>204,"message"=>"No Data");

      }  

   } else{
      $response["status"] = array("code"=>400,"message"=>"Undefined array key");
   } 
   echo json_encode($response);  
?> 