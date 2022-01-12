use lms;
## creating function to calculate age

DELIMITER $$
CREATE FUNCTION func_Calculate_Age(student_id int)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE TodayDate DATE;
	DECLARE student_birth_date DATE;
    SELECT CURRENT_DATE() INTO TodayDate ;
	SELECT birth_date from fellowship_candidates where id = student_id into student_birth_date;
    RETURN YEAR(TodayDate) - YEAR(student_birth_date);
END$$
DELIMITER ;

select func_Calculate_Age(501) as age;
drop function func_Calculate_Age;

