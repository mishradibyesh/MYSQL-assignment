/*
partioning by rang column
*/
use lms;
create table selected_candidate_by_range_column (
     id int NOT NULL,
     first_name VARCHAR(100) NOT NULL,
     middle_name VARCHAR(50) DEFAULT NULL,
     last_name VARCHAR(50) NOT NULL,
     email_id VARCHAR(100) NOT NULL,
	 mobile_number BIGINT NOT NULL,
     hired_city VARCHAR(50) NOT NULL,
     degree VARCHAR(50) NOT NULL,
     hired_date DATETIME NOT NULL,
     permanent_pincode INT NOT NULL,
     hired_lab VARCHAR(50) DEFAULT NULL,
     attitude VARCHAR(50) DEFAULT NULL,
     communication_remark VARCHAR(30) DEFAULT NULL,
     knowledge_remark VARCHAR(30) DEFAULT NULL,
     aggregate_remark VARCHAR(30) DEFAULT NULL,
     status VARCHAR(30) DEFAULT NULL,
     creator_stamp DATETIME DEFAULT NULL,
     PRIMARY KEY(degree,permanent_pincode)
     )
     partition by range columns (degree,permanent_pincode) (
     partition ballia_and_msc values less than ('b.tech',277001), 
     partition ballia_and_btech values less than ('m.sc',277303),
     PARTITION others_p VALUES LESS THAN (MAXVALUE,MAXVALUE));
drop table selected_candidate_by_range_column;

INSERT INTO selected_candidate_by_range_column (id, first_name, middle_name, last_name, email_id, mobile_number, hired_city, hired_date, degree, permanent_pincode, 
								hired_lab, attitude, communication_remark, knowledge_remark, aggregate_remark, status,creator_stamp) VALUES 
(501,"Dibyesh",Null, "Mishra", "dm@gmail.com", 8847992225, "Ballia", "2013-05-05 14:20:56","b.tech", 277001,
        "EasyRewarz", "creative", "Excellent", "Excellent", "Excellent", "active","2022-01-01 12:20:56"),
(502,"Gyanesh",Null, "Mishra", "gm@gmail.com", 8844992225, "Ballia", "2014-05-05 14:20:56","m.sc", 277303,
        "EasyRewarz", "creative", "Excellent", "Excellent", "Excellent", "active","2022-01-01 12:20:56");

-- output
explain select * from selected_candidate_by_range_column where degree ='m.sc' and permanent_pincode=277303;
+----+-------------+------------------------------------+-------------+-------+---------------+---------+---------+-------------+------+----------+-------+
| id | select_type | table                              | partitions  | type  | possible_keys | key     | key_len | ref         | rows | filtered | Extra |
+----+-------------+------------------------------------+-------------+-------+---------------+---------+---------+-------------+------+----------+-------+
|  1 | SIMPLE      | selected_candidate_by_range_column | part_others | const | PRIMARY       | PRIMARY | 206     | const,const |    1 |   100.00 | NULL  |
+----+-------------+------------------------------------+-------------+-------+---------------+---------+---------+-------------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> exit
