<?php
session_start();
if(isset($_SESSION['logged']) && $_SESSION['logged'] = true){
    header('Location: public/admin/mainPage.php');
}else{
    header('Location: public/admin/login.php');
}

