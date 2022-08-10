<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_POST['id'])) {  
      $hour = $_POST['id']; 


      require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
      // connecting to db  
      $db = new Database();  
      $query = "SELECT img_path, name_kh, grade,room_kh, phone, username, address from tbl_students
         INNER JOIN tbl_student_user ON tbl_student_user.id=tbl_students.student_id
         INNER JOIN tbl_rooms ON tbl_rooms.id=tbl_students.student_id";
      

      $result = mysqli_query($db->connect(),$query);  
      
      if (mysqli_num_rows($result) > 0) {  
 
         $response["status"] = array("code"=>200,"message"=>"success");
         $response["data"] = array();  
         $response["data"]['profile'] = array();

         
          while ($row = mysqli_fetch_assoc($result)) {
             array_push($response["data"]['profile'], $row);  
          } 
         echo json_encode($response);  

      } else {  

         $response["status"] = array("code"=>400,"message"=>"Missing error");

         echo json_encode($response);  

      }  

   }  
?> 