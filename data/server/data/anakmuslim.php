<?php
class Product
{
    public $id_pengguna;
    public $nama_pengguna;
    public $keterangan_pengguna;

    private $conn;
    private $table = "anakmuslim";

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    function add()
    {
        $query = "INSERT INTO
                " . $this->table . "
            SET
               id_pengguna=:id_pengguna, nama_pengguna=:nama_pengguna, keterangan_pengguna=:keterangan_pengguna";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('id_pengguna', $this->id_pengguna);
        $stmt->bindParam('nama_pengguna', $this->nama_pengguna);
        $stmt->bindParam('keterangan_pengguna', $this->keterangan_pengguna);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE id_pengguna = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id_pengguna);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function fetch()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function get()
    {
        $query = "SELECT * FROM " . $this->table . " p          
                WHERE
                    p.id_pengguna = ?
                LIMIT
                0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id_pengguna);

        $stmt->execute();

        $product = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id_pengguna = $product['id_pengguna'];
        $this->nama_pengguna = $product['nama_pengguna'];
        $this->keterangan_pengguna = $product['keterangan_pengguna'];
    }

    function update()
    {
        $query = "UPDATE
                " . $this->table . "
            SET
                nama_pengguna = :nama_pengguna,
                keterangan_pengguna = :keterangan_pengguna
            WHERE
                id_pengguna = :id_pengguna";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('id_pengguna', $this->id_pengguna);
        $stmt->bindParam('nama_pengguna', $this->nama_pengguna);
        $stmt->bindParam('keterangan_pengguna', $this->keterangan_pengguna);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}
