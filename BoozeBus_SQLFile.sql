-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Phone_No` VARCHAR(45) NULL,
  `DOB` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Driver` (
  `idDriver` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Phone_No` VARCHAR(45) NULL,
  `DOB` VARCHAR(45) NULL,
  PRIMARY KEY (`idDriver`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle` (
  `idVehicle` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NULL,
  `Make` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idVehicle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SKU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SKU` (
  `idSKU` INT NOT NULL AUTO_INCREMENT,
  `SKU_Description` VARCHAR(45) NULL,
  `Beverage_Category` VARCHAR(45) NULL,
  `Price` DECIMAL(5,2) NULL,
  PRIMARY KEY (`idSKU`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Location` (
  `Address` VARCHAR(45) NOT NULL,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  PRIMARY KEY (`Address`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `idPayment` INT NOT NULL AUTO_INCREMENT,
  `Payment_Type` VARCHAR(45) NULL,
  `Payment_Acct` VARCHAR(45) NULL,
  PRIMARY KEY (`idPayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `Location_Address` VARCHAR(45) NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  `Driver_idDriver` INT NOT NULL,
  `Vehicle_idVehicle` INT NOT NULL,
  `SKU_idSKU` INT NOT NULL,
  `Payment_idPayment` INT NOT NULL,
  `Quantity` INT NULL,
  `Date` VARCHAR(45) NULL,
  `Time_Ordered` VARCHAR(45) NULL,
  `Time_Arrived` VARCHAR(45) NULL,
  `Cost` DECIMAL(5,2) NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_Order_Location1_idx` (`Location_Address` ASC) VISIBLE,
  INDEX `fk_Order_Customer1_idx` (`Customer_idCustomer` ASC) VISIBLE,
  INDEX `fk_Order_Driver1_idx` (`Driver_idDriver` ASC) VISIBLE,
  INDEX `fk_Order_Vehicle1_idx` (`Vehicle_idVehicle` ASC) VISIBLE,
  INDEX `fk_Order_SKU1_idx` (`SKU_idSKU` ASC) VISIBLE,
  INDEX `fk_Order_Payment1_idx` (`Payment_idPayment` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Location1`
    FOREIGN KEY (`Location_Address`)
    REFERENCES `mydb`.`Location` (`Address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `mydb`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Driver1`
    FOREIGN KEY (`Driver_idDriver`)
    REFERENCES `mydb`.`Driver` (`idDriver`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Vehicle1`
    FOREIGN KEY (`Vehicle_idVehicle`)
    REFERENCES `mydb`.`Vehicle` (`idVehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_SKU1`
    FOREIGN KEY (`SKU_idSKU`)
    REFERENCES `mydb`.`SKU` (`idSKU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Payment1`
    FOREIGN KEY (`Payment_idPayment`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Warehouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Warehouse` (
  `WarehouseID` INT NOT NULL AUTO_INCREMENT,
  `Warehouse_Address` VARCHAR(45) NULL,
  `QuantityOnHand` VARCHAR(45) NULL,
  `SKU_idSKU` INT NOT NULL,
  PRIMARY KEY (`WarehouseID`, `SKU_idSKU`),
  INDEX `fk_Warehouse_SKU1_idx` (`SKU_idSKU` ASC) VISIBLE,
  CONSTRAINT `fk_Warehouse_SKU1`
    FOREIGN KEY (`SKU_idSKU`)
    REFERENCES `mydb`.`SKU` (`idSKU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO customer(`Name`, Phone_No, DOB) VALUES 
    ("Tony Stark", "1-949-345-5363", "02-03-1993"),
    ("Bucky Barnes", "1-949-893-3453", "04-15-1964"),
    ("Barry Allen", "1-949-293-7653", "01-20-1986"),
    ("Wally West", "1-949-742-3453", "07-04-1992"),
    ("Steve Rogers", "1-949-433-3453", "01-12-1957"),
    ("Natasha Romanov", "1-949-324-8765", "08-25-1993"),
    ("Matt Murdock", "1-949-345-7956", "10-23-1996"),
    ("Diana Prince", "1-949-327-9754", "11-11-1988"),
    ("Stephen Strange", "1-949-884-0733", "03-01-1998"),
    ("John Stewart", "1-949-704-9653", "12-02-1997"),
    ("Hal Jordan", "1-949-374-3457", "11-07-1995"),
    ("Clark Kent", "1-949-346-3457", "05-08-1965"),
    ("Clint Barton", "1-949-853-3458", "06-26-1978");
    
INSERT INTO driver(`Name`, Phone_No, DOB) VALUES 
    ("Jon Jonzz", "1-949-765-9863", "01-13-1996"),
    ("Bruce Banner", "1-949-093-3123", "03-17-1984"),
    ("Bruce Wayne", "1-949-093-7773", "02-22-1996"),
    ("Thor Odinson", "1-949-712-3093", "10-24-1992"),
    ("Vic Sage", "1-949-421-3490", "11-05-1990"),
    ("Foggy Nelson", "1-949-124-8232", "12-22-1987"),
    ("Shiera Hall", "1-949-123-4564", "05-12-1995");
  
INSERT INTO location(Address, Latitude, Longitude) VALUES 
    ("23645 Rocky Road", "33.663455", "-117.836221"),
    ("35231 King's Way", "33.666432", "-117.823572"),
    ("23421 King's Road", "33.769445", "-117.823059"),
    ("28934 Queen's Lane", "33.475445", "-117.823321"),
    ("23464 Queen's Road", "33.623425", "-117.887652"),
    ("45332 Prince's Way", "33.667533", "-117.832654"),
    ("45234 Royal Boulevard", "33.629973", "-117.822349"),
    ("37892 Princess' Road", "33.634521", "-117.886329"),
    ("13452 Autumn Street", "33.697654", "-117.836964"),
    ("23465 Fall Road", "33.682732", "-117.895321"),
    ("12353 Winter Way", "33.634754", "-117.863253"),
    ("34232 Summer Lane", "33.662345", "-117.832462"),
    ("45622 Spring Street", "33.662345", "-117.822346");

INSERT INTO payment(Payment_Type, Payment_Acct) VALUES 
    ("VISA", "1"),
    ("American Express", "2"),
    ("Discover","3"),
    ("Mastercard","4"),
    ("VISA", "5"),
    ("American Express", "6"),
    ("Discover","7"),
    ("Mastercard","8"),
	("VISA", "9"),
    ("American Express", "10"),
    ("Discover","11"),
    ("Mastercard","12"),
	("VISA", "13");

INSERT INTO sku(SKU_Description, Beverage_Category, Price) VALUES 
    ("Bud Light", "Beer", 3.50),
    ("Coors Light", "Beer", 3.75),
    ("Miller Lite", "Beer", 3.99),
    ("Budweiser", "Beer", 3.25),
    ("Michelob Ultra", "Beer", 3.00),
    ("Pinot Noir", "Wine", 9.00),
    ("Cabernet Sauvignon", "Wine", 6.00),
    ("Merlot", "Wine", 4.00),
    ("Tempranillo", "Wine", 10.00),
    ("Chardonnay", "Wine", 14.00),
    ("Whisky", "Liquor", 50.00),
    ("Rum", "Liquor", 20.00),
    ("Vodka", "Liquor", 20.00),
    ("Tequila", "Liquor", 25.00),
    ("Gin", "Liquor", 22.00),
    ("Strongbow Gold", "Cider", 10.00),
    ("Angry Orchard Crisp Apple", "Cider", 10.00),
    ("Magners Irish", "Cider", 10.00),
    ("Angry Orchard Rose", "Cider", 10.00),
    ("Bold Rock Apple", "Cider", 7.00);

INSERT INTO vehicle(VIN, Make, Model, `Type`) VALUES 
    ("1", "Honda", "Accord", "2018"),
    ("2", "Toyota", "Corolla", "2020"),
    ("3", "Toyota", "Camry", "2014"),
    ("4", "Mazda", "Mazda CX-5", "2020"),
    ("5", "Hyundai", "Sonata", "2017"),
    ("6", "Chevrolet", "Camaro", "2016"),
    ("7", "Toyota", "Corolla", "2019");

INSERT INTO warehouse(WarehouseID, Warehouse_Address, QuantityOnHand, SKU_idSKU) VALUES 
    ("1", "23411 Place", "23", "1"),
    ("1", "23411 Place", "24", "2"),
    ("1", "23411 Place", "13", "3"),
    ("1", "23411 Place", "23", "4"),
    ("1", "23411 Place", "22", "5"),
    ("1", "23411 Place", "56", "6"),
    ("1", "23411 Place", "0", "7"),
    ("1", "23411 Place", "12", "8"),
    ("1", "23411 Place", "2", "9"),
    ("1", "23411 Place", "63", "10"),
    ("1", "23411 Place", "123", "11"),
    ("1", "23411 Place", "1", "12"),
    ("1", "23411 Place", "2", "13"),
    ("1", "23411 Place", "23", "14"),
    ("1", "23411 Place", "11", "15"),
    ("1", "23411 Place", "22", "16"),
    ("1", "23411 Place", "33", "17"),
    ("1", "23411 Place", "24", "18"),
    ("1", "23411 Place", "55", "19"),
    ("1", "23411 Place", "27", "20"),
	("2", "22342 Cool", "23", "1"),
    ("2", "22342 Cool", "2", "2"),
    ("2", "22342 Cool", "13", "3"),
    ("2", "22342 Cool", "54", "4"),
    ("2", "22342 Cool", "21", "5"),
    ("2", "22342 Cool", "22", "6"),
    ("2", "22342 Cool", "1", "7"),
    ("2", "22342 Cool", "21", "8"),
    ("2", "22342 Cool", "1", "9"),
    ("2", "22342 Cool", "63", "10"),
    ("2", "22342 Cool", "32", "11"),
    ("2", "22342 Cool", "12", "12"),
    ("2", "22342 Cool", "2", "13"),
    ("2", "22342 Cool", "45", "14"),
    ("2", "22342 Cool", "12", "15"),
    ("2", "22342 Cool", "24", "16"),
    ("2", "22342 Cool", "13", "17"),
    ("2", "22342 Cool", "54", "18"),
    ("2", "22342 Cool", "25", "19"),
    ("2", "22342 Cool", "17", "20"),
	("3", "23421 Mount Doom", "3", "1"),
    ("3", "23421 Mount Doom", "21", "2"),
    ("3", "23421 Mount Doom", "43", "3"),
    ("3", "23421 Mount Doom", "54", "4"),
    ("3", "23421 Mount Doom", "21", "5"),
    ("3", "23421 Mount Doom", "52", "6"),
    ("3", "23421 Mount Doom", "11", "7"),
    ("3", "23421 Mount Doom", "41", "8"),
    ("3", "23421 Mount Doom", "15", "9"),
    ("3", "23421 Mount Doom", "6", "10"),
    ("3", "23421 Mount Doom", "2", "11"),
    ("3", "23421 Mount Doom", "1", "12"),
    ("3", "23421 Mount Doom", "23", "13"),
    ("3", "23421 Mount Doom", "65", "14"),
    ("3", "23421 Mount Doom", "32", "15"),
    ("3", "23421 Mount Doom", "26", "16"),
    ("3", "23421 Mount Doom", "63", "17"),
    ("3", "23421 Mount Doom", "5", "18"),
    ("3", "23421 Mount Doom", "5", "19"),
    ("3", "23421 Mount Doom", "77", "20"),
	("4", "23122 Awesome", "32", "1"),
    ("4", "23122 Awesome", "2", "2"),
    ("4", "23122 Awesome", "3", "3"),
    ("4", "23122 Awesome", "24", "4"),
    ("4", "23122 Awesome", "51", "5"),
    ("4", "23122 Awesome", "12", "6"),
    ("4", "23122 Awesome", "21", "7"),
    ("4", "23122 Awesome", "4", "8"),
    ("4", "23122 Awesome", "5", "9"),
    ("4", "23122 Awesome", "26", "10"),
    ("4", "23122 Awesome", "24", "11"),
    ("4", "23122 Awesome", "11", "12"),
    ("4", "23122 Awesome", "25", "13"),
    ("4", "23122 Awesome", "64", "14"),
    ("4", "23122 Awesome", "22", "15"),
    ("4", "23122 Awesome", "42", "16"),
    ("4", "23122 Awesome", "42", "17"),
    ("4", "23122 Awesome", "42", "18"),
    ("4", "23122 Awesome", "12", "19"),
    ("4", "23122 Awesome", "75", "20"),
	("5", "23578 Terrific", "3", "1"),
    ("5", "23578 Terrific", "23", "2"),
    ("5", "23578 Terrific", "35", "3"),
    ("5", "23578 Terrific", "2", "4"),
    ("5", "23578 Terrific", "1", "5"),
    ("5", "23578 Terrific", "32", "6"),
    ("5", "23578 Terrific", "51", "7"),
    ("5", "23578 Terrific", "42", "8"),
    ("5", "23578 Terrific", "23", "9"),
    ("5", "23578 Terrific", "42", "10"),
    ("5", "23578 Terrific", "4", "11"),
    ("5", "23578 Terrific", "1", "12"),
    ("5", "23578 Terrific", "42", "13"),
    ("5", "23578 Terrific", "0", "14"),
    ("5", "23578 Terrific", "42", "15"),
    ("5", "23578 Terrific", "4", "16"),
    ("5", "23578 Terrific", "2", "17"),
    ("5", "23578 Terrific", "21", "18"),
    ("5", "23578 Terrific", "76", "19"),
    ("5", "23578 Terrific", "9", "20");

-- 4. One Trigger 
CREATE TRIGGER calc_cost 
BEFORE INSERT ON `order`
FOR EACH ROW 
    SET NEW.Cost = NEW.Quantity * (SELECT Price FROM sku WHERE NEW.SKU_idSKU = sku.idSKU);

INSERT INTO `order`(Location_Address, SKU_idSKU, Driver_idDriver, Vehicle_idVehicle, Customer_idCustomer, Payment_idPayment, Quantity, `Date`, Time_Ordered, Time_Arrived) VALUES 
    ("23645 Rocky Road", 12, 2, 2, 1, 1, 3, "12-01-2020", "05:21 PM", "06:33 PM"),
    ("35231 King's Way", 20, 5, 5, 2, 2, 4, "12-01-2020", "07:54 PM", "08:23 PM"),
    ("28934 Queen's Lane", 7, 7, 7, 4, 4, 2, "12-02-2020", "03:31 PM", "04:43 PM"),
    ("23421 King's Road", 2, 6, 6, 3, 3, 10, "12-02-2020", "04:33 PM", "05:12 PM"),
    ("23645 Rocky Road", 13, 5, 5, 1, 1, 3, "12-02-2020", "05:54 PM", "06:03 PM"),
    ("45234 Royal Boulevard", 16, 3, 3, 7, 7, 7, "12-02-2020", "06:23 PM", "07:43 PM"),
    ("23465 Fall Road", 9, 4, 4, 10, 10, 8, "12-02-2020", "07:53 PM", "08:02 PM"),
    ("34232 Summer Lane", 7, 1, 1, 12, 12, 1, "12-02-2020", "08:23 PM", "09:34 PM"),
    ("37892 Princess' Road", 16, 2, 2, 8, 8, 6, "12-02-2020", "09:12 PM", "10:12 PM"),
    ("13452 Autumn Street", 8, 3, 3, 9, 9, 5, "12-02-2020", "10:53 PM", "11:34 PM"),
    ("23464 Queen's Road", 4, 6, 6, 5, 5, 3, "12-02-2020", "11:15 PM", "12:12 AM");

-- 3. Five Queries:
-- 1
USE mydb;
SELECT Latitude, Longitude, Address from location 
where Address IN (Select Location_Address 
                  from mydb.order 
                  where Location_Address LIKE '%Rocky Road%');
-- 2
USE mydb;
SELECT idOrder, Driver_idDriver FROM mydb.order
WHERE Driver_idDriver IN (SELECT DISTINCT Driver_idDriver from mydb.order) GROUP BY idOrder; 

-- 3
USE mydb;
select warehouse.SKU_idSKU, Warehouse_Address, ifnull(Sum(QuantityOnHand), 0) as NumItemInStock 
from warehouse left join mydb.order on warehouse.SKU_idSKU=mydb.order.SKU_idSKU group by  SKU_idSKU, Warehouse_Address;

-- 4
USE mydb;
SELECT * from vehicle 
where idVehicle is not null GROUP BY idVehicle; 

-- 5
USE mydb;
SELECT WarehouseID, AVG(QuantityOnHand) AS AVGQuantityonHand from warehouse 
where QuantityOnHand is not null 
GROUP by WarehouseID;