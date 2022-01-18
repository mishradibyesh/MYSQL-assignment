## partition by range and sub partition by hash

CREATE TABLE log_subpart(
	user_name VARCHAR(100) NOT NULL,
	technology VARCHAR(50) NOT NULL,
	disk_write_count BIGINT NOT NULL
)
PARTITION BY RANGE (disk_write_count)
SUBPARTITION BY HASH (disk_write_count)(
	PARTITION less_than_100000 VALUES LESS THAN (100000)
	(
		SUBPARTITION subpart1,
		SUBPARTITION subpart2
	),
	PARTITION less_than_200000 VALUES LESS THAN (200000)
	(
		SUBPARTITION subpart3,
		SUBPARTITION subpart4
	),
	PARTITION less_than_300000 VALUES LESS THAN (300000)
	(
		SUBPARTITION subpart5,
		SUBPARTITION subpart6
	),
    PARTITION less_than_400000 VALUES LESS THAN (400000)
	(
		SUBPARTITION subpart7,
		SUBPARTITION subpart8
	),
    PARTITION less_than_500000 VALUES LESS THAN (500000)
	(
		SUBPARTITION subpart9,
		SUBPARTITION subpart10
	),
    PARTITION less_than_600000 VALUES LESS THAN (600000)
	(
		SUBPARTITION subpart11,
		SUBPARTITION subpart12
	),
	PARTITION less_than_other VALUES LESS THAN MAXVALUE
	(
		SUBPARTITION subpart13,
		SUBPARTITION subpart14
	)
);
INSERT INTO log_subpart SELECT user_name, technology, disk_write_count FROM temporary_MIS ORDER BY disk_write_count;
select * from log_subpart;
drop table log_subpart;

 SELECT TABLE_NAME, PARTITION_NAME, SUBPARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'log_subpart';
+-------------+------------------+-------------------+------------+
| TABLE_NAME  | PARTITION_NAME   | SUBPARTITION_NAME | TABLE_ROWS |
+-------------+------------------+-------------------+------------+
| log_subpart | less_than_100000 | subpart1          |        726 |
| log_subpart | less_than_100000 | subpart2          |        699 |
| log_subpart | less_than_200000 | subpart3          |         61 |
| log_subpart | less_than_200000 | subpart4          |         53 |
| log_subpart | less_than_300000 | subpart5          |         90 |
| log_subpart | less_than_300000 | subpart6          |         84 |
| log_subpart | less_than_400000 | subpart7          |         79 |
| log_subpart | less_than_400000 | subpart8          |         71 |
| log_subpart | less_than_500000 | subpart9          |          2 |
| log_subpart | less_than_500000 | subpart10         |          2 |
| log_subpart | less_than_600000 | subpart11         |          0 |
| log_subpart | less_than_600000 | subpart12         |          0 |
| log_subpart | less_than_other  | subpart13         |          0 |
| log_subpart | less_than_other  | subpart14         |          0 |
+-------------+------------------+-------------------+------------+
14 rows in set (0.02 sec)

mysql> exit
