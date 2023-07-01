CREATE DATABASE Reservas;
USE Reservas;

CREATE TABLE habitaciones (
  id_habitacion INT PRIMARY KEY,
  numero_habitacion INT,
  tipo_habitacion VARCHAR(50),
  descripcion TEXT,
  precio_noche DECIMAL(10,2),
  disponible BOOLEAN
);

CREATE TABLE persona (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(50),
  nombre VARCHAR(50),
  contraseña VARCHAR(50),
  tipo_usuario VARCHAR(20)
);

CREATE TABLE reservas (
  id_reserva INT PRIMARY KEY,
  id_habitacion INT,
  id_cliente INT,
  fecha_entrada DATE,
  fecha_salida DATE,
  FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion),
  FOREIGN KEY (id_cliente) REFERENCES persona(id_usuario)
);

INSERT INTO persona (usuario, nombre, contraseña, tipo_usuario)
VALUES ('Admin', 'Administrador web', '12345', '1');
