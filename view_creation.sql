CREATE VIEW AllOrders
AS
SELECT 
	Orders.Id AS orderId,
	Orders.Shop AS shopId,
	Orders.Customer AS customerId,
	Orders.Stringer AS stringerId,
	Orders.Racket AS racketId,
	Orders.StringId AS stringId,
	Orders.OrderStatus AS orderStatus,
	Orders.Comment AS comment,
	Orders.Price AS price,
	Orders.DeliveryDate AS deliveryDate,
	Orders.TensionVertical AS tensionVertical,
	Orders.TensionHorizontal AS tensionHorizontal,
	Customers.FirstName AS customerFirstName,
	Customers.LastName AS customerLastName,
	Customers.Email AS customerEmail,
	Customers.PhoneNumber AS customerPhone,
	Stringers.FirstName AS stringerFirstName,
	Stringers.LastName AS stringerLastName,
	Stringers.PhoneNumber AS stringerPhone,
	Stringers.Email AS stringerEmail,
	RacketBrands.RacketBrand AS racketBrand,
	RacketModels.RacketModel AS racketModel,
	Rackets.Weight AS racketWeight,
	Rackets.StringsMain AS racketMain,
	Rackets.StringsCross AS racketCross,
	Rackets.GripSize AS racketGripSize,
	StringModels.StringModel AS stringModel,
	StringTypes.StringType AS stringType,
	Brands.Brand AS stringBrand,
	StringInfo.Thickness AS stringThickness,
	Purposes.Purpose AS stringPurpose,
	Colors.Color AS stringColor
	FROM Orders
	JOIN Customers ON Orders.Customer = Customers.Id
	JOIN Stringers ON Orders.Stringer = Stringers.Id
	JOIN Rackets ON Orders.Racket = Rackets.Id
	JOIN RacketBrands ON Rackets.Brand = RacketBrands.Id
	JOIN RacketModels ON Rackets.Model = RacketModels.Id
	JOIN StringInfo ON Orders.StringId = StringInfo.RacketStringId
	JOIN StringModels ON StringInfo.Model = StringModels.Id
	JOIN StringTypes ON StringInfo.StringType = StringTypes.Id
	JOIN Brands ON StringInfo.Brand = Brands.Id
	JOIN Purposes ON StringInfo.Purpose = Purposes.Id
	JOIN Colors ON StringInfo.Color = Colors.Id

CREATE VIEW CustomerView
AS
SELECT 
	Customers.Id AS customerId,
	Customers.FirstName AS firstName,
	Customers.LastName AS lastName,
	Customers.Email AS email,
	Customers.PhoneNumber AS phoneNumber,
	StringTypes.StringType AS preferredStringType,
	Customers.PreferredTensionVertical AS preferredTensionVertical,
	Customers.PreferredTensionHorizontal AS preferredTensionHorizontal
	FROM Customers
    JOIN StringTypes ON Customers.PreferredStringTypeId = StringTypes.Id

CREATE VIEW RacketStringView
AS
SELECT
	Strings.Id AS stringId,
	Strings.Shop AS shopId,
	Strings.LengthInStock AS lengthInStock,
	Strings.PricePerRacket AS price,
	Strings.IsSoftDeleted AS deleted,
	StringModels.StringModel AS stringModel,
	StringTypes.StringType AS stringType,
	Brands.Brand AS stringBrand,
	StringInfo.Thickness AS stringThickness,
	Purposes.Purpose AS stringPurpose,
	Colors.Color AS stringColor
	FROM Strings
	JOIN StringInfo ON Strings.Id = StringInfo.RacketStringId	
	JOIN StringModels ON StringInfo.Model = StringModels.Id
	JOIN StringTypes ON StringInfo.StringType = StringTypes.Id
	JOIN Brands ON StringInfo.Brand = Brands.Id
	JOIN Purposes ON StringInfo.Purpose = Purposes.Id
	JOIN Colors ON StringInfo.Color = Colors.Id

CREATE VIEW StringerView
AS
SELECT
	Stringers.Id AS stringerId,
	Stringers.FirstName AS firstName,
	Stringers.LastName AS lastName,
	Stringers.PhoneNumber AS phoneNumber,
	Stringers.Email AS email,
	Purposes.Purpose AS preferredRacketType,
    Team_Stringers.TeamId AS teamId
	FROM Stringers
	JOIN Purposes ON Stringers.PreferredRacketType = Purposes.Id
    JOIN Team_Stringers ON Stringers.Id = Team_Stringers.StringerId
