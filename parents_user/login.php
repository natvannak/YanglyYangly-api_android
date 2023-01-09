<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if(isset($_POST['username']) && isset($_POST['password'])){
      require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';  
      $db = new Database();  
      $conn = $db->connect();
      $username = mysqli_real_escape_string( $conn, trim( $_POST['username'] ) ); 
      $pass = mysqli_real_escape_string( $conn, trim( $_POST['password'] ) );; 

      if( $username == '' || $pass == '' ){
         $response["status"] = array("code"=>400,"message"=>"Phone Number & Password aren't empty!");
      }else{
       
         $query = "SELECT * FROM tbl_parents_user WHERE username = '".$username."' AND password = '".md5($pass)."'";
         
         $result = mysqli_query($conn,$query);  
         
         if (mysqli_num_rows($result) > 0) {  
   
            $response["status"] = array("code"=>200,"message"=>"success");
            $response["data"] = array();  
            $response["data"]['user'] = array();
            $row = mysqli_fetch_assoc($result);
            array_push($response["data"]['user'], $row);  
         

         } else {  

            $response["status"] = array("code"=>204,"message"=>"Invalid login, please try again");

         } 
         
      }
      $db->close(); 

   }
   else {  
      $response["status"] = array("code"=>400,"message"=>"REQUEST_METHOD POST, Username,Password!");
   }
   echo json_encode($response); 
?> 

