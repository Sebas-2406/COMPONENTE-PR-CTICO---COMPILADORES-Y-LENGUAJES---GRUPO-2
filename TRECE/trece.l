%{
/* Declaraciones */
#include <stdio.h>

/* Control de estado de la lista */
int esperaElemento = 1;
int hayTokensEnLinea = 0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*  {
                            /* Validacion de identificador */
                            if (esperaElemento == 0)
                            {
                                printf("Error: falta una coma antes de -> %s\n", yytext);
                            }
                            printf("Identificador: %s\n", yytext);
                            esperaElemento = 0;
                            hayTokensEnLinea = 1;
                        }
[0-9]+                  {
                            /* Validacion de numero entero */
                            if (esperaElemento == 0)
                            {
                                printf("Error: falta coma antes de -> %s\n", yytext);
                            }
                            printf("Numero entero: %s\n", yytext);
                            esperaElemento = 0;
                            hayTokensEnLinea = 1;
                        }
,                       {
                            /* Validacion de separador coma */
                            if (esperaElemento == 1)
                            {
                                printf("Error: coma inesperada -> ,\n");
                            }
                            else
                            {
                                printf("Separador: ,\n");
                                esperaElemento = 1;
                            }
                            hayTokensEnLinea = 1;
                        }
[ \t\r]+                { /* Omision de espacios y tabulaciones */ }
\n                      {
                            /* Cierre y reinicio de estado por linea */
                            if (hayTokensEnLinea == 1)
                            {
                                if (esperaElemento == 1)
                                {
                                    printf("Error: falta elemento al final de la lista\n");
                                }
                                printf("----------------------------------------\n");
                            }
                            esperaElemento = 1;
                            hayTokensEnLinea = 0;
                        }
[^ \t\n\r,]+            {
                            /* Reporte de token no valido */
                            printf("Error: token no valido -> %s\n", yytext);
                            esperaElemento = 0;
                            hayTokensEnLinea = 1;
                        }
%%

/* Funcion principal */
int main()
{
    printf("==========PROCESADOR DE LISTAS==========\n");
    yylex();

    if (hayTokensEnLinea == 1 && esperaElemento == 1)
    {
        printf("Error: falta un elemento al final de la lista\n");
    }

    printf("========================================\n");

    return 0;
}
