<!doctype html>
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
        <title>User Registration Form</title>                
    </head>
    <body>      
        <form id="RegistrationForm" onsubmit="return false">
            <div class="overlay">
            <div class="loader"></div>
        </div>
        <div class="container">
            <center> 
             <div class="row">			
		<div class="col-md-12" id="signup_msg">	</div>					
             </div>
             <h1 class="well">Registration Form</h1>
            </center>
            <div class="col-lg-12 well">
                <div class="row">                   
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12 form-group">
                                    <label >Name</label>
                                    <input type="text" name="name" placeholder="Enter Your Name Here.." class="form-control" required>
                                </div>                                
                            </div>					
                            <div class="form-group">
                                <label>Address</label>
                                <textarea name="address" placeholder="Enter Address Here.." rows="3" class="form-control" required></textarea>
                            </div>	                            
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Password</label>
                                    <input type="text" name="password" placeholder="Enter Password Here.." class="form-control" required>
                                </div>		
                                <div class="col-sm-6 form-group">
                                    <label>Confirm Password</label>
                                    <input type="text" name="confirmPassword" placeholder="Re-Enter Password Here.." class="form-control" required>
                                </div>	
                            </div>						
                            <div class="form-group">
                                <label>Phone Number</label>
                                <input type="text" name="phone" placeholder="Enter Phone Number Here.." class="form-control" required>
                            </div>		
                            <div class="form-group">
                                <label>Email Address</label>
                                <input type="text" name="email" placeholder="Enter Email Address Here.." class="form-control" required>
                            </div>	                            
                            <input type="submit" id="signup" class="btn btn-lg btn-success pull-right" Value="Submit">					
                        </div>                        
                </div>
            </div>
        </div>
    </form>                    
    </body>
</html>