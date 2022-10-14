<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   if (isset($_GET['acad_year']) && isset($_GET['stu_id']) && isset($_GET['semester'])) {  

    $id = $_GET['stu_id'];
    $acad = $_GET['acad_year'];
    $semester = $_GET['semester'];

    require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
    $db = new Database();  
    $query = "SELECT * FROM vw_student_semester_exam_score where student_id = $id AND acad_year_id = $acad AND semester = $semester";
    $result = mysqli_query($db->connect(),$query);
    
    $query2 = "SELECT * FROM vw_student_semester_exam_result where student_id = $id AND acad_year_id = $acad AND semester = $semester";
    $result2 = mysqli_query($db->connect(),$query2);    
      
    if (mysqli_num_rows($result) > 0 && mysqli_num_rows($result2) > 0) {  
        $response["status"] = array("code"=>200,"message"=>"success");
        $response["data"] = array();  
        $response["data"]['semester_score'] = array();
        $response["data"]['semester_result'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['semester_score'], $row);  
        } 

        while ($row = mysqli_fetch_assoc($result2)) {
            array_push($response["data"]['semester_result'], $row);  
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