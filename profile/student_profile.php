<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['id'])) {  

      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
      $query = "SELECT tbl_students.name_kh, CONCAT (tbl_grade_levels.grade_kh,' ', tbl_groups.group_name_kh) as grade , 
      tbl_students.img_path, tbl_rooms.room_kh, tbl_students.phone , tbl_students.student_id , tbl_students.address 
      FROM tbl_study_records
      INNER JOIN tbl_students ON tbl_study_records.id_student = tbl_students.id
      INNER JOIN tbl_groups ON tbl_study_records.`group` = tbl_groups.id
      INNER JOIN tbl_rooms ON tbl_rooms.id = tbl_groups.room
      INNER JOIN tbl_grade_levels ON tbl_grade_levels.id = tbl_groups.grade
      INNER JOIN tbl_academic_years ON tbl_academic_years.id = tbl_groups.acad_year
      WHERE tbl_students.id = ".$_GET['id']." ORDER BY tbl_academic_years.is_selected DESC LIMIT 1";
      

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