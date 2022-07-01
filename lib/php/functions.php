<?php
define('MB', 1048576);
// Start Function Security Filtter Inpute in Database //
function filterRequest($requestname)
{
    return htmlspecialchars(strip_tags($_POST[$requestname]));
}
// End Function Security Filtter Inpute in Database //
// Start Function Uplode Images In Server //
function imageUpload($imageRequest)
{
    global $msgError;
    $imagename = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
    $imagetmp = $_FILES[$imageRequest]['tmp_name'];
    $imagesize = $_FILES[$imageRequest]['size'];
    $allowExt = array("jpg", "png", "jpge", "gif");
    $strtoarray = explode(".", $imagename);
    $ext = end($strtoarray);
    $ext  = strtolower($ext);
    if (!empty($imagename) && !in_array($ext, $allowExt)) {
        $msgError[] = "Not Extination Included";
    }
    if ($imagesize > 10 * MB) {
        $msgError[] = "Size File is Large";
    }
    if (empty($msgError)) {
        move_uploaded_file($imagetmp, "../upload/" . $imagename);
        return $imagename;
    } else {
        return "fail";
    }
}
// End Function Uplode Images In Server //
// Start Delete File in The Database //
function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}
// Start Delete File in The Database //
