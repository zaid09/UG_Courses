%{
 #include<stdio.h>
 int vow = 0;
 int cons = 0;
%}
%%
[aeiouAEIOU] {vow++;}
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] {cons++;}
%%
int yywrap()
{
return 1;
}
main()
{
printf("Enter the string:\n");
yylex();
printf("No of vowels=%d\nNo of consonants=%d\n", vow,cons);
}

