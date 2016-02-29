-- MySQL Script generated by MySQL Workbench
-- 02/28/16 19:55:45
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Turnos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Turnos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Turnos` (
  `idTurno` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `startTime` VARCHAR(45) NULL,
  `endTime` VARCHAR(45) NULL,
  PRIMARY KEY (`idTurno`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `idTurnos_UNIQUE` (`idTurno` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `dniUser` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `realName` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  `admin` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `dniUser_UNIQUE` (`dniUser` ASC),
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TurnosUsuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TurnosUsuarios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TurnosUsuarios` (
  `idUser` INT NOT NULL,
  `idTurno` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idTurno`, `idUser`, `fecha`),
  INDEX `fk_idUser_idx` (`idUser` ASC),
  CONSTRAINT `fk_idUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`Usuarios` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_idTurno`
    FOREIGN KEY (`idTurno`)
    REFERENCES `mydb`.`Turnos` (`idTurno`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
