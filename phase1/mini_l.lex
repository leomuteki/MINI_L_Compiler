/*
 * Emmilio Segoiva, Chris Nguyen
 * CS152 Project Phase 1
 * Description: A lexical scanner for the MINI-L language
*/

%{
	int currLine = 1, currPos = 1;
%}

DIGIT		[0-9]
ALPHA		[a-zA-Z]
ALPHANUM	[{ALPHA}{DIGIT}]

%%
"function"	{printf("FUNCTION"); currPos++;}
"beginparams"	{printf("BEGIN_PARAMS")}

%%

main(int argc, char** argv)
{
	yyin = fopen(argv[1], "r");
	if (yyin != NULL) {
		yyin = stdin;
	}
	yylex();
	printf("done");
}
