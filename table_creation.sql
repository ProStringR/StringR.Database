
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS Strings (
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
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Company VARCHAR(45),
    UNIQUE (Company)
);

CREATE TABLE IF NOT EXISTS Brands (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Brand VARCHAR(45),
    UNIQUE (Brand)
);

CREATE TABLE IF NOT EXISTS Purposes (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Purpose VARCHAR(45),
    UNIQUE (Purpose)
);

CREATE TABLE IF NOT EXISTS Colors (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Color VARCHAR(45),
    UNIQUE (Color)
);

CREATE TABLE IF NOT EXISTS StringTypes (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StringType VARCHAR(45),
    UNIQUE (StringType)
);
	
CREATE TABLE IF NOT EXISTS StringModels (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StringModel VARCHAR(45),
    UNIQUE (StringModel)
);

CREATE TABLE IF NOT EXISTS RacketModels (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RacketModel VARCHAR(45),
    UNIQUE (RacketModel)
);

CREATE TABLE IF NOT EXISTS RacketBrands (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RacketBrand VARCHAR(45),
    UNIQUE (RacketBrand)
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
    PreferredRacketType INT,
    FOREIGN KEY(PreferredRacketType) REFERENCES testDB.Purposes(Id)
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
    PreferredStringTypeId INT,
    PreferredTensionVertical DOUBLE,
    PreferredTensionHorizontal DOUBLE,
    UNIQUE (UserId),
    FOREIGN KEY(PreferredStringTypeId) REFERENCES testDB.StringTypes(Id)
);

CREATE TABLE IF NOT EXISTS StringTransactions (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RacketStringId INT,
    Price DOUBLE,
    TransactionDate BIGINT,
    LengthAdded INT,
    FOREIGN KEY(RacketStringId) REFERENCES testDB.Strings(Id)
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
    Model INT,
    StringType INT,
    Brand INT,
    Thickness DOUBLE,
    Purpose INT,
    Color INT,
    FOREIGN KEY(RacketStringId) REFERENCES testDB.Strings(Id),
    FOREIGN KEY(Color) REFERENCES testDB.Colors(Id),
    FOREIGN KEY(Model) REFERENCES testDB.StringModels(Id),
    FOREIGN KEY(StringType) REFERENCES testDB.StringTypes(Id),
    FOREIGN KEY(Brand) REFERENCES testDB.Brands(Id),
    FOREIGN KEY(Purpose) REFERENCES testDB.Purposes(Id)
);

CREATE TABLE IF NOT EXISTS Shops (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Address INT,
    TeamId INT,
    Company INT,
    PhoneNumber VARCHAR(45),
    UserId VARCHAR(255),
    Password VARCHAR(255),
    UNIQUE (UserId),
    FOREIGN KEY(Address) REFERENCES testDB.Address(Id),
    FOREIGN KEY(TeamId) REFERENCES testDB.Teams(Id),
    FOREIGN KEY(Company) REFERENCES testDB.Companies(Id)
);

CREATE TABLE IF NOT EXISTS Rackets (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Brand INT,
    Model INT,
    Weight INT,
    StringsMain INT,
    StringsCross INT,
    GripSize INT,
    FOREIGN KEY(Brand) REFERENCES testDB.RacketBrands(Id),
    FOREIGN KEY(Model) REFERENCES testDB.RacketModels(Id)
);

CREATE TABLE IF NOT EXISTS Orders (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Customer INT,
    Stringer INT,
    Shop INT,
    Racket INT,
    StringId INT,
    OrderStatus INT,
    Comment VARCHAR(255),
    Price DOUBLE,
    DeliveryDate BIGINT,
    TensionVertical DOUBLE,
    TensionHorizontal DOUBLE,
    FOREIGN KEY(Customer) REFERENCES testDB.Customers(Id),
    FOREIGN KEY(Stringer) REFERENCES testDB.Stringers(Id),
    FOREIGN KEY(Shop) REFERENCES testDB.Shops(Id),
    FOREIGN KEY(Racket) REFERENCES testDB.Rackets(Id),
    FOREIGN KEY(StringId) REFERENCES testDB.Strings(Id)
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
