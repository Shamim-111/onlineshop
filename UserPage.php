
<?php
session_start();
if (!isset($_SESSION['user_name'])) {
    header('Location: homepage.php');
} else {
    $user_name = $_SESSION['user_name'];
}
?>

<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link type = "text/css" href= 'style.css' rel= 'stylesheet'>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>BuyZone</title>
        <style>

            input[type=text]
            {
                padding:7px;
                border:5px;
                font-size:16px;
                font-family:sans-serif;
                color: black;

            }
            button 
            {
                width:100px;
                cursor:pointer;
                margin-top:35px;
                padding:7px;
                background:#F1C40F;
                border-radius: 0 5px 5px 0;
                bordr:none;
                color:black;
                position: relative;
            }
        </style>
    </head>
    <body>

        <div id="search_box">
            <input id= "textstyle"  type = "text" name = "Search" placeholder = "Search here">
            <button> Search </button>
        </div>
        <div id="menu">

            <ul>
                <li> <a> BuyZone<span><img src="down-arrow.png" style="width:10px;height:10px;"></span></a>
                    <ul>
                        <li> <a href = "#">Amazon</a></li>
                        <li> <a href = "#">eBay</a></li>
                        <li> <a href = "#">Alibaba</a></li>
                    </ul>

                </li>
                <li> <a href = "# ">Department <span><img src="down-arrow.png" style="width:10px;height:10px;"></span></a>
                    <ul>
                        <li><a href = "#"> Electronics </a>

                            <ul>
                                <li> <a href = "#"> Computer</a></li>
                                <li> <a href = "#"> Mobile</a></li>
                                <li> <a href = "#"> Machinery</a></li>
                                <li> <a href = "#"> Networking</a></li>
                            </ul>



                        <li> <a href = "#"> Books </a>
                            <ul>
                                <li> <a href = "#">Children's Books</a></li>
                                <li> <a href = "#">Text Books</a></li>
                                <li> <a href = "#">Fiction</a></li>
                                <li> <a href = "#">Magazines</a></li>
                            </ul>

                        <li> <a href = "#">Food & Grocaey</a>

                            <ul>
                                <li> <a href = "#">Baby Food</a></li>
                                <li> <a href = "#">Breakfast</a></li>
                                <li> <a href = "#">Candy & Chocolate</a></li>
                                <li> <a href = "#">Dairy</a></li>
                            </ul>


                        </li>
                        <li> <a href = "#"> Clothing, Shoes & Jewelry</a>

                            <ul>
                                <li> <a href = "#">Women</a></li>
                                <li> <a href = "#">Men</a></li>
                                <li> <a href = "#">Boys</a></li>
                                <li> <a href = "#">Girls</a></li>
                                <li> <a href = "#">Babys</a></li>
                            </ul>

                        </li>
                        <li> <a href = "#"> Handmade</a>
                            <ul>
                                <li> <a href = "#">Gifts</a></li>
                                <li> <a href = "#">Toys & Games</a></li>
                                <li> <a href = "#">Wedding</a></li>
                                <li> <a href = "#">Jewelry</a></li>
                            </ul></li>
                    </ul>
                </li>
                <li> <a href = "#"> Cart</a></li>
                <li> <a href = "#"> Help</a></li>
                <li> <a> <?php echo$user_name;?></a></li>
                <li> <a href = "logout.php">LogOut</a></li> 
            </ul>
            <br><br><br><br><br><br><br><br><br><br>
        </div>
    </body>
</html>

<?php
?>



