<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_POST['username']) && isset($_POST['password'])) {  
      $username = $_POST['username'];  
      $pass = $_POST['password'];  

      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
    $query = "SELECT * FROM tbl_student_user WHERE username = '$username' and password = '$pass'";
      // $query = "SELECT * FROM tbl_student_user";

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['user'] = array();

         
         while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['user'], $row);  
         } 


         echo json_encode($response);  

      } else {  

         $response["status"] = array("code"=>400,"message"=>"Missing password");

         echo json_encode($response);  

      }  

   }  
?> 