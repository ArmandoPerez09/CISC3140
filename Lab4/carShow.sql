--REFERNCE FILE FOR CREATING DATABASE USING SQLITE3--

.mode csv
.mode column
.header on
.open carShow.db

--All Cars--
CREATE TABLE IF NOT EXISTS allCars (
    CarID INT NOT NULL PRIMARY KEY,
    Maker VARCHAR(255),
    Year INT,
	Model VARCHAR(255)
);
INSERT INTO allCars (CarID,Maker,Year,Model)
SELECT Car_ID, Make, CAST(Year AS INT), Model FROM carShowInfo;

--All Owners--
CREATE TABLE IF NOT EXISTS owners (
    CarID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255)
);
INSERT INTO owners (CarID,Name,Email)
SELECT Car_ID, Name, Email FROM carShowInfo;


--Car Scores--
CREATE TABLE IF NOT EXISTS winners (
	CarID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Year INT,
	Model VARCHAR(255),
	Score INT
);
INSERT INTO winners (CarID, Name, Make, Year, Model, Score)
SELECT Car_ID, Name, Make, Year, Model,
--Total Score--
(Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower + Car_Overall + 
Engine_Modifications + Engine_Performance + Engine_Chrome + Engine_Detailing + 
Engine_Cleanliness + Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + 
Body_Frame_Detailing + Body_Frame_Cleanliness + Mods_Paint + Mods_Body + Mods_Wrap + 
Mods_Rims + Mods_Interior + Mods_Other + Mods_ICE + Mods_Aftermarket + Mods_WIP + Mods_Overall) AS Score
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;

--Racer Class--
CREATE TABLE IF NOT EXISTS racers (
	CarID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Year INT,
	Model VARCHAR(255),
	Score INT
);
INSERT INTO racers (CarID, Name, Make, Year, Model, Score)
SELECT Car_ID, Name, Make, Year, Model,
(Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower) as Score
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;


--Engine Class--
CREATE TABLE IF NOT EXISTS engine (
	CarID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Year INT,
	Model VARCHAR(255),
	Score INT
);
INSERT INTO engine (CarID, Name, Make, Year, Model, Score)
SELECT Car_ID, Name, Make, Year, Model,
(Engine_Modifications + Engine_Performance + Engine_Chrome + 
Engine_Detailing + Engine_Cleanliness) as Score
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;


--Body Frame Class--
CREATE TABLE IF NOT EXISTS body (
	CarID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Year INT,
	Model VARCHAR(255),
	Score INT
);
INSERT INTO body (CarID, Name, Make, Year, Model, Score)
SELECT Car_ID, Name, Make, Year, Model,
(Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + 
Body_Frame_Detailing + Body_Frame_Cleanliness) as Score
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;


--Mod Class--
CREATE TABLE IF NOT EXISTS mods (
	CarID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Year INT,
	Model VARCHAR(255),
	Score INT
);
INSERT INTO mods (CarID, Name, Make, Year, Model, Score)
SELECT Car_ID, Name, Make, Year, Model,
(Mods_Paint + Mods_Body + Mods_Wrap + Mods_Rims + Mods_Interior + Mods_Other + 
Mods_ICE + Mods_Aftermarket + Mods_WIP) as Score
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;


--Car Overall Score--
CREATE TABLE IF NOT EXISTS carOverall(
	CarID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Year INT,
	Model VARCHAR(255),
	Score INT
);
INSERT INTO carOverall (CarID, Name, Make, Year, Model, Score)
SELECT Car_ID, Name, Make, Year, Model, Car_Overall as Score
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;

--Mod Overall Score--
CREATE TABLE IF NOT EXISTS modsOverall (
	CarID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Year INT,
	Model VARCHAR(255),
	Score INT
);
INSERT INTO modsOverall (CarID, Name, Make, Year, Model, Score)
SELECT Car_ID, Name, Make, Year, Model, Mods_Overall as Score
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;
.quit