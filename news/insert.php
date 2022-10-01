<?php  
   header("Access-Control-Allow-Origin: *");
   header("Content-Type: application/json; charset=UTF-8");
   
   $response = array();  
   $notitication_value = array();
   if (isset($_POST['title']) && isset($_POST['image']) && isset($_POST['short_description']) && isset($_POST['description']) && isset($_POST['type_id']) && isset($_POST['createby'])) { 
     

    $title = $_POST['title'];
    $image = $_POST['image'];
    $short_description = $_POST['short_description'];
    $description = $_POST['description'];
    $type_id = $_POST['type_id'];
    $createdate = date('Y-m-d H:i:s'); 
    $createby = $_POST['createby'];


    require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/config/Database.php';    
    require_once $_SERVER['DOCUMENT_ROOT']. '/api_android/notification/notify.php';

    $db = new Database(); 
    $conn =  $db->connect();
    $query = "INSERT INTO `tbl_news`(`title`, `image`, `short_description`, `description`, `type_id`, `createdate`, `createby`) 
    VALUES ('$title','$image','$short_description','$description',$type_id,'$createdate','$createby');";
    
    $result = mysqli_query($conn,$query);  
    
    if ($result) {  

        $response["status"] = array("code"=>200,"message"=>"success");
        $response["data"] = array();  

        $data = array(
            'id'=>mysqli_insert_id($conn),
            'title'=>$title,
            'short_description'=>$short_description,
            'description'=>$description,
            'type_id'=>$type_id
        );

        $response["data"]['news_detail'] = $data;
        
        //$to="fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A";

        $to = "dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9";
        $notitication_value = array(
            'title'=>$data['title'],
            'body'=>$data['short_description']
        );
       

    } else {  

        $response["status"] = array("code"=>204,"message"=>mysqli_error($conn));

    }  

   } else{
      $response["status"] = array("code"=>400,"message"=>"Undefined array key");
   } 
   echo json_encode($response);  
   echo notify($to,$notitication_value,$data);   
?> 