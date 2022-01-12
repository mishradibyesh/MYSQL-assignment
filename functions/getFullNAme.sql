use lms;
/* Get the full name of the candidate by candidate_id */
DELIMITER $$
CREATE FUNCTION displayFullName(person_id INT)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
	DECLARE fullName varchar(250);
	SELECT CONCAT(first_name,' ', COALESCE(middle_name,''), ' ', last_name) INTO fullName FROM fellowship_candidates WHERE id =person_id;
	RETURN fullName;
END$$
DELIMITER ;

drop function displayFullName;
SELECT displayFullName(501);