<?php
include 'ProductDisplayHandler.php';
session_start();
if (!isset($_REQUEST['product_type'])) {
    $ProductType = "";
} else {
    $ProductType = $_REQUEST['product_type'];
    if ($ProductType == "all_department") {
        $ProductType = "";
    }
}
if (!isset($_REQUEST['product_provider'])) {
    $ProductProvider = "";
} else {
    $ProductProvider = $_REQUEST['product_provider'];
    if ($ProductProvider == "both_provider") {
        $ProductProvider = "";
    }
}
if(!(isset($_REQUEST['search_key'])))
{
    $SearchKey="";
}
 else {
    $SearchKey=$_REQUEST['search_key'];
    if($SearchKey!="")
    {
        $ProductType = "";
        $ProductProvider = "";
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
        <script src="main.js"></script>
        <title>BuyZone</title>
    </head>
    <body>
        <div class="overlay">
            <div class="loader"></div>
        </div>
        
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">

                    <a class="navbar-brand" href="#"> BuyZone</a>                    
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                    </button>
                    <div class="collapse navbar-collapse" id="collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="index.php"><span class="glyphicon glyphicon-home"></span>Home</a></li>				
                        </ul>
                        <form class="navbar-form navbar-left" method="post">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search" name="searchkey" id="search">
		        </div>
		        <button type="submit" class="btn btn-primary" name="search" value="search" id="search_btn"><span class="glyphicon glyphicon-search"></span></button>
		     </form>
                        <?php if(isset($_REQUEST['search'])){$SearchKey=$_REQUEST['searchkey']; if($SearchKey!=""){header("location:test.php?product_provider=$ProductProvider&product_type=$ProductType&search_key=$SearchKey");}} ?>
                        <ul class="nav navbar-nav navbar-right">                                                                                    
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-list-alt"></span><?php if ($ProductProvider == "") {
                                 echo 'Provider';} else { echo $ProductProvider;} ?><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li> <a href="test.php?product_provider=Amazon&product_type=<?php echo $ProductType;?>">Amazon</a></li>
                                    <li class="divider"></li>
                                    <li><a href="test.php?product_provider=eBay&product_type=<?php echo $ProductType; ?>">eBay</a></li> 
                                    <li class="divider"></li>
                                    <li><a href="test.php?product_provider=both_provider&product_type=<?php echo $ProductType; ?>">Both Provider</a></li>                                   
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-list"></span><?php if ($ProductType == "") {echo 'Department';} else if ($ProductType == "food-grocery") {echo "Food & Grocery";} else if ($ProductType == "clothing-shoes-jewelry") {echo 'Cloting,Shoes & Jewelry';} else {echo $ProductType;} ?><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="test.php?product_type=Electronics&product_provider=<?php echo $ProductProvider; ?>">Electronics</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="test.php?product_type=Books&product_provider=<?php echo $ProductProvider; ?>">Books</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="test.php?product_type=food-grocery&product_provider=<?php echo $ProductProvider; ?>">Food & Grocery</a></li>
                                    <li class="divider"> </li>
                                    <li><a href="test.php?product_type=clothing-shoes-jewelry&product_provider=<?php echo $ProductProvider; ?>">Clothing,Shoes & Jewelry </a></li>
                                    <li class="divider"> </li>                                  
                                    <li><a href="test.php?product_type=HandMade&product_provider=<?php echo $ProductProvider; ?>">HandMade</a></li>
                                    <li class="divider"> </li>                                  
                                    <li><a href="test.php?product_type=all_department&product_provider=<?php echo $ProductProvider; ?>">All Department</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-shopping-cart"></span>Cart<span class="badge">0</span></a>
                                <div class="dropdown-menu" style="width:400px;">
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-md-3">Sl.No</div>
                                                <div class="col-md-3">Product Image</div>
                                                <div class="col-md-3">Product Name</div>
                                                <div class="col-md-3">Price in .৳</div>
                                            </div>
                                        </div>
                                        <div class="panel-body pre-scrollable">
                                            <div id="cart_product">                                                
                                            </div>
                                        </div>
                                        <div class="panel-footer"></div>
                                    </div>
                                </div>
                            </li>
                            <li><?php if(!isset($_SESSION['customer_id'])){     echo '<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>SignIn</a>
                                ' . '<div class="dropdown-menu" style="width:300px;">
							<div class="panel panel-success">
								<div class="panel-heading">Login</div>
								<div class="panel-heading">
                                                                    <form onsubmit="return false" id="login">
										<label for="email">Email</label>
										<input type="email" class="form-control" name="email" id="email" required/>
										<label for="password">Password</label>
										<input type="password" class="form-control" name="password" id="password" required/>
										<p><br/></p>
                                                                                <a href="#" style="color:green; list-style:none;">Forgotten Password</a><input type="submit" class="btn btn-success" style="float:right;">
                                                                    </form>
								</div>
								<div class="panel-footer" id="e_msg"></div>
							</div>
						</div>';
                            }
                            else{
                                echo '<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
                                     Hello '.$_SESSION['customer_name'].
                                   '</a><ul class="dropdown-menu">
                                    <li> <a href="#">Profile</a></li>
                                    <li class="divider"></li>                                    
                                    <li><a href="Cart.php">Cart</a></li>
                                    <li class="divider"></li>
                                    <li><a href="OrderPage.php">Order</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#" id="logout">Logout</a></li>                                     
                                </ul>';
                            }?>					
											
				</li>                           
                        </ul>
                    </div>
                </div>
            </div>                           
        <?php       
        echo '<form>';
       // echo $ProductProvider.$ProductType ;
        $ProductClass = new ProductSelector($ProductProvider, $ProductType, "",$SearchKey);
        $Product = $ProductClass->getProductClass();
        $row = (mysqli_fetch_array($Product->getProductNumber()));
        $total = $row['total'];
        $dis = 6;
        $total_page = ceil($total / $dis);
        $page_cur = (isset($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
        $k = ($page_cur - 1) * $dis;
        $ProductData = $Product->getProduct($k, $dis);
        echo '<div class="container" >';
        echo '<div class="row" style="width:99%;">';
        echo '<div id="customer_msg"></div>';
        echo '</div>';
        echo '<div class="row" style="width:100%; height:100%;">';
        while ($row = mysqli_fetch_array($ProductData)) {
            $ProductId = $row['product_id'];
            $ProductName = $row['product_name'];
            $ProductPrice = $row['product_price'];
            $ProductImageSource = $row['product_image_source'];
            $ProductImageName = $row['product_image_name'];
            $ProductLink = $row['product_link'];
            echo '<div class="col-lg-4">';
            echo '<div class="jumbotron" style="height:550px;">';
            echo'<div class="panel panel-info">';
            echo'<div class="panel-heading" style="height:100px;">';
            echo '<div> <a href="ProductDetailsDisplayPage.php?product_provider=' . $ProductProvider . '&product_type=' . $ProductType . '&product_id=' . $ProductId . '">';
            if (strlen($ProductName) > 75) {
                echo substr($ProductName, 0, 75) . "...";
            } else {
                echo str_pad($ProductName, 75, " ");
            }
            echo '</a>';
            echo '</div>';
            echo '</div>';
            echo '<div class="panel-body" style="height:300px;">';
            echo '<a href="ProductDetailsDisplayPage.php?product_provider=' . $ProductProvider . '&product_type=' . $ProductType . '&product_id=' . $ProductId . '"> <img src="' . $ProductImageSource . $ProductImageName . '" class="img-responsive image"></a>';
            echo '</div>';
            echo '<div class="panel-heading">';
            echo '<a href="' . $ProductLink . '" target="_blank" class="btn btn-success btn-sm pull-left">Official Link</a>';
            echo '<a class="btn btn-success btn-sm pull-right" id="AddToCart" data-id="'.$ProductId.'" >AddToCart</a>';
            echo '</div>';          
            echo '<div class="panel-heading" style="height:100%;">';
            echo '<h5 style="margin-top: 20px">৳ : '.BanglaConverter::en2bn($ProductPrice) . '</h5>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
        }
        echo'</div>';
        echo'</div>';
        echo'<center>';
        if ($page_cur > 1) {
            echo '<a href="test.php?page=' . ($page_cur - 1) . '&product_type=' . $ProductType . '&product_provider=' . $ProductProvider . '&search_key=' . $SearchKey . '" style="cursor:pointer;color:DeepSkyBlue ;" ><input style="cursor:pointer;background-color:DeepSkyBlue;border:1px black solid;border-radius:5px;width:120px;height:30px;color:white;font-size:15px;font-weight:bold;" type="button" value=" Previous "></a> ';
        } else {

            echo '<input style="background-color:DeepSkyBlue;border:1px black solid;border-radius:5px;width:120px;height:30px;color:black;font-size:15px;font-weight:bold;" type="button" value=" Previous "> ';
        }
        $count = 0;
        for ($i = 1; $i < $total_page; $i++) {
            if ($page_cur == $i) {

                echo '<input style="background-color:DeepSkyBlue ;border:2px black solid;border-radius:5px;width:30px;height:30px;color:black;font-size:15px;font-weight:bold;" type="button" value="' . $i . '"> ';
            } else {
                if (($i >= $page_cur + 3 || $i > $page_cur - 3) && $count <= 7) {
                    echo '<a href="test.php?page=' . $i . '&product_type=' . $ProductType . '&product_provider=' . $ProductProvider . '&search_key=' . $SearchKey . '"> <input style="cursor:pointer;background-color:DeepSkyBlue ;border:1px black solid;border-radius:5px;width:30px;height:30px;color:white;font-size:15px;font-weight:bold;" type="button" value="' . $i . '"> </a> ';
                    $count++;
                }
            }
        }
        if ($page_cur < $total_page) {

            echo '<a href="test.php?page=' . ($page_cur + 1) . '&product_type=' . $ProductType . '&product_provider=' . $ProductProvider . '&search_key=' . $SearchKey . '"><input style="cursor:pointer;background-color:DeepSkyBlue ;border:1px black solid;border-radius:5px;width:90px;height:30px;color:white;font-size:15px;font-weight:bold;" type="button" value=" Next "></a>';
        } else {

            echo '<input style="background-color:DeepSkyBlue ;border:1px black solid;border-radius:5px;width:90px;height:30px;color:black;font-size:15px;font-weight:bold;" type="button" value="   Next "> ';
        }
        echo'</center>';
        echo'</form>';
        ?>
    </body>
</html>
