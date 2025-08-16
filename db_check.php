<?php
$host = $argv[1];
$port = $argv[2];
$database = $argv[3];
$username = $argv[4];
$password = $argv[5];

try {
    new PDO("mysql:host=$host;port=$port;dbname=$database", $username, $password);
} catch (PDOException $e) {
    exit(1);
}