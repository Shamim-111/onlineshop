<?php
session_start();
if(isset($_REQUEST['product_type']))
{
    $_SESSION['product_type']=$_REQUEST['product_type'];
}
if(isset($_REQUEST['product_provider']))
{
    $_SESSION['product_provider']=$_REQUEST['product_provider'];
}
header('Location:test.php');
?>

