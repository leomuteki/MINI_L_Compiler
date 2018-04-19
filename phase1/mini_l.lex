/*
 * Emmilio Segoiva, Chris Nguyen
 * CS152 Project Phase 1
 * Description: A lexical scanner for the MINI-L language
*/

%{
	int curLine = 1, curPos = 1;
%}
/*
*DIGIT		[0-9]
*ALPHA		[a-zA-Z]
*ID		{ALPHA}[_{ALPHA}{DIGIT}]*
*/
%%
"function"	{printf("FUNCTION\n"); curPos+=yyleng;}
"beginparams"	{printf("BEGIN_PARAMS\n"); curPos+=yyleng;}
"endparams"	{printf("END_PARAMS\n"); curPos+=yyleng;}
","		{printf("COMMA\n"); curPos+=yyleng;}
"return"	{printf("RETURN\n"); curPos+=yyleng;}
";"		{printf("SEMICOLON\n"); curPos++; curPos+=yyleng;}
":"		{printf("COLON\n"); curPos+=yyleng;}
"array"		{printf("ARRAY\n"); curPos+=yyleng;}
"integer"	{printf("INTEGER\n"); curPos+=yyleng;}
"beginlocals"	{printf("BEGIN_LOCALS\n"); curPos+=yyleng;}
"endlocals"	{printf("END_LOCALS\n"); curPos+=yyleng;}
"beginbody"	{printf("BEGIN_BODY\n"); curPos+=yyleng;}
"endbody"	{printf("END_BODY\n"); curPos+=yyleng;}
"beginloop"	{printf("BEGINLOOP\n"); curPos+=yyleng;}
"endloop"	{printf("ENDLOOP\n"); curPos+=yyleng;}
"true"		{printf("TRUE\n"); curPos+=yyleng;}
"false"		{printf("FALSE\n"); curPos+=yyleng;}
"while"		{printf("WHILE\n"); curPos+=yyleng;}
"if"		{printf("IF\n"); curPos+=yyleng;}
"endif"		{printf("ENDIF\n"); curPos+=yyleng;}
"else"		{printf("ELSE\n"); curPos+=yyleng;}
"then"		{printf("THEN\n"); curPos+=yyleng;}
"continue"	{printf("CONTINUE\n"); curPos+=yyleng;}
"do"		{printf("DO\n"); curPos+=yyleng;}
"and"		{printf("AND\n"); curPos+=yyleng;}
"or"		{printf("OR\n"); curPos+=yyleng;}
"not"		{printf("NOT\n"); curPos+=yyleng;}
"("		{printf("L_PAREN\n"); curPos+=yyleng;}
")"		{printf("R_PAREN\n"); curPos+=yyleng;}
"["		{printf("L_SQUARE_BRACKET\n"); curPos+=yyleng;}
"]"		{printf("R_SQUARE_BRACKET\n"); curPos+=yyleng;}
"of"		{printf("OF\n"); curPos+=yyleng;}
"write"		{printf("WRITE\n"); curPos+=yyleng;}
"read"		{printf("READ\n"); curPos+=yyleng;}
"+"		{printf("ADD\n"); curPos+=yyleng;}
"-"		{printf("SUB\n"); curPos+=yyleng;}
"/"		{printf("DIV\n"); curPos+=yyleng;}
"*"		{printf("MULT\n"); curPos+=yyleng;}
"%"		{printf("MOD\n"); curPos+=yyleng;}
"<"		{printf("LT\n"); curPos+=yyleng;}
">"		{printf("GT\n"); curPos+=yyleng;}
"<="		{printf("LTE\n"); curPos+=yyleng;}
">="		{printf("GTE\n"); curPos+=yyleng;}
"=="		{printf("EQ\n"); curPos+=yyleng;}
"<>"		{printf("NEQ\n"); curPos+=yyleng;}
":="		{printf("ASSIGN\n"); curPos+=yyleng;}


[0-9]+						{printf("NUMBER %s\n", yytext); curPos+=yyleng;}
[_0-9][_a-zA-Z0-9]*[a-zA-Z0-9]	 	{printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", curLine, curPos, yytext); exit(0);}
[a-zA-Z][_a-zA-Z0-9]*[_]			{printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", curLine, curPos, yytext); exit(0);}
[a-zA-Z][_a-zA-Z0-9]*		 		{printf("IDENT %s\n", yytext); curPos+=yyleng;}

[ \t\r\f\v]					{curPos += yyleng;}		
"\n"		{curLine++; curPos = 1;}
[##].*		{curLine++; curPos = 1;}
.		{printf("Error at line %d, column %d: unrecongnized symbol \"%s\"\n",curLine, curPos, yytext);exit(0);}
%%

main(int argc, char** argv)
{
	yyin = fopen(argv[1], "r");
	if (yyin != NULL) {
		yyin = stdin;
	}
	yylex();
	printf("\n");
}
