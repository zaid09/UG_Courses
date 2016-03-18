%{
 #include<stdio.h>
%}
letter [a-z][A-Z0-9a-z0-9]*
%%
"+"|"-"|"|"|"/"|"*"|"&"|"="|"=="|"+="|"*="|"++"|"--"|"&&"|"||" {printf("%s is an operator",yytext);}
int|float|do|char|else|while|for|if|continue|return|enum {printf("%s is a keyword",yytext);}
{letter} {printf("%s is an identifier",yytext);}
.+ {printf("%s is not a identifier/keyword/operator",yytext);}
%%
int main(){
	yylex();
	return 0;
}
