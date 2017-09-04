<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Twitter</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" media="screen" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <div class="row">


        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" style="margin-top:30px;">


            <?php
            include_once '../bootstrap.php';
            $_SESSION['logged'] = false;
            unset($_SESSION['logged']);
            unset($_SESSION['email']);
            echo '<h2 class="form-signin-heading">You have been logged out</h2>';
             echo '<a href="login.php"> Log in again</a>';

            ?>

        </div>
    </div>
</div>
