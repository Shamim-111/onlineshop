<?php

class DataBase {

    var $dbHost, $dbUser, $dbPass, $dbName;
    var $ConnectionResult, $Sql, $QueryResult;

    public function __construct($dbHost, $dbUser, $dbPass, $dbName) {
        $this->dbHost = $dbHost;
        $this->dbUser = $dbUser;
        $this->dbPass = $dbPass;
        $this->dbName = $dbName;
    }

    public function doConnect() {
        return $this->ConnectionResult = new mysqli($this->dbHost, $this->dbUser, $this->dbPass, $this->dbName);
    }
    public function doQuery($Sql)
    {
        $this->Sql=$Sql;
        return $this->QueryResult=$this->ConnectionResult->query($this->Sql);
    }
    public function getResult()
    {
        return $this->QueryResult;
    }
    public function doColose()
    {
        if($this->ConnectionResult)
        {
             $this->ConnectionResult->close();
        } 
    }
}
?>
