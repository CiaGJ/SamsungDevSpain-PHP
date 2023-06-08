<?php
if($_POST){
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $email = $_POST['email'];

    // Conexión con PDO
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "cursoSQL";

    // Create connect
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if($conn->connect_error){ 
        die("Connection failed: ".$conn->connect_error);
    }

    $sql = "INSERT INTO usuario (NOMBRE, APELLIDO, EMAIL)
    VALUES ('$name','$surname','$email')";

    if($conn->query($sql)=== TRUE){
        echo "New record created sucessfully";
    }else{
        echo "Error: ".$sql."<br>".$conn->error;
    }

    $conn->close();
}

?>