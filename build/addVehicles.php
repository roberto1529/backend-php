<?php
require('../helper/headers.php');
require('../config/db.config.php');



if ($_SERVER['REQUEST_METHOD']==='POST') {
  $data = json_decode(file_get_contents("php://input"));
  $id = $data->id;
  $year = $data->year;
  $make = $data->make;
  $capacity = $data->capacity;
  $description = $data->description;

  $sql = "INSERT INTO `vehiciles`(`id`, `description`,`year`, `make`, `capacity`, `active`) 
  VALUES ('$id','$description','$year','$make','$capacity',1)";

  if ($conn->query($sql) === TRUE) {
      echo json_encode(array('res'=> 'ok'));
    //   var_dump(array('res'=> 'ok'));
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
      exit(json_encode(array('res'=> 'err')));
    }
}