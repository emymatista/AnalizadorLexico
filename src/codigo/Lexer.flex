package codigo;
import static codigo.Tokens.*;
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
int | float {lexeme=yytext(); return Reservada;}
si | if {lexeme=yytext(); return Reservada_if;}
else | entonces {lexeme=yytext(); return Reservada_else;}
else if | si entonces {lexeme=yytext(); return Reservada_else_if;}
para | for {lexeme=yytext(); return Reservada_for;}
mientras | while {lexeme=yytext(); return Reservada_while;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"(" {return ParentesisAbierto;}
")" {return ParentesisCerrado;}
"{" {return LlaveAbierto;}
"}" {return LlaveCerrado;}
"[]" {return Arreglo;}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"**" {return Exponenciacion;}
"/" {return Division;}
"%" {return Modulo;}
{D}+"."{D}* {lexeme=yytext(); return NumeroDecimal;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
\"([^\"\n]|\\.)*\" {lexeme=yytext(); return Cadena;}
 . {return ERROR;}
