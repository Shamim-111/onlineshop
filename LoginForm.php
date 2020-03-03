<?php
session_start();
if (isset($_SESSION['user_name'])) {
    header('Location: UserPage.php');
}
?>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, user-scafile:///C:/Users/Sajib/Desktop/project/background.jpglable=1">
        <title>Simple Login Form</title>
        <link rel="stylesheet" type="text/css" href="LoginFormStyleSheet.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

<!--<img src="background.png" class="lala">-->
    <center><b> <font color='red' size='4'><?php echo @$_REQUEST['massage']; ?>
            </font></b></center>
    <form class="loginBox" method="post" action="LoginForm.php">
        <table>
            <tr>
            <img src="source.png" class="user">
            <h3>Sign in here</h3> 
            </tr>
            <tr class="inputBox">
            <input type="text" name="email" placeholder="Email" class="username">
            <span><i class="fa fa-user" area-hidden="true"></i></span>
            </tr>
            <tr class="inputBox">
            <input type="password" name="password" placeholder="Password" class="password">
            <span><i class="fa fa-lock" aria-hidden="true"></i></span>
            <tr>
            <input type="submit" name="submit" value="Login" class="login">

            </tr>
            </tr>
            <tr>
                <td align="left"><a href="" class ="forgetPassowrd" >Forget Password</a></td>
                <td align="right"><a href="homepage.php" class="homepage">HomePage</a></td>
            </tr>
        </table>
    </form>
</body>
</html>
<?php
include 'DataBaseHandlerClass.php';
if (isset($_REQUEST['submit'])) {
    $user_email = $_REQUEST['email'];
    $user_password = $_REQUEST['password'];
    $DataBase = new DataBase("localhost", "root", "", "byzone");
    $DataBase->doConnect();
    if ($user_email == '') {
        echo
        "<script>window.open('LoginForm.php?massage=Email Is Required','_self')</script>";
        exit();
    }
    if ($user_password == '') {
        echo
        "<script>window.open('LoginForm.php?massage=Password Is Required','_self')</script>";
        exit();
    }
    if ($DataBase->doQuery("select * from customer where customer_email='$user_email'and customer_password='$user_password'")) {
        if (($row=(mysqli_fetch_array($DataBase->getResult()))) >= 1) {
           // $name=
            $_SESSION['user_name']=$row['customer_name'];
            header("location:UserPage.php?name=$name");
        } else {
            echo
            "<script>window.open('LoginForm.php?massage=Invalid Email Or Password','_self')</script>";
            exit();
        }
    }
}
?>


