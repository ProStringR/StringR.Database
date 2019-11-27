DELIMITER //

CREATE PROCEDURE CreateOrder(
	IN customerId INT,
	IN stringerId INT,
	IN shopId INT,
	IN racketId INT,
	IN racketString INT,
	IN tensionVertical DOUBLE,
	IN tensionHorizontal DOUBLE,
	IN stringId INT,
	IN deliveryDate BIGINT,
	IN price DOUBLE,
	IN comment VARCHAR(255),
	IN datePlaced BIGINT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT INTO Orders (Customer, Stringer, Shop, Racket, RacketString, OrderStatus, Comment)
	VALUES (customerId, stringerId, shopId, racketId, racketString, 0, comment);

	SET @orderId = LAST_INSERT_ID();

	INSERT INTO OrderTransactions (OrderId, TransactionDate, Paid, OrderStatus)
	VALUES (@orderId, datePlaced, 0, 0);

    SET FOREIGN_KEY_CHECKS=1;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddRacketStringToStorageForShop(
	IN shopId INT,
	IN lenght DOUBLE,
	IN pricePerRacket DOUBLE,
	IN model VARCHAR(45),
	IN stringType VARCHAR(45),
	IN brand VARCHAR(45),
	IN thickness DOUBLE,
	IN purpose VARCHAR(45),
	IN color VARCHAR(45),
	IN price DOUBLE,
	IN datePlaced BIGINT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT INTO RacketStrings (PricePerRacket, LengthInStock)
	VALUES (pricePerRacket, lenght);

	SET @racketStringId = LAST_INSERT_ID();

	INSERT INTO StringInfo (RacketStringId, Model, StringType, Brand, Thickness, Purpose, Color)
	VALUES (@racketStringId, model, stringType, brand, thickness, purpose, color);

	INSERT INTO RacketStringTransactions (RacketStringId, Price, TransactionDate, LengthAdded)
	VALUES (@racketStringId, price, datePlaced, lenght);

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateTeamWithStringerForShop(
	IN firstName VARCHAR(45),
	IN lastName VARCHAR(45),
	IN phoneNumber VARCHAR(45),
	IN email VARCHAR(45),
	IN preferredRacketType VARCHAR(45),
	IN shopId INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT INTO Teams (Id) VALUES (null);

	SET @teamId = LAST_INSERT_ID();

	INSERT INTO Stringers (FirstName, LastName, PhoneNumber, Email, PreferredRacketType)
	VALUES (firstName, lastName, phoneNumber, email, preferredRacketType);

	SET @stringerId = LAST_INSERT_ID();

	INSERT INTO Team_Stringers (TeamId, StringerId)
	VALUES (@teamId, @stringerId);

	UPDATE Shops SET TeamId = @teamId WHERE Id = shopId;

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddStringerToTeam(
	IN teamId INT,
	IN firstName VARCHAR(45),
	IN lastName VARCHAR(45),
	IN phoneNumber VARCHAR(45),
	IN email VARCHAR(45),
	IN preferredRacketType VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT INTO Stringers (FirstName, LastName, PhoneNumber, Email, PreferredRacketType)
	VALUES (firstName, lastName, phoneNumber, email, preferredRacketType);

	SET @stringerId = LAST_INSERT_ID();

	INSERT INTO Team_Stringers (TeamId, StringerId)
	VALUES (teamId, @stringerId);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateShop(
	IN zipCode VARCHAR(45),
	IN city VARCHAR(45),
	IN country VARCHAR(45),
	IN longitude DOUBLE,
	IN latitude DOUBLE,
	IN street VARCHAR(45),
	IN addressNumber VARCHAR(45),
	IN companyId VARCHAR(45),
	IN phoneNumber VARCHAR(45),
	IN userId VARCHAR(255),
	IN password VARCHAR(255))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO Cities (ZipCode, City, Country)
	VALUES (zipCode, city, country);

	INSERT INTO Address (ZipCode, Longitude, Latitude, Street, AddressNumber)
	VALUES (zipCode, longitude, latitude, street, addressNumber);

	SET @addressId = LAST_INSERT_ID();

	INSERT INTO Shops (Address, TeamId, Company, PhoneNumber, UserId, Password)
	VALUES (@addressId, null, companyId, phoneNumber, userId, password);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateCustomer(
	IN firstName VARCHAR(45),
	IN lastName VARCHAR(45),
	IN email VARCHAR(45),
	IN phoneNumber VARCHAR(45),
	IN userId VARCHAR(255),
	IN password VARCHAR(255),
	IN preferredStringTypeId VARCHAR(45),
	IN preferredTensionVertical DOUBLE,
	IN preferredTensionHorizontal DOUBLE)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, UserId, Password, PreferredStringTypeId, PreferredTensionVertical, PreferredTensionHorizontal)
	VALUES (firstName, lastName, email, phoneNumber, userId, password, preferredStringTypeId, preferredTensionVertical, preferredTensionHorizontal);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateCompany(
	IN companyName VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO Companies (Company) VALUES (companyName);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateRacket(
	IN brand VARCHAR(45),
	IN model VARCHAR(45),
	IN weight DOUBLE,
	IN stringsMain INT,
	IN stringsCross INT,
	IN gripSize INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO Rackets (Brand, Model, Weight, StringsMain, StringsCross, GripSize)
	VALUES (brand, model, weight, stringsMain, stringsCross, gripSize);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddBrand(
	IN brandName VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO Brands (Brand) VALUES (brandName);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddPurpose(
	IN purpose VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO Purposes (Purpose) VALUES (purpose);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddColor(
	IN color VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO Colors (Color) VALUES (color);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddStringType(
	IN stringType VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO StringTypes (StringType) VALUES (stringType);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddStringModel(
	IN stringModel VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO StringModels (StringModel) VALUES (stringModel);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddRacketModel(
	IN racketModel VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO RacketModels (RacketModel) VALUES (racketModel);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddRacketBrand(
	IN racketBrand VARCHAR(45))

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	INSERT IGNORE INTO RacketBrands (RacketBrand) VALUES (racketBrand);

	SET FOREIGN_KEY_CHECKS=1;

END //

DELIMITER ;
