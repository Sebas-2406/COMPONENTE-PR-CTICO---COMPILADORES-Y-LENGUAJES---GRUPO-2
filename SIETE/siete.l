/* Declaraciones */
%{
#include <stdio.h>
%}

/* Reglas */
%%
"<="        { printf("Tipo: Operador Relacional (Menor o igual)\t- Lexema: %s\n", yytext); } // Operadores de dos caracteres
">="        { printf("Tipo: Operador Relacional (Mayor o igual)\t- Lexema: %s\n", yytext); }
"=="        { printf("Tipo: Operador Relacional (Igualdad)\t\t- Lexema: %s\n", yytext); }
"!="        { printf("Tipo: Operador Relacional (Desigualdad)\t\t- Lexema: %s\n", yytext); }
"<"         { printf("Tipo: Operador Relacional (Menor)\t\t- Lexema: %s\n", yytext); } // Operadores relacionales simples
">"         { printf("Tipo: Operador Relacional (Mayor)\t\t- Lexema: %s\n", yytext); }
"+"         { printf("Tipo: Operador Aritmetico (Suma)\t\t- Lexema: %s\n", yytext); } // Operadores aritmeticos
"-"         { printf("Tipo: Operador Aritmetico (Resta)\t\t- Lexema: %s\n", yytext); }
"*"         { printf("Tipo: Operador Aritmetico (Multiplicacion)\t- Lexema: %s\n", yytext); }
"/"         { printf("Tipo: Operador Aritmetico (Division)\t\t- Lexema: %s\n", yytext); }
[ \t\n\r]+  ; // Omision de tabulaciones y espacios en blanco entre tokens
.           ; // Omision de signos de puntuacion y caracteres especiales 
%%

/* Codigo (main) */
int main()
{
    yylex();
    return 0;
}
