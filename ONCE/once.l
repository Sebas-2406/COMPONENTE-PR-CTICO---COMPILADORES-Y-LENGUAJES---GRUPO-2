%{
/* Declaraciones */
#include <stdio.h>

/* Contador de binarios reconocidos */
int totalBinarios = 0;

/* Conversion de cadena binaria a decimal */
unsigned long long convertirBinarioADecimal(const char *cadena)
{
    unsigned long long valorDecimal = 0;
    int indice = 0;

    while (cadena[indice] != '\0')
    {
        int digito = cadena[indice] - '0';
        valorDecimal = (valorDecimal * 2) + digito;
        indice++;
    }

    return valorDecimal;
}
%}

%%
[01]+           {
                    /* Conversion y despliegue del valor decimal */
                    unsigned long long valorDecimal = convertirBinarioADecimal(yytext);
                    printf("Binario: %s -> Decimal: %llu\n", yytext, valorDecimal);
                    totalBinarios++;
                }
[0-9]+\.[0-9]+  { /* Omision de numeros decimales */ }
[a-zA-Z0-9_]+   { /* Omision de tokens no binarios */ }
[ \t\n\r]+      { /* Omision de espacios y saltos de linea */ }
.               { /* Omision de otros caracteres */ }
%%

/* Funcion principal */
int main()
{
    printf("==========CONVERSION BINARIO A DECIMAL==========\n");
    yylex();
    printf("================================================\n");
    printf("Total de numeros binarios reconocidos: %d\n", totalBinarios);

    return 0;
}
