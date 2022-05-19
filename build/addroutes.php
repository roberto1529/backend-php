<?php
require('../helper/headers.php');
require('../config/db.config.php');



if ($_SERVER['REQUEST_METHOD']==='POST') {
  $data = json_decode(file_get_contents("php://input"));
  $id = $data->id;
  $vehicile_id = $data->vehicile_id;
  $driver_id = $data->driver_id;
  $description = $data->description;

  $sql = "INSERT INTO `routes`(`id`, `description`, `driver_id`, `vehicile_id`, `active`) 
  VALUES ('$id','$description','$driver_id',$vehicile_id,1)";

  if ($conn->query($sql) === TRUE) {
      echo json_encode(array('res'=> 'ok'));
    //   var_dump(array('res'=> 'ok'));
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
      exit(json_encode(array('res'=> 'err')));
    }
}