SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Alumno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Alumno` (
  `idAlumno` INT NOT NULL ,
  `nombre_alu` VARCHAR(45) NOT NULL ,
  `grado` VARCHAR(45) NOT NULL ,
  `turno` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idAlumno`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Padre_familia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Padre_familia` (
  `RFC` INT NOT NULL ,
  `nombre_padre` VARCHAR(45) NOT NULL ,
  `telefono` VARCHAR(45) NULL ,
  `correo` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`RFC`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tiene`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tiene` (
  `Alumno_idAlumno` INT NOT NULL ,
  `Padre_familia_RFC` INT NOT NULL ,
  PRIMARY KEY (`Alumno_idAlumno`, `Padre_familia_RFC`) ,
  INDEX `fk_Alumno_has_Padre_familia_Padre_familia1_idx` (`Padre_familia_RFC` ASC) ,
  INDEX `fk_Alumno_has_Padre_familia_Alumno_idx` (`Alumno_idAlumno` ASC) ,
  CONSTRAINT `fk_Alumno_has_Padre_familia_Alumno`
    FOREIGN KEY (`Alumno_idAlumno` )
    REFERENCES `mydb`.`Alumno` (`idAlumno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_has_Padre_familia_Padre_familia1`
    FOREIGN KEY (`Padre_familia_RFC` )
    REFERENCES `mydb`.`Padre_familia` (`RFC` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Materia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Materia` (
  `Clave` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `horario` TIME NOT NULL ,
  PRIMARY KEY (`Clave`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Grupo` (
  `Clave_gpo` INT NOT NULL ,
  `nombre_gpo` VARCHAR(45) NOT NULL ,
  `turno` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Clave_gpo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Maestro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Maestro` (
  `idMaestro` INT NOT NULL ,
  `RFC` VARCHAR(45) NOT NULL ,
  `nombre_ma` VARCHAR(45) NOT NULL ,
  `dire_ma` VARCHAR(45) NOT NULL ,
  `tel_ma` VARCHAR(45) NOT NULL ,
  `correo_ma` VARCHAR(45) NOT NULL ,
  `Grupo_Clave_gpo` INT NOT NULL ,
  PRIMARY KEY (`idMaestro`) ,
  INDEX `fk_Maestro_Grupo1_idx` (`Grupo_Clave_gpo` ASC) ,
  CONSTRAINT `fk_Maestro_Grupo1`
    FOREIGN KEY (`Grupo_Clave_gpo` )
    REFERENCES `mydb`.`Grupo` (`Clave_gpo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historial academico`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Historial academico` (
  `Alumno_idAlumno` INT NOT NULL ,
  `Materia_Clave` INT NOT NULL ,
  `calificacion` VARCHAR(4) NOT NULL ,
  PRIMARY KEY (`Alumno_idAlumno`, `Materia_Clave`) ,
  INDEX `fk_Alumno_has_Materia_Materia1_idx` (`Materia_Clave` ASC) ,
  INDEX `fk_Alumno_has_Materia_Alumno1_idx` (`Alumno_idAlumno` ASC) ,
  CONSTRAINT `fk_Alumno_has_Materia_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno` )
    REFERENCES `mydb`.`Alumno` (`idAlumno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_has_Materia_Materia1`
    FOREIGN KEY (`Materia_Clave` )
    REFERENCES `mydb`.`Materia` (`Clave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cursa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`cursa` (
  `Materia_Clave` INT NOT NULL ,
  `Grupo_Clave_gpo` INT NOT NULL ,
  PRIMARY KEY (`Materia_Clave`, `Grupo_Clave_gpo`) ,
  INDEX `fk_Materia_has_Grupo_Grupo1_idx` (`Grupo_Clave_gpo` ASC) ,
  INDEX `fk_Materia_has_Grupo_Materia1_idx` (`Materia_Clave` ASC) ,
  CONSTRAINT `fk_Materia_has_Grupo_Materia1`
    FOREIGN KEY (`Materia_Clave` )
    REFERENCES `mydb`.`Materia` (`Clave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_has_Grupo_Grupo1`
    FOREIGN KEY (`Grupo_Clave_gpo` )
    REFERENCES `mydb`.`Grupo` (`Clave_gpo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
