<?php
require "conexion.php";

session_start();

if ($_POST) {
    $usuario = $_POST['usuario'];
    $contraseña = $_POST['contraseña'];

    $sql = "SELECT id_usuario, contraseña, nombre, tipo_usuario FROM persona WHERE usuario='$usuario'";

    $resultado = $mysqli->query($sql);
    $num = $resultado->num_rows;

    if ($num > 0) {
        $row = $resultado->fetch_assoc();
        $contraseña_bd = $row['contraseña'];

        $contraseña_cifrada = sha1($contraseña);

        if ($contraseña_bd == $contraseña_cifrada) {
            $_SESSION['id'] = $row['id_usuario']; 
            $_SESSION['nombre'] = $row['nombre'];
            $_SESSION['tipo_usuario'] = $row['tipo_usuario'];

            header("Location: principal.php");
            exit;
        } else {
            echo "La contraseña no coincide";
        }
    } else {
        echo "No existe el usuario";
    }
}
?>




?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" name="usuario" type="text" placeholder="name@example.com" />
                                                <label for="inputEmail">usuario</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" name="contraseña" type="password" placeholder="Password" />
                                                <label for="inputPassword">contraseña</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Recordar contraseña</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.html">Forgot Password?</a>
                                                <button type="submit" class="btn btn-primary">Login</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
