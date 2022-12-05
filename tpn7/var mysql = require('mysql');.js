var mysql = require('mysql');

// Agregue las credenciales para acceder a su base de datos
var connection = mysql.createConnection({
   host     : 'localhost',
   user     : '<USERNAME that tipically is root>',
   password : '<PASSWORD or just use null if youre working lcocally',
   database : '<DATABASE-NAME>'
});

// conectarse a mysql
connection.connect(function(err) {
   // en caso de error
   if(err){
       console.log(err.code);
       console.log(err.fatal);
   }
});
