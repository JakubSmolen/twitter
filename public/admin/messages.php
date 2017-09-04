<?php
include_once '../bootstrap.php';
if ($_SESSION['logged'] != true) {
    die('You are not logged in <br>
    <a href="login.php"> Log in</a>');
}
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

            <?php
            //username data
            $user = User::showUserByEmail($connection, $_SESSION['email']);
            $username = $user->getUsername();
            $userId = $user->getId();
            echo "<h3> Messages of user $username </h3>";
            #received messages button
            echo '<form  action = "" method="GET">
<input type="submit" name="receivedMessages" value="See received messages">
</from>' . "<br>" . "<br>";
            #sent messages button
            echo '<form  action = "" method="GET">
<input type="submit" name="sentMessages" value="See sent messages">
</from>' . "<br>" . "<br>";
            if ($_SERVER['REQUEST_METHOD'] == "GET" && isset ($_GET['receivedMessages'])) {
                $messagesSent = Message::loadMessageByReceiverId($connection, $userId);
                echo "<strong> Received messages: </strong><br>";
                #display all messages
                foreach ($messagesSent as $oneMessage) {
                    $sender = User::loadUserById($connection, $oneMessage->getSenderId());
                    $text = $oneMessage->getMessage();
                    $messageId = $oneMessage->getId();
                    echo '<table border="solid black" width="50%"> '
                        . '<tr> <td width="30%">'
                        . '<br> Sender: ' . '</td>'
                        . '<td>' . $sender->getUsername()
                        . ' </td> </tr>';
                    echo '<tr> <td width="30%">'
                        . '<br> Message sent on: ' . '</td>'
                        . '<td>' . $oneMessage->getCreationDate()
                        . ' </td> </tr>';
                    echo '<tr> <td width="30%">'
                        . '<br> Message: ' . '</td>'
                        . '<td>';
                    if (strlen($text) > 30 && $oneMessage->getIsRead() == 0) {
                        echo '<strong>' . substr($text, 0, 30) . "... </strong>";
                    } elseif (strlen($text) > 30 && $oneMessage->getIsRead() == 1) {
                        echo substr($text, 0, 30) . "...";
                    } elseif ($text <= 30 && $oneMessage->getIsRead() == 0) {
                        echo "<strong> $text </strong>";
                    } else {
                        echo $text;
                    }
                    echo "<a href='seeMessage.php?messageId=$messageId'> See message</a>";
                    echo ' </td> </tr>';
                    echo '</table>';
                }
            }
            if ($_SERVER['REQUEST_METHOD'] == "GET" && isset ($_GET['sentMessages'])) {
                $messagesSent = Message::loadMessageBySenderId($connection, $userId);
                echo "<strong> Sent messages: </strong><br>";
                #display all messages
                foreach ($messagesSent as $oneMessage) {
                    $sender = User::loadUserById($connection, $oneMessage->getReceiverId());
                    $text = $oneMessage->getMessage();
                    $messageId = $oneMessage->getId();
                    echo '<table border="solid black" width="50%"> '
                        . '<tr> <td width="30%">'
                        . '<br> Receiver: ' . '</td>'
                        . '<td>' . $sender->getUsername()
                        . ' </td> </tr>';
                    echo '<tr> <td width="30%">'
                        . '<br> Message sent on: ' . '</td>'
                        . '<td>' . $oneMessage->getCreationDate()
                        . ' </td> </tr>';
                    echo '<tr> <td width="30%">'
                        . '<br> Message: ' . '</td>'
                        . '<td>';
                    if (strlen($text) > 30 && $oneMessage->getIsRead() == 0) {
                        echo '<strong>' . substr($text, 0, 30) . "... </strong>";
                    } elseif (strlen($text) > 30 && $oneMessage->getIsRead() == 1) {
                        echo substr($text, 0, 30) . "...";
                    } elseif ($text <= 30 && $oneMessage->getIsRead() == 0) {
                        echo "<strong> $text </strong>";
                    } else {
                        echo $text;
                    }
                    echo "<a href='seeMessage.php?messageId=$messageId'> See message</a>";
                    echo ' </td> </tr>';
                    echo '</table>';
                }
            }
            echo "<a href='mainPage.php'> Go back to the main page </a>";
            ?>
        </div>
    </div>
</div>
</body>
</html>
