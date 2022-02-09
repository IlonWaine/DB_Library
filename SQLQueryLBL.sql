USE LIBRARY_ODISEY

CREATE TABLE GENRE
(
ID INT PRIMARY KEY IDENTITY(1,1),
[NAME] VARCHAR(70) UNIQUE NOT NULL
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
PHONE VARCHAR(10),
CONSTRAINT PHONE_NUMBER CHECK( PHONE LIKE '0[1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9]' )
);

CREATE TABLE AUTOR
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
GENRE_ID INT FOREIGN KEY REFERENCES GENRE(ID) NOT NULL ON DELETE NO ACTION,
PRICE FLOAT
);

CREATE TABLE AUTOR_BOOK
(
AUTOR_ID INT FOREIGN KEY REFERENCES AUTOR(ID),
BOOK_ID INT FOREIGN KEY REFERENCES LITERATURE(ID)
);

CREATE TABLE ORDERS
( 
ID INT PRIMARY KEY IDENTITY(1,1),
DEP_ID INT FOREIGN KEY REFERENCES DEPARTMENT(ID),
VISITOR_ID INT FOREIGN KEY REFERENCES VISITORS(ID),
BOOK_ID INT FOREIGN KEY REFERENCES LITERATURE(ID),
ORDER_DATE DATE,
EXP_RET_DATE DATE,
FACT_RET_DATE DATE
);

CREATE TABLE FINES
(
ID INT PRIMARY KEY IDENTITY(1,1),
VISITOR_ID INT FOREIGN KEY REFERENCES VISITORS(ID),
ORDER_ID INT FOREIGN KEY REFERENCES ORDERS(ID),
DAYS_OF_DELAY INT,
[SUM] FLOAT
);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          