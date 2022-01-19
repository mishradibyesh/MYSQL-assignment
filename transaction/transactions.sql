use lms;

DELIMITER //
CREATE PROCEDURE transactionRollback()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
			SELECT 'TRANSACTION FAILED: data is already present with this user id';
		END;
	START TRANSACTION;
		insert into hired_candidate values(501,"Dibyesh",Null, "Mishra", "dm@gmail.com", 8847992225, "Ballia", "2022-05-05 14:20:56","m.sc", 277303, 
		"EasyRewarz", "creative", "Excellent", "Excellent", "Excellent", "active","2022-01-01 12:20:56");
        commit;
END //
DELIMITER ;

call transactionRollback;