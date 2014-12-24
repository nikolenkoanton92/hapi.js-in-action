-- MySQL Script generated by MySQL Workbench
-- Wed Dec 10 09:45:37 2014
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL,
  `username` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipes` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `cooking_time` VARCHAR(255) NULL,
  `prep_time` VARCHAR(255) NULL,
  `serves` INT NULL,
  `difficulty` VARCHAR(255) NULL,
  `cuisine` VARCHAR(255) NULL,
  `chef` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipes_users_idx` (`chef` ASC),
  CONSTRAINT `fk_recipes_users`
    FOREIGN KEY (`chef`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingredients` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `qty` VARCHAR(255) NULL,
  `recipe` INT NOT NULL,
  PRIMARY KEY (`id`, `recipe`),
  INDEX `fk_ingredients_recipes1_idx` (`recipe` ASC),
  CONSTRAINT `fk_ingredients_recipes1`
    FOREIGN KEY (`recipe`)
    REFERENCES `mydb`.`recipes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stars` (
  `id` INT NOT NULL,
  `recipe` INT NOT NULL,
  `awarded_by` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_star_recipes1_idx` (`recipe` ASC),
  INDEX `fk_star_users1_idx` (`awarded_by` ASC),
  CONSTRAINT `fk_star_recipes1`
    FOREIGN KEY (`recipe`)
    REFERENCES `mydb`.`recipes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_star_users1`
    FOREIGN KEY (`awarded_by`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipes_ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipes_ingredients` (
  `recipes_id` INT NOT NULL,
  `ingredients_id` INT NOT NULL,
  PRIMARY KEY (`recipes_id`, `ingredients_id`),
  INDEX `fk_recipes_has_ingredients_ingredients1_idx` (`ingredients_id` ASC),
  INDEX `fk_recipes_has_ingredients_recipes1_idx` (`recipes_id` ASC),
  CONSTRAINT `fk_recipes_has_ingredients_recipes1`
    FOREIGN KEY (`recipes_id`)
    REFERENCES `mydb`.`recipes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipes_has_ingredients_ingredients1`
    FOREIGN KEY (`ingredients_id`)
    REFERENCES `mydb`.`ingredients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
