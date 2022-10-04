<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
      
      $db = new Database();  
      $query = 'SELECT id, academic_year, DATE_FORMAT(start_date, "%d %M %Y") as start_date, DATE_FORMAT(end_date, "%d %M %Y") as end_date, is_selected FROM tbl_academic_years ORDER BY sort ASC;';
      
      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
  
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['academic'] = array();

         while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['academic'], $row);  
         }  
         echo json_encode($response);  

      } else {  

         $response["status"] = array("code"=>204,"message"=>"No Data");
         echo json_encode($response);  

      }  
 
?> 