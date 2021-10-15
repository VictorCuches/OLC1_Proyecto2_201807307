
const parser = require('./src/Analizer/grammar')



var cont = "int num = 45;";

console.log(parser.parse(cont))