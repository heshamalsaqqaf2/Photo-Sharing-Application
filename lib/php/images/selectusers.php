<?php 

require 'Connection.php';


$stmt=$con->prepare("select * from users");
if($stmt->execute())
{
    foreach($stmt as $user)
    {
        echo '<tr id="'.$user['id'].'" onclick="getpost(this.id)">
        <td>
            <img src="1.jpg">
            <p>'.$user['username'].'</p>
        </td>
        <td>01-10-2021</td>
        <td><span class="status pending">حظر</span></td>
    </tr>';
    }
}



?>