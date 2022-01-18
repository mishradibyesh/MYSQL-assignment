 /*
partioning by  list
*/
 use lms;
 create table selected_candidate_by_pincode (
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
     PRIMARY KEY(id,permanent_pincode)
     )
     partition by list(permanent_pincode) (
     partition pincode_ballia values in (277303,277001), 
     partition pincode_delhi values in  (11054), 
     partition pincode_gwalior values in (24790));
    
-- output

 select * from selected_candidate_by_pincode where permanent_pincode = 277303;
+-----+------------+-------------+-----------+--------------+---------------+------------+--------+---------------------+-------------------+------------+----------+----------------------+------------------+------------------+--------+---------------------+
| id  | first_name | middle_name | last_name | email_id     | mobile_number | hired_city | degree | hired_date          | permanent_pincode | hired_lab  | attitude | communication_remark | knowledge_remark | aggregate_remark | status | creator_stamp       |
+-----+------------+-------------+-----------+--------------+---------------+------------+--------+---------------------+-------------------+------------+----------+----------------------+------------------+------------------+--------+---------------------+
| 501 | Dibyesh    | NULL        | Mishra    | dm@gmail.com |    8847992225 | Ballia     | m.sc   | 2013-05-05 14:20:56 |            277303 | EasyRewarz | creative | Excellent            | Excellent        | Excellent        | active | 2022-01-01 12:20:56 |
+-----+------------+-------------+-----------+--------------+---------------+------------+--------+---------------------+-------------------+------------+----------+----------------------+------------------+------------------+--------+---------------------+
1 row in set (0.00 sec)

mysql> exit
