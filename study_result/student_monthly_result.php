<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   $response = array();
   if (isset($_GET['id'])) {   
       
      require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
     
      $db = new Database();

      $query = "SELECT subject_kh, score, total, average, rank, mention  FROM tbl_student_monthly_score
      INNER JOIN tbl_student_monthly_result ON tbl_student_monthly_result.id=tbl_student_monthly_score.student_id
      INNER JOIN tbl_subjects ON tbl_subjects.id=tbl_student_monthly_score.subject";

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  

         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['result'] = array();

         while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['contact_info'], $row);  
         }  
         
      } else {  
         
         $response["status"] = array("code"=>204,"message"=>"No Data");
      } 
    
   }else{
      $response["status"] = array("code"=>400,"message"=>"Empty ID");
   } 

   echo json_encode($response);  
?>