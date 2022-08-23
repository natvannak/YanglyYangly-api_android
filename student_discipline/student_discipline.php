<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['stu_id']) && isset($_GET['acad_year']) && isset($_GET['subject'])) {  

      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
      $query = "SELECT tbl_subjects.subject_kh,tbl_student_discipline.date, tbl_reasons.reason_kh, 
               tbl_student_discipline.promise_date, tbl_student_discipline.description 
               FROM tbl_student_discipline
               INNER JOIN tbl_reasons ON tbl_reasons.id=tbl_student_discipline.reason
               LEFT JOIN tbl_subjects ON tbl_subjects.id=tbl_student_discipline.subject
               INNER JOIN tbl_academic_years ON tbl_student_discipline.acad_year = tbl_academic_years.id ";
      if ($_GET['subject'] == 0) {
         $query .= "WHERE tbl_student_discipline.id_student = ".$_GET['stu_id']." AND tbl_student_discipline.acad_year = ".$_GET['acad_year']; 
      }else {
         $query .= "WHERE tbl_student_discipline.id_student = ".$_GET['stu_id']." AND tbl_student_discipline.id_student = 1 AND tbl_student_discipline.acad_year = ".$_GET['acad_year']." AND tbl_student_discipline.`subject` = ".$_GET['subject'];
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
      $response["status"] = array("code"=>400,"message"=>"Empty ID");
   } 
   echo json_encode($response);  
?> 