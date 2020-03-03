<?php

include 'DataBaseHandlerClass.php';

interface PersonBuilder {

    public function setAddress($PersonAddress);

    public function setPhone($PersonPhone);
}

class UserForm {

    var $UserName, $UserPhone;
    var $UserEmail, $UserAddress;
    var $UserPassword, $UserId;

    public function __construct($UserName, $UserPhone, $UserEmail, $UserAddress, $UserPassword) {
        $this->UserName = $UserName;
        $this->UserPhone = $UserPhone;
        $this->UserEmail = $UserEmail;
        $this->UserAddress = $UserAddress;
        $this->UserPassword = $UserPassword;
    }

}

class UserFormBuilder implements PersonBuilder {

    var $UserName, $UserPhone;
    var $UserEmail, $UserAddress;
    var $UserPassword, $UserId;

    public function __construct($UserName, $UserEmail, $UserPassword) {
        $this->UserName = $UserName;
        $this->UserEmail = $UserEmail;
        $this->UserPassword = $UserPassword;
    }

    public function setPhone($PersonPhone) {
        $this->UserPhone = $PersonPhone;
        return $this;
    }

    public function setAddress($PersonAddress) {
        $this->UserAddress = $PersonAddress;
        return $this;
    }

    public function getUserForm() {
        return new UserForm($this->UserName, $this->UserPhone, $this->UserEmail, $this->UserAddress, $this->UserPassword);
    }

}

abstract class Registration {

    abstract public function userInputCheck();

    abstract public function userEmailCheck();

    abstract public function registration();
}

class UserRegestration extends Registration {

    var $UserName, $UserPhone;
    var $UserEmail, $UserAddress;
    var $UserPassword, $UserId;
    var $DataBase;

    public function __construct($UserForm) {
        $this->UserName = $UserForm->UserName;
        $this->UserPhone = $UserForm->UserPhone;
        $this->UserEmail = $UserForm->UserEmail;
        $this->UserAddress = $UserForm->UserAddress;
        $this->UserPassword = $UserForm->UserPassword;
        $this->DataBase = new DataBase("localhost", "root", "", "byzone");
    }

    public function userEmailCheck() {
        $this->DataBase->doConnect();
        if ($this->DataBase->doQuery("select customer_email from customer where customer_email='$this->UserEmail'")) {
            if ($row = mysqli_fetch_array($this->DataBase->getResult()) >= 1) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public function userInputCheck() {
        if ($this->UserName == '') {
            echo
            "<script>window.open('RegistrationPage.php?massage=Name Is Required','_self')</script>";
            exit();
        }
        if ($this->UserPhone == '') {
            echo
            "<script>window.open('RegistrationPage.php?massage=Phone Number Is Required','_self')</script>";
            exit();
        }
        if ($this->UserEmail == '') {
            echo
            "<script>window.open('RegistrationPage.php?massage=Email Is Required','_self')</script>";
            exit();
        }
        if ($this->UserPassword == '') {
            echo
            "<script>window.open('RegistrationPage.php?massage=Password Is Required','_self')</script>";
            exit();
        }
        if ($this->userEmailCheck()) {
            echo
            "<script>window.open('RegistrationPage.php?massage=Email Already Exists','_self')</script>";
            exit();
        }
        return true;
    }

    public function registration() {
        $que = "insert into customer(customer_name,customer_phone,customer_address,customer_email,customer_password)
        values('$this->UserName','$this->UserPhone','$this->UserAddress','$this->UserEmail','$this->UserPassword')";
        if ($this->DataBase->doQuery($que)) {
            echo
            "<script>window.open('RegistrationPage.php?massage=Registration Successful','_self')</script>";
            exit();
        } else {
            echo
            "<script>window.open('RegistrationPage.php?massage=Something Went Wrong. Try Again Later','_self')</script>";
            exit();
        }
    }

}
?>

