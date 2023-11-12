<?php 
$pageTitle = 'Login';
include('header.php');
?>

<h1 style='text-align: center;'>Inventory Management System</h1>
<form action="login.php" method="post">
    <table><tr><th colspan=2 style='text-align: center;'>Login Page</th></tr>
        <tr> <td>User ID</td> <td><input type="text" name="userid"></td> </tr>
        <tr> <td>Password</td> <td><input type="password" name="pass"></td> </tr>
        <tr> <td colspan="2" style='text-align: center;'><input type="submit" value="Login"> <input type="reset" value="Clear"></td> </tr>
    </table>
</form>

<?php include('footer.php'); ?>