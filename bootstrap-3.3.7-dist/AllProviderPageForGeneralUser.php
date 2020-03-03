<?php
include 'ProductDisplayHandler.php';
session_start();
if (!isset($_SESSION['product_type'])) {
    $ProductType = "";
} else {
    $ProductType = $_SESSION['product_type'];
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
        <form>
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
                                    <li><a href="#">Electronics</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Book</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="#">Food & Grocery</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="#">Clothing,Shoes & Jewelry </a></li>
                                    <li class="divider"> </li>                                  
                                    <li><a href="#">HandMade</a></li>
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
        <?php
        echo '<form>';
        $ProductClass = new ProductSelector("", "");
        $Product = $ProductClass->getProductClass();
        $row = (mysqli_fetch_array($Product->getProductNumber()));
        $total = $row['total'];
        $dis = 6;
        $total_page = ceil($total / $dis);
        $page_cur = (isset($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
        $k = ($page_cur - 1) * $dis;
        $ProductData = $Product->getProduct($k, $dis);
        while ($row = mysqli_fetch_array($ProductData)) {
            $ProductId = $row['product_id'];
            $ProductName = $row['product_name'];
            $ProductPrice = $row['product_price'];
            $ProductImageSource = $row['product_image_source'];
            $ProductImageName = $row['product_image_name'];
            $ProductLink = $row['product_link'];

            echo '<div class="container">';
            echo '<div class="row">';
            echo '<div class="col-lg-4">';
            echo '<div class="jumbotron">';
            echo '<div class="name"> <a href="#">';
            // $ProductName="jilan";
            if (strlen($ProductName) > 100) {
                echo substr($ProductName, 0, 100) . "...";
            } else {
                echo str_pad($ProductName, 100, " ");
            }

            echo '</a>';
            echo'</div>';
            echo '<a href="homepage.php"> <img src="' . $ProductImageSource . $ProductImageName . '" class="img-responsive case1 image"></a>';
            echo'<a href="' . $ProductLink . '" target="_blank" class="bt btn-success btn-sm center-block case1 link">Official Link</a>';
            echo '<p class="case1 pull-left">' . $ProductPrice . ' Taka</p>';
            echo'<a href="" class="bt btn-success btn-sm pull-right case1">Add To Cart</a>';
            echo '</div>';
            echo'</div>';
        }
        echo'</div>';
        echo'</div>';
        echo'<center>';
        if ($page_cur > 1) {
            echo '<a href="AllProviderPageForGeneralUser.php?page=' . ($page_cur - 1) . '" style="cursor:pointer;color:DeepSkyBlue ;" ><input style="cursor:pointer;background-color:DeepSkyBlue;border:1px black solid;border-radius:5px;width:120px;height:30px;color:white;font-size:15px;font-weight:bold;" type="button" value=" Previous "></a> ';
        } else {

            echo '<input style="background-color:DeepSkyBlue;border:1px black solid;border-radius:5px;width:120px;height:30px;color:black;font-size:15px;font-weight:bold;" type="button" value=" Previous "> ';
        }
        for ($i = 1; $i < $total_page; $i++) {
            if ($page_cur == $i) {

                echo '<input style="background-color:DeepSkyBlue ;border:2px black solid;border-radius:5px;width:30px;height:30px;color:black;font-size:15px;font-weight:bold;" type="button" value="' . $i . '"> ';
            } else {
                echo '<a href="AllProviderPageForGeneralUser.php?page=' . $i . '"> <input style="cursor:pointer;background-color:DeepSkyBlue ;border:1px black solid;border-radius:5px;width:30px;height:30px;color:white;font-size:15px;font-weight:bold;" type="button" value="' . $i . '"> </a> ';
            }
        }
        if ($page_cur < $total_page) {

            echo '<a href="AllProviderPageForGeneralUser.php?page=' . ($page_cur + 1) . '"><input style="cursor:pointer;background-color:DeepSkyBlue ;border:1px black solid;border-radius:5px;width:90px;height:30px;color:white;font-size:15px;font-weight:bold;" type="button" value=" Next "></a>';
        } else {

            echo '<input style="background-color:DeepSkyBlue ;border:1px black solid;border-radius:5px;width:90px;height:30px;color:black;font-size:15px;font-weight:bold;" type="button" value="   Next "> ';
        }
        echo'</center>';
        echo'</form>';
        ?>
    </body>
</html>