use Staypro;

DELIMITER //

CREATE PROCEDURE ObtenerReservasPorClienteEmail(IN clienteEmail VARCHAR(50))
BEGIN
  SELECT r.id, c.cedula, c.nombre, c.apellido, h.numero, r.fecha_inicio, r.fecha_fin
  FROM reservas r
  INNER JOIN clientes c ON r.cliente_id = c.id
  INNER JOIN habitaciones h ON r.habitacion_id = h.id
  WHERE c.email = clienteEmail;
END //

DELIMITER ;





