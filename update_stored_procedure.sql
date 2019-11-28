DELIMITER //

CREATE PROCEDURE UpdateOrder(
	IN orderId INT,
	IN transactionDate BIGINT,
	IN paidStatus TINYINT,
	IN orderStatus INT)

BEGIN

	UPDATE Orders SET OrderStatus = orderStatus WHERE Id = orderId;

	INSERT INTO OrderTransactions (OrderId, TransactionDate, Paid, OrderStatus)
	VALUES (orderId, transactionDate, paidStatus, orderStatus);

END //

DELIMITER ;