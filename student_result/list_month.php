<?php  
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    
    $response = array();  
  
    require_once $_SERVER['DOCUMENT_ROOT']. '/api/config/Database.php';   
    $db = new Database();  
    $query = "SELECT * FROM tbl_months ORDER BY sort;";
    $result = mysqli_query($db->connect(),$query);

    if (mysqli_num_rows($result) > 0 || mysqli_num_rows($result2) > 0) {  
        $response["status"] = array("code"=>200,"message"=>"success");
        $response["data"] = array();  
        $response["data"]['month'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            array_push($response["data"]['month'], $row);  
        }  

    } else {  
        $response["status"] = array("code"=>204,"message"=>"NOT DATA");
    }  

    echo json_encode($response);  
?> 