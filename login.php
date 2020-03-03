<?php
include 'DataBaseHandlerClass.php';
session_start();
$DB=new DataBase("localhost", "root", "", "buyzone");
$DB->doConnect();
if(isset($_REQUEST['email']) && isset($_REQUEST['password']))
{
    //$Email= mysqli_real_escape_string($DB->ConnectionResult,$_REQUEST['email']);
    $Email=$_REQUEST['email'];
    $Password = $_REQUEST['password'];
    //$password = md5($_REQUEST['password']);
    $Sql= "select * from customer where customer_email='$Email' and customer_password='$Password'";
    $count = mysqli_num_rows($DB->doQuery($Sql));
    if($count == 1)
    {
        $row = mysqli_fetch_array($DB->getResult());
        $_SESSION['customer_name'] = $row['customer_name'];
        $_SESSION['customer_id'] = $row['customer_id'];
        $IpAddress = getenv("REMOTE_ADDR");
        $Sql="select * from cart where customer_id='-1' and ip_address='$IpAddress'";
        if($DB->doQuery($Sql))
        {           
          //  $PList = stripcslashes($_COOKIE['product_list']);
            //$ProductList = json_decode($PList,true);
            $Result=$DB->getResult();
            while (($row= mysqli_fetch_array($Result)))
            {
                $ProductId=$row['product_id'];
                $VarifyCart = "select * from cart where customer_id = '$_SESSION[customer_id]' and product_id='$ProductId'";
                $DB->doQuery($VarifyCart);
               
                if(mysqli_num_rows($DB->getResult()) < 1)
                {
                    $UpdateCart="update cart set customer_id='$_SESSION[customer_id]',ip_address='-1' where ip_address='$IpAddress' and customer_id='-1' and product_id='$ProductId'";                   
                    $DB->doQuery($UpdateCart);                  
                }
                else{
                    $DeleteExistingItem="delete from cart where customer_id='-1' and ip_address='$IpAddress' and product_id='$ProductId'";
                    $DB->doQuery($DeleteExistingItem);
                }                    
            }
         //   setcookie("product_list","", strtotime("-1 day")."/");
           
        }        
        echo "LoginSuccess";
        exit();
    }
    else{
	echo "<span class='alert alert-info'style='color:red;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Please Register Before Login..!</span>";
	exit();
}
}

?>

