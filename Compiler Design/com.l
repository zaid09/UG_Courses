%{
    #include<stdio.h>
    int com=0;
%}
%%
"//"([a-zA-Z\t ])* { com++;}
"/*"([a-zA-Z\t\n ])*"*/" {com++;}
%%
 
main( argc, argv )
int argc;
char **argv; {
	++argv, --argc;
	if ( argc > 0 )
	yyin = fopen( argv[0], "r" );
	else
	yyin = stdin;
    yylex();
 	printf("\nNo. of comment lines=%d\n",com);
 	fclose(yyin);
}

 int yywrap() {
 	return 1;
}