use lms;
## handling exception while calling displayFullName function in a procedure
DELIMITER //
CREATE PROCEDURE getFullName(in s_id varchar(40))
BEGIN
	declare incorrectFormat condition for 1366;
	declare exit handler for incorrectFormat
	select 'please enter integer format for id' Message; 
	SELECT displayFullName(s_id);
END //
DELIMITER ;

call getFullName('s_id');
drop procedure getFullName;