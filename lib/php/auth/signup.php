<?php

// File Connection Database
include "../connetion.php";

$username = filterRequest("username");
$email = filterRequest("email");
$password = filterRequest("password");

$stmt = $con->prepare("INSERT INTO `users`(`username`, `email`, `password`) VALUES (?,  ?,  ?)");

$stmt->execute(array($username, $email, $password));

$count = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
