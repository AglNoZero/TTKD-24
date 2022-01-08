use master
go
create database UKAccidentsMETADATA
go
use UKAccidentsMETADATA
go

CREATE TABLE DDS (
	ID INT NOT NULL PRIMARY KEY,
	TableName NVARCHAR(255),
	UpdateDate DATETIME
)

INSERT INTO DDS (ID, TableName, UpdateDate)
VALUES (1, 'DimAccidents', '2021-12-18 21:43:57.000');
INSERT INTO DDS (ID, TableName, UpdateDate)
VALUES (2, 'DimVehicles', '2021-12-18 21:43:57.000');
INSERT INTO DDS (ID, TableName, UpdateDate)
VALUES (3, 'DimDate', '2021-12-18 21:43:57.000');
INSERT INTO DDS (ID, TableName, UpdateDate)
VALUES (4, 'DimGeography', '2021-12-18 21:43:57.000');