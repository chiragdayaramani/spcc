%{
    int vow_count=0;
    int const_count =0;
%}
  
%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}
%%
int yywrap(){}
int main()
{
	FILE *fp;
	char filename[50];
	printf("Enter the file name: \n");
	scanf("%s",filename);
	fp=fopen(filename,"r");
	yyin=fp;
    yylex();
    printf("Number of vowels are:  %d\n", vow_count);
    printf("Number of consonants are:  %d\n", const_count);
    return 0;
}
