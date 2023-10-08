-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema staypro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema staypro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `staypro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `staypro` ;

-- -----------------------------------------------------
-- Table `staypro`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`rol` (
  `idRol` INT(11) NOT NULL,
  `nombrerol` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`persona` (
  `Ndocumento` INT(11) NOT NULL,
  `nombre` VARCHAR(80) NULL DEFAULT NULL,
  `apellido` VARCHAR(80) NULL DEFAULT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Ndocumento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`usuario` (
  `UsuarioID` INT(11) NOT NULL AUTO_INCREMENT,
  `CorreoElectronico` VARCHAR(255) NULL DEFAULT NULL,
  `Contraseña` VARCHAR(255) NULL DEFAULT NULL,
  `persona_Ndocumento` INT(11) NOT NULL,
  `Rol_idRol` INT(11) NOT NULL,
  PRIMARY KEY (`UsuarioID`),
  INDEX `fk_usuario_persona1_idx` (`persona_Ndocumento` ASC) VISIBLE,
  INDEX `fk_usuario_Rol1_idx` (`Rol_idRol` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `staypro`.`rol` (`idRol`),
  CONSTRAINT `fk_usuario_persona1`
    FOREIGN KEY (`persona_Ndocumento`)
    REFERENCES `staypro`.`persona` (`Ndocumento`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`administrador` (
  `AdministradorID` INT(11) NOT NULL AUTO_INCREMENT,
  `UsuarioID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`AdministradorID`),
  UNIQUE INDEX `UsuarioID` (`UsuarioID` ASC) VISIBLE,
  CONSTRAINT `administrador_ibfk_1`
    FOREIGN KEY (`UsuarioID`)
    REFERENCES `staypro`.`usuario` (`UsuarioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`cargo` (
  `idcargo` INT(11) NOT NULL,
  `nombrecargo` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`cliente` (
  `ClienteID` INT(11) NOT NULL AUTO_INCREMENT,
  `UsuarioID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ClienteID`),
  UNIQUE INDEX `UsuarioID` (`UsuarioID` ASC) VISIBLE,
  CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`UsuarioID`)
    REFERENCES `staypro`.`usuario` (`UsuarioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`promociones` (
  `numpromocion` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePrograma` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion_programa` VARCHAR(100) NULL DEFAULT NULL,
  `beneficios_programa` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_finalizacion` DATE NULL DEFAULT NULL,
  `requisitos` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`numpromocion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`cliente_has_promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`cliente_has_promociones` (
  `cliente_ClienteID` INT(11) NOT NULL,
  `promociones_numpromocion` INT(11) NOT NULL,
  PRIMARY KEY (`cliente_ClienteID`, `promociones_numpromocion`),
  INDEX `fk_cliente_has_promociones_promociones1_idx` (`promociones_numpromocion` ASC) VISIBLE,
  INDEX `fk_cliente_has_promociones_cliente1_idx` (`cliente_ClienteID` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_promociones_cliente1`
    FOREIGN KEY (`cliente_ClienteID`)
    REFERENCES `staypro`.`cliente` (`ClienteID`),
  CONSTRAINT `fk_cliente_has_promociones_promociones1`
    FOREIGN KEY (`promociones_numpromocion`)
    REFERENCES `staypro`.`promociones` (`numpromocion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`tipo_habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`tipo_habitacion` (
  `idtipo_habitacion` INT(11) NOT NULL,
  `nombretipohabitacion` VARCHAR(45) NULL DEFAULT NULL,
  `capacidad` INT(4) NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NULL DEFAULT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`idtipo_habitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`habitaciones` (
  `numhabitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `Estado` VARCHAR(50) NULL DEFAULT NULL,
  `tipo_habitacion_idtipo_habitacion1` INT(11) NOT NULL,
  PRIMARY KEY (`numhabitacion`),
  INDEX `fk_habitaciones_tipo_habitacion1_idx` (`tipo_habitacion_idtipo_habitacion1` ASC) VISIBLE,
  CONSTRAINT `fk_habitaciones_tipo_habitacion1`
    FOREIGN KEY (`tipo_habitacion_idtipo_habitacion1`)
    REFERENCES `staypro`.`tipo_habitacion` (`idtipo_habitacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`reservas` (
  `ReservaID` INT(11) NOT NULL AUTO_INCREMENT,
  `ClienteID` INT(11) NULL DEFAULT NULL,
  `FechaEntrada` DATE NULL DEFAULT NULL,
  `FechaSalida` DATE NULL DEFAULT NULL,
  `EstadoReserva` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ReservaID`),
  INDEX `ClienteID` (`ClienteID` ASC) VISIBLE,
  CONSTRAINT `reservas_ibfk_1`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `staypro`.`cliente` (`ClienteID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`detalles_reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`detalles_reserva` (
  `reservas_ReservaID` INT(11) NOT NULL,
  `habitaciones_numhabitacion` INT(11) NOT NULL,
  `habitaciones_tipo_habitacion_idtipo_habitacion` INT(11) NOT NULL,
  PRIMARY KEY (`reservas_ReservaID`, `habitaciones_numhabitacion`, `habitaciones_tipo_habitacion_idtipo_habitacion`),
  INDEX `fk_reservas_has_habitaciones_habitaciones1_idx` (`habitaciones_numhabitacion` ASC, `habitaciones_tipo_habitacion_idtipo_habitacion` ASC) VISIBLE,
  INDEX `fk_reservas_has_habitaciones_reservas1_idx` (`reservas_ReservaID` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_has_habitaciones_habitaciones1`
    FOREIGN KEY (`habitaciones_numhabitacion`)
    REFERENCES `staypro`.`habitaciones` (`numhabitacion`),
  CONSTRAINT `fk_reservas_has_habitaciones_reservas1`
    FOREIGN KEY (`reservas_ReservaID`)
    REFERENCES `staypro`.`reservas` (`ReservaID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`empleado` (
  `EmpleadoID` INT(11) NOT NULL AUTO_INCREMENT,
  `UsuarioID` INT(11) NULL DEFAULT NULL,
  `cargo_idcargo` INT(11) NOT NULL,
  PRIMARY KEY (`EmpleadoID`),
  UNIQUE INDEX `UsuarioID` (`UsuarioID` ASC) VISIBLE,
  INDEX `fk_empleado_cargo1_idx` (`cargo_idcargo` ASC) VISIBLE,
  CONSTRAINT `empleado_ibfk_1`
    FOREIGN KEY (`UsuarioID`)
    REFERENCES `staypro`.`usuario` (`UsuarioID`),
  CONSTRAINT `fk_empleado_cargo1`
    FOREIGN KEY (`cargo_idcargo`)
    REFERENCES `staypro`.`cargo` (`idcargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`permisos` (
  `idpermisos` INT(11) NOT NULL,
  `tipopermiso` VARCHAR(45) NULL DEFAULT NULL,
  `descripcionpermiso` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idpermisos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`tipo_pqrs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`tipo_pqrs` (
  `idtipo_pqrs` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion_tipo` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`idtipo_pqrs`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`pqrs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`pqrs` (
  `numcaso` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `pqrscol` VARCHAR(45) NULL DEFAULT NULL,
  `usuario_UsuarioID` INT(11) NOT NULL,
  `tipo_pqrs_idtipo_pqrs` INT(11) NOT NULL,
  PRIMARY KEY (`numcaso`),
  INDEX `fk_pqrs_usuario1_idx` (`usuario_UsuarioID` ASC) VISIBLE,
  INDEX `fk_pqrs_tipo_pqrs1_idx` (`tipo_pqrs_idtipo_pqrs` ASC) VISIBLE,
  CONSTRAINT `fk_pqrs_tipo_pqrs1`
    FOREIGN KEY (`tipo_pqrs_idtipo_pqrs`)
    REFERENCES `staypro`.`tipo_pqrs` (`idtipo_pqrs`),
  CONSTRAINT `fk_pqrs_usuario1`
    FOREIGN KEY (`usuario_UsuarioID`)
    REFERENCES `staypro`.`usuario` (`UsuarioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`rol_has_permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`rol_has_permisos` (
  `Rol_idRol` INT(11) NOT NULL,
  `permisos_idpermisos` INT(11) NOT NULL,
  PRIMARY KEY (`Rol_idRol`, `permisos_idpermisos`),
  INDEX `fk_Rol_has_permisos_permisos1_idx` (`permisos_idpermisos` ASC) VISIBLE,
  INDEX `fk_Rol_has_permisos_Rol_idx` (`Rol_idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Rol_has_permisos_Rol`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `staypro`.`rol` (`idRol`),
  CONSTRAINT `fk_Rol_has_permisos_permisos1`
    FOREIGN KEY (`permisos_idpermisos`)
    REFERENCES `staypro`.`permisos` (`idpermisos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `staypro`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`categorias` (
  `idcategorias` INT NOT NULL,
  `nombreCategoria` VARCHAR(45) NULL,
  `descripcionCategoria` MEDIUMTEXT NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staypro`.`encuestaSatisfaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`encuestaSatisfaccion` (
  `idencuestaSatisfaccion` INT NOT NULL AUTO_INCREMENT,
  `puntuacion` DECIMAL(1) NULL,
  `comentarios` VARCHAR(255) NULL,
  `cliente_ClienteID` INT(11) NOT NULL,
  PRIMARY KEY (`idencuestaSatisfaccion`),
  INDEX `fk_encuestaSatisfaccion_cliente_idx` (`cliente_ClienteID` ASC) VISIBLE,
  CONSTRAINT `fk_encuestaSatisfaccion_cliente`
    FOREIGN KEY (`cliente_ClienteID`)
    REFERENCES `staypro`.`cliente` (`ClienteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staypro`.`entradas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`entradas` (
  `identradas` INT NOT NULL AUTO_INCREMENT,
  `cantidadProducto` INT NULL,
  `precio` DECIMAL(2) NULL,
  `fechaIngreso` DATETIME NULL,
  `productos_codigoProducto` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`identradas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staypro`.`salidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`salidas` (
  `idsalidas` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL,
  `fechaSalida` DATETIME NULL,
  `productos_codigoProducto` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idsalidas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staypro`.`provedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`provedores` (
  `NIT` INT NOT NULL,
  `razonSocial` VARCHAR(120) NULL,
  `correo` VARCHAR(100) NULL,
  `telefono` INT NULL,
  `direccion` VARCHAR(80) NULL,
  `ciudad` VARCHAR(45) NULL,
  PRIMARY KEY (`NIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staypro`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`productos` (
  `codigoProducto` VARCHAR(10) NOT NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `descripcionProducto` VARCHAR(45) NULL,
  `provedores_NIT` INT NOT NULL,
  `categorias_idcategorias` INT NOT NULL,
  `provedores_NIT1` INT NOT NULL,
  `categorias_idcategorias1` INT NOT NULL,
  PRIMARY KEY (`codigoProducto`),
  INDEX `fk_productos_provedores1_idx` (`provedores_NIT1` ASC) VISIBLE,
  INDEX `fk_productos_categorias1_idx` (`categorias_idcategorias1` ASC) VISIBLE,
  CONSTRAINT `fk_productos_provedores1`
    FOREIGN KEY (`provedores_NIT1`)
    REFERENCES `staypro`.`provedores` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`categorias_idcategorias1`)
    REFERENCES `staypro`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staypro`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staypro`.`inventario` (
  `idinventario` INT NOT NULL AUTO_INCREMENT,
  `cantidadDisponible` VARCHAR(45) NULL,
  `entradas_identradas` INT NOT NULL,
  `salidas_idsalidas` INT NOT NULL,
  `productos_codigoProducto` VARCHAR(10) NOT NULL,
  `entradas_identradas1` INT NOT NULL,
  `salidas_idsalidas1` INT NOT NULL,
  `productos_codigoProducto1` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idinventario`),
  INDEX `fk_inventario_entradas1_idx` (`entradas_identradas1` ASC) VISIBLE,
  INDEX `fk_inventario_salidas1_idx` (`salidas_idsalidas1` ASC) VISIBLE,
  INDEX `fk_inventario_productos1_idx` (`productos_codigoProducto1` ASC) VISIBLE,
  CONSTRAINT `fk_inventario_entradas1`
    FOREIGN KEY (`entradas_identradas1`)
    REFERENCES `staypro`.`entradas` (`identradas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_salidas1`
    FOREIGN KEY (`salidas_idsalidas1`)
    REFERENCES `staypro`.`salidas` (`idsalidas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_productos1`
    FOREIGN KEY (`productos_codigoProducto1`)
    REFERENCES `staypro`.`productos` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
