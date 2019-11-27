DELIMITER //
 
CREATE PROCEDURE GetAllOrdersForShop(
	IN id INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	SELECT 
	Orders.Id AS orderId,
	Orders.Customer AS customerId,
	Orders.Stringer AS stringerId,
	Orders.Racket AS racketId,
	Orders.RacketString AS racketStringId,
	Orders.OrderStatus AS orderStatus,
	Orders.Comment AS comment,
	Customers.FirstName AS customerFirstName,
	Customers.LastName AS customerLastName,
	Customers.Email AS customerEmail,
	Customers.PhoneNumber AS customerPhone,
	Stringers.FirstName AS stringerFirstName,
	Stringers.LastName AS stringerLastName,
	Stringers.PhoneNumber AS stringerPhone,
	Stringers.Email AS stringerEmail,
	Rackets.Brand AS racketBrand,
	Rackets.Model AS racketModel,
	RacketStrings.PricePerRacket AS price,
	StringInfo.Model AS stringModel,
	StringInfo.StringType AS stringType,
	StringInfo.Brand AS stringBrand,
	StringInfo.Thickness AS thickness,
	StringInfo.Purpose AS purpose,
	StringInfo.Color AS color
	FROM Orders
	JOIN Customers ON Orders.Customer = Customers.Id
	JOIN Stringers ON Orders.Stringer = Stringers.Id
	JOIN Rackets ON Orders.Racket = Rackets.Id
	JOIN RacketStrings ON Orders.RacketString = RacketStrings.Id
	JOIN StringInfo ON Orders.RacketString = StringInfo.RacketStringId
	WHERE Orders.Shop = id;

    SET FOREIGN_KEY_CHECKS=1;
END //
 
DELIMITER 

DELIMITER //
 
CREATE PROCEDURE GetAllOrdersForShopOnStatus(
	IN id INT,
	IN orderStatus INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	SELECT 
	Orders.Id AS orderId,
	Orders.Customer AS customerId,
	Orders.Stringer AS stringerId,
	Orders.Racket AS racketId,
	Orders.RacketString AS racketStringId,
	Orders.OrderStatus AS orderStatus,
	Orders.Comment AS comment,
	Customers.FirstName AS customerFirstName,
	Customers.LastName AS customerLastName,
	Customers.Email AS customerEmail,
	Customers.PhoneNumber AS customerPhone,
	Stringers.FirstName AS stringerFirstName,
	Stringers.LastName AS stringerLastName,
	Stringers.PhoneNumber AS stringerPhone,
	Stringers.Email AS stringerEmail,
	Rackets.Brand AS racketBrand,
	Rackets.Model AS racketModel,
	RacketStrings.PricePerRacket AS price,
	StringInfo.Model AS stringModel,
	StringInfo.StringType AS stringType,
	StringInfo.Brand AS stringBrand,
	StringInfo.Thickness AS thickness,
	StringInfo.Purpose AS purpose,
	StringInfo.Color AS color
	FROM Orders
	JOIN Customers ON Orders.Customer = Customers.Id
	JOIN Stringers ON Orders.Stringer = Stringers.Id
	JOIN Rackets ON Orders.Racket = Rackets.Id
	JOIN RacketStrings ON Orders.RacketString = RacketStrings.Id
	JOIN StringInfo ON Orders.RacketString = StringInfo.RacketStringId
	WHERE Orders.Id = id AND Orders.OrderStatus = orderStatus;

    SET FOREIGN_KEY_CHECKS=1;
END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetOrderById(
	IN id INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	SELECT 
	Orders.Id AS orderId,
	Orders.Customer AS customerId,
	Orders.Stringer AS stringerId,
	Orders.Racket AS racketId,
	Orders.RacketString AS racketStringId,
	Orders.OrderStatus AS orderStatus,
	Orders.Comment AS comment,
	Customers.FirstName AS customerFirstName,
	Customers.LastName AS customerLastName,
	Customers.Email AS customerEmail,
	Customers.PhoneNumber AS customerPhone,
	Stringers.FirstName AS stringerFirstName,
	Stringers.LastName AS stringerLastName,
	Stringers.PhoneNumber AS stringerPhone,
	Stringers.Email AS stringerEmail,
	Rackets.Brand AS racketBrand,
	Rackets.Model AS racketModel,
	RacketStrings.PricePerRacket AS price,
	StringInfo.Model AS stringModel,
	StringInfo.StringType AS stringType,
	StringInfo.Brand AS stringBrand,
	StringInfo.Thickness AS thickness,
	StringInfo.Purpose AS purpose,
	StringInfo.Color AS color
	FROM Orders
	JOIN Customers ON Orders.Customer = Customers.Id
	JOIN Stringers ON Orders.Stringer = Stringers.Id
	JOIN Rackets ON Orders.Racket = Rackets.Id
	JOIN RacketStrings ON Orders.RacketString = RacketStrings.Id
	JOIN StringInfo ON Orders.RacketString = StringInfo.RacketStringId
	WHERE Orders.Id = id;

    SET FOREIGN_KEY_CHECKS=1;
END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetStringById(
	IN id INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	SELECT 
	RacketStrings.Id AS stringId,
	RacketStrings.PricePerRacket AS price,
	RacketStrings.LengthInStock AS lengthInStock,
	StringInfo.Model AS stringModel,
	StringInfo.StringType AS stringType,
	StringInfo.Brand AS stringBrand,
	StringInfo.Thickness AS thickness,
	StringInfo.Purpose AS purpose,
	StringInfo.Color AS color
	FROM RacketStrings
	JOIN StringInfo ON RacketStrings.Id = StringInfo.RacketStringId
	WHERE RacketStrings.Id = id;

    SET FOREIGN_KEY_CHECKS=1;
END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllStringForShop(
	IN id INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	SELECT 
	RacketStrings.Id AS stringId,
	RacketStrings.PricePerRacket AS price,
	RacketStrings.LengthInStock AS lengthInStock,
	RacketStrings.Shop AS shopId,
	StringInfo.Model AS stringModel,
	StringInfo.StringType AS stringType,
	StringInfo.Brand AS stringBrand,
	StringInfo.Thickness AS thickness,
	StringInfo.Purpose AS purpose,
	StringInfo.Color AS color
	FROM RacketStrings
	JOIN StringInfo ON RacketStrings.Id = StringInfo.RacketStringId
	WHERE RacketStrings.Shop = id;

    SET FOREIGN_KEY_CHECKS=1;
END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetTeamOfStringerForShop(
	IN id INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

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

    SET FOREIGN_KEY_CHECKS=1;
END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetStringerById(
	IN id INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

	SELECT 
	Stringers.Id AS stringerId,
	Stringers.FirstName AS firstName,
	Stringers.LastName AS lastName,
	Stringers.PhoneNumber AS phoneNumber,
	Stringers.Email AS email,
	Stringers.PreferredRacketType AS preferredRacketType
	FROM Stringers
	WHERE Stringers.Id = id;

    SET FOREIGN_KEY_CHECKS=1;
END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetShopById(
	IN id INT)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;

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
	JOIN Companies ON Shops.Company = Companies.Company
	WHERE Shops.Id = id;

    SET FOREIGN_KEY_CHECKS=1;
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