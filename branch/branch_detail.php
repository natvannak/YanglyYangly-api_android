<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array(); 
   if(isset($_GET['id'])){
      
      require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';  
      $db = new Database();  
      $query = "SELECT * FROM tbl_branch_detail WHERE branch_id = " . $_GET['id'];
      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  

         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['branch_detail'] = array();
         $row = mysqli_fetch_assoc($result);
         array_push($response["data"]['branch_detail'], $row);  

      }else {  
         $response["status"] = array("code"=>204,"message"=>"No Data");
      }  

   } else{
      $response["status"] = array("code"=>400,"message"=>"Undefined array key");
   } 

   echo json_encode($response); 
  
?> 