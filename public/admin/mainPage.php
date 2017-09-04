<?php
include_once '../bootstrap.php';

if ($_SESSION != true) {
    header('Location: login.php');
    var_dump($_SESSION);
//   echo 'nie zalogowało';
}
else{


?>

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
<body style="background:#9ccff4">

<div class="container">
    <div class="row">


        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" style="margin-top:30px;">
            <h1>Twitter</h1>
            <br>
            <a class="btn btn-warning" href="mainPage.php" role="button">Home page</a>
            <a class="btn btn-info" href="myuser.php" role="button">See your profile</a>
            <a class="btn btn-info" href="messages.php" role="button">Messages</a>
            <a class="btn btn-danger" href='logout.php' role="button">Log out</a>
            <hr/>


            <!--echo "Logged as: " . $_SESSION['email'];-->
            <!--echo "| <a href=\"myuser.php\">See your profile</a>";-->
            <!--echo "|<a href='messages.php'> Messages</a>";-->
            <!--echo "| <a href=\"logout.php\">Log out</a>";-->
            <!---->
            <!--?>-->


            <form action="" method="POST">
                <h3>Create tweet:</h3>
                <textarea cols="50" rows="5" name="tweet"></textarea>
                <br>
                <input class="btn btn-warning" type="submit" value="Create tweet">
            </form>
            <hr/>

            <h3>Latest tweets:</h3>
            <?php
            if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['tweet'])) {
                $user = User::showUserByEmail($connection, $_SESSION['email']);
                $newTweet = new Tweet();
                $userId = $user->getId();
                $newTweet->setUserId($userId);
                $newTweet->setText($_POST['tweet']);
                $newTweet->setCreationDate(date('Y-m-d H:i:s'));
                $newTweet->saveToDB($connection);
            }
            $tweets = Tweet::loadAllTweets($connection);

            foreach ($tweets as $oneTweet) {
                $userName = User::loadUserById($connection, ($oneTweet->getUserId()))->getUsername();
                $tweetId = ($oneTweet->getId());


                echo
                    '<ul> <b>'
                    . 'User <a href = "user.php?id=' . $oneTweet->getUserId()
                    . '">' . $userName . '</a>' . ' twitted:</a>'
                    . ' </ul></b>';
                echo '<li>' . $oneTweet->getText()
                    . '<a href = "tweet.php?TweetId=' . $tweetId
                    . '">' . '<br> See more' . '<br><br></a>'
                    . '</li>';

            }
            }
            ?>
        </div>
    </div>
</div>
</body>
</html>