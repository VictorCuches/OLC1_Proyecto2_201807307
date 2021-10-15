const parser = require('./src/Analizer/grammar')



var cont = "string name = \"asdf\" char UNO = \n double abc = 12.4  //into /*asfsf*/";

console.log(parser.parse(cont))