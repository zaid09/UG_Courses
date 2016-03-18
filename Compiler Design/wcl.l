%{
	#include<stdio.h>
	int lines=0;
	int words=0;
	int s_letters=0;
	int c_letters=0;
	int spl_char=0;
	int num=0;
	int total=0;
%}
%%
\n {lines++; words++;}
[\t" "] words++;
[A-Z] c_letters++;
[a-z] s_letters++;
[0-9] num++;
. spl_char++;
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
	total=s_letters+c_letters+num+spl_char;
	printf("The file contains..");
	printf("\n %d lines",lines);
	printf("\n %d words",words);
	printf("\n %d small letters",s_letters);
	printf("\n %d capital letters",c_letters);
	printf("\n %d digits",num);
	printf("\n %d special characters",spl_char);
	printf("\n Total %d characters\n",total);
return 0;
}
int yywrap() {
	return 1;
}
