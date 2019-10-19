CREATE DATABASE BASICJSP;
USE BASICJSP;


create table user(
userID VARCHAR(20) PRIMARY KEY,
userPassword VARCHAR(20),
userEmail VARCHAR(20),
userName VARCHAR(20),
userGender VARCHAR(20),
userPhone VARCHAR(20),
userAge INT,
userAddress VARCHAR(30)
);

create table BBS(
bbsID INT PRIMARY KEY,
bbsTitle VARCHAR(50),
userID VARCHAR(20),
bbsDate DATETIME,
bbsContent VARCHAR(2048),
bbsAvailable INT
);



DROP TABLE IF EXISTS tblBoard;

CREATE TABLE `tblBoard` (
	`num`               int(11)              NOT NULL  auto_increment  ,
	`name`              varchar(20)                    ,
	`subject`           varchar(50)                    ,
	`content`           text                           ,
	`pos`                smallint(7) unsigned           ,
	`ref`               smallint(7)                    ,
	`depth`             smallint(7) unsigned           ,
	`regdate`          date                           ,
	`pass`              varchar(15)                    ,
	`ip`                  varchar(15)                    ,
	`count`             smallint(7) unsigned           ,
	`filename`         varchar(30)                    ,
	`filesize`           int(11)                        ,
	PRIMARY KEY ( `num` )
);

insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)
values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);