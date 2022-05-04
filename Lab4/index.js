const express = require('express');
const app = express();
const PORT = 3000;

// Import SQLite3
var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('carShow.db');

app.use(express.json()); 

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