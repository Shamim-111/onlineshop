<?php

include 'DataBaseHandlerClass.php';

abstract class product {

    abstract function getProduct($limit1, $limit2);

    abstract function getProductNumber();
}

class AmazonProduct extends product {

    var $ProductType, $DataBase;

    public function __construct($ProductType) {
        $this->ProductType = $ProductType;
        $this->DataBase = new DataBase("localhost", "root", "", "buyzone");
        $this->DataBase->doConnect();
    }

    public function getProduct($limit1, $limit2) {
        if (!($limit1 == '' && $limit2 == '')) {
            if ($this->ProductType == '') {
                $sql = "select * from product where product_provider='Amazon' order by product_id DESC LIMIT $limit1,$limit2";
                if ($this->DataBase->doQuery($sql)) {
                    return $this->DataBase->getResult();
                }
            } else {
                $sql = "select * from product where product_provider='Amazon' and product_type='$this->ProductType' order by product_id DESC LIMIT $limit1,$limit2";
                if ($this->DataBase->doQuery($sql)) {
                    return $this->DataBase->getResult();
                }
            }
        }
    }

    public function getProductNumber() {
        if ($this->ProductType == '') {
            $sql = "select count(*) \"total\" from product where product_provider='Amazon'";
            if ($this->DataBase->doQuery($sql)) {
                return $this->DataBase->getResult();
            }
        } else {
            $sql = "select count(*) \"total\" from product where product_provider='Amazon' and product_type='$this->ProductType'";
            if ($this->DataBase->doQuery($sql)) {
                return $this->DataBase->getResult();
            }
        }
    }

}

class eBayProduct extends product {

    var $ProductType, $DataBase;

    public function __construct($ProductType) {
        $this->ProductType = $ProductType;
        $this->DataBase = new DataBase("localhost", "root", "", "buyzone");
        $this->DataBase->doConnect();
    }

    public function getProduct($limit1, $limit2) {
        if (!($limit1 == '' && $limit2 == '')) {
            if ($this->ProductType == '') {
                $sql = "select * from product where product_provider='eBay' order by product_id DESC LIMIT $limit1,$limit2";
                if ($this->DataBase->doQuery($sql)) {
                    return $this->DataBase->getResult();
                }
            } else {
                $sql = "select * from product where product_provider='eBay' and product_type='$this->ProductType'order by product_id DESC LIMIT $limit1,$limit2";
                if ($this->DataBase->doQuery($sql)) {
                    return $this->DataBase->getResult();
                }
            }
        }
    }

    public function getProductNumber() {
        if ($this->ProductType == '') {
            $sql = "select count(*) \"total\" from product where product_provider='eBay'";
            if ($this->DataBase->doQuery($sql)) {
                return $this->DataBase->getResult();
            }
        } else {
            $sql = "select count(*) \"total\" from product where product_provider='eBay' and product_type='$this->ProductType'";
            if ($this->DataBase->doQuery($sql)) {
                return $this->DataBase->getResult();
            }
        }
    }

}

class AllProduct extends product {

    var $ProductType, $DataBase;

    public function __construct($ProductType) {
        $this->ProductType = $ProductType;
        $this->DataBase = new DataBase("localhost", "root", "", "buyzone");
        $this->DataBase->doConnect();
    }

    public function getProduct($limit1, $limit2) {
        if (!($limit1 == '' && $limit2 == '')) {
            if ($this->ProductType == '') {
                $sql = "select * from product order by product_id DESC LIMIT $limit1,$limit2";
                if ($this->DataBase->doQuery($sql)) {
                    return $this->DataBase->getResult();
                }
            } else {
                $sql = "select * from product where product_type='$this->ProductType' order by product_id DESC LIMIT $limit1,$limit2";
                if ($this->DataBase->doQuery($sql)) {
                    return $this->DataBase->getResult();
                }
            }
        }
    }

    public function getProductNumber() {
        if ($this->ProductType == '') {
            $sql = "select count(*) \"total\" from product";
            if ($this->DataBase->doQuery($sql)) {
                return $this->DataBase->getResult();
            }
        } else {
            $sql = "select count(*) \"total\" from product where product_type='$this->ProductType'";
            if ($this->DataBase->doQuery($sql)) {
                return $this->DataBase->getResult();
            }
        }
    }

}

class IndividualProduct {

    var $ProductId, $DataBase;

    public function __construct($ProductId) {
        $this->ProductId = $ProductId;
        $this->DataBase = new DataBase("localhost", "root", "", "buyzone");
        $this->DataBase->doConnect();
    }

    public function getProduct() {
        $Sql = "select * from product where product_id='$this->ProductId'";
        if ($this->DataBase->doQuery($Sql)) {
            return $this->DataBase->getResult();
        }
    }

}

class SearchProduct {

    var $SearchKey, $DataBase;

    public function __construct($SearchKey) {
        $this->SearchKey = $SearchKey;
        $this->DataBase = new DataBase("localhost", "root", "", "buyzone");
        $this->DataBase->doConnect();
    }
    public function getProductNumber(){
        $sql = "select count(*) \"total\" from product where product_type LIKE '%$this->SearchKey%' or product_provider like '%$this->SearchKey%' or product_name like '%$this->SearchKey%' or product_details like '%$this->SearchKey'";
            if ($this->DataBase->doQuery($sql)) {
                return $this->DataBase->getResult();
            }
    }
     public function getProduct($limit1, $limit2) {
         $sql="SELECT * FROM product WHERE product_type LIKE '%$this->SearchKey%' or product_provider like '%$this->SearchKey%' or product_name like '%$this->SearchKey%' or product_details like '%$this->SearchKey' order by product_id DESC LIMIT $limit1,$limit2";
         if ($this->DataBase->doQuery($sql)) {
            return $this->DataBase->getResult();
        }
     }
}

class ProductSelector {

    var $ProductProvider, $ProductType, $ProductId, $SearchKey;

    public function __construct($ProductProvider, $ProductType, $ProductId, $SearchKey) {
        $this->ProductProvider = $ProductProvider;
        $this->ProductType = $ProductType;
        $this->ProductId = $ProductId;
        $this->SearchKey = $SearchKey;
    }

    public function getProductClass() {
        if ($this->ProductId != "") {
            return new IndividualProduct($this->ProductId);
        } else if ($this->SearchKey != "") {
            return new SearchProduct($this->SearchKey);
        } else if ($this->ProductProvider == 'Amazon') {
            return new AmazonProduct($this->ProductType);
        } else if ($this->ProductProvider == 'eBay') {
            return new eBayProduct($this->ProductType);
        } else {
            return new AllProduct($this->ProductType);
        }
    }

}

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
?>

