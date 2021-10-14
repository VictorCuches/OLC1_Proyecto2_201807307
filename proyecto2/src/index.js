import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
const parser = require('./Analizer/grammar')
  //"jison": "jison .src/Analizer/Grammar.jison && mv Grammar.js ./src/Analizer/"


  
ReactDOM.render(
 <div>Hola Mundo </div>, document.getElementById("root")
);



var contenido 

// EVENTOS

const compilar = document.getElementById('compile');
compilar.addEventListener('click', probando);

var textEditor = document.getElementById("editor");


function probando() {
  console.log("Hola mundo")
  console.log(parser.parse(contenido))
   

}

function readFile(evento){ // lectura del archivo .json
    
  let archivo = evento.target.files[0];
  if (archivo){
      let reader = new FileReader();
      reader.onload = function(e){
          contenido = e.target.result;
          console.log(contenido)
          textEditor.textContent = contenido
           
                    
          //generateElements(listaValores, tipoDato);

      };
      reader.readAsText(archivo); 

  } else {
      alert("No se ha seleccionado ningun archivo");
  }
}

window.addEventListener('load', ()=>{ // cada vez que cambie 
  document.getElementById('file').addEventListener('change',readFile)
});

