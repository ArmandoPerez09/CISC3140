--Armando Perez
--CISC3140
--Lab2
--3/9/22

.mode csv
--Import data.csv from local directory
.import data_lab2/data.csv temp_table
.header on

--TABLE CREATION
--cars table to hold data of car information
CREATE TABLE cars (
CarID varchar(255) NOT NULL PRIMARY KEY,
Year varchar(255),
Maker varchar(255),
Model varchar(255),
Name varchar(255),
Email varchar(255)
);

--judges table to hold judges data
CREATE TABLE judges (
JudgeID varchar(255),
JudgeName varchar(255),
time timestamp
);

--carScore table to hold the scores of each car
CREATE TABLE carScore (
CarID varchar(255) NOT NULL PRIMARY KEY,
RacerTurbo varchar(255),
RacerSupercharged varchar(255),
RacerPerformance varchar(255),
RacerHorsepower varchar(255),
CarOverall varchar(255),
EngineMod varchar(255),
EnginePerformance varchar(255),
EngineChrome varchar(255),
EngineDetailing varchar(255),
EngineCleanliness varchar(255),
BodyFrameUndercarriage varchar(255),
BodyFrameSuspension varchar(255),
BodyFrameChrome varchar(255),
BodyFrameDetailing varchar(255),
BodyFrameCleanliness varchar(255),
ModsPaint varchar(255),
ModsBody varchar(255),
ModsWrap varchar(255),
ModsRims varchar(255),
ModsInterior varchar(255),
ModsOther varchar(255),
ModsICE varchar(255),
ModsAftermarket varchar(255),
ModsWIP varchar(255),
ModsOverall varchar(255)
);

--extract table to output data into csv files (extract1, extract2)
CREATE TABLE extract (
Ranking INTEGER,
CarID varchar(255),
Year varchar(255),
Maker varchar(255),
Model varchar(255)
);

--DATA INSERTION
--Inserts data from temp_table into carScore table
INSERT INTO carScore (
CarID, RacerTurbo, RacerSupercharged, RacerPerformance, 
RacerHorsepower, CarOverall, EngineMod,EnginePerformance, 
EngineChrome, EngineDetailing, EngineCleanliness, BodyFrameUndercarriage, 
BodyFrameSuspension,BodyFrameChrome, BodyFrameDetailing, 
BodyFrameCleanliness, ModsPaint, ModsBody, ModsWrap, ModsRims, 
ModsInterior, ModsOther, ModsICE, ModsAftermarket, ModsWIP, ModsOverall)
SELECT Car_ID, Racer_Turbo, Racer_Supercharged, Racer_Performance, 
Racer_Horsepower, Car_Overall, Engine_Modifications,Engine_Performance, 
Engine_Chrome, Engine_Detailing, Engine_Cleanliness, 
Body_Frame_Undercarriage, Body_Frame_Suspension, Body_Frame_Chrome, 
Body_Frame_Detailing, Body_Frame_Cleanliness, Mods_Paint, Mods_Body, 
Mods_Wrap, Mods_Rims, Mods_Interior, Mods_Other, Mods_ICE, 
Mods_Aftermarket, Mods_WIP, Mods_Overall FROM temp_table;

--Inserts data from temp_table into cars table
INSERT INTO cars (CarID, Year, Maker, Model, Name, Email)
SELECT Car_ID, Year, Maker, Model, Name, Email FROM temp_table;

--Sums all scores for a total score use for a ranking column
INSERT INTO extract (Ranking, CarID, Year, Maker, Model)
SELECT (Racer_Turbo+Racer_Supercharged+Racer_Performance+Racer_Horsepower+
Car_Overall+Engine_Modifications+Engine_Performance+Engine_Chrome+
Engine_Detailing+Engine_Cleanliness+Body_Frame_Undercarriage+
Body_Frame_Suspension+Body_Frame_Chrome+Body_Frame_Detailing+
Body_Frame_Cleanliness+Mods_Paint+Mods_Body+Mods_Wrap+Mods_Rims+
Mods_Interior+Mods_Other+Mods_ICE+Mods_Aftermarket+Mods_WIP+Mods_Overall),
 Car_Id, Year, Make, Model FROM temp_table;

--Total Scores sorted in descending order
--Exports queried data from extract table to extract1.csv 
 .output extract1.csv
 SELECT * FROM extract
 ORDER BY cast(RANKING as unsigned) DESC; 

--Top 3 Car Maker Ranks
--Exports queried data from extract table to extract2.csv
.output extract2.csv
SELECT * FROM (
--RANK () creates Ranking for each maker, Creates new column MakerRank
SELECT Ranking, CarID, Year, Maker, Model, RANK () OVER (
PARTITION BY Maker
--All scores are sorted in descending order
ORDER BY cast(Ranking as unsigned) DESC)
MakerRank FROM extract)
--Makes it so that only the top three cars are shown
t WHERE MakerRank <=3;

--Update Judges table
--Adds columns and inserts data from temp_table
ALTER TABLE judges
ADD COLUMN numCars INTEGER;
ALTER TABLE judges
ADD COLUMN start varchar(255)
ALTER TABLE judges
ADD COLUMN end varchar(255)
ALTER TABLE judges
ADD COLUMN duration varchar(255)
ALTER TABLE judges
ADD COLUMN average varchar(255)

INSERT INTO judges(JudgeID, JudgeName, numCar, start, end, duration, average)
SELECT Judge_ID, Judge_Name, count(*), MIN(Timestamp), MAX(Timestamp), MAX(Timestamp)-MIN(Timestamp), AVG(Timestamp)
FROM temp_table
GROUP BY Judge_ID;

--END OF PROGRAM
.save Lab2.db
.quit
CREATE TABLE allCars (
    CarID INT NOT NULL PRIMARY KEY,
    Maker VARCHAR(255),
    Year INT,
	Model VARCHAR(255)
);