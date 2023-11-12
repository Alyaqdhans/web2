<?php
include('dbconnect.php');

$userid = mysqli_real_escape_string($conn, $_POST['userid']);
$pass = mysqli_real_escape_string($conn, $_POST['pass']);

$q = "select * from usrdt where usrid = '$userid' and usrpswd = password('$pass')";

$r = mysqli_query($conn, $q) or die("Error in query: <mark>$q</mark><br>\n". mysqli_error($conn));

if (mysqli_num_rows($r) == 1) {
    if (!isset($_SESSION['UID'])) {
        $user = mysqli_fetch_assoc($r);

        session_start();

        $_SESSION['UID'] = $user['usrid'];
        $_SESSION['NAME'] = $user['usrname'];
        $_SESSION['TYPE'] = $user['usrtype'];

        header('Location: formToSearch.php');
    } else {
        header('Location: error.php?ec=2'); //user is already logged in
        exit;
    }
} else {
    header('Location: error.php?ec=0'); //userid or pswd is wrong
    exit;
}
?>