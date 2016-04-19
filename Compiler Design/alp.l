%{
	#include<stdio.h>
%}
%%
[A-Za-z] { printf("%s is an alphabet",yytext);}
[A_Za-z]+ { printf("%s is a word",yytext); }
.+ { printf("%s is neither a word nor an alphabet",yytext); }
%%

int main() {
	yylex();
	return 0;
}

int yywrap() {
	return 1;
}
