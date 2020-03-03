<?php
include 'ProductDisplayHandler.php';
session_start();
if (isset($_REQUEST['product_type'])) {
    $_SESSION['product_type'] = $_REQUEST['product_type'];
    $ProductType = $_SESSION['product_type'];
} else {
    if (!isset($_SESSION['product_type'])) {
        $ProductType = "";
    } else {
        $ProductType = $_SESSION['product_type'];
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>BuyZone</title>
    </head>
    <body>
        <form method="post">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">

                    <a class="navbar-brand" href="#"> BuyZone</a>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                    </button>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <div class="input-group case1 collapse navbar-collapse">
                                    <input type="text" class="form-control" placeholder="Search">                                                                       
                                </div>                  
                            </li>
                            <li>
                                <div class="collapse navbar-collapse">
                                    <button class="btn btn-default pull-right case1" type="submit" >
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button> 
                                </div>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Provider<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li> <a href="AmazonPageForGeneralUser.php">Amazon</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">eBay</a></li> 
                                    <li class="divider"></li>
                                    <li><a href="#">All Provider</a></li> 
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Department<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="AmazonPageForGeneralUser.php?product_type=electronics">Electronics</a></li>
                                    <li class="divider"></li>
                                    <li><a href="AmazonPageForGeneralUser.php?product_type=book">Book</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="#">Food & Grocery</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="#">Clothing,Shoes & Jewelry </a></li>
                                    <li class="divider"> </li>                                  
                                    <li><a href="#">HandMade</a></li>
                                    <li class="divider"> </li>                                  
                                    <li><a href="#">All Product</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Cart()</a></li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">User<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li> <a href="#">Sing In</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Sing Up</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="#">Help</a></li>                              
                                </ul>
                            </li>                                               
                        </ul>
                    </div>
                </div>
            </div>           
        </form>
        <form>



<?php
$ProductClass = new ProductSelector("amazon", $ProductType);
$Product = $ProductClass->getProductClass();
$ProductData = $Product->getProduct();
while ($row = mysqli_fetch_array($ProductData)) {
    $ProductId = $row['product_id'];
    $ProductName = $row['product_name'];
    $ProductPrice = $row['product_price'];
    $ProductImageSource = $row['product_image_source'];
    $ProductImageName = $row['product_image_name'];
    $ProductLink = $row['product_link'];
    ?>
                <div class="container"> 
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="jumbotron">                                                               
                                <div class="name"> <a href="#"><?php        
            if (strlen($ProductName) > 100) {
                echo substr($ProductName, 0, 100) . "...";
            } else {
                echo str_pad($ProductName, 100, " ");
            }
    ?>
                                    </a>
                                </div>
                                <a href="#"> <img src="<?php echo $ProductImageSource . $ProductImageName; ?>" class="img-responsive case1 image"></a>                       
                                <a href="<?php echo $ProductLink; ?>" target="_blank" class="bt btn-success btn-sm center-block case1 link">Official Link</a>
                                <p class="case1 pull-left"><?php echo $ProductPrice . " Taka"; ?></p>
                                <a href="" class="bt btn-success btn-sm pull-right case1">Add To Cart</a>                                                  
                            </div>
                        </div>
<?php } ?>
                </div>
            </div>
        </form>
    </body>
</html>
