/* Declaraciones */
%{
#include <stdio.h>

/* Arreglo para contar las apariciones de cada digito */
int contador[10] = {0};
%}

/* Reglas */
/* Clasificacion de los digitos */
%%
[0-9] {
    contador[yytext[0] - '0']++;
}

.|\n {
    /* Omision de otros caracteres */
}
%%

/* Codigo (main) */
int main()
{
    int i;

    yylex();

    /* Impresion de la tabla de frecuencias */
    printf("========== FRECUENCIA DE DIGITOS ==========\n");
    printf("Digito\tCantidad\n");

    for(i = 0; i < 10; i++) {
        printf("%d\t%d\n", i, contador[i]);
    }

    return 0;
}
