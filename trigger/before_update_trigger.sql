use lms;
-- trigger beore update check for empty password
 DELIMITER //
 Create Trigger before_update_check_empty  
BEFORE UPDATE ON user_details FOR EACH ROW  
BEGIN  
IF NEW.password = ''  THEN  SIGNAL SQLSTATE
'45000' SET MESSAGE_TEXT = 'password can not be empty';  
END IF;  
END //
 DELIMITER ;
 
UPDATE user_details SET password = '' WHERE id = 501;
UPDATE user_details SET password = 'Dibyesh@033' WHERE id = 501;