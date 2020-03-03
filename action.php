<?php
include 'DataBaseHandlerClass.php';

class BanglaConverter {

    public static $bn = array("১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯", "০");
    public static $en = array("1", "2", "3", "4", "5", "6", "7", "8", "9", "0");

    public static function bn2en($number) {
        return str_replace(self::$bn, self::$en, $number);
    }

    public static function en2bn($number) {
        return str_replace(self::$en, self::$bn, $number);
    }

}

session_start();
$DB = new DataBase("localhost", "root", "", "buyzone");
$DB->doConnect();
$IpAddress = getenv("REMOTE_ADDR");
if (isset($_REQUEST['AddToCart'])) {
    $ProductId = $_REQUEST['AddToCart'];
    if (isset($_SESSION['customer_id'])) {
        $CustomerId = $_SESSION['customer_id'];
        $Sql = "select * from cart where product_id='$ProductId' and ip_address='-1'";
        $DB->doQuery($Sql);
        $Count = mysqli_num_rows($DB->getResult());
        if ($Count > 0) {
            echo "
		<div class='alert alert-warning'>
			<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
			<center><b>Product Is Already Added Into The Cart Continue Shopping..!</b></center>
		</div>
	   ";
            // exit();
        } else {
            $Sql = "insert into cart(customer_id,ip_address,product_id,quantity)
                   values('$CustomerId','-1','$ProductId','1')";
            if ($DB->doQuery($Sql)) {
                echo "
		<div class='alert alert-warning'>
			<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
			<center><b>Product Is Added..!</b></center>
		</div>
	   ";
                // exit();
            }
        }
    } else {

        $Sql = "select * from cart where product_id='$ProductId' and customer_id='-1'";
        $DB->doQuery($Sql);
        $Count = mysqli_num_rows($DB->getResult());
        if ($Count > 0) {
            echo "
		<div class='alert alert-warning'>
			<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
			<center><b>Product Is Already Added Into The Cart Continue Shopping..!</b></center>
		</div>
	   ";
            // exit();
        } else {


            $Sql = "insert into cart(customer_id,product_id,ip_address,quantity)
                   values('-1','$ProductId','$IpAddress','1')";
            if ($DB->doQuery($Sql)) {

                echo "
		<div class='alert alert-warning'>
			<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
			<center><b>Product Is Added..!</b></center>
		</div>
	   ";
                // exit();
            }
        }
    }
}


if (isset($_REQUEST["count_item"])) {
    if (isset($_SESSION['customer_id'])) {
        $sql = "SELECT COUNT(*) AS count_item FROM cart WHERE customer_id = $_SESSION[customer_id]";
    } else {
        $sql = "SELECT COUNT(*) AS count_item FROM cart WHERE ip_address = '$IpAddress' AND customer_id< 0";
    }

    $DB->doQuery($sql);
    $row = mysqli_fetch_array($DB->getResult());
    echo $row["count_item"];
    //exit();
}
if (isset($_REQUEST['Common'])) {
    if (isset($_SESSION['customer_id'])) {
        $sql = "SELECT a.product_id,a.product_name,a.product_price,a.product_image_source,a.product_image_name,b.quantity FROM product a,cart b WHERE a.product_id=b.product_id AND b.customer_id='$_SESSION[customer_id]'";
    } else {
        $sql = "SELECT a.product_id,a.product_name,a.product_price,a.product_image_source,a.product_image_name,b.quantity FROM product a,cart b WHERE a.product_id=b.product_id AND b.ip_address='$IpAddress'";
    }
    $DB->doQuery($sql);
    if (isset($_REQUEST['select_item'])) {
        if (mysqli_num_rows($DB->getResult()) > 0) {
            $n = 0;
            while ($row = mysqli_fetch_array($DB->getResult())) {
                $n++;
                $ProductId = $row['product_id'];
                $ProductName = $row['product_name'];
                $ProductPrice = $row['product_price'];
                $ProductImageName = $row['product_image_name'];
                $ProductImageSource = $row['product_image_source'];
                $Quantity = $row['quantity'];
                if (strlen($ProductName) > 25) {
                    $ProductName = substr($ProductName, 0, 25) . "...";
                } else {
                    echo str_pad($ProductName, 25, " ");
                }
                echo '
		   <div class="row">
		   <div class="col-md-3">' . $n . '</div>
		   <div class="col-md-3"><img class="img-responsive" style="height : 50px; width : 50px;" src="' . $ProductImageSource . '' . $ProductImageName . '" /></div>
		   <div class="col-md-3">' . $ProductName . '</div>
		   <div class="col-md-3">৳.' . BanglaConverter::en2bn($ProductPrice) . '</div>
		   </div>';
            }
            ?>
            <a style="float:right;" href="Cart.php" class="btn btn-warning">Edit&nbsp;&nbsp;<span class="glyphicon glyphicon-edit"></span></a>
                <?php
            }
        }
        if (isset($_REQUEST['checkOutDetails'])) {
            if (mysqli_num_rows($DB->getResult()) > 0) {
                $n = 0;
                while ($row = mysqli_fetch_array($DB->getResult())) {
                    $n++;
                    $ProductId = $row['product_id'];
                    $ProductName = $row['product_name'];
                    $ProductPrice = $row['product_price'];
                    $ProductImageName = $row['product_image_name'];
                    $ProductImageSource = $row['product_image_source'];
                    $Quantity = $row['quantity'];
                    if (strlen($ProductName) > 25) {
                        $ProductName = substr($ProductName, 0, 25) . "...";
                    } else {
                        echo str_pad($ProductName, 25, " ");
                    }
                    echo
                    '<div class="row">
                        <center>
                        <div class="col-md-1">' . $n . '</div>
			<div class="col-md-2">
			<div class="btn-group">
			<a href="#" remove_id="' . $ProductId . '" class="btn btn-danger remove"><span class="glyphicon glyphicon-trash"></span></a>
			<a href="#" update_id="' . $ProductId . '" class="btn btn-primary update"><span class="glyphicon glyphicon-ok-sign"></span></a>
			</div>
			</div>
			<input type="hidden" name="product_id[]" value="' . $ProductId . '"/>			
			<div class="col-md-1"><img class="img-responsive" style="height : 50px; width : 50px;" src="' . $ProductImageSource . '' . $ProductImageName . '" /></div>
			<div class="col-md-2">' . $ProductName . '</div>
			<div class="col-md-2"><input type="text" class="form-control quantity" value="' . $Quantity . '" ></div>
			<div class="col-md-2"><input type="text" class="form-control price" value="' . BanglaConverter::en2bn($ProductPrice) . '" readonly="readonly"></div>
                        <div class="col-md-2"><input type="text" class="form-control total" value="" readonly="readonly"></div>
                        </center>
			</div>
                        ';
                    echo '<div style="margin-top:15px;"></div>';
                }
                echo '<div class="container><div class="row">						
			<div class="col-md-12 pull-right"> <p class="pull-right"> <b class=' . "net_total" . ' style="font-size:20px;">' . '</b></p></div></div>';
                echo '<div class="row pull-right">
                        <div class="col-md-6">                         		
                        <input type="submit" style="margin-top : 15px;" id="bKash" class="btn btn-info btn-lg" value="Pay With bKash" >                        
                        </div>
                        <div class="col-md-6">                         		
                        <input type="submit" style="margin-top : 15px;" id="Rocket" class="btn btn-info btn-lg" value="Pay With Rocket" >                        
                        </div>
                        </div>
                        </div>';
            }
        }
    }

    if (isset($_REQUEST['e_to_b'])) {
        echo BanglaConverter::en2bn($_REQUEST['e_to_b']);
    }

    if (isset($_REQUEST['b_to_e'])) {
        echo BanglaConverter::bn2en($_REQUEST['b_to_e']);
    }

    if (isset($_REQUEST['RemoveItemFromCart'])) {
        $RemoveId = $_REQUEST['RemoveId'];
        if (isset($_SESSION['customer_id'])) {
            $sql = "delete from cart where product_id='$RemoveId' and customer_id='$_SESSION[customer_id]'";
        } else {
            $sql = "delete from cart where product_id='$RemoveId' and ip_address='$IpAddress'";
        }
        if ($DB->doQuery($sql)) {
            echo "<div class='alert alert-danger'>
						<center><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
						<b>Product Is Removed From Cart</b>
						</center>
				</div>";
        }
    }

    if (isset($_POST["UpdateCartItem"])) {
        $UpdateId = $_REQUEST['UpdateId'];
        $Quantity = $_REQUEST['Quantity'];
        if (isset($_SESSION["customer_id"])) {
            $sql = "UPDATE cart SET quantity='$Quantity' WHERE product_id = '$UpdateId' AND customer_id = '$_SESSION[customer_id]'";
        } else {
            $sql = "UPDATE cart SET quantity='$Quantity' WHERE product_id = '$UpdateId' AND ip_address = '$IpAddress'";
        }
        if ($DB->doQuery($sql)) {
            echo "<div class='alert alert-info'>
						<center><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
						<b>Product Is Updated</b>
                                                </center>
				</div>";
            exit();
        }
    }
    if (isset($_REQUEST['pay'])) {
        if (isset($_SESSION['customer_id'])) {
            echo 'success';
            exit();
        } else {
            echo '<div class="alert alert-info">'
            . '<center><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>'
            . '<b>Please SignIn First</b>'
            . '</center>'
            . '</div>';
        }
    }

    if (isset($_REQUEST['id'])) {
        $txr = $_REQUEST['id'];
        if ($txr != "") {
            $CustomerId=$_SESSION['customer_id'];
            $sql="select * from cart where customer_id='$CustomerId'";
            $DB->doQuery($sql);
            $result=$DB->getResult();           
            while($row = mysqli_fetch_array($result))
            {   $ProductId=$row['product_id'];
                $Quantity=$row['quantity'];
                $sql="insert into order_info(customer_id,product_id,quantity,transaction_id,payment_status,delivery_status) values('$CustomerId','$ProductId','$Quantity','$txr','paid','pending')";
                $DB->doQuery($sql);
            }
            $sql="delete from cart where customer_id='$CustomerId'";
            
            if($DB->doQuery($sql))
            {
                echo "success";                
                exit(); 
            }
                      
        } else {
            echo '<div class="alert alert-info">'
            . '<center><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>'
            . '<b>Please Send Valid Transaction ID</b>'
            . '</center>'
            . '</div>';
        }
    }
    ?>

