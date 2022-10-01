<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['stu_id'])) {  

    $id = $_GET['stu_id'];

    require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
    $db = new Database();  
    $query = "CALL `sp_contact`($id);";
    $result = mysqli_query($db->connect(),$query);
      
    if (mysqli_num_rows($result) > 0 || mysqli_num_rows($result2) > 0) {  
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['contact_info'] = array();

         while ($row = mysqli_fetch_assoc($result)) {
               array_push($response["data"]['contact_info'], $row);  
         } 

    } else {  
        $response["status"] = array("code"=>204,"message"=>"NOT DATA");
    }  
    
   } 
   else{
      $response["status"] = array("code"=>400,"message"=>"Field required");
   } 
   echo json_encode($response);  
?> 