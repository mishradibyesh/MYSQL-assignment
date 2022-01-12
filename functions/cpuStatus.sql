use lms;
## Take cpu percent and use case to print cpu percent is high when > 80,  normal<80 and else low 
DELIMITER $$
CREATE FUNCTION cpuStatus(bootTime varchar(50))
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
declare cpu_percentage double;
select  cpu_percent into cpu_percentage from temporary_mis where boot_time =bootTime;
	CASE
		WHEN cpu_percentage > 80 THEN  RETURN 'cpu percent is high';
        WHEN cpu_percentage < 80 THEN RETURN 'cpu percent is normal';
        ELSE RETURN 'low';
	END CASE;
END$$
DELIMITER ;

SELECT cpuStatus('0:05:08.314758');
drop function cpuStatus;