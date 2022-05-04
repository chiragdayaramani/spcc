%{
#include<stdio.h>
#include<string.h>
char *createT();
int tCount = 0;
%}

%union{char str[30];}
%left '+'
%left '-'
%left '*'
%left '/'
%token <str> ID
%token <str> NUM
%type <str> assign
%type <str> exp

%%

assign : ID'='exp {printf("\n%s=%s", $1, $3);}

exp : '('exp')' {strcpy($$, $2);}
	| exp'+'exp {strcpy($$, createT()); printf("\n%s=%s+%s", $$, $1, $3);}
	| exp'-'exp {strcpy($$, createT()); printf("\n%s=%s-%s", $$, $1, $3);}
	| exp'*'exp {strcpy($$, createT()); printf("\n%s=%s*%s", $$, $1, $3);}
	| exp'/'exp {strcpy($$, createT()); printf("\n%s=%s/%s", $$, $1, $3);}
	| NUM {strcpy($$, $1);}
	| ID {strcpy($$, $1);}

%%

char *createT(){
	char snum[30], *ptr;
	sprintf(snum, "t%d", tCount);
	ptr = snum;
	tCount++;
	return ptr;
}

int main(){
	printf("Expression: ");
	yyparse();
	return 0;
}

int yyerror(char *s){
	printf("\nInvalid Expression");
	return 0;
}

