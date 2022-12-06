'use strict';
let jsonData = require('./personas.json');
// console.log(jsonData);
console.log(JSON.stringify(jsonData));

// ¿Qué sucede cuando utilizamos JSON.stringify? Por que?
// devuelve un string con los datos del arreglo en formato json

console.log(JSON.parse(jsonData));

//¿Qué sucede cuando utilizamos JSON.parse? Por que?
// tira un error
