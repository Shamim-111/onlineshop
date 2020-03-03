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
function generateRandomString($length) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
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
        <?php if(isset($_SESSION['customer_id']))
        {echo'                    
        <div class="container">
            <div class="row">			
			<div class="col-md-12" id="customer_msg">                            
			</div>			
		</div>
            <div class="row">
                <div class="col-lg-12">
                    <center><img class="img-responsive" src="image/bKash.JPG"/></center>
                </div>
                <center>                   
                    <div class=" col-lg-10 h4"> Your Reference Number Is "'.generateRandomString(10).'"</div>
                </center>                               
            </div>
            <form method="post" >
            <div class="row" style=" margin-left: 25%;">
                <div class="form-group col-lg-4">                                
                    <input type="text" name="transaction" placeholder="Enter Your bKash Transaction ID" id="transaction" class="form-control" required>                  
                </div>
                 <div class="form-group col-lg-4"> 
                <input type="submit" id="varify" name="submit" class="btn btn-success" Value="Varify Transaction">
                 </div>
            </div>
            </form>
        </div>';}?>
   </body>
</html>