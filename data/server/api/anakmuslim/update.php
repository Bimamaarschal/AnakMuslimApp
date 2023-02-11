<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: PUT');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/anakmuslim.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$anakmuslim = new anakmuslim($conn);

$data = json_decode(file_get_contents("php://input"));

$anakmuslim->id_pengguna = $data->id_pengguna;

$response = [];

if ($request == 'PUT') {
    if (
        !empty($data->id_pengguna) &&
        !empty($data->nama_pengguna) &&
        !empty($data->keterangan_pengguna)
    ) {
        $anakmuslim->id_pengguna = $data->id_pengguna;
        $anakmuslim->nama_pengguna = $data->nama_pengguna;
        $anakmuslim->keterangan_pengguna = $data->keterangan_pengguna;

        $data = array(
            'id_pengguna' => $anakmuslim->id_pengguna,
            'nama_pengguna' => $anakmuslim->nama_pengguna,
            'keterangan_pengguna' => $anakmuslim->keterangan_pengguna,
        );

        if ($anakmuslim->update()) {
            $response = array(
                'status' =>  array(
                    'messsage' => 'Success', 'code' => (http_response_code(200))
                ), 'data' => $data
            );
        } else {
            http_response_code(400);
            $response = array(
                'messsage' => 'Update Failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' =>  array(
                'messsage' => 'Update Failed - Wrong Parameter', 'code' => http_response_code()
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
