-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LaboratorioClinico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LaboratorioClinico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LaboratorioClinico` DEFAULT CHARACTER SET utf8 ;
USE `LaboratorioClinico` ;

-- -----------------------------------------------------
-- Table `LaboratorioClinico`.`TB_LABORATORIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaboratorioClinico`.`TB_LABORATORIO` (
  `codigo_lab` INT NOT NULL AUTO_INCREMENT,
  `nombre_lab` VARCHAR(30) NULL,
  `telefono_lab` TEXT(8) NOT NULL,
  `dpi_pa` TEXT(15) NULL,
  `codigo_ex` INT NOT NULL,
  `TB_PACIENTE_dpi_pa` TEXT(15) NOT NULL,
  `TB_PACIENTE_TB_FACTURA_codigo_fa` INT NOT NULL,
  PRIMARY KEY (`codigo_lab`),
  INDEX `fk_TB_LABORATORIO_TB_EXPEDIENTE1_idx` (`codigo_ex` ASC) VISIBLE,
  INDEX `fk_TB_LABORATORIO_TB_PACIENTE1_idx` (`dpi_pa` ASC) VISIBLE,
  INDEX `fk_TB_LABORATORIO_TB_PACIENTE2_idx` (`TB_PACIENTE_dpi_pa` ASC, `TB_PACIENTE_TB_FACTURA_codigo_fa` ASC) VISIBLE,
  CONSTRAINT `fk_TB_LABORATORIO_TB_EXPEDIENTE1`
    FOREIGN KEY (`codigo_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`codigo_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_LABORATORIO_TB_PACIENTE1`
    FOREIGN KEY (`dpi_pa`)
    REFERENCES `LaboratorioClinico`.`TB_PACIENTE` (`dpi_pa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_LABORATORIO_TB_PACIENTE2`
    FOREIGN KEY (`TB_PACIENTE_dpi_pa` , `TB_PACIENTE_TB_FACTURA_codigo_fa`)
    REFERENCES `LaboratorioClinico`.`TB_PACIENTE` (`dpi_pa` , `TB_FACTURA_codigo_fa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaboratorioClinico`.`TB_ENCABEZADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaboratorioClinico`.`TB_ENCABEZADO` (
  `codigo_en` INT NOT NULL AUTO_INCREMENT,
  `nombre_lab` VARCHAR(30) NOT NULL,
  `codigo_lab` INT NOT NULL,
  `monto_en` DOUBLE NOT NULL,
  `TB_FACTURA_codigo_fa` INT NOT NULL,
  PRIMARY KEY (`codigo_en`),
  INDEX `fk_TB_ENCABEZADO_TB_FACTURA1_idx` (`TB_FACTURA_codigo_fa` ASC) VISIBLE,
  INDEX `fk_TB_ENCABEZADO_TB_LABORATORIO1_idx` (`nombre_lab` ASC) VISIBLE,
  INDEX `fk_TB_ENCABEZADO_TB_LABORATORIO2_idx` (`codigo_lab` ASC) VISIBLE,
  CONSTRAINT `fk_TB_ENCABEZADO_TB_FACTURA1`
    FOREIGN KEY (`TB_FACTURA_codigo_fa`)
    REFERENCES `LaboratorioClinico`.`TB_FACTURA` (`codigo_fa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_ENCABEZADO_TB_LABORATORIO1`
    FOREIGN KEY (`nombre_lab`)
    REFERENCES `LaboratorioClinico`.`TB_LABORATORIO` (`nombre_lab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_ENCABEZADO_TB_LABORATORIO2`
    FOREIGN KEY (`codigo_lab`)
    REFERENCES `LaboratorioClinico`.`TB_LABORATORIO` (`codigo_lab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaboratorioClinico`.`TB_FACTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaboratorioClinico`.`TB_FACTURA` (
  `codigo_en` TEXT(5) NOT NULL,
  `fecha_fa` DATE NOT NULL,
  `codigo_fa` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo_fa`),
  INDEX `fk_TB_FACTURA_TB_ENCABEZADO1_idx` (`codigo_en` ASC) VISIBLE,
  CONSTRAINT `fk_TB_FACTURA_TB_ENCABEZADO1`
    FOREIGN KEY (`codigo_en`)
    REFERENCES `LaboratorioClinico`.`TB_ENCABEZADO` (`codigo_en`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaboratorioClinico`.`TB_PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaboratorioClinico`.`TB_PACIENTE` (
  `dpi_pa` TEXT(15) NOT NULL,
  `codigo_ex` INT NOT NULL,
  `nombre_ex` VARCHAR(30) NOT NULL,
  `TB_FACTURA_codigo_fa` INT NOT NULL,
  PRIMARY KEY (`dpi_pa`, `TB_FACTURA_codigo_fa`),
  INDEX `fk_TB_PACIENTE_TB_FACTURA1_idx` (`TB_FACTURA_codigo_fa` ASC) VISIBLE,
  INDEX `fk_TB_PACIENTE_TB_EXPEDIENTE1_idx` (`codigo_ex` ASC) VISIBLE,
  INDEX `fk_TB_PACIENTE_TB_EXPEDIENTE2_idx` (`nombre_ex` ASC) VISIBLE,
  CONSTRAINT `fk_TB_PACIENTE_TB_FACTURA1`
    FOREIGN KEY (`TB_FACTURA_codigo_fa`)
    REFERENCES `LaboratorioClinico`.`TB_FACTURA` (`codigo_fa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_PACIENTE_TB_EXPEDIENTE1`
    FOREIGN KEY (`codigo_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`codigo_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_PACIENTE_TB_EXPEDIENTE2`
    FOREIGN KEY (`nombre_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`nombre_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaboratorioClinico`.`TB_EXPEDIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaboratorioClinico`.`TB_EXPEDIENTE` (
  `codigo_ex` INT NOT NULL AUTO_INCREMENT,
  `nombre_ex` VARCHAR(30) NOT NULL,
  `genero_ex` VARCHAR(20) NOT NULL,
  `telefono_ex` INT NOT NULL,
  `nit_ex` VARCHAR(9) NULL,
  `direccion_ex` TEXT(30) NULL,
  `dpi_pa` INT NOT NULL,
  `referente_ex` VARCHAR(30) NULL,
  `muestra_ex` VARCHAR(25) NULL,
  `nacimiento_ex` DATE NOT NULL,
  `codauxiliar_ex` INT NULL,
  `id_us` INT NOT NULL,
  `TB_USUARIOS_id_us` INT NOT NULL,
  `TB_PACIENTE_dpi_pa` TEXT(15) NOT NULL,
  `TB_PACIENTE_TB_FACTURA_codigo_fa` INT NOT NULL,
  PRIMARY KEY (`codigo_ex`, `TB_PACIENTE_dpi_pa`, `TB_PACIENTE_TB_FACTURA_codigo_fa`),
  INDEX `fk_TB_EXPEDIENTE_TB_PACIENTE1_idx` (`dpi_pa` ASC) VISIBLE,
  INDEX `fk_TB_EXPEDIENTE_TB_USUARIOS1_idx` (`id_us` ASC) VISIBLE,
  INDEX `fk_TB_EXPEDIENTE_TB_USUARIOS2_idx` (`TB_USUARIOS_id_us` ASC) VISIBLE,
  INDEX `fk_TB_EXPEDIENTE_TB_PACIENTE2_idx` (`TB_PACIENTE_dpi_pa` ASC, `TB_PACIENTE_TB_FACTURA_codigo_fa` ASC) VISIBLE,
  CONSTRAINT `fk_TB_EXPEDIENTE_TB_PACIENTE1`
    FOREIGN KEY (`dpi_pa`)
    REFERENCES `LaboratorioClinico`.`TB_PACIENTE` (`dpi_pa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_EXPEDIENTE_TB_USUARIOS1`
    FOREIGN KEY (`id_us`)
    REFERENCES `LaboratorioClinico`.`TB_USUARIOS` (`id_us`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_EXPEDIENTE_TB_USUARIOS2`
    FOREIGN KEY (`TB_USUARIOS_id_us`)
    REFERENCES `LaboratorioClinico`.`TB_USUARIOS` (`id_us`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_EXPEDIENTE_TB_PACIENTE2`
    FOREIGN KEY (`TB_PACIENTE_dpi_pa` , `TB_PACIENTE_TB_FACTURA_codigo_fa`)
    REFERENCES `LaboratorioClinico`.`TB_PACIENTE` (`dpi_pa` , `TB_FACTURA_codigo_fa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaboratorioClinico`.`TB_USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaboratorioClinico`.`TB_USUARIOS` (
  `id_us` INT NOT NULL AUTO_INCREMENT,
  `nombre_pa` VARCHAR(30) NOT NULL,
  `contrasenia_us` VARCHAR(25) NOT NULL,
  `rol_us` VARCHAR(20) NOT NULL,
  `codigo_ex` INT NOT NULL,
  PRIMARY KEY (`id_us`),
  INDEX `fk_TB_USUARIOS_TB_EXPEDIENTE1_idx` (`codigo_ex` ASC) VISIBLE,
  CONSTRAINT `fk_TB_USUARIOS_TB_EXPEDIENTE1`
    FOREIGN KEY (`codigo_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`codigo_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaboratorioClinico`.`TB_CUERPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaboratorioClinico`.`TB_CUERPO` (
  `nit_ex` VARCHAR(9) NOT NULL,
  `direccion_ex` TEXT(30) NOT NULL,
  `telefono_ex` TEXT(9) NOT NULL,
  `nombre_ex` VARCHAR(30) NOT NULL,
  `referente_ex` VARCHAR(30) NOT NULL,
  `TB_FACTURA_codigo_fa` INT NOT NULL,
  INDEX `fk_TB_CUERPO_TB_FACTURA_idx` (`TB_FACTURA_codigo_fa` ASC) VISIBLE,
  INDEX `fk_TB_CUERPO_TB_EXPEDIENTE1_idx` (`direccion_ex` ASC) VISIBLE,
  INDEX `fk_TB_CUERPO_TB_EXPEDIENTE2_idx` (`telefono_ex` ASC) VISIBLE,
  INDEX `fk_TB_CUERPO_TB_EXPEDIENTE3_idx` (`nombre_ex` ASC) VISIBLE,
  INDEX `fk_TB_CUERPO_TB_EXPEDIENTE4_idx` (`referente_ex` ASC) VISIBLE,
  INDEX `fk_TB_CUERPO_TB_EXPEDIENTE5_idx` (`nit_ex` ASC) VISIBLE,
  CONSTRAINT `fk_TB_CUERPO_TB_FACTURA`
    FOREIGN KEY (`TB_FACTURA_codigo_fa`)
    REFERENCES `LaboratorioClinico`.`TB_FACTURA` (`codigo_fa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_CUERPO_TB_EXPEDIENTE1`
    FOREIGN KEY (`direccion_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`direccion_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_CUERPO_TB_EXPEDIENTE2`
    FOREIGN KEY (`telefono_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`telefono_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_CUERPO_TB_EXPEDIENTE3`
    FOREIGN KEY (`nombre_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`nombre_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_CUERPO_TB_EXPEDIENTE4`
    FOREIGN KEY (`referente_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`referente_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_CUERPO_TB_EXPEDIENTE5`
    FOREIGN KEY (`nit_ex`)
    REFERENCES `LaboratorioClinico`.`TB_EXPEDIENTE` (`nit_ex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
