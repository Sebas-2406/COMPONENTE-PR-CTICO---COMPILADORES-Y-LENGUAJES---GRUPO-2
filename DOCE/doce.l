%{
/* Declaraciones */
#include <stdio.h>

/* Conversion de cadena hexadecimal a decimal */
unsigned long long convertirHexadecimalADecimal(const char *cadena)
{
    unsigned long long valorDecimal = 0;
    int indice = 2;

    while (cadena[indice] != '\0')
    {
        char caracter = cadena[indice];
        int digito = 0;

        if (caracter >= '0' && caracter <= '9')
        {
            digito = caracter - '0';
        }
        else if (caracter >= 'A' && caracter <= 'F')
        {
            digito = (caracter - 'A') + 10;
        }
        else if (caracter >= 'a' && caracter <= 'f')
        {
            digito = (caracter - 'a') + 10;
        }

        valorDecimal = (valorDecimal * 16) + digito;
        indice++;
    }

    return valorDecimal;
}
%}

%%
0[xX][0-9a-fA-F]+               {
                                    /* Conversion y despliegue del valor decimal */
                                    unsigned long long valorDecimal = convertirHexadecimalADecimal(yytext);
                                    printf("Hexadecimal: %s -> Decimal: %llu\n", yytext, valorDecimal);                
                                }
[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+    { /* Omision de numeros con punto decimal */ }
[a-zA-Z0-9_]+                   { /* Omision de tokens no hexadecimales */ }
[ \t\n\r]+                      { /* Omision de espacios y saltos de linea */ }
.                               { /* Omision de otros caracteres */ }
%%

/* Funcion principal */
int main()
{
    printf("==========CONVERSION HEXADECIMAL A DECIMAL==========\n");
    yylex();
    printf("====================================================\n");

    return 0;
}
