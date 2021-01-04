CREATE DATABASE SellingPoint
GO

USE SellingPoint
GO

CREATE TABLE Categories (
	CateID char(6) CONSTRAINT PK_cateid PRIMARY KEY (CateID),
	CateName nvarchar(100) NOT NULL,
	Description nvarchar(200),
)
GO

CREATE TABLE Parts (
	PartID int IDENTITY CONSTRAINT PK_partid PRIMARY KEY (PartID),
	PartName nvarchar(100) NOT NULL,
	CateID char(6) CONSTRAINT FK_cateid FOREIGN KEY (CateID) REFERENCES Categories(CateID),
	Description nvarchar(1000),
	Price money NOT NULL DEFAULT (0),
	Quantity int DEFAULT (0),
	Warranty int DEFAULT (1),
	Photo nvarchar(200) DEFAULT ('photo/nophoto.png')
)
GO

INSERT INTO Categories VALUES
	(123456,'CPU','Central Processing Unit'),
	(212345,'RAM','Random access memory'),
	(332415,'HDD','Hard disk drive')
GO

INSERT INTO Parts VALUES
	('Pow',332415,'ability',1000,403,112, DEFAULT),
	('Big',212345,'Tranfer',1200,210,224, DEFAULT),
	('Coco',123456,'Tele',805,121,300, DEFAULT)
GO


SELECT * FROM Parts WHERE Price > 100
GO

SELECT * FROM Parts
JOIN Categories ON Categories.CateID = Parts.CateID
WHERE CateName LIKE 'CPU'
GO

CREATE VIEW V_Parts AS
SELECT PartID, PartName, Price, Quantity FROM Categories JOIN Parts on Categories.CateID = Parts.CateID
GO

CREATE VIEW V_TopParts AS
SELECT TOP 5 * FROM Parts ORDER BY Price DESC
GO