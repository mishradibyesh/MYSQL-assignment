use lms;
DELIMITER //
CREATE TRIGGER company_after_delete
AFTER DELETE
ON company FOR EACH ROW
BEGIN
   INSERT INTO company_trash(company_name,date_deleted)
   VALUES
   ( OLD.name,localtime());
END; //

DELIMITER ;
drop trigger company_after_delete;


/* execute */

delete from company where id=505;
select * from company_trash;