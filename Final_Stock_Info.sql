
USE stock_info
GO
-- -----------------------------------------


--Table Industries
CREATE TABLE Industries(
	Industry_ID INT PRIMARY KEY NOT NULL,
	[Name] varchar(30) NOT NULL
	);

-- -----------------------------------------


-- Table Company

CREATE TABLE Company(
	Company_ID  INT  IDENTITY PRIMARY KEY NOT NULL,
	Industry_ID INT REFERENCES Industries(Industry_ID),
	Company_Name varchar(45) NOT NULL,
	Ticker_Symbol varchar(45) NOT NULL,
	Address varchar(45)
	);
-- -----------------------------------------

-- Table Stock Data
CREATE TABLE Stock_Data(
	[Date] DATETIME NOT NULL,
	Sales_Data INT, 
	Ticker_Symbol varchar(45) NOT NULL
	);
ALTER TABLE Stock_Data
	ADD CONSTRAINT primary_key PRIMARY KEY ([Date],Ticker_Symbol)
GO
CREATE UNIQUE INDEX UN ON Stock_Data([Date])

-- ---------------------------------------

-- Table Date Data

CREATE TABLE Date_Data(
	[Date] DATETIME REFERENCES Stock_Data([Date]) NOT NULL,
	[Open] INT,
	High INT,
	Low INT,
	[Close] INT,
	Ticker_Symbol varchar(45) NOT NULL
	);

ALTER TABLE Date_Data
	ADD CONSTRAINT date_primary_key PRIMARY KEY ([Date],Ticker_Symbol)

-- -----------------------------------------

--Populate Industries
INSERT INTO Industries VALUES(1, 'Industrials')
INSERT INTO Industries VALUES(2, 'Health Care')
INSERT INTO Industries VALUES(3,'Information Technology')
INSERT INTO Industries VALUES(4, 'Communication Services')
INSERT INTO Industries VALUES(5, 'Consumer Discretionary')
INSERT INTO Industries VALUES(6, 'Energy')
INSERT INTO Industries VALUES(7, 'Financials')
INSERT INTO Industries VALUES(8, 'Materials')
INSERT INTO Industries VALUES(9, 'Real Estate')
INSERT INTO Industries VALUES(10, 'Utilities')

-- -----------------------------------------

-- Populate Company 
INSERT INTO Company VALUES(1,'3M Company', 'MMM', 'St. Paul, Minnesota')
INSERT INTO Company VALUES(1,'Alaska Air Group', 'ALK', 'Seattle, Washington')
INSERT INTO Company VALUES(1,'CSX Corp', 'CSX', 'Jacksonville, Florida')
INSERT INTO Company VALUES(1,'General Electric', 'GE', 'Boston, Massachussets')
INSERT INTO Company VALUES(2,'Abbot Laboratories', 'ABT', 'North Chicago, Illinois')
INSERT INTO Company VALUES(2,'Cardinal Health Inc', 'CAH', 'Dublin, Ohio')
INSERT INTO Company VALUES(2,'United Health Group', 'UNH', 'Waltham, Massachussets')
INSERT INTO Company VALUES(2,'Incyte', 'INCY', 'Wilmington, Delaware')
INSERT INTO Company VALUES(3,'Accenture plc', 'ACN', 'Dublin, Ireland')
INSERT INTO Company VALUES(3,'Akamai Technologies INC', 'AKAM', 'Cambridge, Massachussets')
INSERT INTO Company VALUES(3,'PayPal', 'PYPL', 'San Jose, California')
INSERT INTO Company VALUES(3,'Juniper Networks', 'JNPR', 'Sunnyvale, California')
INSERT INTO Company VALUES(4,'Activision Blizzard', 'ATVI', 'Santa Montana, California')
INSERT INTO Company VALUES(4,'Alphabet Inc Class A', 'GOOGL', 'Mountain View, California')
INSERT INTO Company VALUES(5,'Advance Auto Parts', 'AAP', 'Roanake, Virginia')
INSERT INTO Company VALUES(5,'Amazon', 'AMZN', 'Seattle, Washington')
INSERT INTO Company VALUES(6,'Apache Corporation', 'APC', 'Houston, Texas')
INSERT INTO Company VALUES(6,'Chevron Corp.', 'CVX', 'San Ramon, California')
INSERT INTO Company VALUES(7,'AFLAC Inc', 'AFL', 'Beverly, Massachussets')
INSERT INTO Company VALUES(7,'First Republic Bank', 'FRC', 'San Francisco, California')
INSERT INTO Company VALUES(8,'Ball Corp', 'BLL', 'Broomfield, Colorado')
INSERT INTO Company VALUES(8,'WestRock', 'WRK', 'Richmond, Virginia')
INSERT INTO Company VALUES(9,'HCP Inc', 'HCP', 'Long Beach, California')
INSERT INTO Company VALUES(9,'UDR Inc', 'UDR', 'Highlands Ranch, Colorado')
INSERT INTO Company VALUES(10,'AES Corp', 'AES', 'Arlington, Virginia')
INSERT INTO Company VALUES(10,'NRG Energy', 'NRG', 'Princeton, New Jersey')


-- -----------------------------------------


-- Poppulate Stock_Data

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2014-03-08 10:25:00', 'MMM')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2008-02-02 17:39:58', 'AES')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2015-05-09 10:45:59', 'FRC')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2012-05-18 14:43:40', 'BLL')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2015-02-01 18:45:00', 'GOOGL')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2013-04-08 15:30:00', 'ACN')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2012-12-12 15:26:50', 'PYPL')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2015-11-09 17:16:20', 'PYPL')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2014-04-04 11:25:00', 'HCP')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2015-06-02 13:17:04', 'AMZN')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2014-03-02 12:45:03', 'AMZN')

INSERT INTO Stock_Data(Date, Ticker_Symbol)
VALUES('2013-02-09 20:35:03', 'JNPR')

-- -----------------------------------------


--Populate Date_Data

INSERT INTO Date_Data VALUES('2014-03-08 10:25:00 ',134.80,135.1,133.2,134.1, 'MMM')

INSERT INTO Date_Data VALUES('2008-02-02 17:39:58',80.80,81,79.8,80.7, 'AES')

INSERT INTO Date_Data VALUES('2015-05-09 10:45:59',120.60,122.02,118.2,122.00, 'FRC')

INSERT INTO Date_Data VALUES('2012-05-18 14:43:40',100.00,101.2,99,100.2, 'BLL')

INSERT INTO Date_Data VALUES('2015-02-01 18:45:00',180.2,186.4,180.2,185, 'GOOGL')

INSERT INTO Date_Data VALUES('2013-04-08 15:30:00',102.3,103,99,100, 'ACN')

INSERT INTO Date_Data VALUES('2012-12-12 15:26:50',76,78,73,77, 'PYPL')

INSERT INTO Date_Data VALUES('2015-11-09 17:16:20',112,115,111.3,114.7, 'PYPL')



INSERT INTO Date_Data VALUES('2014-04-04 11:25:00', 112.4,113,111,113, 'HCP')

INSERT INTO Date_Data VALUES('2015-06-02 13:17:04',178.2,178.2,177.3,177, 'AMZN')

INSERT INTO Date_Data VALUES('2014-03-02 12:45:03',168.1,168.8,166.5,166.5, 'AMZN')

INSERT INTO Date_Data VALUES('2013-02-09 20:35:03', 98,100.24,98,99.99, 'JNPR')

-- -----------------------------------------

-- Populate Customer_Employees


INSERT INTO Customer_has_Employees VALUES(1134,1)
INSERT INTO Customer_has_Employees VALUES(1135,2)
INSERT INTO Customer_has_Employees VALUES(1136,2)
INSERT INTO Customer_has_Employees VALUES(1137,7)
INSERT INTO Customer_has_Employees VALUES(1138,1)
INSERT INTO Customer_has_Employees VALUES(1139,7)
INSERT INTO Customer_has_Employees VALUES(1140,2)
INSERT INTO Customer_has_Employees VALUES(1141,2)
INSERT INTO Customer_has_Employees VALUES(1142,1)
INSERT INTO Customer_has_Employees VALUES(1143,1)

-- -----------------------------------------
--Poppulate Transaction table. 
drop table [TRANSACTION]
drop table Account

select * from Account
select * from [TRANSACTION]
select * from Departments
select * from Customer
select * from Employees
select * from Customer_has_Employees
select * from Stock_Data

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(1,'AMZN',50,1134)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(2,'PYPL',23,1136)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(3,'PYPL',48,1139)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(4,'BLL',10,1134)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(5,'JNPR',100,1141)


INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(6,'MMM',18,1142)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(7,'AMZN',50,1134)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(8,'FRC',12,1135)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(9,'GOOGL',18,1138)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(10,'AES',38,1138)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(11,'HCP',22,1135)

INSERT INTO [TRANSACTION](TransactionID,Stock_Name,Stock_Quantity,CustomerID)
VALUES(12,'ACN',2,1140)

-- -----------------------------------------

-- Update function for transaction to get account ID
UPDATE [TRANSACTION]
SET Account_ID = c.Account_ID
FROM [TRANSACTION] T
LEFT JOIN Customer c
ON T.CustomerID = c.CustomerID

-- Update Function for employee ID
UPDATE [TRANSACTION]
SET EmpID = c.EmpID
FROM [TRANSACTION] T
LEFT JOIN Customer_has_Employees c
ON T.CustomerID = c.CustomerID


--Get Dates of Trasactions
UPDATE [TRANSACTION]
SET DateBoughtAt = '2014-03-02 12:45:03.000'
WHERE TransactionID = 1

UPDATE [TRANSACTION]
SET DateBoughtAt = '2012-12-12 15:26:50.000'
WHERE TransactionID = 2

UPDATE [TRANSACTION]
SET DateBoughtAt = '2012-12-12 15:26:50.000'
WHERE TransactionID = 2

UPDATE [TRANSACTION]
SET DateSoldAt = '2015-11-09 17:16:20.000'
WHERE TransactionID = 3

UPDATE [TRANSACTION]
SET DateBoughtAt = '2012-05-18 14:43:40.000'
WHERE TransactionID = 4

UPDATE [TRANSACTION]
SET DateBoughtAt = '2013-02-09 20:35:03.000'
WHERE TransactionID = 5

UPDATE [TRANSACTION]
SET DateSoldAt = '2014-03-08 10:25:00.000'
WHERE TransactionID = 6

UPDATE [TRANSACTION]
SET DateSoldAt = '2015-06-02 13:17:04.000'
WHERE TransactionID = 7

UPDATE [TRANSACTION]
SET DateBoughtAt = '2015-05-09 10:45:59.000'
WHERE TransactionID = 8

UPDATE [TRANSACTION]
SET DateSoldAt = '2015-02-01 18:45:00.000'
WHERE TransactionID = 9

UPDATE [TRANSACTION]
SET DateBoughtAt = '2008-02-02 17:39:58.000'
WHERE TransactionID = 10

UPDATE [TRANSACTION]
SET DateSoldAt = '2014-04-04 11:25:00.000'
WHERE TransactionID = 11

UPDATE [TRANSACTION]
SET DateBoughtAt = '2013-04-08 15:30:00.000'
WHERE TransactionID = 12

--Fill stock prices
UPDATE [TRANSACTION]
SET StockSoldAt = d.High
FROM [TRANSACTION] T
LEFT JOIN Date_Data d
ON T.DateSoldAt = d.[Date]

UPDATE [TRANSACTION]
SET StockBoughtAt = d.High
FROM [TRANSACTION] T
LEFT JOIN Date_Data d
ON T.DateBoughtAt = d.[Date]

-- -----------------------------------------

--Case function
UPDATE [TRANSACTION]
SET [Revenue] = 
				CASE
					WHEN StockSoldAt is not null then  (Stock_Quantity * StockSoldAt) 
					WHEN StockBoughtAt is not null then  (-(Stock_Quantity * StockBoughtAt)) 
				END
	WHERE Account_ID = 1001 OR Account_ID = 1003 OR Account_ID = 1017;

-- -----------------------------------------

-- Creating Stored Procedure
Create Procedure set_rev @Account_ID INT
AS 
	UPDATE [TRANSACTION]
	SET [Revenue] = 
				CASE
					WHEN StockSoldAt is not null then  (Stock_Quantity * StockSoldAt) 
					WHEN StockBoughtAt is not null then  (-(Stock_Quantity * StockBoughtAt)) 
				END
	WHERE Account_ID = @Account_ID;
GO
-- -----------------------------------------


-- Create trigger for stored procedure
 CREATE TRIGGER insert_to_account
 ON [TRANSACTION] 
 AFTER INSERT 
 AS BEGIN
 	DECLARE	@return_value int
	EXEC	@return_value = [dbo].[set_rev]
			@Account_ID = 1006
	SELECT	'Return Value' = @return_value
    END;

-- -----------------------------------------


-- Testing trigger function and stored procedure

select * from [TRANSACTION]

insert INTO [TRANSACTION] VALUES (13,'AMZN',112,NULL,'2016-04-04 11:25:00.000',NULL,50,1,1140,1006,NULL) --Inserting dummy row

select * from [TRANSACTION] -- Revenue cell automatically created

DELETE FROM [TRANSACTION] WHERE TransactionID = 13;

-- -----------------------------------------



-- Create a view for customer revenue

 CREATE VIEW CUST_REV AS
		Select a.Account_ID,a.Account_Number,a.Bank_Name,s.Revenue from (
		Account a
		LEFT JOIN (Select Account_ID,sum(Revenue) AS [Revenue] from [TRANSACTION]
		GROUP BY Account_ID)s 
		ON a.Account_ID = s.Account_ID)

-- -----------------------------------------

-- Create view to see how many times a stock has been transacted
select * from [TRANSACTION]

 CREATE VIEW No_of_times_stock_transacted AS
		Select Stock_Name, Count(Stock_Name) AS [Count]
		from [TRANSACTION]
		Group by Stock_Name

------------------------------------


	


