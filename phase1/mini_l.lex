/*
 * Emmilio Segoiva, Chris Nguyen
 * CS152 Project Phase 1
 * Description: A lexical scanner for the MINI-L language
*/

%{
	int curLine = 1, curPos = 1;
%}

DIGIT		[0-9]
ALPHA		[a-zA-Z]
ALPHANUM	[{ALPHA}{DIGIT}]

%%
"function"	{printf("FUNCTION"); curPos++;}
"beginparams"	{printf("BEGIN_PARAMS");}
"endparams"	{printf("END_PARAMS");}
","		{printf("COMMA");}
"return"	{printf("RETURN");}
";"		{printf("SEMICOLON"); curPos++;}
":"		{printf("COLON"); curPos++;}
"array"		{printf("ARRAY");}
"integer"	{printf("INTEGER"); curPoss++;}
"beginlocals"	{printf("BEGIN_LOCALS");}
"endlocals"	{printf("END_LOCALS");}
"beginbody"	{printf("BEGIN_BODY");}
"endbody"	{printf("END_BODY");}
"beginloop"	{printf("BEGIN_LOOP");}
"endloop"	{printf("END_LOOP");}
"true"		{printf("TRUE");}
"false"		{printf("FALSE");}
"while"		{printf("WHILE");}
"if"		{printf("IF");}
"endif"		{printf("ENDIF");}
"else"		{printf("ELSE");}
"then"		{printf("THEN");}
"continue"	{printf("CONTINUE");}
"do"		{printf("DO");}
"and"		{printf("AND");}
"or"		{printf("OR");}
"not"		{printf("NOT");}
"("		{printf("L_PAREN");}
")"		{printf("R_PAREN");}
"["		{printf("L_SQUARE_BRACKET");}
"]"		{printf("R_SQUARE_BRACKET");}
"of"		{printf("OF");}
"write"		{printf("WRITE");}
"read"		{printf("READ");}
"+"		{printf("ADD");}
"-"		{printf("SUB");}
"/"		{printf("DIV");}
"*"		{printf("MULT");}
"%"		{printf("MOD");}
"<"		{printf("LT");}
">"		{printf("GT");}	
"<="		{printf("LTE");}
">="		{printf("GTE");}
"=="		{printf("EQ");}
"<>"		{printf("NEQ");}
":="		{printf("ASSIGN");}
{DIGIT}+	{printf("NUMBER %s\n", yytext);}
{ALPHA}([_{ALPHANUM}]*{ALPHANUM})? {printf("IDENT %s\n", yytext);}
{DIGIT}[_{ALPHANUM}]*[_{ALPHA}] {printf("Error at line %d, column %d: identifier "%s" must begin with a letter", curLine, curPos, yytext);}}
{ALPHA}[_{ALPHANUM}]*_ {printf("Error at line %d, column %d: identifier "%s" cannot end with an underscore", curLine, curPos, yytext);}}
[ \t\r\f\v]	{curPos += yyleng;}
"\n"		{curLine++; curPos = 1;}
.		{printf("Error at line %d , column %d: identifier "%s" cannot end with 
%%

int	_a

main(int argc, char** argv)
{
	yyin = fopen(argv[1], "r");
	if (yyin != NULL) {
		yyin = stdin;
	}
	yylex();
	printf("done");
}
