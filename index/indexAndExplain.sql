use lms;
create index abc
on temporary_MIS (cpu_percent);
explain select * from temporary_MIS where cpu_percent = 75.000;