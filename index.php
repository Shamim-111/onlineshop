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
        <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
	  height: 350px;
      margin: auto;
  }
  </style>
     <title>BuyZone</title>
    </head>
    <body>
        <div class="overlay">
            <div class="loader"></div>
        </div>       
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <a class="navbar-brand" href="#"> BuyZone</a>  <a href="http://localhost/WebProject/test.php?product_provider=Amazon&product_type="><img src="https://images.cooltext.com/5363063.png" width="743" height="90" alt="buy zone K " /></a>
<br />Decorated by <a href="http://localhost/WebProject/index.php">Shamim & Abdullah </a> - <a href="?LogoID=3446239769"></a>                  
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
                                                                                <a href="#" style="color:green; list-style:none;">Forgotten Password ?</a><input type="submit" class="btn btn-success" style="float:right;">
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
        <div class="container">
            <a href="test.php" class="btn btn-success btn-lg pull-right" >Start Shopping>></a>
        </div>
        <div class="container">            
            <br>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <a href="test.php?product_type=Books"> <img src="image/slider/book1.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">

                       <a href="test.php?product_type=Books"> <img src="image/slider/Book2.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=Books"><img src="image/slider/Book3.PNG" alt="Electronics" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="container">
            <br>
            <div id="myCarousell" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousell" data-slide-to="4" class="active"></li>
                    <li data-target="#myCarousell" data-slide-to="5"></li>
                    <li data-target="#myCarousell" data-slide-to="6"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">

                        <a href="test.php?product_type=clothing-shoes-jewelry"><img src="image/slider/Cloth1.PNG" alt="Clothing" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">

                        <a href="test.php?product_type=clothing-shoes-jewelry"><img src="image/slider/Cloth2.PNG" alt="Clothing" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=clothing-shoes-jewelry"><img src="image/slider/Cloth3.PNG" alt="Clothing" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousell" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousell" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>


        <div class="container">
            <br>
            <div id="myCarousel3" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel3" data-slide-to="8" class="active"></li>
                    <li data-target="#myCarousel3" data-slide-to="9"></li>
                    <li data-target="#myCarousel3" data-slide-to="10"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <a href="test.php?product_type=Electronics"><img src="image/slider/Electronics1.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=Electronics"><img src="image/slider/Electronics2.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=Electronics"><img src="image/slider/Electronics3.PNG" alt="Electronics" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel3" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel3" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
      <div class="container">
            <br>
            <div id="myCarousel4" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel4" data-slide-to="8" class="active"></li>
                    <li data-target="#myCarousel4" data-slide-to="9"></li>
                    <li data-target="#myCarousel4" data-slide-to="10"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <a href="test.php?product_type=food-grocery"><img src="image/slider/Food1.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=food-grocery"><img src="image/slider/Food2.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=food-grocery"><img src="image/slider/Food3.PNG" alt="Electronics" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel4" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel4" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="container">
            <br>
            <div id="myCarousel5" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel5" data-slide-to="8" class="active"></li>
                    <li data-target="#myCarousel5" data-slide-to="9"></li>
                    <li data-target="#myCarousel5" data-slide-to="10"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <a href="test.php?product_type=HandMade"><img src="image/slider/Handmade1.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=HandMade"><img src="image/slider/Handmade2.PNG" alt="Handmade" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <a href="test.php?product_type=HandMade"><img src="image/slider/Handmade3.PNG" alt="Electronics" class = "img-responsive"></a>
                        <div class="carousel-caption">
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel5" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel5" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
<!-- Footer -->
<footer class="page-footer font-small mdb-color pt-4">

  <!-- Footer Links -->
  <div class="container text-center text-md-left">

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

        <!-- Content -->
      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none">
  <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 mx-auto my-md-4 my-0 mt-4 mb-1">


        
        <h5 class="font-weight-bold text-uppercase mb-4"> Enjoy webshoping</h5>
        <p>You can buy your goods easily.</p>
        <p>please infrom us about your expricence for using this site.</p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 mx-auto my-md-4 my-0 mt-4 mb-1">

        <!-- Links -->
        <h5 class="font-weight-bold text-uppercase mb-4">About</h5>

        <ul class="list-unstyled">
          <li>
            <p>
              <a href="#!">PRODUCTS</a>
            </p>
          </li>
          <li>
            <p>
              <a href="#!">ABOUT US</a>
            </p>
          </li>
          <li>
            <p>
              <a href="#!">CONTACT</a>
            </p>
          </li>
          <li>
            <p>
              <a href="#!">OFFER</a>
            </p>
          </li>
        </ul>

      </div>
    
         

      
        <!-- Contact details -->
        <h5 class="font-weight-bold text-uppercase mb-4">Address</h5>

        <ul class="list-unstyled">
          <li>
            <p>
              <i class="fas fa-home mr-3"></i> Sector 7,Uttora,Dhaka</p>
          </li>
          <li>
            <p>
              <i class="fas fa-envelope mr-3"></i> info@buyzone.com</p>
          </li>
          <li>
            <p>
              <i class="fas fa-phone mr-3"></i> + 88 01 62 73 65 292</p>
          </li>
          <li>
            <p>
              <i class="fas fa-print mr-3"></i> + 88 01 68 96 95 582</p>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 text-center mx-auto my-4">

        <!-- Social buttons -->
        <h5 class="font-weight-bold text-uppercase mb-4">Follow Us</h5>

        <!-- Facebook -->
        <a type="button" class="btn-floating btn-fb">
          <i class="fab fa-facebook-f"></i>
        </a>
        <!-- Twitter -->
        <a type="button" class="btn-floating btn-tw">
          <i class="fab fa-twitter"></i>
        </a>
        <!-- Google +-->
        <a type="button" class="btn-floating btn-gplus">
          <i class="fab fa-google-plus-g"></i>
        </a>
        <!-- Dribbble -->
        <a type="button" class="btn-floating btn-dribbble">
          <i class="fab fa-dribbble"></i>
        </a>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/"> Buy Zone</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
  </div>
    </body>
</html>
