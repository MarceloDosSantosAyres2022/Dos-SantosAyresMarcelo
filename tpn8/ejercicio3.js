'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
//console.log(JSON.parse(data));
console.log(JSON.stringify(data));
});


// ¿Qué sucede cuando utilizamos JSON.stringify?
// devuelve valores primitivos
 console.log(data);
// ¿Que sucede? Por que?
// tira un error