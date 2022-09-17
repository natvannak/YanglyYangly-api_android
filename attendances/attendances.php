<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   $response = array();
   if (isset($_GET['academic_year']) && isset($_GET['month']) && isset($_GET['stu_id'])) {  
      $academic = $_GET['academic_year']; 
      $month = $_GET['month']; 
      $stu_id = $_GET['stu_id']; 

   require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
      // connecting to db  
   $db = new Database();

   $query = "CALL sp_attendances_by_id(".$academic.",".$month.",".$stu_id.")";

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