<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   
   if(isset($_GET['id'])){
      
      require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php'; 
      $db = new Database();  
      $query = "SELECT tbl_students.name_kh, tbl_students.img_path, tbl_branches.branch_name, 
      tbl_branches.id as `branch_id` , tbl_academic_years.academic_year, tbl_study_program.title
      FROM tbl_study_records
      INNER JOIN tbl_students ON tbl_study_records.id_student = tbl_students.id
      INNER JOIN tbl_groups ON tbl_study_records.`group` = tbl_groups.id
      INNER JOIN tbl_branches ON tbl_branches.id = tbl_groups.branch
      INNER JOIN tbl_academic_years ON tbl_academic_years.id = tbl_groups.acad_year
      INNER JOIN tbl_education_levels ON tbl_education_levels.id = tbl_study_records.education_level
      INNER JOIN tbl_study_program ON tbl_study_program.id = tbl_education_levels.study_program
      WHERE tbl_students.id = ". $_GET['id'] ." ORDER BY tbl_academic_years.is_selected DESC LIMIT 1" ;
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
   
   
        $response["status"] = array("code"=>200,"message"=>"success");
        $response["data"] = array();  
        $response["data"]['profile_dashboard'] = array();
   
        array_push($response["data"]['profile_dashboard'], $row = mysqli_fetch_assoc($result));  
         
      } else {  
   
         $response["status"] = array("code"=>400,"message"=>"No Data");

      }
   }
   else{
      $response["status"] = array("code"=>400,"message"=>"Empty ID");
   }
     
   echo json_encode($response);  
 
?>