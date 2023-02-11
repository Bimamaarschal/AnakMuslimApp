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
$anakmuslim->id_pengguna = isset($_GET['id_pengguna']) ? $_GET['id_pengguna'] : die();

$anakmuslim->get();

$response = [];

if ($request == 'GET') {
    if ($anakmuslim->id_pengguna != null) {
        $data = array(
            'id_pengguna' => $anakmuslim->id_pengguna,
            'nama_pengguna' => $anakmuslim->nama_pengguna,
            'keterangan_pengguna' => $anakmuslim->keterangan_pengguna,
        );
        $response = array(
            'status' =>  array(
                'messsage' => 'Success', 'code' => (http_response_code(200))
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
