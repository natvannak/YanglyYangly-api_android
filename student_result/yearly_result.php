<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['acad_year']) && isset($_GET['stu_id'])) {  

    $id = $_GET['stu_id'];
    $acad = $_GET['acad_year'];

    require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
    $db = new Database();  
    $query = "SELECT * FROM vw_student_yearly_result where student_id = $id AND acad_year_id = $acad;";
    $result = mysqli_query($db->connect(),$query);
   
    if (mysqli_num_rows($result) > 0) {  

        $response["status"] = array("code"=>200,"message"=>"success");
        $response["data"] = array();  
        $response["data"]['yearly_result'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['yearly_result'], $row);  
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