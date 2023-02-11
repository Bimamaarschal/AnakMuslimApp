<?php
class Database
{
    private $host = "localhost";
    private $dbname = "anakmuslim";
    private $username = "root";
    private $password = "";
    public $conn;

    public function connection()
    {
        $this->conn = null;
        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->dbname, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        } catch (PDOException $e) {
            echo "Koneksi Eror : " . $e->getMessage();
        }
        return $this->conn;
    }
}
