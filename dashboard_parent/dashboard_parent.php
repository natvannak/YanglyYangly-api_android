<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   $response = array();
   if (isset($_GET['id'])) { 
   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';
      // connecting to db  
   $db = new Database();

   $query = "SELECT tbl_student_parents.stu_id, tbl_students.img_path, tbl_students.name_kh,CONCAT ('ថ្នាក់ទី ', tbl_groups.group_name_kh) as grade
   FROM tbl_student_parents
   INNER JOIN tbl_students ON tbl_students.id=tbl_student_parents.stu_id
   INNER JOIN tbl_study_records ON tbl_study_records.id=tbl_student_parents.stu_id 
   INNER JOIN tbl_groups ON tbl_groups.id=tbl_student_parents.stu_id
   INNER JOIN tbl_grade_levels ON tbl_groups.grade=tbl_grade_levels.id
   WHERE tbl_student_parents.parents_id = ".$_GET['id'];

   $result = mysqli_query($db->connect(),$query);  
   
   if (mysqli_num_rows($result) > 0) {  

      $response["status"] = array("code"=>200,"message"=>"success");
      $response["data"] = array();  
      $response["data"]['dashboard_parent'] = array();

      while ($row = mysqli_fetch_assoc($result)) {
         array_push($response["data"]['dashboard_parent'], $row);  
      }    

   } else {  

      $response["status"] = array("code"=>204,"message"=>"No Data");
  }  
}
else{
   $response["status"] = array("code"=>400,"message"=>"Empty ID");
} 
echo json_encode($response);  

 
?>