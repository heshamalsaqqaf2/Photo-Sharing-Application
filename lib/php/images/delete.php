<?php

include "../connetion.php";

$imageid = filterRequest("id");
$imagename = filterRequest("imagename");

$stmt = $con->prepare("DELETE FROM images WHERE images_id = ?");
$stmt->execute(array($imageid));
$count = $stmt->rowCount();
if ($count > 0) {
    deleteFile("../upload", $imagename);
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
