<?php
require('../helper/headers.php');
require('../config/db.config.php');

if ($_SERVER['REQUEST_METHOD']==='GET') {
    $data = json_decode(file_get_contents("php://input"));
    // $user = $data->user;
    // $pass = $data->clave;

    $sql = "SELECT * FROM `vehiciles`";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
        $res []= $row;
        http_response_code(200);


       // exit($res);
      }
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }    
        
    print json_encode($res);
    $conn->close();
}