<?php 

	function send_notification ($tokens, $message)
	{
		$url = 'https://fcm.googleapis.com/fcm/send';
		$fields = array(
			 'registration_ids' => $tokens,
			 'data' => $message
			);

		$headers = array(
			'Authorization:key = HLhAza57P21fjUQ5jMVaCRvCkQdAQClL97BY_aIO3DI ',
			'Content-Type: application/json'
			);

	   $ch = curl_init();
       curl_setopt($ch, CURLOPT_URL, $url);
       curl_setopt($ch, CURLOPT_POST, true);
       curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
       curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);  
       curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
       curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
       $result = curl_exec($ch);           
       if ($result === FALSE) {
           die('Curl failed: ' . curl_error($ch));
       }
       curl_close($ch);
       return $result;
	}
	
$tokens = "fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A";
	$message = array("message" => " FCM PUSH NOTIFICATION TEST MESSAGE");
	$message_status = send_notification($tokens, $message);
	echo $message_status;



 ?>
