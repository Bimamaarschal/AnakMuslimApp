<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/anakmuslim.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$anakmuslim = new anakmuslim($conn);

$stmt = $anakmuslim->fetch();
$count = $stmt->rowCount();

$response = [];

if ($request == 'GET') {
    if ($count > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            extract($row);
            $data[] = array(
                "id_pengguna" => $id_pengguna,
                "nama_pengguna" => $nama_pengguna,
                "keterangan_pengguna" => $keterangan_pengguna,
            );
        }
        $response = array(
            'status' =>  array(
                'messsage' => 'Success', 'code' => http_response_code(200)
            ), 'data' => $data
        );
    } else {
        http_response_code(404);
        $response = array(
            'status' =>  array(
                'messsage' => 'No Data Found', 'code' => http_response_code()
            )
        );
    }
} else {
    http_response_code(405);
    $response = array(
        'status' =>  array(
            'messsage' => 'Method Not Allowed', 'code' => http_response_code()
        )
    );
}

echo json_encode($response);
