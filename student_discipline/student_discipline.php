<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['stu_id']) && isset($_GET['acad_year']) && isset($_GET['subject'])) {  

      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      
      $db = new Database();  
      $query = "SELECT * FROM vw_student_discipline_by_id ";
      if ($_GET['subject'] == 0) {
         $query .= "WHERE id_student = ".$_GET['stu_id']." AND acad_year = ".$_GET['acad_year']; 
      }else {
         $query .= "WHERE id_student = ".$_GET['stu_id']." AND acad_year = ".$_GET['acad_year']." AND `subject` = ".$_GET['subject'];
      }
      
      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['student_discipline'] = array();
         
         while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['student_discipline'], $row);  
         }  

      } else {  

         $response["status"] = array("code"=>204,"message"=>"NOT DATA");
      }  
      
   } 
   else{
      $response["status"] = array("code"=>400,"message"=>"Field required");
   } 
   echo json_encode($response);  
?> 