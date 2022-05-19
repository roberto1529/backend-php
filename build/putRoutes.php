<?php
require('../helper/headers.php');
require('../config/db.config.php');



if ($_SERVER['REQUEST_METHOD']==='PUT') {
  $data = json_decode(file_get_contents("php://input"));
 
  $id = $data->id;
  $description = $data->description;
  $driver_id = $data->driver_id;
  $vehicile_id = $data->vehicile_id;


  $sql = "UPDATE `routes` SET `description`='$description',`driver_id`='$driver_id',`vehicile_id`='$vehicile_id'
  WHERE `id` = '$id'";


  if ($conn->query($sql) === TRUE) {
      echo json_encode(array('res'=> 'ok'));
    //   var_dump(array('res'=> 'ok'));
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
      echo json_encode(array('res'=> 'err'));
    }
}