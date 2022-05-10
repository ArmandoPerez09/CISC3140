# Lab 4
*Build a backend API using a combination of SQL and JavaScript to enable users to view data that is stored in a database as well as update data.
*Should support the ability to view, insert, and update data into/from the database

## Installation
Used on Windows OS
Sqlite3 Installer
Node.js - node-v16.15.0-x64.msi
Express - npm install express --save
Nodemon - npm install nodemon --save-dev
Node Sqlite3 - npm install https://github.com/mapbox/node-sqlite3/tarball/master
MD5 - npm install md5

## Usage
* Creates a basic backend API to support Car Show Database

## Files and Directory

```
..
├───Data
│   └───data.csv
├───node_modules
│   └───Node Dependencies
├───.gitignore
├───carShow.db
├───carShow.sql
├───index.js
├───package-lock.json
├───package.json
└───README.md

2 directories, 10+ files
```

## Instructions
* From Terminal, Run command `node index.js` in lab4 root directory of program
* Run a web browser and in the url, search "localhost:3000"

## API Endpoints
* localhost:3000/ 		- Start point of the API
### Create Operations
* ./allCars/add/:id/:maker/:year/:model	- Adds new entry to cars table with id, maker, year, and model as values 
* ./owners/add/:id/:name/:email		- Adds new entry to owners table with id, name, and email as values

### Read Operations
* ./allCars 			- Displays all data in cars table stored in carShow.db
* ./allCars/:id		- Displays car with chosen id in cars table
* ./allCars/maker/:maker	- Displays all cars of chosen maker in cars table
* ./allCars/model/:model	- Displays all cars of chosen model in cars table
* ./owners			- Displays all owners
* ./winners 			- Displays cars overall scores
* ./winners/racers		- Display racer scores
* ./winners/engine		- Display engine scores
* ./winners/body		- Displays body scores
* ./winners/mods		- Displays mods scores
* ./winners/carOverall		- Displays car overall scores
* ./winners/modsOverall	- Displays mods overall scores

### Update Operations
* ./owners/update/name/:id/:name	- Updates name of owner with corresponding car id
* ./owners/update/email/:id/:email	- Updates email of owner with corresponding car id

### Delete Operations
* ./allCars/del/:id'		- Deletes car with corresponding car id
* ./owners/del/:id'		- Deletes owner with corresponding car id
