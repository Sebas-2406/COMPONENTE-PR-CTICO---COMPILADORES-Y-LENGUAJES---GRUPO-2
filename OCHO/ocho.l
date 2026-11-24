
/* Declaraciones */
%{
#include <stdio.h>
#include <ctype.h>
%}

/* Reglas */
%%
[A-Z] {
    printf("%c", tolower(yytext[0]));
}

.|\n {
    printf("%s", yytext);
}
%%

/* Codigo (main) */
int main()
{
    yylex();
    return 0;
}
