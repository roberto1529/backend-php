<?php
require('../helper/headers.php');
require('../config/db.config.php');

if ($_SERVER['REQUEST_METHOD']==='POST') {
    $data = json_decode(file_get_contents("php://input"));
    $user = $data->user;
    $pass = $data->clave;

    $sql = "SELECT * FROM `user` WHERE user = '$user' and pass = '$pass'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
        $res = array("res"=>"true");
        http_response_code(200);

        print json_encode($res);
       // exit($res);
      }
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $conn->close();
}