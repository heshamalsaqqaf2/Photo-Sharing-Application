<?php
$hostName = "mysql:host=localhost;dbname=id18754454_yemengallary";
$userName = "id18754454_heshamabdrahman";
$password = "VWo5L=Ch}a0HOBJi";
$option = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8");

try {
    $con = new PDO($hostName, $userName, $password, $option);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    include "functions.php"; // Function Filter Request
} catch (PDOException $e) {
    echo $e->getMessage();
}
