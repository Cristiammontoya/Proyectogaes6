<?php
$servername = "localhost";
$username = "tu_usrootuario";
$password = "mysql2023*";
$dbname = "staypro"; // El nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

echo "Conexión exitosa";

// Puedes ejecutar consultas aquí
// Por ejemplo:
$sql = "SELECT * FROM persona";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "Nombre: " . $row["nombre"] . " Apellido: " . $row["apellido"] . "<br>";
    }
} else {
    echo "0 resultados";
}

// Cerrar conexión
$conn->close();
?>
