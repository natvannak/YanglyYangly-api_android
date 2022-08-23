<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['id'])) {  

      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
      $query = "SELECT tbl_subjects.subject_kh,tbl_student_discipline.date, tbl_reasons.reason_kh, tbl_student_discipline.promise_date, tbl_student_discipline.description from tbl_student_discipline
      INNER JOIN tbl_reasons ON tbl_reasons.id=tbl_student_discipline.reason
      INNER JOIN tbl_subjects ON tbl_subjects.id=tbl_student_discipline.subject
      ";
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['student_profile'] = array();

         array_push($response["data"]['student_profile'], mysqli_fetch_assoc($result));           

      } else {  

         $response["status"] = array("code"=>204,"message"=>"NOT FOUND");
      }  
      
   } 
   else{
      $response["status"] = array("code"=>400,"message"=>"Empty ID");
   } 
   echo json_encode($response);  
?> 