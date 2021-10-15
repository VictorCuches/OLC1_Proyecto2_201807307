///configuraciones
%lex
%options case-insensitive

%% 
//definir tokens 
// ER      retrun 'NOMBRE_TOKEN'
 
 
"int"                   return 'INT';
"double"                return 'DOUBLE';
"boolean"               return 'BOOLEAN';
"char"                  return 'CHAR';
"string"                return 'STRING';

"true"                  return "TRUE";
"false"                 return "FALSE";

"="                     return "IGUAL";


[0-9]+("."[  |0-9]+)?                       return 'DECIMAL';
[0-9]+                                      return 'ENTERO';
[A-Za-z_]+[_0-9A-Za-z]*                     return 'IDENTIFI';
"\""[^\"]*"\""                              return 'CADENA';


(\/\/.*)      return 'COMENTLINEA';
"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"    return 'COMENTMULTI';

[\r\t\n\s]+                 {}

<<EOF>>                 return 'EOF';

.                           { console.log("error léxico: ", yytext, 'en línea ', yylloc.first_line, 'en columna: ', yylloc.first_column); }

/lex


%left 'TK_SUMA' 'TK_RESTA'
%left 'TK_MULTIPLICACION' 'TK_DIVISION'


%start inicio

%% 
// Producciones


inicio : instrucciones EOF;

instrucciones : instrucciones instruccion 
| instruccion
| error {console.log('Error Sintáctico con ', yytext); }; 

instruccion : COMENTLINEA
| COMENTMULTI
| asignacion 
;

asignacion: INT IDENTIFI IGUAL ENTERO 
| DOUBLE IDENTIFI IGUAL DECIMAL
| BOOLEAN IDENTIFI IGUAL TRUE
| BOOLEAN IDENTIFI IGUAL FALSE
| CHAR IDENTIFI IGUAL
| STRING IDENTIFI IGUAL CADENA
;
 
