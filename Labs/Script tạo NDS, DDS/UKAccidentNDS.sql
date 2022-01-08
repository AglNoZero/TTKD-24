use master
go
create database UKAccidentsNDS
go
use UKAccidentsNDS
go

CREATE TABLE Accidents (
	Accident_index NVARCHAR(13) PRIMARY KEY,
	Location_Easting_OSGR INT,
	Location_Northing_OSGR INT,
	Longitude REAL,
	Latitude REAL,
	Accident_severity INT,
	Number_of_vehicles INT,
	Number_of_casualties INT,
	Accident_date DATETIME,
	Time_in_day DATETIME,
	Local_authority_district INT,
	Local_authority_highway NVARCHAR(255),
	Road_type INT,
	Speed_limit INT,
	Light_condition INT,
	Weather_condition INT,
	Road_surface_condition INT,
	Special_condition_at_site INT,
	Urban_or_rural_area INT,
	LSOA_of_Accident_location NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Accident_Severity (
	Accident_severirty_index INT NOT NULL PRIMARY KEY,
	Accident_severirty_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Urban_or_Rural (
	Area_key INT NOT NULL PRIMARY KEY,
	Area_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Road_type (
	Road_type_key INT NOT NULL PRIMARY KEY,
	Road_type_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Special_condition_at_site(
	Special_condition_at_site_key INT NOT NULL PRIMARY KEY,
	Special_condition_at_site_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
--CREATE TABLE Built_up_road_type (
--	Built_up_type_key INT NOT NULL PRIMARY KEY,
--	Built_up_name  NVARCHAR(255),
--	Create_date DATETIME,
--	Update_date DATETIME
--);
--GO
CREATE TABLE Light_condition (
	Light_condition_key INT NOT NULL PRIMARY KEY,
	Light_condition_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Road_surface_condittion (
	Road_surface_condition_key INT NOT NULL PRIMARY KEY,
	Road_surface_condition_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Local_authority_highway (
	Local_authority_highway_key NVARCHAR(255) PRIMARY KEY,
	Local_authority_highway_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Weather_conditions (
	Weather_condition_key INT NOT NULL PRIMARY KEY,
	Weather_condition_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Local_authority_district (
	Local_district_key INT NOT NULL PRIMARY KEY,
	Local_district_name NVARCHAR(255),
	City_id INT,
	Create_date DATETIME,
	Update_date DATETIME
);
GO
/*CREATE TABLE Dates (
	Date_key INT NOT NULL PRIMARY KEY,
	Day_of_month INT,
	Month_key INT,
	Day_of_weak_key INT,
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Months (
	Month_key INT NOT NULL PRIMARY KEY,
	Month_name NVARCHAR(255),
	Quarter_of_year_key INT,
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Quarters (
	Quarter_key INT NOT NULL PRIMARY KEY,
	Quarter_name NVARCHAR(255),
	Year_key INT,
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Years (
	Year_key INT NOT NULL PRIMARY KEY,
	Year_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO*/
--CREATE TABLE Time_in_day (
	--Time_key INT NOT NULL PRIMARY KEY,
--	Session_key INT,
	--Time_in_day DATETIME,
	--Create_date DATETIME,
--	Update_date DATETIME
--);
--GO
--CREATE TABLE Session_in_day (
--	Session_key INT NOT NULL PRIMARY KEY,
--	Session_name NVARCHAR(255),
	--Create_date DATETIME,
--	Update_date DATETIME
--);
GO


---Casualty
CREATE TABLE Casualties (
	Accident_index NVARCHAR(13),
	Vehicle_ref INT,
	Casualty_ref INT,
	Casualty_class INT,
	Sex_of_casualty INT,
	Age_of_casualty INT,
	Age_band_of_casualty INT,
	Casualty_severity INT,
	Casualty_type INT, 
	Casutalty_Home_Area_type INT,
	PRIMARY KEY (Accident_index, Vehicle_ref, Casualty_ref),
	Create_date DATETIME,
	Update_date DATETIME
)
GO
CREATE TABLE Casualty_class (
	Casualty_class_code INT NOT NULL PRIMARY KEY,
	Casualty_class_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Age_of_casualty (
	Age_of_casualty_code INT NOT NULL PRIMARY KEY,
	Age_of_casualty_name NVARCHAR(255),
	Age_band INT,
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Age_band (
	Age_band_code INT NOT NULL PRIMARY KEY,
	Age_band NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Sex_of_casualty (
	Sex_of_casualty_code INT NOT NULL PRIMARY KEY,
	Sex_of_casualty_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Casualty_severity (
	Casualty_severity_code INT NOT NULL PRIMARY KEY,
	Casualty_severity_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Casualty_type (
	Casualty_type_code INT NOT NULL PRIMARY KEY,
	Casualty_type_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Home_area_type (
	Home_are_type_code INT NOT NULL PRIMARY KEY,
	Home_are_type_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO

--Vehicles
CREATE TABLE Vehicles (
	Accident_index NVARCHAR(13),
	Vehicle_ref INT,
	Vehicle_type INT,
	Vehicle_manoeuvre INT,
	Hit_obejct_in_carriageway INT,
	First_point_of_impact INT,
	Was_vehicle_left_hand_drive INT,
	Sex_of_driver INT,
	Age_of_driver INT,
	Age_band_of_driver INT,
	Journey_purpose INT,
	Propulsion_code INT,
	Driver_IMD_Decile INT,
	PRIMARY KEY (Accident_index, Vehicle_ref),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE First_point_of_impact (
	Point_code INT NOT NULL PRIMARY KEY,
	Label NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Vehicle_type (
	Vehicle_type_code INT NOT NULL PRIMARY KEY,
	Vehicle_type_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Vehicle_manoeuvre (
	Vehicle_manoeuvre_code INT NOT NULL PRIMARY KEY,
	Vehicle_manoeuvre_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Hit_object_in_carriageway (
	Hit_object_code INT NOT NULL PRIMARY KEY,
	Hit_object_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Sex_of_driver (
	Sex_of_driver_code INT NOT NULL PRIMARY KEY,
	Sex_of_driver_name NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Journey_purpose (
	Purpose_code INT NOT NULL PRIMARY KEY,
	Purpose NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Driver_IMD_Decile (
	IMD_code INT NOT NULL PRIMARY KEY,
	IMD NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO

--LSOA
CREATE TABLE LSOA (
	lsoa11cd NVARCHAR(255) PRIMARY KEY,
	lsoa11nm NVARCHAR(255),
	msoa11cd NVARCHAR(255),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE MSOA (
	msoa11cd NVARCHAR(255) PRIMARY KEY,
	msoa11nm NVARCHAR(255),
	Local_authority_district INT,
	Create_date DATETIME,
	Update_date DATETIME
);
GO
/*CREATE TABLE Postcode (
	postcode nvarchar(4) PRIMARY KEY,
	easting int,
	northing int,
	latitude real,
	longitude real,
	City_id int,
	Create_date DATETIME,
	Update_date DATETIME
);
GO*/
CREATE TABLE City (
	City_id int IDENTITY(1,1) PRIMARY KEY,
	City_name nvarchar(50),
	County_id INT,
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE County (
	County_id int IDENTITY(1,1) PRIMARY KEY,
	County_name nvarchar(50),
	Region_code nvarchar(9),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Region (
	Region_code nvarchar(9) PRIMARY KEY,
	Region_name nvarchar(50),
	Country_code nvarchar(20),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
CREATE TABLE Country (
	Country_code nvarchar(20) PRIMARY KEY,
	Country_name nvarchar(50),
	Create_date DATETIME,
	Update_date DATETIME
);
GO
--Accidents forign keys
ALTER TABLE Accidents
ADD FOREIGN KEY (Accident_Severity) REFERENCES Accident_Severity(Accident_severirty_index);
ALTER TABLE Accidents
ADD FOREIGN KEY (Urban_or_rural_area) REFERENCES Urban_or_Rural(Area_key);
ALTER TABLE Accidents
ADD FOREIGN KEY (Accident_Severity) REFERENCES Accident_Severity(Accident_severirty_index);
ALTER TABLE Accidents
ADD FOREIGN KEY (Road_type) REFERENCES Road_type(Road_type_key);
ALTER TABLE Accidents
ADD FOREIGN KEY (Special_condition_at_site) REFERENCES Special_condition_at_site(Special_condition_at_site_key);
ALTER TABLE Accidents
--ADD FOREIGN KEY (Built_up_road_type) REFERENCES Built_up_road_type(Built_up_type_key);
--ALTER TABLE Accidents
ADD FOREIGN KEY (Light_condition) REFERENCES Light_condition(Light_condition_key);
ALTER TABLE Accidents
ADD FOREIGN KEY (Road_surface_condition) REFERENCES Road_surface_condittion(Road_surface_condition_key);
ALTER TABLE Accidents
ADD FOREIGN KEY (Local_authority_highway) REFERENCES Local_authority_highway(Local_authority_highway_key);
ALTER TABLE Accidents
ADD FOREIGN KEY (Weather_condition) REFERENCES Weather_conditions(Weather_condition_key);
ALTER TABLE Accidents
ADD FOREIGN KEY (Local_authority_district) REFERENCES Local_authority_district(Local_district_key);
ALTER TABLE Accidents
ADD FOREIGN KEY (Road_type) REFERENCES Road_type(Road_type_key);
/*ALTER TABLE Accidents
ADD FOREIGN KEY (Date_key) REFERENCES Dates(Date_key);
--ALTER TABLE Accidents
--ADD FOREIGN KEY (Time_key) REFERENCES Time_in_day(Time_key);
ALTER TABLE Dates
ADD FOREIGN KEY (Month_key) REFERENCES Months(Month_key);
ALTER TABLE Months
ADD FOREIGN KEY (Quarter_of_year_key) REFERENCES Quarters(Quarter_key);
ALTER TABLE Quarters
ADD FOREIGN KEY (Year_key) REFERENCES Years(Year_key);*/
--ALTER TABLE Time_in_day
--ADD FOREIGN KEY (Session_key) REFERENCES Session_in_day(Session_key);

--Casualty forign key
ALTER TABLE Casualties
ADD FOREIGN KEY (Casualty_class) REFERENCES Casualty_class(Casualty_class_code);
ALTER TABLE Casualties
ADD FOREIGN KEY (Age_of_casualty) REFERENCES Age_of_casualty(Age_of_casualty_code);
ALTER TABLE Age_of_casualty
ADD FOREIGN KEY (Age_band) REFERENCES Age_band(Age_band_code);
ALTER TABLE Casualties
ADD FOREIGN KEY (Sex_of_casualty) REFERENCES Sex_of_casualty(Sex_of_casualty_code);
ALTER TABLE Casualties
ADD FOREIGN KEY (Casualty_severity) REFERENCES Casualty_severity(Casualty_severity_code);
ALTER TABLE Casualties
ADD FOREIGN KEY (Casualty_type) REFERENCES Casualty_type(Casualty_type_code);
ALTER TABLE Casualties
ADD FOREIGN KEY (Casutalty_Home_Area_type) REFERENCES Home_area_type(Home_are_type_code);
ALTER TABLE Casualties
ADD FOREIGN KEY (Accident_index, Vehicle_ref) REFERENCES Vehicles(Accident_index, Vehicle_ref); 

--Vehicles
ALTER TABLE Vehicles
ADD FOREIGN KEY (Accident_index) REFERENCES Accidents(Accident_index);
ALTER TABLE Vehicles
ADD FOREIGN KEY (First_point_of_impact) REFERENCES First_point_of_impact(Point_code);
ALTER TABLE Vehicles
ADD FOREIGN KEY (Accident_index) REFERENCES Accidents(Accident_index);
ALTER TABLE Vehicles
ADD FOREIGN KEY (Vehicle_type) REFERENCES Vehicle_type(Vehicle_type_code);
ALTER TABLE Vehicles
ADD FOREIGN KEY (Vehicle_manoeuvre) REFERENCES Vehicle_manoeuvre(Vehicle_manoeuvre_code);
ALTER TABLE Vehicles
ADD FOREIGN KEY (Hit_obejct_in_carriageway) REFERENCES Hit_object_in_carriageway(Hit_object_code);
ALTER TABLE Vehicles
ADD FOREIGN KEY (Sex_of_driver) REFERENCES Sex_of_driver(Sex_of_driver_code);
ALTER TABLE Vehicles
ADD FOREIGN KEY (Journey_purpose) REFERENCES Journey_purpose(Purpose_code);
ALTER TABLE Vehicles
ADD FOREIGN KEY (Driver_IMD_Decile) REFERENCES Driver_IMD_Decile(IMD_code);

--LSOA
ALTER TABLE Accidents
ADD FOREIGN KEY (LSOA_of_Accident_location) REFERENCES LSOA(lsoa11cd);
ALTER TABLE LSOA
ADD FOREIGN KEY (msoa11cd) REFERENCES MSOA(msoa11cd);

ALTER TABLE City
ADD FOREIGN KEY (County_id) REFERENCES County(County_id);
ALTER TABLE County
ADD FOREIGN KEY (Region_code) REFERENCES Region(Region_code);
ALTER TABLE Region
ADD FOREIGN KEY (Country_code) REFERENCES Country(Country_code);

--accident to postcode by ladcd
ALTER TABLE Local_authority_district
ADD FOREIGN KEY (City_id) REFERENCES City(City_id);
ALTER TABLE MSOA
ADD FOREIGN KEY (Local_authority_district) REFERENCES Local_authority_district(Local_district_key);

--functions
GO
CREATE FUNCTION Get_SESSION(@datetime datetime)
RETURNS NVARCHAR(255)
AS
Begin
	Declare @result nvarchar(255);
	IF (CONVERT(time, @datetime) >= '05:00:00' and CONVERT(time, @datetime) < '12:00:00')
       SET @result = 'Morning';
	ELSE 
	IF (CONVERT(time, @datetime) >= '12:00:00' and CONVERT(time, @datetime) < '17:00:00')	
       SET @result = 'Afternoon';
	ELSE 
	IF (CONVERT(time, @datetime) >= '17:00:00' and CONVERT(time, @datetime) < '21:00:00')	
       SET @result = 'Evening';
	ELSE 
	IF (CONVERT(time, @datetime) >= '21:00:00' and CONVERT(time, @datetime) <= '23:59:59')	
       SET @result = 'Night';
	ELSE
	IF (CONVERT(time, @datetime) >= '00:00:00' and CONVERT(time, @datetime) < '05:00:00')	
       SET @result = 'Night';
return @result;
End;
GO

GO
CREATE FUNCTION Get_Built_up_road(@speed_limit int)
RETURNS NVARCHAR(255)
AS
Begin
	Declare @result nvarchar(255);
	IF (@speed_limit < 50)
       SET @result = 'Built-up road';
	ELSE 
	   SET @result = 'Non Built-up road';
	
return @result;
End;
GO

CREATE FUNCTION Get_Age_band(@age int)
RETURNS NVARCHAR(255)
AS
Begin
	Declare @result nvarchar(255);
	IF (@age < 18)
       SET @result = 'Young people';
	ELSE 
	IF (@age < 60)
       SET @result = 'Adults';
	ELSE 
       SET @result = '60 and over';
return @result;
End;
GO
