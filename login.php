<?php
session_start();
include "config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $username = mysqli_real_escape_string($conn, $_POST['username']);
    
    $password = mysqli_real_escape_string($conn, $_POST['password']); 

    $query = "SELECT * FROM user_auth WHERE username='$username' AND password='$password'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) == 1) {

        $user = mysqli_fetch_assoc($result);

        $_SESSION['id'] = $user['id_user']; 
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role'];

        header("Location: dashboard_mahasiswa.php");
        exit;

    } else {

        echo "<script>
            alert('Username atau Password salah!');
            window.location.href='index.html';
        </script>";
    }

} else {

    header("Location: index.html");
    exit;
}
?>