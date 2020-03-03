DELIMITER //

CREATE PROCEDURE UpdateOrder(
	IN orderId INT,
	IN transactionDate BIGINT,
	IN paidStatus TINYINT,
	IN orderStatus INT)

BEGIN

	UPDATE Orders SET OrderStatus = orderStatus WHERE Id = orderId;
	UPDATE Orders SET Paid = paidStatus WHERE Id = orderId;

	INSERT INTO OrderTransactions (OrderId, TransactionDate, Paid, OrderStatus)
	VALUES (orderId, transactionDate, paidStatus, orderStatus);

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateRacketStringInStorageOnPurchase(
	IN stringId INT,
	IN price DOUBLE,
	IN transactionDate BIGINT,
	IN lengthAdded INT)

BEGIN

	UPDATE Strings SET LengthInStock = LengthInStock + lengthAdded WHERE Id = stringId;

	INSERT INTO StringTransactions (RacketStringId, Price, TransactionDate, LengthAdded)
	VALUES (stringId, price, transactionDate, lengthAdded);

END //

DELIMITER ;