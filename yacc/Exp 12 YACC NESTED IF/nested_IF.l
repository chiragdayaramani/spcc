%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
"if" {return IF;}
[sS][0-9]* {return S;}
"<"|">"|"=="|"<="|">="|"!=" {return RELOP;}
[0-9]+ {return NUM;}
[a-zA-z_][a-zA-Z0-9_]* {return ID;}
\n {return NEWLINE;}
. {return yytext[0];}
%%

int yywrap(){
	return 0;
}


