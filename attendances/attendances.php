<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   $response = array();
   if (isset($_POST['academic_year']) && isset($_POST['month']) && isset($_POST['stu_id'])) {  
      $academic = $_POST['academic_year']; 
      $month = $_POST['month']; 
      $stu_id = $_POST['stu_id']; 

   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
      // connecting to db  
   $db = new Database();

   /*$query = "SELECT subject_kh, is_late, is_permission, is_absence FROM tbl_attendances
   INNER JOIN tbl_subjects ON tbl_subjects.id=tbl_attendances.subject";
   */

   $query = "SELECT tbl_subjects.subject_kh, tbl_attendances.is_absence, tbl_attendances.is_permission, tbl_attendances.is_late 
   FROM tbl_attendances
   INNER JOIN tbl_subjects ON tbl_subjects.id=tbl_attendances.subject
   WHERE MONTH(tbl_attendances.date) = ".$month;

   $query .= " and tbl_attendances.id_student = ".$stu_id;

   $query .= " and tbl_attendances.acad_year = ".$academic;

   $result = mysqli_query($db->connect(),$query);  
   
   if (mysqli_num_rows($result) > 0) {  

      $response["status"] = array("code"=>200,"message"=>"success");
      $response["data"] = array();  
      $response["data"]['attendances'] = array();

      while ($row = mysqli_fetch_assoc($result)) {
         array_push($response["data"]['attendances'], $row);  
      }  
     
   } else {  

      $response["status"] = array("code"=>204,"message"=>"No Data");

   }  
}else{
   
   $response["status"] = array("code"=>400,"message"=>"Field Requirements");
   
}
echo json_encode($response);  
 
?>