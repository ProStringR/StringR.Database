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

	SELECT * FROM RacketStringView WHERE stringId = id;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllStringForShop(
	IN id INT)

BEGIN

	SELECT * FROM RacketStringView WHERE shopId = id AND deleted = 0;

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
	IN email VARCHAR(255))

BEGIN

 	SELECT Shops.Id AS id, Shops.Password AS password FROM Shops WHERE Shops.Email = email;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE AuthenticateCustomer(
	IN email VARCHAR(255))

BEGIN

	SELECT Customers.Id AS id, Customers.Password AS password FROM Customers WHERE Customers.Email = email;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllPurposes()

BEGIN

	SELECT * FROM Purposes;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllStringTypes()

BEGIN

	SELECT * FROM StringTypes;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllColors()

BEGIN

	SELECT * FROM Colors;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllRacketBrands()

BEGIN

	SELECT * FROM RacketBrands;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetAllStringBrands()

BEGIN

	SELECT * FROM Brands;

END //
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE GetStringPurchaseHistory(
	IN stringId INT)

BEGIN

	SELECT * FROM StringTransactions WHERE StringTransactions.RacketStringId = stringId;

END //
 
DELIMITER ;