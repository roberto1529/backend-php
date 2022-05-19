<?php
require('../helper/headers.php');
require('../config/db.config.php');



if ($_SERVER['REQUEST_METHOD']==='POST') {
  $data = json_decode(file_get_contents("php://input"));

  $id = $data->id;


  $sql = "DELETE FROM `vehiciles` WHERE `vehiciles`.`id` = '$id'";


  if ($conn->query($sql) === TRUE) {
      echo json_encode(array('res'=> 'ok'));
    //   var_dump(array('res'=> 'ok'));
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
      exit(json_encode(array('res'=> 'err')));
    }
}