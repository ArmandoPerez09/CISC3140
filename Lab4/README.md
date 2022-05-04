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
* localhost:3000/ 					- Start point of the API
* localhost:3000/cars 				- Displays all data in cars table stored in carShow.db
* localhost:3000/cars/:Car_ID		- Displays single record in cars table using Car_ID as key
* localhost:3000/owners 			- Displays all data in owners table stored in carShow.db
* localhost:3000/owners/:Car_ID		- Displays single record in owners table using Car_ID as key
* localhost:3000/judges 			- Displays all data in judges table stored in carShow.db
* localhost:3000/judges/:Judge_ID	- Displays single record in cars table using Judge_ID as key
* localhost:3000/scores 			- Displays all data in scores table stored in carShow.db
* localhost:3000/scores/:Car_ID		- Displays single record in scores table using Car_ID as key
* POST PATCH DELETE Endpoints to be added