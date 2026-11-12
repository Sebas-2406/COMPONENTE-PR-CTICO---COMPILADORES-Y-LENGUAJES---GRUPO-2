/* Declaraciones */
%{
	#include<stdlib.h>  // Necesaria para ocupar 'printf' 
%}

/*Comprobar si una cadena es un numero, identificador o numero en notacion exponencial*/
%%
[0-9]+  printf("NUMERO \n");
[a-zA-Z][a-zA-Z0-9]*	printf("IDENTIFICADOR \n");
[+-]?[0-9]+(\.[0-9]+)?[Ee][+-]?[0-9]+	printf("EXPONENCIAL \n");
%%
