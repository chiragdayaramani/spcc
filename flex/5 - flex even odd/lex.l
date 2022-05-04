%{
#include<stdio.h>
int i;
%}
%%
[0-9]+ {i=atoi(yytext);
 if(i%2==0)
 printf("Even");
 else
 printf("Odd");}
%%

int yywrap(void) {
return 1;
}

int main()
{

 printf("Enter the number:" );
 yylex();
 return 0;
} 
