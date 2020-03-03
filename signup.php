<?php

session_start();
include 'DataBaseHandlerClass.php';
$DB = new DataBase("localhost", "root", "", "buyzone");
$DB->doConnect();
if (isset($_REQUEST['name'])) {

    $Name = $_REQUEST['name'];
    $Email = $_REQUEST['email'];
    $Password = $_REQUEST['password'];
    $ConfirmPassword = $_REQUEST['confirmPassword'];
    $Phone = $_REQUEST['phone'];
    $Address = $_REQUEST['address'];
    $name = "/^[a-zA-Z ]+$/";
    $emailValidation = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9]+(\.[a-z]{2,4})$/";
    $number = "/^[0-9]+$/";
    if (!empty($Name) && !empty($Email) && !empty($Password) && !empty($ConfirmPassword) &&
            !empty($Phone) && !empty($Address)) {

        if (!preg_match($name, $Name)) {
            echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>This Name : '$Name' Is Not Valid..!</b>
			</div>
		";
            exit();
        }
        if (strlen($Password) < 9) {
            echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Password Is Weak</b>
			</div>
		";
            exit();
        }
        if ($Password != $ConfirmPassword) {
            echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Password Is Not Same</b>
			</div>
		";
            exit();
        }

        if (!preg_match($number, $Phone)) {
            echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Mobile Number : '$Phone' Is Not Valid</b>
			</div>
		";
            exit();
        }
        if (!(strlen($Phone) == 11)) {
            echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Mobile Number Must Be 11 Digit</b>
			</div>
		";
            exit();
        }
        if (!preg_match($emailValidation, $Email)) {
            echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>This Email : '$Email' Is Not Valid..!</b>
			</div>
		";
            exit();
        }
        $sql = "SELECT customer_id FROM customer WHERE customer_email = '$Email' LIMIT 1";
        $count_email = mysqli_num_rows($DB->doQuery($sql));
        if ($count_email > 0) {
            echo "
          <div class='alert alert-danger'>
          <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
          <b>Email Address Is Already Available Try Another Email Address</b>
          </div>
          ";
            exit();
        } else {
           // $Password = md5($Password);
           $sql="insert into customer (customer_name,customer_phone,customer_address,customer_email,customer_password) VALUES('$Name','$Phone','$Address','$Email','$Password')";
            $DB->doQuery($sql);
            $_SESSION['customer_id'] = mysqli_insert_id($DB->ConnectionResult);
            $_SESSION["customer_name"] = $Name;
            $IpAddress = getenv("REMOTE_ADDR");
             $Sql="select * from cart where customer_id='-1' and ip_address='$IpAddress'";
        if($DB->doQuery($Sql))
       {                   
            $Result=$DB->getResult();
            while (($row= mysqli_fetch_array($Result)))
            {
                $VarifyCart = "select * from cart where customer_id = '$_SESSION[customer_id]' and product_id='$row[product_id]'";
                $DB->doQuery($VarifyCart);
                if(mysqli_num_rows($DB->getResult()) < 1)
                {
                    $UpdateCart="update cart set customer_id='$_SESSION[customer_id]',ip_address='-1' where ip_address='$IpAddress' and customer_id='-1'";                   
                    $DB->doQuery($UpdateCart);                  
                }
                else{
                    $DeleteExistingItem="delete from cart where customer_id='-1' and ip_address='$IpAddress' and product_id='$row[product_id]'";
                    $DB->doQuery($DeleteExistingItem);
                }                    
            }
            echo "RegisterSuccess";          
        }
    }
}
}
?>
