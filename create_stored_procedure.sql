DELIMITER //

CREATE PROCEDURE CreateOrder(
	IN customerId INT,
	IN stringerId INT,
	IN shopId INT,
	IN racketModel VARCHAR(45),
	IN racketBrand INT,
	IN tensionVertical DOUBLE,
	IN tensionHorizontal DOUBLE,
	IN stringId INT,
	IN deliveryDate BIGINT,
	IN price DOUBLE,
	IN comment VARCHAR(255),
	IN datePlaced BIGINT)

BEGIN
	
	CALL AddRacketModel(racketModel);

	SET @racketModelId = LAST_INSERT_ID();

	CALL CreateRacket(racketBrand, @racketModelId, 0, 0, 0, 0);

	SET @racketId = LAST_INSERT_ID();

	INSERT INTO Orders (Customer, Stringer, Shop, Racket, StringId, OrderStatus, Comment, Price, DeliveryDate, TensionVertical, TensionHorizontal)
	VALUES (customerId, stringerId, shopId, @racketId, stringId, 0, comment, price, deliveryDate, tensionVertical, tensionHorizontal);

	SET @orderId = LAST_INSERT_ID();

	INSERT INTO OrderTransactions (OrderId, TransactionDate, Paid, OrderStatus)
	VALUES (@orderId, datePlaced, 0, 0);

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateRacket(
	IN brand INT,
	IN model INT,
	IN weight DOUBLE,
	IN stringsMain INT,
	IN stringsCross INT,
	IN gripSize INT)

BEGIN

	INSERT INTO Rackets (Brand, Model, Weight, StringsMain, StringsCross, GripSize)
	VALUES (brand, model, weight, stringsMain, stringsCross, gripSize);

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddRacketStringToStorageForShop(
	IN shopId INT,
	IN lenght DOUBLE,
	IN pricePerRacket DOUBLE,
	IN model VARCHAR(45),
	IN stringType INT,
	IN brand INT,
	IN thickness DOUBLE,
	IN purpose INT,
	IN color INT,
	IN price DOUBLE,
	IN datePlaced BIGINT)

BEGIN

	CALL AddStringModel(model);
	SET @stringModelId = LAST_INSERT_ID();

	INSERT INTO Strings (Shop, PricePerRacket, LengthInStock)
	VALUES (shopId, pricePerRacket, lenght);

	SET @racketStringId = LAST_INSERT_ID();

	INSERT INTO StringInfo (RacketStringId, Model, StringType, Brand, Thickness, Purpose, Color)
	VALUES (@racketStringId, @stringModelId, stringType, brand, thickness, purpose, color);

	INSERT INTO StringTransactions (RacketStringId, Price, TransactionDate, LengthAdded)
	VALUES (@racketStringId, price, datePlaced, lenght);

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateTeamWithStringerForShop(
	IN firstName VARCHAR(45),
	IN lastName VARCHAR(45),
	IN phoneNumber VARCHAR(45),
	IN email VARCHAR(45),
	IN preferredRacketType INT,
	IN shopId INT)

BEGIN

	INSERT INTO Teams (Id) VALUES (null);

	SET @teamId = LAST_INSERT_ID();

	INSERT INTO Stringers (FirstName, LastName, PhoneNumber, Email, PreferredRacketType)
	VALUES (firstName, lastName, phoneNumber, email, preferredRacketType);

	SET @stringerId = LAST_INSERT_ID();

	INSERT INTO Team_Stringers (TeamId, StringerId)
	VALUES (@teamId, @stringerId);

	UPDATE Shops SET TeamId = @teamId WHERE Id = shopId;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddStringerToTeam(
	IN teamId INT,
	IN firstName VARCHAR(45),
	IN lastName VARCHAR(45),
	IN phoneNumber VARCHAR(45),
	IN email VARCHAR(45),
	IN preferredRacketType INT)

BEGIN

	INSERT INTO Stringers (FirstName, LastName, PhoneNumber, Email, PreferredRacketType)
	VALUES (firstName, lastName, phoneNumber, email, preferredRacketType);

	SET @stringerId = LAST_INSERT_ID();

	INSERT INTO Team_Stringers (TeamId, StringerId)
	VALUES (teamId, @stringerId);

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
	IN companyId INT,
	IN phoneNumber VARCHAR(45),
	IN userId VARCHAR(255),
	IN password VARCHAR(255))

BEGIN

	INSERT IGNORE INTO Cities (ZipCode, City, Country)
	VALUES (zipCode, city, country);

	INSERT INTO Address (ZipCode, Longitude, Latitude, Street, AddressNumber)
	VALUES (zipCode, longitude, latitude, street, addressNumber);

	SET @addressId = LAST_INSERT_ID();

	INSERT INTO Shops (Address, TeamId, Company, PhoneNumber, UserId, Password)
	VALUES (@addressId, null, companyId, phoneNumber, userId, password);

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
	IN preferredStringTypeId INT,
	IN preferredTensionVertical DOUBLE,
	IN preferredTensionHorizontal DOUBLE)

BEGIN

	INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, UserId, Password, PreferredStringTypeId, PreferredTensionVertical, PreferredTensionHorizontal)
	VALUES (firstName, lastName, email, phoneNumber, userId, password, preferredStringTypeId, preferredTensionVertical, preferredTensionHorizontal);

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateCompany(
	IN companyName VARCHAR(45))

BEGIN

	INSERT IGNORE INTO Companies (Company) VALUES (companyName) ON DUPLICATE KEY UPDATE Company=companyName;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddBrand(
	IN brandName VARCHAR(45))

BEGIN

	INSERT IGNORE INTO Brands (Brand) VALUES (brandName) ON DUPLICATE KEY UPDATE Brand=brandName;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddPurpose(
	IN purpose VARCHAR(45))

BEGIN

	INSERT IGNORE INTO Purposes (Purpose) VALUES (purpose) ON DUPLICATE KEY UPDATE Purpose=purpose;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddColor(
	IN color VARCHAR(45))

BEGIN

	INSERT IGNORE INTO Colors (Color) VALUES (color) ON DUPLICATE KEY UPDATE Color=coLor;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddStringType(
	IN stringType VARCHAR(45))

BEGIN

	INSERT IGNORE INTO StringTypes (StringType) VALUES (stringType) ON DUPLICATE KEY UPDATE StringType=stringType;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddStringModel(
	IN stringModel VARCHAR(45))

BEGIN

	INSERT IGNORE INTO StringModels (StringModel) VALUES (stringModel) ON DUPLICATE KEY UPDATE StringModel=stringModel;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddRacketModel(
	IN racketModel VARCHAR(45))

BEGIN

	INSERT IGNORE INTO RacketModels (RacketModel) VALUES (racketModel)  ON DUPLICATE KEY UPDATE RacketModel=racketModel;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddRacketBrand(
	IN racketBrand VARCHAR(45))

BEGIN

	INSERT IGNORE INTO RacketBrands (RacketBrand) VALUES (racketBrand) ON DUPLICATE KEY UPDATE RacketBrand=racketBrand;

END //

DELIMITER ;
