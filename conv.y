%{
	#include<stdio.h> 
	#include<math.h>
	#include<string.h>
	#include<stdlib.h>
	float num,r;
	float a;
%} 

%union
{
    float floatValue;
}

%token F K R NEWLINE
%token <floatValue>NUM
%token <floatValue>NENUM

%%
START: CONVERSION NEWLINE	{printf("\n complete\n");}
		;
CONVERSION:
		F NUM
			{
				num=$2;
				printf("THE FARENHEIT CONVERSION IS: ");
				a=((num*9.0)/5.0)+32.0;
				printf("%f",a);
			}

		|K NUM
			{
				num=$2;
				printf("THE KELVIN CONVERSION IS: ");
				a=num+273.15;
				printf("%f",a);
			}

		|R NUM
			{
				num=$2;
				printf("THE RANKINE CONVERSION IS: ");
				a=(num*9.0)/5.0+491.67;
				printf("%f",a);
			}
		|F NENUM
			{
				num=$2;
				printf("THE FARENHEIT CONVERSION IS: ");
				a=((num*9.0)/5.0)+32.0;
				printf("%f",a);
			}
		|K NENUM
			{
				num=$2;
				printf("THE KELVIN CONVERSION IS: ");
				a=num+273.15;
				printf("%f",a);
			}

		|R NENUM
			{
				num=$2;
				printf("THE RANKINE CONVERSION IS: ");
				a=(num*9.0)/5.0+491.67;
				printf("%f",a);
			};
		

%%
int main()
{
	yyparse();
	return 0;

}
yyerror(char *s)
{
	fprintf(stdout,"\n %s",s);
}