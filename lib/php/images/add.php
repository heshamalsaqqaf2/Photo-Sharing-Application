<?php

include "../connetion.php";

$title = filterRequest("title");
$description = filterRequest("description");
$userid = filterRequest("id");
$imagename = imageUpload("file");

if ($imagename != 'fail') {
    $stmt = $con->prepare("INSERT INTO `images`(`images_title`, `images_description`, `images_name` ,`image_users`) VALUES (?,  ?,  ?, ?)");
    $stmt->execute(array($title, $description, $imagename, $userid));
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "fail"));
    }
} else {
    echo json_encode(array("status" => "fail"));
}
