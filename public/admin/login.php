<?php
include_once '../bootstrap.php';
$_SESSION['logged'] = false;
$errors = [];
if ($_SERVER['REQUEST_METHOD'] == 'POST'
    && isset($_POST['email'])
    && isset($_POST['password'])) {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    $user = User::showUserByEmail($connection, $email);

    if ($user == true) {
        if (password_verify($password, $user->getHashPassword())) {
            $_SESSION['logged'] = true;
            $_SESSION['email'] = $email;
//            var_dump($_SESSION['logged']);
            header('Location: mainPage.php'); //przekierowanie na stronę główną
        } else {
            $errors[] = 'Incorrect password';

        }
    } else {
        echo "No user with this email";
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" media="screen" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <form class="form-signin" method="post">
                <?php echo join('<br>', $errors); ?>
                <h2 class="form-signin-heading">Please login</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input name="email" class="form-control" placeholder="Email address" required="" autofocus=""
                       type="email">
                <label for="inputPassword" class="sr-only">Password</label>
                <input name="password" class="form-control" placeholder="Password" required="" type="password">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

            </form>
            <div>
                <br>
                You do not have an account.
                <br>

                <a href="register.php">Register here: </a>

            </div>


        </div>

    </div>


</div>
</body>
</html>


