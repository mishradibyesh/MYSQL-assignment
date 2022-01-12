use lms;
## get company count by location
DELIMITER $$
CREATE FUNCTION fun_companyCount(cLocation varchar(60))
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE count_company int;
	SELECT COUNT(location) INTO count_company FROM company WHERE location = cLocation;
    RETURN count_company;
END$$
DELIMITER ;
    
select fun_companyCount('ballia');
drop function fun_companyCount;