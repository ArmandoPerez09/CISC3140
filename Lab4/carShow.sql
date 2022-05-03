.mode csv
.mode column
.header on
.open carShow.db

--All Cars--
CREATE TABLE cars AS
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as "Entry Number",
Car_ID as "Car ID", Make, Year, Model FROM carShowInfo
ORDER BY "Entry Number" asc;

--All Owners--
CREATE TABLE owners AS
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as "Entry Number",
Car_ID as "Car ID", Name as Owner, Email, Make, Year, Model,
--Total Score--
(Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower + Car_Overall + 
Engine_Modifications + Engine_Performance + Engine_Chrome + Engine_Detailing + 
Engine_Cleanliness + Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + 
Body_Frame_Detailing + Body_Frame_Cleanliness + Mods_Paint + Mods_Body + Mods_Wrap + 
Mods_Rims + Mods_Interior + Mods_Other + Mods_ICE + Mods_Aftermarket + Mods_WIP + Mods_Overall) as Score 
FROM carShowInfo
ORDER BY "Entry Number" asc;

--All Judges--
CREATE TABLE judges AS
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as "Entry Number",
Judge_ID as "Judge ID", Judge_Name as "Judge Name", count(*) as "Cars Scored", 
MIN(Timestamp) as "Start Time", MAX(Timestamp) as "End Time"
FROM carShowInfo
GROUP BY Judge_ID;

--Car Scores--
CREATE TABLE scores AS
SELECT Car_ID as "Car ID",Make,Year,Model,
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
(Car_Overall) as "Car Ovr",
--Mod Overall Score--
(Mods_Overall) as "Mods Ovr"
FROM carShowInfo
ORDER BY cast(Score as unsigned) desc;

.quit