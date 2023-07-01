CREATE DATABASE IF NOT EXISTS Staypro /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE Staypro;

-- Crear tabla de clientes
CREATE TABLE IF NOT EXISTS clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cedula VARCHAR(20) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  role INT NOT NULL
);

-- Insertar datos de ejemplo en la tabla de clientes
INSERT INTO clientes (cedula, nombre, apellido, email, role) VALUES
  ('1234567890', 'Juan', 'Pérez', 'cliente1@example.com', 1),
  ('9876543210', 'María', 'Gómez', 'cliente2@example.com', 1),
  ('5678901234', 'Pedro', 'López', 'cliente3@example.com', 1),
  ('0123456789', 'Ana', 'Sánchez', 'cliente4@example.com', 1),
  ('5432109876', 'Luis', 'Torres', 'cliente5@example.com', 1),
  ('2468135790', 'Laura', 'Rodríguez', 'cliente6@example.com', 1),
  ('1357924680', 'Carlos', 'García', 'cliente7@example.com', 1),
  ('9870123456', 'Sofía', 'Hernández', 'cliente8@example.com', 1),
  ('3210987654', 'Andrés', 'Martínez', 'cliente9@example.com', 1),
  ('7418529630', 'Diana', 'Flores', 'cliente10@example.com', 1);

-- Crear tabla de roles
CREATE TABLE IF NOT EXISTS roles (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL
);

-- Insertar datos de ejemplo en la tabla de roles
INSERT INTO roles (nombre) VALUES
  ('Cliente'),
  ('Administrador');

-- Crear tabla de habitaciones
CREATE TABLE IF NOT EXISTS habitaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  numero VARCHAR(10) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  capacidad INT NOT NULL,
  precio DECIMAL(10, 2) NOT NULL
);

-- Insertar datos de ejemplo en la tabla de habitaciones
INSERT INTO habitaciones (numero, tipo, capacidad, precio) VALUES
  ('101', 'Individual', 1, 50.00),
  ('201', 'Doble', 2, 80.00),
  ('301', 'Suite', 4, 120.00);

-- Crear tabla de reservas
CREATE TABLE IF NOT EXISTS reservas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  habitacion_id INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  subtotal DECIMAL(10, 2),
  total DECIMAL(10, 2),
  cancelada BOOLEAN NOT NULL DEFAULT false,
  FOREIGN KEY (cliente_id) REFERENCES clientes (id),
  FOREIGN KEY (habitacion_id) REFERENCES habitaciones (id)
);

-- Insertar datos de ejemplo en la tabla de reservas
INSERT INTO reservas (cliente_id, habitacion_id, fecha_inicio, fecha_fin, subtotal, total, cancelada) VALUES
  (1, 1, '2023-07-01', '2023-07-03', 100.00, 120.00, false),
  (2, 2, '2023-07-02', '2023-07-05', 200.00, 250.00, false),
  (3, 3, '2023-07-03', '2023-07-06', 300.00, 350.00, true),
  (4, 1, '2023-07-04', '2023-07-07', 150.00, 180.00, false),
  (5, 2, '2023-07-05', '2023-07-08', 160.00, 200.00, false);


CALL ObtenerReservasPorClienteEmail('cliente1@example.com');














