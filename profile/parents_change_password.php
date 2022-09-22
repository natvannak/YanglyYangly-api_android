<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_POST['id']) && isset($_POST['pass_current']) && isset($_POST['pass_update'])) {  

    $id = $_POST['id'];
    
    require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
    $db = new Database();  
    $conn = $db->connect();
    $query = "SELECT `password` FROM tbl_parents_user WHERE id = $id;";
    $result = mysqli_query($conn,$query);
   
    $pass_current = mysqli_real_escape_string($conn,$_POST['pass_current']);
    $pass_update = mysqli_real_escape_string($conn,$_POST['pass_update']);

    if (mysqli_num_rows($result) > 0) {  
        $row = mysqli_fetch_assoc($result);;
        $current = $row['password'];

        if ($current == $pass_current) {
            $sql = "UPDATE tbl_parents_user SET `password` = '$pass_update' WHERE id = $id;";
            $update = mysqli_query($conn,$sql);

            if ($update) {
                $response["status"] = array("code"=>200,"message"=>"success");
            }else {
                $response["status"] = array("code"=>230,"message"=>"fail");
            }
        }else {
            $response["status"] = array("code"=>231,"message"=>"not match");
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