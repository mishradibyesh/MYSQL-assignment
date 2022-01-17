use lms;
## Defined handler inside procedure to handle sql exception and sql warning  by doing select query to call the views inside the procedure
DELIMITER //
CREATE PROCEDURE callViews()
BEGIN
	declare viewInsideProcedure condition for 1054;
	declare exit handler for viewInsideProcedure
	select 'hum nahi jante is problem ko' Message; 
    -- sql query
	select * from personWhoseEducationChecked;
END //
DELIMITER ;

call callViews();
drop procedure callViews;
