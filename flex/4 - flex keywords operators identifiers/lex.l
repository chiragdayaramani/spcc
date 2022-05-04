%{
#include<stdio.h>
 int ids = 0;
 int rel = 0;
 int keywords = 0;
%}
DIGIT [0-9]
LETTER [A-Za-z]
TYPE int|char|bool|float|void|for|do|while|if|else|return|void
%option yylineno
%option noyywrap
%%
{TYPE} {keywords++;}
(<|>|<=|>=|==|=) {rel++;}
'#'/[a-zA-Z0-9]* {;}
[a-zA-Z]+[a-zA-Z0-9]* {ids++;}
. {;}
%%
void main(int argc, char **argv)
{
 FILE *fh;
 if (argc == 2 && (fh = fopen("input.c", "r"))) {
 yyin = fh;
 }
 yylex();
 printf("identifiers = %d, operators = %d, keywords = %d \n",ids,rel,keywords);
}

