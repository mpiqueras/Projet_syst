%{
	#include "compiler.tab.h" 
%}

%%

void {
	yylval.str = strdup(yytext);
	return tVOID;
}
main	return tMAIN;

"if" return tIF;

"else" return tELSE; 

"while" return tWHILE;

printf	return tPRINTF;

const return tCONST;

int {
	yylval.str = strdup(yytext);
	return tINT;
}


float return tFLOAT;

"char\*" {
	yylval.str = strdup(yytext);
	return tSTRING;
}

\{ return tACCOLADEOUVRANTE;

\}	return tACCOLADEFERMANTE;

\( return tPARENTHESEOUVRANTE;

\) return tPARENTHESEFERMANTE; 	

,	return tVIRGULE;

[A-Z]+	return tCONSTANTE;

"\"".*"\"" {
	yylval.str = strdup(yytext);
	return tCHAINE;
}

[a-zA-Z][a-zA-Z0-9]* {
	yylval.str = strdup(yytext);
	return tVARIABLE;
}

"+"	return tADD;

"-"	return tSUB;

"/"	return tDIV;

"*"	return tMUL;

"<=" return tINFEGAL;

">=" return tSUPEGAL;

"<" return tINF;

">" return tSUP;

"==" return tEGALEGAL;

"!=" return tDIFFERENT;

"||" return tOU;

"&&" return tET;

=	return tEGAL;


";"	return tPOINTVIRGULE;

[0-9]+	{
	yylval.nb = atoi(yytext);
	return tNOMBRE;
}













