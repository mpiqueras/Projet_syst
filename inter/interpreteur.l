%{
	#include "interpreteur.tab.h" 
%}

%%

"STORE"	{
	yylval.str = strdup(yytext);
	return tSTORE;
}

"AFC"	{
	yylval.str = strdup(yytext);
	return tAFC;
}

"LOAD"	{
	yylval.str = strdup(yytext);
	return tLOAD;
}

"JMPC"	{
	yylval.str = strdup(yytext);
	return tJMPC;
}

"JMP"	{
	yylval.str = strdup(yytext);
	return tJMP;
}

"SUB" {
	yylval.str = strdup(yytext);
	return tSUB;
}

"MUL" {
	yylval.str = strdup(yytext);
	return tMUL;
}

"ADD" {
	yylval.str = strdup(yytext);
	return tADD;
}

"DIV" {
	yylval.str = strdup(yytext);
	return tDIV;
}

"EQU" {
	yylval.str = strdup(yytext);
	return tEQU;
}

"INF" {
	yylval.str = strdup(yytext);
	return tINF;
}

"INFE" {
	yylval.str = strdup(yytext);
	return tINFE;
}

"SUP" {
	yylval.str = strdup(yytext);
	return tSUP;
}

"SUPE" {
	yylval.str = strdup(yytext);
	return tSUPE;
}

[0-9]+	{
	yylval.nb = atoi(yytext);
	return tNOMBRE;
}





