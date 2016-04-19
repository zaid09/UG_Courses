%{
   #include <stdio.h>
   int level=0;
%}

%token IF SIMP OP
%%
stmt: if_stmt    { if(level>1) { printf("\nThere is a nested if."); } printf("\nValid levels=%d\n",level);}
    | error      { printf("---ERROR---\n");}
    ;
if_stmt: IFCOND SIMP
       | IFCOND if_stmt
       | IFCOND '{' EXP '}'
       | IFCOND '{' if_stmt '}'
IFCOND:  IF '(' EXP ')' {level++;} 
      ;
EXP: | SIMP OP SIMP
     | SIMP
     ;
%%
yyerror(char *s)
{
  printf("Invalid");
}
