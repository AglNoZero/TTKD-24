use master
go
create database UKAccidentsDDS
go
use UKAccidentsDDS
go

CREATE TABLE FactCasualties (
	FactCasualty_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Vehicle_ID INT,
	Casualty_NK INT,
	Date_ID INT,
	Casualty_severity INT,
	Sex_of_casualty INT,
	Casualty_Type INT,
	Age_band_of_casualty INT,
	Local_authority_district_ID INT,
	Age_of_casualty INT,
	Children_or_not INT
);

GO
CREATE TABLE FactVehicles (
	Vehicle_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Accident_ID INT,
	Vehicle_ref INT,
	Accident_index_NK nvarchar(13),
	Journey_purpose INT,
	Vehicle_type INT,
	Local_authority_district_ID INT,
	Date_ID INT
);

GO
CREATE TABLE FactAccidents (
	Accident_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Accident_index_NK nvarchar(13),
	Accident_severity INT,
	Time_in_day datetime,
	Time_period INT,
	Urban_or_rural_area INT,
	Road_type INT,
	Built_up_road INT,
	Local_authority_district_ID INT,
	Longitude real,
	Latitude real,
	Date_ID INT
);
GO

--Extends
CREATE TABLE FactBridgeAccidentsVehicles (
	Fact_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Accident_index_NK nvarchar(13),
	Vehicle_type INT,
	Built_up_road INT,
	Date_ID INT
);
GO
--

CREATE TABLE DimDate (
	Date_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FullDate date,
	DayNumberOfMonth TINYINT,
	MonthNumberOfYear TINYINT,
	EnglishMonthName NVARCHAR(10),
	CalenderQuarter TINYINT,
	CalenderYear SMALLINT
)
GO
CREATE TABLE dimLAD (
	LADCode_SK INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	LADCode INT,
	LADName NVARCHAR(255),
	City_ID INT
)
GO
CREATE TABLE  dimCity(
	City_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CityCode INT,
	CityName NVARCHAR(50),
	County_ID INT
)
GO
CREATE TABLE dimCounty (
	County_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountyCode INT,
	CountyName NVARCHAR(50),
	Region_ID INT
)
GO
CREATE TABLE dimRegion (
	Region_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	RegionCode NVARCHAR(9),
	RegionName NVARCHAR(50),
	Country_ID INT
)
GO
CREATE TABLE dimCountry (
	Country_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountryCode nvarchar(20),
	CountryName NVARCHAR(50),
)
GO
CREATE TABLE DimCasualty_severity (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Casualty_severity nvarchar(255),
)
GO
CREATE TABLE DimSex_of_casualty (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Sex_of_casualty nvarchar(255)
)
GO
CREATE TABLE DimCasualty_Type (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Casualty_Type nvarchar(255)
)
GO
CREATE TABLE DimAge_band_of_casualty (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Age_band_of_casualty nvarchar(255)
)
GO
CREATE TABLE DimAccident_severity (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Accident_severity nvarchar(255)
)
GO

CREATE TABLE DimTime_period (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Time_period nvarchar(255)
)
GO
CREATE TABLE DimUrban_or_rural_area (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Area nvarchar(255)
)
GO
CREATE TABLE DimRoad_type (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Road_type nvarchar(255)
)
GO
CREATE TABLE DimBuilt_up_road (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Built_up_road nvarchar(255)
)
GO
CREATE TABLE DimJourney_purpose (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Journey_purpose nvarchar(255)
)
GO
CREATE TABLE DimVehicle_type (
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Vehicle_type nvarchar(255)
)
GO
ALTER TABLE FactCasualties
ADD FOREIGN KEY (Vehicle_ID) REFERENCES FactVehicles(Vehicle_ID);
ALTER TABLE FactCasualties
ADD FOREIGN KEY (Date_ID) REFERENCES DimDate(Date_ID);
ALTER TABLE FactCasualties
ADD FOREIGN KEY (Local_authority_district_ID) REFERENCES dimLAD(LADCode_SK);
ALTER TABLE FactCasualties
ADD FOREIGN KEY (Casualty_severity) REFERENCES DimCasualty_severity(ID);
ALTER TABLE FactCasualties
ADD FOREIGN KEY (Sex_of_casualty) REFERENCES DimSex_of_casualty(ID);
ALTER TABLE FactCasualties
ADD FOREIGN KEY (Casualty_Type) REFERENCES DimCasualty_Type(ID);
ALTER TABLE FactCasualties
ADD FOREIGN KEY (Age_band_of_casualty) REFERENCES DimAge_band_of_casualty(ID);


ALTER TABLE FactVehicles
ADD FOREIGN KEY (Accident_ID) REFERENCES FactAccidents(Accident_ID);
ALTER TABLE FactVehicles
ADD FOREIGN KEY (Journey_purpose) REFERENCES DimJourney_purpose(ID);
ALTER TABLE FactVehicles
ADD FOREIGN KEY (Vehicle_type) REFERENCES DimVehicle_type(ID);
ALTER TABLE FactVehicles
ADD FOREIGN KEY (Local_authority_district_ID) REFERENCES dimLAD(LADCode_SK);
ALTER TABLE FactVehicles
ADD FOREIGN KEY (Date_ID) REFERENCES DimDate(Date_ID);


ALTER TABLE FactAccidents
ADD FOREIGN KEY (Accident_severity) REFERENCES DimAccident_severity(ID);
ALTER TABLE FactAccidents
ADD FOREIGN KEY (Time_period) REFERENCES DimTime_period(ID);
ALTER TABLE FactAccidents
ADD FOREIGN KEY (Urban_or_rural_area) REFERENCES DimUrban_or_rural_area(ID);
ALTER TABLE FactAccidents
ADD FOREIGN KEY (Road_type) REFERENCES DimRoad_type(ID);
ALTER TABLE FactAccidents
ADD FOREIGN KEY (Built_up_road) REFERENCES DimBuilt_up_road(ID);
ALTER TABLE FactAccidents
ADD FOREIGN KEY (Local_authority_district_ID) REFERENCES dimLAD(LADCode_SK);
ALTER TABLE FactAccidents
ADD FOREIGN KEY (Date_ID) REFERENCES DimDate(Date_ID);


ALTER TABLE FactBridgeAccidentsVehicles
ADD FOREIGN KEY (Date_ID) REFERENCES DimDate(Date_ID);
ALTER TABLE FactBridgeAccidentsVehicles
ADD FOREIGN KEY (Vehicle_type) REFERENCES DimVehicle_type(ID);
ALTER TABLE FactBridgeAccidentsVehicles
ADD FOREIGN KEY (Built_up_road) REFERENCES DimBuilt_up_road(ID);


ALTER TABLE dimLAD
ADD FOREIGN KEY (City_ID) REFERENCES dimCity(City_ID);
ALTER TABLE dimCity
ADD FOREIGN KEY (County_ID) REFERENCES dimCounty(County_ID);
ALTER TABLE dimCounty
ADD FOREIGN KEY (Region_ID) REFERENCES dimRegion(Region_ID);
ALTER TABLE dimRegion 
ADD FOREIGN KEY (Country_ID) REFERENCES dimCountry(Country_ID);


--INSERT 
INSERT INTO DimBuilt_up_road (Built_up_road)
VALUES ('Built-up road')
INSERT INTO DimBuilt_up_road (Built_up_road)
VALUES ('Non Built-up road')

INSERT INTO DimTime_period (Time_period)
VALUES ('Morning')
INSERT INTO DimTime_period (Time_period)
VALUES ('Afternoon')
INSERT INTO DimTime_period (Time_period)
VALUES ('Evening')
INSERT INTO DimTime_period (Time_period)
VALUES ('Afternoon')
INSERT INTO DimTime_period (Time_period)
VALUES ('Night')

INSERT INTO DimAge_band_of_casualty (Age_band_of_casualty)
VALUES ('Young people')
INSERT INTO DimAge_band_of_casualty (Age_band_of_casualty)
VALUES ('Adults')
INSERT INTO DimAge_band_of_casualty (Age_band_of_casualty)
VALUES ('60 and over')
