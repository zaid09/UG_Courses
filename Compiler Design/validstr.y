%{
   #include<stdio.h>
   #include<stdlib.h>
%}
%token a b
%%
Stmt: TERM '\n'       {printf("\nValid String\n"); exit(0);}
    | error '\n'            {yyerror("\nInvalid String\n"); exit(0);}
    ;
TERM: a TERM b
    |
    ;
%%
main()
{
 printf("Enter the string:\n");
 yyparse();
}
yylex()
{
 char ch;
 while((ch=getchar())==' ');
 if(ch=='a')
   return a;
 if(ch=='b')
   return b;
 return ch;
}
yyerror(char *s)
{
 printf("%s",s);
}

int yywrap() {
	return 1;
}
