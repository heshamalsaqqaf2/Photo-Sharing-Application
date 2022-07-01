<?php

include "../connetion.php";

$imageid = filterRequest("id");
$title = filterRequest("title");
$description = filterRequest("description");

$stmt = $con->prepare(
    "UPDATE `images` SET 
    `images_title`= ? ,`images_description`= ? WHERE images_id = ? "
);
$stmt->execute(array($title, $description, $imageid));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
