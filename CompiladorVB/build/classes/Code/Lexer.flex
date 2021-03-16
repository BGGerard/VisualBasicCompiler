package Code;
import static Code.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
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
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

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

//Palabras Reservadas
( "Main" ) {lexeme=yytext(); return Main;}
( "Next" ) {lexeme=yytext(); return Next;}
( "then" ) {lexeme=yytext(); return Then;}
( "Sub" ) {lexeme=yytext(); return Sub;}
( "End" ) {lexeme=yytext(); return End;}
( "Dim" ) {lexeme=yytext(); return Dim;}
( "As" ) {lexeme=yytext(); return As;}
( "public" ) {lexeme=yytext(); return Public;}
( "Module" ) {lexeme=yytext(); return Module;}
( "Console" ) {lexeme=yytext(); return Console;}
( "WriteLine" ) {lexeme=yytext(); return WriteLine;}
( "ReadLine" ) {lexeme=yytext(); return ReadLine;}
( "return" ) {lexeme=yytext(); return Return;}
( "class" ) {lexeme=yytext(); return Class;}
( "Function" ) {lexeme=yytext(); return Function;}
( "Structure" ) {lexeme=yytext(); return Structure;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}