const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
//let persona = JSON.parse(rawdata);
//console.log(persona);
console.log(JSON.stringify(rawdata)); 

// ¿Qué sucede cuando utilizamos JSON.stringify? Por que?
// convierte el array en valores crudos o rpimitivos. 

// ¿Qué sucede cuando utilizamos JSON.parse? Por que?
// devuele el resultado en formato json
