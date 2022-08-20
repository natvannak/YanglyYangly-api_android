<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   $response = array();
   if (isset($_POST['academic_year']) && isset($_POST['stu_id'])) {  
      $academic = $_POST['academic_year']; 
      $stu_id = $_POST['stu_id']; 

   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
      // connecting to db  
   $db = new Database();

   $query = "SELECT tbl_students.img_path, tbl_students.name_kh, tbl_groups.group_name_kh FROM tbl_student_parents
    INNER JOIN tbl_students ON tbl_students.id=tbl_student_parents.stu_id
    INNER JOIN tbl_groups ON tbl_groups.id=tbl_student_parents.stu_id 
      WHERE tbl_student_parents.stu_id= 1 and tbl_students.status = 1 AND tbl_student_parents.parents_id =1";


   $result = mysqli_query($db->connect(),$query);  
   
   if (mysqli_num_rows($result) > 0) {  

      $response["status"] = array("code"=>200,"message"=>"success");
      $response["data"] = array();  
      $response["data"]['dashboardparent'] = array();

      while ($row = mysqli_fetch_assoc($result)) {
         array_push($response["data"]['dashboardparent'], $row);  
      }  
      echo json_encode($response);  

   } else {  

      $response["status"] = array("code"=>204,"message"=>"No Data");

      echo json_encode($response);  

   }  
}

 
?>