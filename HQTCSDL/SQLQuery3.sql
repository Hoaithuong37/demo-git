﻿CREATE DATABASE IT_PROJECTS
USE IT_PROJECTS
GO
CREATE TABLE PROJECTS (
	PROJECTSNO NVARCHAR(10),
	PROJECTNAME NVARCHAR(50),
	STARTDATE DATE,
	ENDDATE DATE, 
	BUDGET NCHAR(50)
	CONSTRAINT PK_PROJECTS PRIMARY KEY(PROJECTSNO)
)
go
CREATE TABLE EMPLOYEES(
	EMPID NVARCHAR(10),
	EMPNAME NVARCHAR(50) UNIQUE,
	DOB DATE,
	GENDER INT
	CONSTRAINT PK_EMPLOYEES PRIMARY KEY(EMPID)
)
GO
CREATE TABLE PRO_EMP
( 
	PROJECTSNO NVARCHAR(10) FOREIGN KEY (PROJECTSNO) REFERENCES PROJECTS(PROJECTSNO),
	EMPID NVARCHAR(10) FOREIGN KEY(EMPID) REFERENCES EMPLOYEES(EMPID),
	ROLE NVARCHAR(50) NOT NULL,
	STARTDATE DATE,
	ENDDATE DATE

)
DROP TABLE PRO_EMP
GO

INSERT INTO PROJECTS(PROJECTSNO,PROJECTNAME,STARTDATE,ENDDATE,BUDGET)
VALUES ('P001','WEB','2023-01-15','2023-12-31',50000);
INSERT INTO PROJECTS(PROJECTSNO,PROJECTNAME,STARTDATE,ENDDATE,BUDGET)
VALUES ('P002','MOBILE','2023-02-20','2023-11-30',75000);
INSERT INTO PROJECTS(PROJECTSNO,PROJECTNAME,STARTDATE,ENDDATE,BUDGET)
VALUES ('P003','TEST','2023-03-10','2023-10-15',60000)

SELECT * FROM PROJECTS

INSERT INTO EMPLOYEES(EMPID,EMPNAME,DOB,GENDER)
VALUES ('E001','JOHN SMITH','1985-03-25',1);
INSERT INTO EMPLOYEES(EMPID,EMPNAME,DOB,GENDER)
VALUES ('E002','JANE DOE','1990-07-15',0);
INSERT INTO EMPLOYEES(EMPID,EMPNAME,DOB,GENDER)
VALUES ('E003','MICHAEL JOHNSON','1988-11-10',1);
INSERT INTO EMPLOYEES(EMPID,EMPNAME,DOB,GENDER)
VALUES ('E004','EMILY WILSON','1992-06-08',0);
INSERT INTO EMPLOYEES(EMPID,EMPNAME,DOB,GENDER)
VALUES ('E005','DAVID BROWN','1987-09-20',1)

SELECT * FROM EMPLOYEES

SELECT * FROM PRO_EMP

INSERT INTO PRO_EMP(PROJECTSNO,EMPID,ROLE,STARTDATE,ENDDATE)
VALUES ('P001','E001','PROJECT MANAGER','2023-01-15','2023-12-31');

INSERT INTO PRO_EMP(PROJECTSNO,EMPID,ROLE,STARTDATE,ENDDATE)
VALUES ('P002','E001','TEAM LEAD','2023-02-20','2023-11-30');

INSERT INTO PRO_EMP(PROJECTSNO,EMPID,ROLE,STARTDATE,ENDDATE)
VALUES ('P003','E001','SOFTWARE ENGINEER','2023-03-10','2023-10-15');

INSERT INTO PRO_EMP(PROJECTSNO,EMPID,ROLE,STARTDATE,ENDDATE)
VALUES ('P003','E002','BUSINESS ANALYST','2023-05-12','2023-08-31');

INSERT INTO PRO_EMP(PROJECTSNO,EMPID,ROLE,STARTDATE,ENDDATE)
VALUES ('P002','E002','PROJECT MANAGER','2023-01-15','2023-12-31');

INSERT INTO PRO_EMP(PROJECTSNO,EMPID,ROLE,STARTDATE,ENDDATE)
VALUES ('P001','E003','TEAM LEAD','2023-02-20','2023-11-30');

INSERT INTO PRO_EMP(PROJECTSNO,EMPID,ROLE,STARTDATE,ENDDATE)
VALUES ('P003','E005','QA ANALYST','2023-04-05','2023-09-30');

SELECT * FROM PROJECTS
SELECT * FROM EMPLOYEES
SELECT * FROM PRO_EMP

/*CÂU 2 THAY ĐỔI VAI TRÒ CỦA NHÂN VIÊN E005 VỚI DỰ ÁN P003 THÀNH PROJECT MANAGER*/
UPDATE PRO_EMP
SET ROLE = 'PROJECT MANAGER'
WHERE PROJECTSNO = 'P003' AND EMPID = 'E005'

/*CÂU 3: TĂNG THỜI GIAN KẾT THÚC DỰ ÁN P003 LÊN 10 NGÀY*/

/*CÂU 4: CHO BIẾT THÔNG TIN CÁC NHÂN VIÊN THAM GIA DỰ ÁN P001*/
SELECT * FROM 