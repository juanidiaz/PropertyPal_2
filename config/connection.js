// *********************************************************************************
// CONNECTION.JS - THIS FILE INITIATES THE CONNECTION TO MYSQL
// *********************************************************************************

// ==============================================================================
// MYSQL CONFIGURATION
// This sets up the MYSQL connection
// ==============================================================================

// Require mysql
var mysql = require("mysql");

// Set up our connection information
var connection;

// The connection will be done to JawsDB if this variable exists (used when deployed to Heroku)
if (process.env.JAWSDB_URL) {
  connection = mysql.createConnection(process.env.JAWSDB_URL);
} else {
  connection = mysql.createConnection({
    port: 3306,
    host: "localhost",
    user: "root",
    password: "root",
    database: "propertydb"
  });
}

// Connect to the database
connection.connect(function (err) {
  if (err) {
    console.error("error connecting: " + err.stack);
    return;
  }
  console.log("connected as id " + connection.threadId);
});

// Export connection
module.exports = connection;