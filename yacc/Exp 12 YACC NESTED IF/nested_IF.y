%{
#include<stdio.h>
int count = 0;
%}

%token IF ID NUM RELOP NEWLINE S

%%
smt: if_smt NEWLINE {printf("Nested ifs=%d\n",count);}
	;
if_smt : IF'('cond')''{'if_smt'}' {count++;}
	| S
	;
cond : x RELOP x 
	;
x : ID 
	| NUM
	;
%%

int yyerror(char *s){
	printf("Invalid Statement\n");
	return 0;
}

int main(){
	yyparse();
	return 0;
}