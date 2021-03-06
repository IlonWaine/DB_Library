USE MASTER;
DROP DATABASE LIBRARY_ODISEY;

CREATE DATABASE LIBRARY_ODISEY;


USE LIBRARY_ODISEY

CREATE TABLE GENRE
(
ID INT PRIMARY KEY IDENTITY(1,1),
[NAME] VARCHAR(70) UNIQUE NOT NULL -- ADD UNIQUE CONSTRAINT
);

CREATE TABLE PUBLISHING_HOUSE
(
ID INT PRIMARY KEY IDENTITY(1,1),
[NAME] VARCHAR(150) NOT NULL ,
CITY VARCHAR(40) NOT NULL
);


CREATE TABLE DEPARTMENT
(
ID INT PRIMARY KEY IDENTITY(1,1),
STREET VARCHAR(60) NOT NULL,
CITY VARCHAR(40) NOT NULL
);



CREATE TABLE VISITORS
(
ID INT PRIMARY KEY IDENTITY(1,1),
[NAME] VARCHAR(40) NOT NULL ,
SURNAME VARCHAR(40) NOT NULL,
PHONE VARCHAR(12) UNIQUE NOT NULL,  -- ADD UNIQUE CONSTRAINT
CONSTRAINT PHONE_NUMBER CHECK( PHONE LIKE '0[0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9][0-9]' ) -- ADD CHECK CONSTRAINT
);

--INSERT INTO VISITORS([NAME],SURNAME,PHONE) VALUES('JOHN','Welf','097 152 3502');
--select * from visitors  ;
--CREATE TABLE AUTOR
(
ID INT PRIMARY KEY IDENTITY(1,1),
[NAME] VARCHAR(40) NOT NULL,
SURNAME VARCHAR(40)NOT NULL,
NATIONALITY VARCHAR(50)
);

CREATE TABLE LITERATURE
(
ID INT PRIMARY KEY IDENTITY(1,1),
[NAME] VARCHAR(40) NOT NULL,
PH_ID INT FOREIGN KEY REFERENCES PUBLISHING_HOUSE(ID) ON DELETE SET NULL,
PAGE_AMOUNT INT NOT NULL,
AMOUNT INT NOT NULL DEFAULT 0,
GENRE_ID INT FOREIGN KEY REFERENCES GENRE(ID) ON DELETE NO ACTION NOT NULL ,
PRICE FLOAT
--[DESCRIPTION] TEXT
);

CREATE TABLE GENRE_BOOK
(
GENRE_ID INT FOREIGN KEY REFERENCES GENRE(ID) ON DELETE NO ACTION,
BOOK_ID INT FOREIGN KEY REFERENCES LITERATURE(ID) ON DELETE CASCADE
);

CREATE TABLE AUTOR_BOOK
(
AUTOR_ID INT FOREIGN KEY REFERENCES AUTOR(ID) ON DELETE NO ACTION NOT NULL ,
BOOK_ID INT FOREIGN KEY REFERENCES LITERATURE(ID) ON DELETE CASCADE NOT NULL 
);

CREATE TABLE ORDERS
( 
ID INT PRIMARY KEY IDENTITY(1,1),
DEP_ID INT FOREIGN KEY REFERENCES DEPARTMENT(ID) NOT NULL,
VISITOR_ID INT FOREIGN KEY REFERENCES VISITORS(ID) NOT NULL,
BOOK_ID INT FOREIGN KEY REFERENCES LITERATURE(ID) NOT NULL,
ORDER_DATE DATE NOT NULL,
EXP_RET_DATE DATE NOT NULL,
FACT_RET_DATE DATE, 
CONSTRAINT DATE_REWIEW CHECK( EXP_RET_DATE > ORDER_DATE) -- ADD CHECK CONSTRAINT
);

CREATE TABLE FINES
(
ID INT PRIMARY KEY IDENTITY(1,1),
ORDER_ID INT FOREIGN KEY REFERENCES ORDERS(ID)  NOT NULL,
DAYS_OF_DELAY INT NOT NULL DEFAULT 1,
[SUM] FLOAT
);             



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     