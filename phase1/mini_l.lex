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
"beginparams"	{printf("BEGIN_PARAMS");}
"endparams"	{printf("END_PARAMS");}
","		{printf("COMMA");}
"return"	{printf("RETURN");}
";"		{printf("SEMICOLON"); currPos++;}
":"		{printf("COLON"); currPos++;}
"array"		{printf("ARRAY");}
"integer"	{printf("INTEGER"); currPoss++;}
"beginlocals"	{printf("BEGIN_LOCALS");}
"endlocals"	{printf("END_LOCALS");}
"beginbody"	{printf("BEGIN_BODY");}
"endbody"	{printf("END_BODY");}
"beginloop"	{printf("BEGIN_LOOP");}
"endloop"	{printf("END_LOOP");}
"if"		{printf("IF");}
"do"		{printf("DO");}
"("		{printf("L_PAREN");}
")"		{printf("R_PAREN");}
"["		{printf("L_SQUARE_BRACKET");}
"]"		{printf("R_SQUARE_BRACKET");}
"of"		{printf("OF");}
"read"		{printf("READ");}
"+"		{printf("ADD");}
"-"		{printf("SUB");}
"/"		{printf("DIV");}
"*"		{printf("MULT");}
"<"		{printf("LT");}
">"		{printf("GT");}	
"<="		{printf("LTE");}
">="		{printf("GTE");}
"=="		{printf("EQ");}
":="		{printf("ASSIGN");}
{DIGIT}+	{printf("NUMBER %s\n");}

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
