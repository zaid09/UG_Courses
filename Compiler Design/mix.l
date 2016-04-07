%{
#include<stdio.h>
int lines=0, keywords=0,identifier=0,count=0, operators = 0;
%}
%%
\n              { lines++; fprintf(yyout,"\n");}
"//".*              { count++;}
"/*"([^"*/"]|\n)*"*/"       { count++;}
#include<.*.h>          {fprintf(yyout,"%s",yytext);}
int|float|do|char|else|while|for|if|continue|return|enum {keywords++; fprintf(yyout,"%s",yytext);}
[a-zA-Z_][a-zA-Z0-9_]+      {identifier++; fprintf(yyout,"%s",yytext);}
"+"|"-"|"|"|"/"|"*"|"&"|"="|"=="|"+="|"*="|"++"|"--"|"&&"|"||" {operators++; fprintf(yyout,"%s",yytext);}
.       {fprintf(yyout,"%s",yytext);}
%%
int main()
{
yyin=fopen("hello.c","r");
yyout=fopen("hello1.c","w");
yylex();
printf("No of keywords:%d\n",keywords);
printf("No of Identifier:%d\n",identifier);
printf("No of Operators:%d\n",operators);
printf("No of Comments:%d\n",count);
fclose(yyin);
fclose(yyout);
return 0;
}
