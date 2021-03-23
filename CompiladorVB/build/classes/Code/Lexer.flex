package Code;
import static Code.Tokens.*;
%%
%class Lexer
%type Tokens
%ignorecase
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
Texto = (\").+(\")
%{
    public String lexeme;
%}
%%
/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "’"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipos de datos */
( Integer | Double | Boolean) {lexeme=yytext(); return T_dato;}
( "Integuer" ) {lexeme=yytext(); return Int;}
( "Double" ) {lexeme=yytext(); return Double;}
( "Boolean" ) {lexeme=yytext(); return Boolean;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada If */
( If ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( Else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( Do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( While ) {lexeme=yytext(); return While;}

/* Palabra reservada Loop */
( Loop ) {lexeme=yytext(); return Loop;}

/* Palabra reservada For */
( For ) {lexeme=yytext(); return For;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<="  ) {lexeme = yytext(); return Op_relacional;}


/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme=yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme=yytext(); return Corchete_c;}

/* Punto */
( "." ) {lexeme=yytext(); return Punto;}
 
//Palabras Reservadas
( "Main" ) {lexeme=yytext(); return Main;}
( "Next" ) {lexeme=yytext(); return Next;}
( "Then" ) {lexeme=yytext(); return Then;}
( "Sub" ) {lexeme=yytext(); return Sub;}
( "End" ) {lexeme=yytext(); return End;}
( "Dim" ) {lexeme=yytext(); return Dim;}
( "As" ) {lexeme=yytext(); return As;}
( "public" ) {lexeme=yytext(); return Public;}
( "To" ) {lexeme=yytext(); return To;}
( "Module" ) {lexeme=yytext(); return Module;}
( "Console" ) {lexeme=yytext(); return Console;}
( "WriteLine" ) {lexeme=yytext(); return WriteLine;}
( "ReadLine" ) {lexeme=yytext(); return ReadLine;}
( "return" ) {lexeme=yytext(); return Return;}
( "class" ) {lexeme=yytext(); return Class;}
( "Function" ) {lexeme=yytext(); return Function;}
( "Structure" ) {lexeme=yytext(); return Structure;}
("Elseif") {lexeme = yytext(); return ElseIf;}

/* Texto */
{Texto} {lexeme=yytext(); return Texto;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}