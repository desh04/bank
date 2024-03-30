-- this file should revert the changes by the "up" file
-- up file is creatng the three table 
-- so down file will remove these tables
DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS transfers;
DROP TABLE IF EXISTS accounts;