package Code;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
    L=[a-zA-Z_]+
    D=[0-9]+
    espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "’"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Tipos de datos */
( "Integer" ) {return new Symbol(sym.Int, yychar, yyline, yytext());}

( "Double" ) {return new Symbol(sym.Doub, yychar, yyline, yytext());}

( "Boolean" ) {return new Symbol(sym.Bool, yychar, yyline, yytext());}


/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de Cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* PalabrasReservadas */
( "Main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}
( "Next" ) {return new Symbol(sym.Next, yychar, yyline, yytext());}
( "then" ) {return new Symbol(sym.Then, yychar, yyline, yytext());}
( "Sub" ) {return new Symbol(sym.Sub, yychar, yyline, yytext());}
( "End" ) {return new Symbol(sym.End, yychar, yyline, yytext());}
( "Dim" ) {return new Symbol(sym.Dim, yychar, yyline, yytext());}
( "As" ) {return new Symbol(sym.As, yychar, yyline, yytext());}
( "public" ) {return new Symbol(sym.Public, yychar, yyline, yytext());}
( "Module" ) {return new Symbol(sym.Module, yychar, yyline, yytext());}
( "Console" ) {return new Symbol(sym.Console, yychar, yyline, yytext());}
( "WriteLine" ) {return new Symbol(sym.WriteLine, yychar, yyline, yytext());}
( "ReadLine" ) {return new Symbol(sym.ReadLine, yychar, yyline, yytext());}
( "return" ) {return new Symbol(sym.Return, yychar, yyline, yytext());}
( "class" ) {return new Symbol(sym.Class, yychar, yyline, yytext());}
( "Function" ) {return new Symbol(sym.Function, yychar, yyline, yytext());}
( "Structure" ) {return new Symbol(sym.Structure, yychar, yyline, yytext());}





/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}


/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}