<?php
require('../helper/headers.php');
require('../config/db.config.php');



if ($_SERVER['REQUEST_METHOD']==='POST') {
  $data = json_decode(file_get_contents("php://input"));
  $address = $data->address;
  $city = $data->city;
  $dob = $data->dob;
  $firs_name = $data->firs_name;
  $id = $data->id;
  $last_name = $data->last_name;
  $phone = $data->phone;
  $ssn = $data->ssn;
  $zip = $data->zip;

  $sql = "DELETE FROM `drivers` WHERE `drivers`.`id` = '$id'";


  if ($conn->query($sql) === TRUE) {
      echo json_encode(array('res'=> 'ok'));
    //   var_dump(array('res'=> 'ok'));
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
      exit(json_encode(array('res'=> 'err')));
    }
}