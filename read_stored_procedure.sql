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
	IN stat INT)

BEGIN

	SELECT * FROM AllOrders
	WHERE shopId = id AND orderStatus = stat;

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

	SELECT * FROM RacketStringView WHERE shopId = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetTeamOfStringerForShop(
	IN id INT)

BEGIN

	SELECT * FROM StringerView WHERE teamId = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetStringerById(
	IN id INT)

BEGIN

	SELECT * FROM StringerView WHERE stringerId = id;

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

	SELECT * FROM CustomerView
	WHERE customerId = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllCustomers()

BEGIN

	SELECT * FROM CustomerView;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE AuthenticateShop(
	IN userId VARCHAR(255))

BEGIN

 	SELECT Shops.Id AS id, Shops.Password AS password FROM Shops WHERE Shops.UserId = userId;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE AuthenticateCustomer(
	IN userId VARCHAR(255))

BEGIN

	SELECT Customers.Id AS id, Customers.Password AS password FROM Customers WHERE Customers.UserId = userId;

END //
 
DELIMITER ;