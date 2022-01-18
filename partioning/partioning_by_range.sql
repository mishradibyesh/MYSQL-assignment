/*
partioning by range
*/
show databases;
use payroll_service;
 use lms;
 create table selected_candidate (
     id int NOT NULL,
     first_name VARCHAR(100) NOT NULL,
     middle_name VARCHAR(50) DEFAULT NULL,
     last_name VARCHAR(50) NOT NULL,
     email_id VARCHAR(100) NOT NULL,
	 mobile_number BIGINT NOT NULL,
     hired_city VARCHAR(50) NOT NULL,
     degree VARCHAR(50) NOT NULL,
     hired_date DATETIME NOT NULL,
     permanent_pincode INT DEFAULT NULL,
     hired_lab VARCHAR(50) DEFAULT NULL,
     attitude VARCHAR(50) DEFAULT NULL,
     communication_remark VARCHAR(30) DEFAULT NULL,
     knowledge_remark VARCHAR(30) DEFAULT NULL,
     aggregate_remark VARCHAR(30) DEFAULT NULL,
     status VARCHAR(30) DEFAULT NULL,
     creator_stamp DATETIME DEFAULT NULL,
     PRIMARY KEY(id,hired_date)
     )
     partition by range (YEAR(hired_date)) (
     partition from_2013_or_less values less than (2013), 
     partition from_2014_or_less values less than (2014), 
     partition from_2015_or_less values less than (2015), 
     partition from_2016_or_less values less than (2016) );
     
INSERT INTO selected_candidate (id, first_name, middle_name, last_name, email_id, mobile_number, hired_city, hired_date, degree, permanent_pincode, 
								hired_lab, attitude, communication_remark, knowledge_remark, aggregate_remark, status,creator_stamp) VALUES 
(501,"Dibyesh",Null, "Mishra", "dm@gmail.com", 8847992225, "Ballia", "2013-05-05 14:20:56","m.sc", 277303,
        "EasyRewarz", "creative", "Excellent", "Excellent", "Excellent", "active","2022-01-01 12:20:56"),
(502,"Gyanesh",Null, "Mishra", "gm@gmail.com", 8844992225, "Ballia", "2014-05-05 14:20:56","m.sc", 277303,
        "EasyRewarz", "creative", "Excellent", "Excellent", "Excellent", "active","2022-01-01 12:20:56"),
(503,"Abhay",Null, "Mishra", "am@gmail.com", 8847992225, "Ballia", "2015-05-05 14:20:56","m.sc", 277303,
        "EasyRewarz", "creative", "Excellent", "Excellent", "Excellent", "active","2022-01-01 12:20:56"),
(504,"prashant",Null, "Mishra", "pm@gmail.com", 8847992225, "Ballia", "2015-05-05 14:20:56","m.sc", 277303,
        "EasyRewarz", "creative", "Excellent", "Excellent", "Excellent", "active","2022-01-01 12:20:56");

explain select * from selected_candidate where hired_date = '2014-05-05';
explain select * from selected_candidate where hired_date = '2015-05-05';

## output
explain select * from selected_candidate where hired_date = '2014-05-05';
+----+-------------+--------------------+-------------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table              | partitions        | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+--------------------+-------------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | selected_candidate | from_2015_or_less | ALL  | NULL          | NULL | NULL    | NULL |    1 |   100.00 | Using where |
+----+-------------+--------------------+-------------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql> exit
