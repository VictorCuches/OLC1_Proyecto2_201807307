import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
const parser = require('./Analizer/grammar')
  //"jison": "jison .src/Analizer/Grammar.jison && mv Grammar.js ./src/Analizer/"


// prueba usando react
ReactDOM.render(
 <div>Hola Mundo </div>, document.getElementById("root")
);


// variable global con el contenido del archivo
var contenido 

// EVENTOS
// Opcion Compilar
const compilar = document.getElementById('compile');
compilar.addEventListener('click', probando);

// textarea para el editor
var textEditor = document.getElementById("editor");


function probando() {
  console.log("Hola mundo")
  console.log(parser.parse(contenido)) // envio el contenido a ser evaluado por la gramatica
   
}


// Lectura del archivo
function readFile(evento){  
    
  let archivo = evento.target.files[0];
  if (archivo){
      let reader = new FileReader();
      reader.onload = function(e){
          contenido = e.target.result;
          textEditor.textContent = contenido

      };
      reader.readAsText(archivo); 

  } else {
      alert("No se ha seleccionado ningun archivo");
  }
}

window.addEventListener('load', ()=>{ // cada vez que cambie 
  document.getElementById('file').addEventListener('change',readFile)
});

