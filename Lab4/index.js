//Uses express package
const express = require('express');
const app = express();
const PORT = 3000;	//Port# to be used

// Import SQLite3
var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('carShow.db');
app.use(express.json()); 

//Use body-parser to insert entries
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.listen(PORT, () => console.log(`Express server currently running on port ${PORT}`));

//ROUTES-API ENDPOINTS
//ROOT
app.get('/', (request, response) => {	
  response.send('Lab 4: Javascript & SQL API Using Express');
});

//Cars Table
//Display Car Table from carShow.db
app.get('/cars/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM cars;", function(err, table) {
		  response.json(table);
	})
  })
});

//Displays single record using Car_ID as key for cars table
app.get("/cars/:Car_ID", (request, response) => {	
  var params = [request.params.Car_ID]
  db.serialize(function(){
	  db.all("SELECT * FROM cars WHERE Car_ID = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		response.json(table);
	})
  })
});
//Adds record to cars table
app.post("/cars/", (req, res, next) => {
    var errors=[]
    if (!req.body.Car_ID){
        errors.push("N/A");
    }
    if (!req.body.Make){
        errors.push("N/A");
    }
	if (!req.body.Year){
        errors.push("N/A");
    }
    if (!req.body.Model){
        errors.push("N/A");
    }
    if (errors.length){
        res.status(400).json({"error":errors.join(",")});
        return;
    }
    var data = {
        Car_ID: req.body.Car_ID,
        Make: req.body.Make,
		Year: req.body.Year,
		Model: req.body.Model
    }
    var sql = 'INSERT INTO cars (Car_ID,Make,Year,Model) VALUES (?,?,?,?)'
    var params =[data.Car_ID, data.Make, data.Year,data.Model]
    db.run(sql, params, function (err, result) {
        if (err){
            res.status(400).json({"error": err.message})
            return;
        }
        res.json({
            "message": "success",
            "data": data
        })
    });
})
//Updates data in cars table


//Owners Table
//Display Owners table from carShow.db
app.get('/owners/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM owners;", function(err, table) {
		  response.json(table);
	})
  })
});

//Display single record using Car_ID as key for owners table
app.get("/owners/:Car_ID", (request, response) => {	
  var params = [request.params.Car_ID]
  db.serialize(function(){
	  db.all("SELECT * FROM owners WHERE Car_ID = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		response.json(table);
	})
  })
});

//Adds record to owners table
app.post("/owners/", (req, res, next) => {
    var errors=[]
    if (!req.body.Car_ID){
        errors.push("N/A");
    }
	if (!req.body.Owner){
        errors.push("N/A");
    }
	if (!req.body.Email){
        errors.push("N/A");
    }
    if (!req.body.Make){
        errors.push("N/A");
    }
	if (!req.body.Year){
        errors.push("N/A");
    }
    if (!req.body.Model){
        errors.push("N/A");
    }
	if (!req.body.Score){
        errors.push("N/A");
    }
    if (errors.length){
        res.status(400).json({"error":errors.join(",")});
        return;
    }
    var data = {
        Car_ID: req.body.Car_ID,
		Owner: req.body.Owner,
		Email: req.body.Email,
        Make: req.body.Make,
		Year: req.body.Year,
		Model: req.body.Model,
		Score: req.body.Score
    }
    var sql = 'INSERT INTO cars (Car_ID,Make,Year,Model) VALUES (?,?,?,?,?,?,?)'
    var params =[data.Car_ID,data.Owner,data.Email,data.Make, data.Year,data.Model,data.Score]
    db.run(sql, params, function (err, result) {
        if (err){
            res.status(400).json({"error": err.message})
            return;
        }
        res.json({
            "message": "success",
            "data": data
        })
    });
})
//Updates data in owners table

//Judges Table
//Display Judges Table from carShow.db
app.get('/judges/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM judges;", function(err, table) {
		  response.json(table);
	})
  })
});

//Display single record using Judge_ID as key for judges table
app.get("/judges/:Judge_ID", (request, response) => {	
  var params = [request.params.Judge_ID]
  db.serialize(function(){
	  db.all("SELECT * FROM judges WHERE Judge_ID = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		response.json(table);
	})
  })
});

//Adds record to judges table
app.post("/owners/", (req, res, next) => {
    var errors=[]
    if (!req.body.Judge_ID){
        errors.push("N/A");
    }
	if (!req.body.Judge_Name){
        errors.push("N/A");
    }
	if (!req.body.Cars_Scored){
        errors.push("N/A");
    }
    if (!req.body.Start_Time){
        errors.push("N/A");
    }
	if (!req.body.End_Time){
        errors.push("N/A");
    }
    if (errors.length){
        res.status(400).json({"error":errors.join(",")});
        return;
    }
    var data = {
        Judge_ID: req.body.Judge_ID,
		Judge_Name: req.body.Judge_Name,
		Cars_Scored: req.body.Cars_Scored,
        Start_Time: req.body.Start_Time,
		End_Time: req.body.End_Time
    }
    var sql = 'INSERT INTO cars (Car_ID,Make,Year,Model) VALUES (?,?,?,?)'
    var params =[data.Judge_ID,data.Judge_Name,data.Cars_Scored,data.Start_Time,data.End_Time]
    db.run(sql, params, function (err, result) {
        if (err){
            res.status(400).json({"error": err.message})
            return;
        }
        res.json({
            "message": "success",
            "data": data
        })
    });
})
//Updates data in judges table

//Scores Table
//Display Scores Table from carShow.db
app.get('/scores/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM scores;", function(err, table) {
		  response.json(table);
	})
  })
});

//Display single record using Car_ID as key for scores table
app.get("/scores/:Car_ID", (request, response) => {	
  var params = [request.params.Car_ID]
  db.serialize(function(){
	  db.all("SELECT * FROM scores WHERE Car_ID = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		response.json(table);
	})
  })
});

//Adds record to scores table

//Updates data in scores table