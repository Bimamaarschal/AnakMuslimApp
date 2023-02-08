<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: DELETE');
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

if ($request == 'DELETE') {
    if (
        !empty($data->id_pengguna)
    ) {
        $anakmuslim->id_pengguna = $data->id_pengguna;

        if ($anakmuslim->delete()) {
            $response = array(
                'status' =>  array(
                    'messsage' => 'Success', 'code' => (http_response_code(200))
                )
            );
        } else {
            http_response_code(400);
            $response = array(
                'messsage' => 'Delete Failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' =>  array(
                'messsage' => 'Delete Failed - Wrong Parameter', 'code' => http_response_code()
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
