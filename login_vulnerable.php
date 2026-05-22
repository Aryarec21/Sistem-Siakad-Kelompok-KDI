<?php
session_start();
include "config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];

    $query = "SELECT * FROM user_auth WHERE username = '$username'";

    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $_SESSION['username'] = $username;
        $_SESSION['role'] = 'mahasiswa';

        header("Location: dashboard_mahasiswa.php");
        exit;
    } else {
        echo "Login gagal";
    }
} else {
    header("Location: index.html");
    exit;
}
?>