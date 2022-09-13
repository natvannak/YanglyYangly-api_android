<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['academic_year']) && isset($_GET['day']) && isset($_GET['stu_id'])) {  
      $academic = $_GET['academic_year']; 
      $day = $_GET['day']; 
      $stu_id = $_GET['stu_id']; 

      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
     
      $db = new Database();  

      $query = "SELECT vw_schedule_details.study_hour_all, vw_schedule_details.day_kh, vw_schedule_details.subject_kh, vw_schedule_details.teacher_kh 
      FROM vw_schedules 
      INNER JOIN vw_schedule_details ON vw_schedule_details.schedule_id = vw_schedules.id
      INNER JOIN tbl_study_records ON tbl_study_records.`group` = vw_schedules.`group`
      WHERE tbl_study_records.id_student = ". $stu_id .
      " AND tbl_study_records.school_year = ". $academic .
      " AND vw_schedule_details.weekday = ". $day .
      " ORDER BY study_hour_all ASC ;";
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['schedule'] = array();
  
          while ($row = mysqli_fetch_assoc($result)) {
             array_push($response["data"]['schedule'], $row);  
          } 

      } else {  

         $response["status"] = array("code"=>400,"message"=>"Missing error");
      }  

   }  
   else{
      $response["status"] = array("code"=>400,"message"=>"Empty ID");
   } 
   echo json_encode($response); 
?> 