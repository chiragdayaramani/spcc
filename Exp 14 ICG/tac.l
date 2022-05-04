%{
#include "y.tab.h"
#include<string.h>
%}

%%
[0-9]+ {strcpy(yylval.str, yytext); return NUM;}
[a-zA-Z_][a-zA-Z0-9_]* {strcpy(yylval.str, yytext); return ID;}
\n {return 0;}
[ \t] {}
. {return yytext[0];}
%%

int yywrap(){
	return 0;
}