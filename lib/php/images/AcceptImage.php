<?php

require 'Connection.php';

$stmt = $con->prepare("update images set image_accept=? where images_id=?");
$id=$_POST['id'];
$stmt->bindParam(1,$_POST['accept']);
$stmt->bindParam(2,$id);
if($stmt->execute()){
    echo 'success';
}
else{
    echo 'error';
}

?>