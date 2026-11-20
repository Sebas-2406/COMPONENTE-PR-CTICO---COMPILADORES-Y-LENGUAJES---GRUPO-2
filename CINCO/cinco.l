/* Declaraciones */
%{
#include <stdio.h>

/* Contadores globales de cada categoria */
int mayusculas = 0;
int minusculas = 0;
int digitos = 0;
int espacios = 0;
%}

/* Reglas */
/* Clasificacion por categoria */
%%
[A-Z]       { mayusculas++; /* Mayusculas */}
[a-z]       { minusculas++; /* Minusculas */}
[0-9]       { digitos++; /* Digitos numericos */}
[ \t\n\r]   { espacios++; /* Espacios */}
.           { /* Omision de signos de puntuacion y caracteres especiales */ }
%%

/* Codigo (main) */
int main()
{
yylex();

//Impresion del resumen de caracteres clasificados
printf("==========RESUMEN DE CLASIFICACION==========\n");
printf("Letras mayusculas: %d\n", mayusculas);
printf("Letras minusculas: %d\n", minusculas);
printf("Digitos: %d\n", digitos);
printf("Espacios en blanco: %d\n", espacios);

return 0;
}
