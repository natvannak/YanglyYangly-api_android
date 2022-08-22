<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   $response = array();
   if (isset($_GET['id'])) {   
       
   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
      // connecting to db  
   $db = new Database();

   $query = "SELECT tbl_staffs.id, tbl_staffs.name_kh, tbl_staffs.phone, tbl_staffs.telegram, tbl_staff_job_pos.position FROM tbl_staffs
   INNER JOIN tbl_staff_job_pos ON tbl_staff_job_pos.id=tbl_staffs.staff_id
   INNER JOIN tbl_students ON tbl_students.id=tbl_staffs.staff_id";

   $result = mysqli_query($db->connect(),$query);  
   
   if (mysqli_num_rows($result) > 0) {  

      $response["status"] = array("code"=>200,"message"=>"success");
      $response["data"] = array();  
      $response["data"]['contact_info'] = array();

      while ($row = mysqli_fetch_assoc($result)) {
         array_push($response["data"]['contact_info'], $row);  
      }  
      echo json_encode($response);  

   } else {  
      
      $response["status"] = array("code"=>204,"message"=>"No Data");

      echo json_encode($response);  

   }  
}

 
?>