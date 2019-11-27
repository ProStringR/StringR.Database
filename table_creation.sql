
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS RacketStrings (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Shop INT,
    PricePerRacket DOUBLE,
    LengthInStock DOUBLE,
    FOREIGN KEY(Shop) REFERENCES testDB.Shops(Id)
);

CREATE TABLE IF NOT EXISTS Cities (
	ZipCode VARCHAR(45) NOT NULL PRIMARY KEY,
    City VARCHAR(45),
    Country VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS Companies (
    Company VARCHAR(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Brands (
    Brand VARCHAR(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Purposes (
    Purpose VARCHAR(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Colors (
    Color VARCHAR(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS StringTypes (
    StringType VARCHAR(45) NOT NULL PRIMARY KEY
);
	
CREATE TABLE IF NOT EXISTS StringModels (
    StringModel VARCHAR(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS RacketModels (
    RacketModel VARCHAR(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS RacketBrands (
    RacketBrand VARCHAR(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Teams (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Stringers (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    PhoneNumber VARCHAR(45),
    Email VARCHAR(45),
    PreferredRacketType VARCHAR(45),
    FOREIGN KEY(PreferredRacketType) REFERENCES testDB.Purposes(Purpose)
);

CREATE TABLE IF NOT EXISTS Address (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ZipCode VARCHAR(45),
    Longitude DOUBLE,
    Latitude DOUBLE,
    Street VARCHAR(45),
    AddressNumber VARCHAR(45),
    FOREIGN KEY(ZipCode) REFERENCES testDB.Cities(ZipCode)
);

CREATE TABLE IF NOT EXISTS Customers (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Email VARCHAR(45),
    PhoneNumber VARCHAR(45),
    UserId VARCHAR(255),
    Password VARCHAR(255),
    PreferredStringTypeId VARCHAR(45),
    PreferredTensionVertical DOUBLE,
    PreferredTensionHorizontal DOUBLE,
    FOREIGN KEY(PreferredStringTypeId) REFERENCES testDB.StringTypes(StringType)
);

CREATE TABLE IF NOT EXISTS RacketStringTransactions (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RacketStringId INT,
    Price DOUBLE,
    TransactionDate BIGINT,
    LengthAdded INT,
    FOREIGN KEY(RacketStringId) REFERENCES testDB.RacketStrings(Id)
);

CREATE TABLE IF NOT EXISTS Team_Stringers (
	TeamId INT,
    StringerId INT,
    PRIMARY KEY (TeamId, StringerId),
    FOREIGN KEY(TeamId) REFERENCES testDB.Teams(Id),
    FOREIGN KEY(StringerId) REFERENCES testDB.Stringers(Id)
);

CREATE TABLE IF NOT EXISTS StringInfo (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RacketStringId INT,
    Model VARCHAR(45),
    StringType VARCHAR(45),
    Brand VARCHAR(45),
    Thickness DOUBLE,
    Purpose VARCHAR(45),
    Color VARCHAR(45),
    FOREIGN KEY(RacketStringId) REFERENCES testDB.RacketStrings(Id),
    FOREIGN KEY(Color) REFERENCES testDB.Colors(Color),
    FOREIGN KEY(Model) REFERENCES testDB.StringModels(StringModel),
    FOREIGN KEY(StringType) REFERENCES testDB.StringTypes(StringType),
    FOREIGN KEY(Brand) REFERENCES testDB.Brands(Brand),
    FOREIGN KEY(Purpose) REFERENCES testDB.Purposes(Purpose)
);

CREATE TABLE IF NOT EXISTS Shops (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Address INT,
    TeamId INT,
    Company VARCHAR(45),
    PhoneNumber VARCHAR(45),
    UserId VARCHAR(255),
    Password VARCHAR(255),
    FOREIGN KEY(Address) REFERENCES testDB.Address(Id),
    FOREIGN KEY(TeamId) REFERENCES testDB.Teams(Id),
    FOREIGN KEY(Company) REFERENCES testDB.Companies(Company)
);

CREATE TABLE IF NOT EXISTS Rackets (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Brand VARCHAR(45),
    Model VARCHAR(45),
    Weight INT,
    StringsMain INT,
    StringsCross INT,
    GripSize INT,
    FOREIGN KEY(Brand) REFERENCES testDB.RacketBrands(RacketBrand),
    FOREIGN KEY(Model) REFERENCES testDB.RacketModels(RacketModel)
);

CREATE TABLE IF NOT EXISTS Orders (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Customer INT,
    Stringer INT,
    Shop INT,
    Racket INT,
    RacketString INT,
    OrderStatus INT,
    Comment VARCHAR(255),
    FOREIGN KEY(Customer) REFERENCES testDB.Customers(Id),
    FOREIGN KEY(Stringer) REFERENCES testDB.Stringers(Id),
    FOREIGN KEY(Shop) REFERENCES testDB.Shops(Id),
    FOREIGN KEY(Racket) REFERENCES testDB.Rackets(Id),
    FOREIGN KEY(RacketString) REFERENCES testDB.RacketStrings(Id)
);

CREATE TABLE IF NOT EXISTS OrderTransactions (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderId INT,
    TransactionDate BIGINT,
    Paid TINYINT,
    OrderStatus INT,
    FOREIGN KEY(OrderId) REFERENCES testDB.Orders(Id)
);

SET FOREIGN_KEY_CHECKS=1;






