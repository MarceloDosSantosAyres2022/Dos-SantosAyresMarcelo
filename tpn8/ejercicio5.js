// Crear un programa (ejercicio5.js) capaz de leer el archivo departamentos.json.
// Luego recorrer e imprimir nombre + puesto de los empleados de tecnologia.
// Al ejecutar node ejercicio5.js la salida en consola debería ser la siguiente:
// Pablo Richmon PM
// Marta Fernandez TechLead
// Pedro Mendez FullStack js
 // 'use strict';
// let jsonData = require('./departamentos.json');
// console.log(JSON.stringify(jsonData));
'use strict';
const fs = require('fs');
fs.readFile('departamentos.json', (err, data) => {
if (err) throw err;
console.log(JSON.parse(data));
});


