DELIMITER //

CREATE PROCEDURE DeleteRacketString(
	IN stringId INT)

BEGIN

    UPDATE Strings SET IsSoftDeleted = 1 WHERE Id = stringId;

END //

DELIMITER ;