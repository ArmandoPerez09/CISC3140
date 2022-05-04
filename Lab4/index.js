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
//Display Car Table from carShow.db
app.get('/cars/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM cars;", function(err, table) {
		  response.json(table);
	})
  })
});
//Display Owners table from carShow.db
app.get('/owners/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM owners;", function(err, table) {
		  response.json(table);
	})
  })
});
//Display Judges Table from carShow.db
app.get('/judges/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM judges;", function(err, table) {
		  response.json(table);
	})
  })
});
//Display Scores Table from carShow.db
app.get('/scores/', (request, response) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM scores;", function(err, table) {
		  response.json(table);
	})
  })
});