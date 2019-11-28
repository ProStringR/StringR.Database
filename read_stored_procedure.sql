DELIMITER //
 
CREATE PROCEDURE GetAllOrdersForShop(
	IN id INT)

BEGIN

	SELECT * FROM AllOrders
	WHERE shopId = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllOrdersForShopOnStatus(
	IN id INT,
	IN orderStatus INT)

BEGIN

	SELECT * FROM AllOrders
	WHERE shopId = id AND orderStatus = orderStatus;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetOrderById(
	IN id INT)

BEGIN

	SELECT * FROM AllOrders
	WHERE orderId = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetStringById(
	IN id INT)

BEGIN

	SELECT 
	Strings.Id AS stringId,
	Strings.PricePerRacket AS price,
	Strings.LengthInStock AS lengthInStock,
	StringInfo.Model AS stringModel,
	StringInfo.StringType AS stringType,
	StringInfo.Brand AS stringBrand,
	StringInfo.Thickness AS thickness,
	StringInfo.Purpose AS purpose,
	StringInfo.Color AS color
	FROM Strings
	JOIN StringInfo ON Strings.Id = StringInfo.RacketStringId
	WHERE Strings.Id = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllStringForShop(
	IN id INT)

BEGIN

	SELECT 
	Strings.Id AS stringId,
	Strings.PricePerRacket AS price,
	Strings.LengthInStock AS lengthInStock,
	Strings.Shop AS shopId,
	StringInfo.Model AS stringModel,
	StringInfo.StringType AS stringType,
	StringInfo.Brand AS stringBrand,
	StringInfo.Thickness AS thickness,
	StringInfo.Purpose AS purpose,
	StringInfo.Color AS color
	FROM Strings
	JOIN StringInfo ON Strings.Id = StringInfo.RacketStringId
	WHERE Strings.Shop = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetTeamOfStringerForShop(
	IN id INT)

BEGIN

	SELECT 
	Stringers.Id AS stringerId,
	Stringers.FirstName AS firstName,
	Stringers.LastName AS lastName,
	Stringers.PhoneNumber AS phoneNumber,
	Stringers.Email AS email,
	Stringers.PreferredRacketType AS preferredRacketType
	FROM Team_Stringers
	JOIN Stringers ON Team_Stringers.StringerId = Stringers.Id
	WHERE Team_Stringers.TeamId = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetStringerById(
	IN id INT)

BEGIN

	SELECT 
	Stringers.Id AS stringerId,
	Stringers.FirstName AS firstName,
	Stringers.LastName AS lastName,
	Stringers.PhoneNumber AS phoneNumber,
	Stringers.Email AS email,
	Purposes.Purpose AS preferredRacketType
	FROM Stringers
	JOIN Purposes ON Stringers.PreferredRacketType = Purposes.Id 
	WHERE Stringers.Id = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetShopById(
	IN id INT)

BEGIN

	SELECT 
	Shops.Id AS shopId,
	Shops.TeamId AS teamId,
	Shops.PhoneNumber AS phoneNumber,
	Companies.Company AS company,
	Address.ZipCode AS zipCode,
	Cities.City AS city,
	Cities.Country AS country,
	Address.Longitude AS longitude,
	Address.Latitude AS latitude,
	Address.Street AS street,
	Address.AddressNumber AS addressNumber
	FROM Shops
	JOIN Address ON Shops.Address = Address.Id
	JOIN Cities ON Address.ZipCode = Cities.ZipCode
	JOIN Companies ON Shops.Company = Companies.Id
	WHERE Shops.Id = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetCustomerById(
	IN id INT)

BEGIN

	SELECT 
	Customers.Id AS id,
	Customers.FirstName AS firstName,
	Customers.LastName AS lastName,
	Customers.Email AS email,
	Customers.PhoneNumber AS phoneNumber,
	Customers.PreferredStringTypeId AS preferredStringType,
	Customers.PreferredTensionVertical AS preferredTensionVertical,
	Customers.PreferredTensionHorizontal AS preferredTensionHorizontal
	FROM Customers
	WHERE Customers.Id = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllCustomers()

BEGIN

	SELECT 
	Customers.Id AS id,
	Customers.FirstName AS firstName,
	Customers.LastName AS lastName,
	Customers.Email AS email,
	Customers.PhoneNumber AS phoneNumber,
	Customers.PreferredStringTypeId AS preferredStringType,
	Customers.PreferredTensionVertical AS preferredTensionVertical,
	Customers.PreferredTensionHorizontal AS preferredTensionHorizontal
	FROM Customers;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE AuthenticateShop(
	IN userId VARCHAR(255),
	IN password VARCHAR(255))

BEGIN

	SELECT COUNT(*) FROM Shops WHERE Shops.UserId = userId AND Shops.Password = password;

END //
 
DELIMITER ;