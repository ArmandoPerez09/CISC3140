Armando Perez
CISC3140
Lab2
3/9/22

--Data extract from the provide data.csv
CREATE TABLE temp_table(
  "Timestamp" TEXT,
  "Email" TEXT,
  "Name" TEXT,
  "Year" TEXT,
  "Make" TEXT,
  "Model" TEXT,
  "Car_ID" TEXT,
  "Judge_ID" TEXT,
  "Judge_Name" TEXT,
  "Racer_Turbo" TEXT,
  "Racer_Supercharged" TEXT,
  "Racer_Performance" TEXT,
  "Racer_Horsepower" TEXT,
  "Car_Overall" TEXT,
  "Engine_Modifications" TEXT,
  "Engine_Performance" TEXT,
  "Engine_Chrome" TEXT,
  "Engine_Detailing" TEXT,
  "Engine_Cleanliness" TEXT,
  "Body_Frame_Undercarriage" TEXT,
  "Body_Frame_Suspension" TEXT,
  "Body_Frame_Chrome" TEXT,
  "Body_Frame_Detailing" TEXT,
  "Body_Frame_Cleanliness" TEXT,
  "Mods_Paint" TEXT,
  "Mods_Body" TEXT,
  "Mods_Wrap" TEXT,
  "Mods_Rims" TEXT,
  "Mods_Interior" TEXT,
  "Mods_Other" TEXT,
  "Mods_ICE" TEXT,
  "Mods_Aftermarket" TEXT,
  "Mods_WIP" TEXT,
  "Mods_Overall" TEXT
);
CREATE TABLE cars (
CarID varchar(255) NOT NULL PRIMARY KEY,
Year varchar(255),
Maker varchar(255),
Model varchar(255),
Name varchar(255),
Email varchar(255)
);
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
CREATE TABLE extract (
Ranking INTEGER,
CarID varchar(255),
Year varchar(255),
Maker varchar(255),
Model varchar(255)
);
CREATE TABLE judges (
JudgeID varchar(255),
JudgeName varchar(255),
 numCars INTEGER, 
start varchar(255), 
end varchar(255), 
duration varchar(255), 
average varchar(255)
);
