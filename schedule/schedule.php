<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_POST['study_hour'])) {  
      $hour = $_POST['study_hour']; 


      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
      // $query = "SELECT study_hour FROM tbl_schedule_details 
      $query = "SELECT tbl_schedule_details.id, tbl_study_hours.hour_start, tbl_subjects.subject_kh, tbl_teachers.name_kh  FROM tbl_schedule_details 
      INNER JOIN tbl_subjects ON tbl_subjects.id=tbl_schedule_details.subject 
      INNER JOIN tbl_teachers ON tbl_teachers.id=tbl_schedule_details.teacher
      INNER JOIN tbl_study_hours ON tbl_study_hours.id=tbl_schedule_details.study_hour"; 
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['Schedule'] = array();

         
          while ($row = mysqli_fetch_assoc($result)) {
             array_push($response["data"]['Schedule'], $row);  
          } 
         echo json_encode($response);  

      } else {  

         $response["status"] = array("code"=>400,"message"=>"Missing error");

         echo json_encode($response);  

      }  

   }  
?> 