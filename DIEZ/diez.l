/* Declaraciones */
%{
#include <stdio.h>
%}

/* Definiciones regulares */
LETRA_NUMERO    [a-zA-Z0-9]
NOMBRE          [a-zA-Z0-9._%+-]+
DOMINIO         [a-zA-Z0-9.-]+
EXTENSION       [a-zA-Z]{2,}

/* Reglas */
/* Reconocimiento de correos electronicos */
%%
{NOMBRE}@{DOMINIO}\.{EXTENSION} {
    printf("Token: Correo Electronico Valido\t- Lexema: %s\n", yytext);
}

[^ \t\n\r]+ {
    printf("Token: Correo Electronico No Valido\t- Lexema: %s\n", yytext);
}

[ \t\n\r]+ {
    /* Omision de espacios en blanco */
}
%%

/* Codigo (main) */
int main()
{
    yylex();
    return 0;
}
