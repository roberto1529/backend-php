<?php
require('../helper/headers.php');
require('../config/db.config.php');



if ($_SERVER['REQUEST_METHOD']==='PUT') {
  $data = json_decode(file_get_contents("php://input"));
  $id = $data->id;
  $year = $data->year;
  $make = $data->make;
  $capacity = $data->capacity;
  $description = $data->description;

  $sql = "UPDATE `vehiciles` SET `description`='$description',`year`= '$year',`make`= '$make',`capacity`= '$capacity'
  WHERE `id` = '$id'";


  if ($conn->query($sql) === TRUE) {
      echo json_encode(array('res'=> 'ok'));
    //   var_dump(array('res'=> 'ok'));
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
      echo json_encode(array('res'=> 'err'));
    }
}