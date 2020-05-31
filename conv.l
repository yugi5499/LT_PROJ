%{
	#include<stdio.h>
	#include "conv.tab.h"
%}

digit	[0-9]

%%
[\t]+	;/*EAT WHITESPACES*/
[\n]	return NEWLINE;
F	return F;
K	return K;
R	return R;
{digit}+.{digit}*	{
						yylval.floatValue=atof(yytext);
						return NUM;
					}
-{digit}+.{digit}* {
						yylval.floatValue=atof(yytext);
						return NENUM;
					}
%%

int yywrap() {
				return 1;
			 }