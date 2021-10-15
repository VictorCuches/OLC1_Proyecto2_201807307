 
%lex
%options case-insensitive
 
%% 
 
[0-9]+                      return 'ENTERO'
[0-9]+("."[  |0-9]+)?       return 'DECIMAL'
(\"[^"]*\")                 return 'CADENA'

 
"int"                   return 'INT'
"double"                return 'DOUBLE'
"boolean"               return 'BOOLEAN'
"char"                  return 'CHAR'
"string"                return 'STRING'

"true"                  return 'TRUE'
"false"                 return 'FALSE'

"="                     return 'IGUAL'
";"                     return 'PTCOMA'
"if"                    return 'IF'
"else"                  return 'ELSE'

"("                     return 'PARAB'
")"                     return 'PARCE'
"{"                     return 'LLAB'
"}"                     return 'LLACE'
">"                     return '>'
"<"                     return '<'

 
[A-Za-z_]+[_0-9A-Za-z]*                     return 'IDENTIFI'
 


(\/\/.*)                                    return 'COMENTLINEA'
"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"    return 'COMENTMULTI'

[\r\t\n\s]+                 {}

<<EOF>>                 return 'EOF'

.      { console.log("error léxico: ", yytext, 'en línea ', yylloc.first_line, 'en columna: ', yylloc.first_column); }

/lex




%start inicio

%% 
 


inicio : instrucciones EOF;

instrucciones : instrucciones instruccion 
| instruccion
;

instruccion : COMENTLINEA
| COMENTMULTI
| asignacion 
| sentencia

;

asignacion: INT IDENTIFI IGUAL ENTERO PTCOMA
| DOUBLE IDENTIFI IGUAL DECIMAL PTCOMA
| BOOLEAN IDENTIFI IGUAL TRUE PTCOMA
| BOOLEAN IDENTIFI IGUAL FALSE PTCOMA 
| CHAR IDENTIFI IGUAL PTCOMA
| STRING IDENTIFI IGUAL CADENA PTCOMA
;

sentencia: IF PARAB expresion PARCE statement elsemore
;

expresion: IDENTIFI
| ENTERO
;

statement: LLAB instrucciones LLACE
| LLAB LLACE
;

elsemore : ELSE statement
| ELSE sentencia
|
;


 
