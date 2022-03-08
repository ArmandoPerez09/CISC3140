.mode csv
.import data_lab2/data.csv
.header on
CREATE TABLE cars (
CarID varchar(255) NOT NULL PRIMARY KEY,
Year varchar(255),
Maker varchar(255),
Model varchar(255),
Name varchar(255),
Email varchar(255)
);

CREATE TABLE judges (
JudgeID varchar(255),
JudgeName varchar(255)
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

INSERT INTO judges (JudgeID, JudgeName)
SELECT Judge_ID, Judge_Name FROM temp_table;

INSERT INTO cars (CarID, Year, Maker, Model, Name, Email)
SELECT Car_ID, Year, Maker, Model, Name, Email FROM temp_table;
