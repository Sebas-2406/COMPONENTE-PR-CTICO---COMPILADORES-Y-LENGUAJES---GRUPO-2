/* Declaraciones */
%{
#include <stdio.h>
%}

/* Definiciones regulares */
DIGITO      [0-9]
LETRA       [a-zA-Z_]
ID          {LETRA}({LETRA}|{DIGITO})*
ENTERO      {DIGITO}+

/* Reglas */
%%
"if"        { printf("Token: Palabra Reservada (Condicional)\t- Lexema: %s\n", yytext); } // Prioridad de palabra reservada "if"
"else"      { printf("Token: Palabra Reservada (Condicional)\t- Lexema: %s\n", yytext); } // Prioridad de palabra reservada "else"
"while"     { printf("Token: Palabra Reservada (Bucle)\t\t- Lexema: %s\n", yytext); } // Prioridad de palabra reservada "while"
"int"       { printf("Token: Palabra Reservada (Tipo de Dato)\t- Lexema: %s\n", yytext); } // Prioridad de palabra reservada "int"
{ID}        { printf("Token: Identificador\t\t\t- Lexema: %s\n", yytext); }
{ENTERO}    { printf("Token: Numero Entero\t\t\t- Lexema: %s\n", yytext); }
[ \t\n\r]+  ; // Omision de tabulaciones y espacios en blanco entre tokens
.           ; // Omision de signos de puntuacion y caracteres especiales 
%%

/* Codigo (main) */
int main()
{
    yylex();
    return 0;
}
