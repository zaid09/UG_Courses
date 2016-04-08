%{
    #include<stdio.h>
    int flag=0;
    
%}
%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{
         printf("\nResult=%d\n",$$);
         return 0;
        }
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'('E')' {$$=$2;}
 | NUMBER {$$=$1;}
;
%%

void main()
{ 
   printf("\nEnter an Arithmetic Expression:\n");
   yyparse();
  if(flag==0)
   printf("\nThe arithmetic expression is Valid\n\n");
  
}
void yyerror()
{
   printf("\nThe arithmetic expression is Invalid\n\n");
   flag=1;
}