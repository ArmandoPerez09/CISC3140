--REFERNCE FILE FOR CREATING DATABASE USING SQLITE3--

.mode csv
.mode column
.header on
.open carShow.db

--All Cars--
CREATE TABLE cars AS
SELECT Car_ID, Make, Year, Model FROM carShowInfo
ORDER BY "Entry_Number" asc;

--All Owners--
CREATE TABLE owners AS
SELECT Car_ID, Name as Owner, Email, Make, Year, Model,
--Total Score--
(Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower + Car_Overall + 
Engine_Modifications + Engine_Performance + Engine_Chrome + Engine_Detailing + 
Engine_Cleanliness + Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + 
Body_Frame_Detailing + Body_Frame_Cleanliness + Mods_Paint + Mods_Body + Mods_Wrap + 
Mods_Rims + Mods_Interior + Mods_Other + Mods_ICE + Mods_Aftermarket + Mods_WIP + Mods_Overall) as Score 
FROM carShowInfo
ORDER BY "Entry_Number" asc;

--All Judges--
CREATE TABLE judges AS
SELECT Judge_ID, Judge_Name, count(*) as "Cars_Scored", 
MIN(Timestamp) as "Start_Time", MAX(Timestamp) as "End_Time"
FROM carShowInfo
GROUP BY Judge_ID;

--Car Scores--
CREATE TABLE scores AS
SELECT Car_ID,Make,Year,Model,
--Total Score--
(Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower + Car_Overall + 
Engine_Modifications + Engine_Performance + Engine_Chrome + Engine_Detailing + 
Engine_Cleanliness + Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + 
Body_Frame_Detailing + Body_Frame_Cleanliness + Mods_Paint + Mods_Body + Mods_Wrap + 
Mods_Rims + Mods_Interior + Mods_Other + Mods_ICE + Mods_Aftermarket + Mods_WIP + Mods_Overall) as Score,
--Racer Class--
(Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower) as Racer,
--Engine Class--
(Engine_Modifications + Engine_Performance + Engine_Chrome + 
Engine_Detailing + Engine_Cleanliness) as Engine,
--Body Frame Class--
(Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + 
Body_Frame_Detailing + Body_Frame_Cleanliness) as Body,
--Mod Class--
(Mods_Paint + Mods_Body + Mods_Wrap + Mods_Rims + Mods_Interior + Mods_Other + 
Mods_ICE + Mods_Aftermarket + Mods_WIP) as Mods,
--Car Overall Score--
(Car_Overall) as "Car_Ovr",
--Mod Overall Score--
(Mods_Overall) as "Mods_Ovr"
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;

.quit