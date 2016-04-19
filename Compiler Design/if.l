%{
  #include "y.tab.h"
%}
%%
"if"       return IF;
"=="       return OP;
[<>+]      return OP;
[{()}]     return *yytext;
[a-zA-Z]*  return SIMP;
" "        {;}
.          { }
%%
main()
{
  yyin=fopen(" ","r"); //enter file name
  yyparse();
  fclose(yyin);
}
int yywrap() {
 	return 1;
}
