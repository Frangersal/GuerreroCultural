<?php
$host = getenv('DB_HOST');
$port = getenv('DB_PORT');
$database = getenv('DB_DATABASE');
$username = getenv('DB_USERNAME');
$password = getenv('DB_PASSWORD');

try {
    new PDO("mysql:host=$host;port=$port;dbname=$database", $username, $password);
} catch (PDOException $e) {
    exit(1);
}