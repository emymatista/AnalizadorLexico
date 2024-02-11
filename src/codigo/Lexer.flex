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
int |
float |
entero |
real |
if |
si |
else |
entonces |
mientras |
para |
for |
while {lexeme=yytext(); return Reservada;}
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
"%" {return Modulus;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
