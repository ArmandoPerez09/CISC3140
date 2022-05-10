//Uses express package
const express = require('express');
const app = express();
const PORT = 3000;	//Port# to be used

//Uses react.js

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
app.get('/', (req, res) => {	
  res.send('Lab 5: Javascript, react.js, & SQL API Using Express.............................../allCars shows all cars......................../allCars/:id displays car if found....................../allcars/add/:id/:make/:year/:model adds entry with parameters sent........................................./allCars/del/:id deletes car if id found' );
});


//CREATE OPERATIONS
app.get('/allCars/add/:id/:maker/:year/:model', function(req,res){
	db.serialize(()=>{
		var params = [req.params.id, req.params.maker, req.params.year, req.params.model];
		db.run('INSERT INTO allCars(CarID,Maker,Year,Model) VALUES(?,?,?,?)', params, function(err) {
		if (err) {
			return console.log(err.message);
		}
			console.log("New car has been added");
			res.json("New car has been added into the database with CarID = "+req.params.id+ " Maker = "+req.params.make+" Year = "+req.params.year+" Model ="+req.params.model);
		});
	});
});
app.get('/owners/add/:id/:name/:email', function(req,res){
	db.serialize(()=>{
		var params = [req.params.id, req.params.name, req.params.email];
		db.run('INSERT INTO owners(CarID,Name,Email) VALUES(?,?,?)', params, function(err) {
		if (err) {
			return console.log(err.message);
		}
			console.log("New Owner has been added");
			res.json("New Owner has been added into the database with CarID = "+req.params.id+ " Name = "+req.params.name+" Year = "+req.params.year+" Model ="+req.params.model);
		});
	});
});

//READ OPERATIONS
/*All Cars Table*/
app.get('/allCars/', (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM allCars;", function(err, table) {
		  res.json(table);
	})
  })
});

//Displays single record using Car ID as key for cars table
app.get("/allCars/:id", (req, res) => {	
  var params = [req.params.id]
  db.serialize(function(){
	  db.all("SELECT * FROM allCars WHERE CarID = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});
//Display cars via Makers
app.get("/allCars/maker/:maker", (req, res) => {	
  var params = [req.params.maker]
  db.serialize(function(){
	  db.all("SELECT * FROM allCars WHERE Maker = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
}); 
//Display cars via Model
app.get("/allCars/model/:model", (req, res) => {	
  var params = [req.params.model]
  db.serialize(function(){
	  db.all("SELECT * FROM allCars WHERE Model = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
})
});
/*Owners Table*/
app.get('/owners/', (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM owners;", function(err, table) {
		  res.json(table);
	})
  })
});

//Displays single record using Car ID as key for cars table
app.get("/owners/:id", (req, res) => {	
  var params = [req.params.id]
  db.serialize(function(){
	  db.all("SELECT * FROM owners WHERE CarID = ?;", params, function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});


app.get('/winners/', (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM winners;", function(err, table) {
		  res.json(table);
	})
  })
});


app.get("/winners/racers", (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM racers;", function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});


app.get("/winners/engine", (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM engine;", function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});


app.get("/winners/body", (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM body;", function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});


app.get("/winners/mods", (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM mods;", function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});


app.get("/winners/carOverall", (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM carOverall;", function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});


app.get("/winners/modsOverall", (req, res) => {	
  db.serialize(function(){
	  db.all("SELECT * FROM modsOverall;", function(err, table) {
		if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
		res.json(table);
	})
  })
});

//UPDATE OPERATIONS
//Owner Information
app.get('/owners/update/:id/:name', function(req,res){
  db.serialize(()=>{
	var params = [req.params.name,req.params.id];
    db.run('UPDATE owners SET name = ? WHERE CarID = ?', params, function(err){
      if(err){
        res.send("Error encountered while updating");
        return console.error(err.message);
      }
      res.send("Entry updated successfully");
      console.log("Entry updated successfully");
    });
  });
});

//DELETE OPERATIONS
app.get('/allCars/del/:id', function(req,res){
  db.serialize(()=>{
	var params = [req.params.id];
    db.run('DELETE FROM allCars WHERE CarID = ?', params, function(err) {
      if (err) {
        res.send("Error encountered while deleting");
        return console.error(err.message);
      }
      res.send("Entry deleted");
      console.log("Entry deleted");
    });
  });
});

app.get('/owners/del/:id', function(req,res){
  db.serialize(()=>{
	var params = [req.params.id];
    db.run('DELETE FROM owners WHERE CarID = ?', params, function(err) {
      if (err) {
        res.send("Error encountered while deleting");
        return console.error(err.message);
      }
      res.send("Entry deleted");
      console.log("Entry deleted");
    });
  });
});