%{
#include<stdio.h>
int pf=0,sf=0;
%}
%%
scanf {sf++;}
printf {pf++;}
%%
int yywrap(void) {
return 1;
}
int main(int argc, char* argv[])
{
if (argc > 1)
{
FILE *file;
file = fopen("input.c", "r");
if (!file)
{
fprintf(stderr, "Could not open %s\n", argv[1]);
exit(1);
}
yyin = file;
}yylex();
printf("no of printf are : %d\n", pf);
printf("no of scanf are : %d\n", sf);
return 0;
}
