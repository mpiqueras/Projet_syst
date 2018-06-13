%{
	#include <stdio.h>
	#include "table_des_symboles.h"
	#include "tabInstructions.h"
	int yylex(void);
	void yyerror(char*);
	char* type;
	int depth=0;
	int temp=0;
	
	
	

#define ADD_INS(op, a, b) \
	remplirTab(op,a,b);
	//printf("%s %d %d\n",op,a,b);
#define ADD_INS_2(op,a,b,c) \
	remplirTab2(op,a,b,c);
	//printf("%s %d %d %d\n",op,a,b,c);
%}

%union {
	int nb;
	char* str;
}

%token tVOID tMAIN tIF tELSE tPRINTF tCONST tINT tFLOAT tSTRING tACCOLADEOUVRANTE tACCOLADEFERMANTE tPARENTHESEOUVRANTE tPARENTHESEFERMANTE tVIRGULE tCONSTANTE tVARIABLE tEGAL tPOINTVIRGULE tNOMBRE tADD tSUB tMUL tDIV tCHAINE tINFEGAL tSUPEGAL tINF tSUP tEGALEGAL tDIFFERENT tOU tET tWHILE;

%left tADD tSUB
%left tMUL tDIV


%type <str> tINT tFLOAT tCHAINE tVARIABLE tSTRING tVOID Type
%type <nb> tNOMBRE Terme Expression 

%%
S: tINT tMAIN tPARENTHESEOUVRANTE Args tPARENTHESEFERMANTE tACCOLADEOUVRANTE Body tACCOLADEFERMANTE{displayTab();};

Type: tINT|tSTRING|tVOID;

Args: ;
Args: Arg ArgSuite;
Arg: Type tVARIABLE;
ArgSuite: tVIRGULE Arg ArgSuite;
ArgSuite: ;
Body: Ligne Body ;
Body: ;

Ligne: Affectation tPOINTVIRGULE;
Affectation: tVARIABLE tEGAL Terme{
	ADD_INS("LOAD", 0,  last());
	depiler();
	ADD_INS("STORE", getAdress($1), 0);
};
Affectation: tVARIABLE tEGAL tCHAINE;

Terme: 
tVARIABLE{
	empiler("tmp","int",depth,'1');
	ADD_INS("LOAD", 0, getAdress($1));
	ADD_INS("STORE", last(),0);
}
|tNOMBRE{
	empiler("tmp","int",depth,'1');
	ADD_INS("AFC",0,$1);
	ADD_INS("STORE", last(),0);
}
|Expression;

//adresse -1 return adresse -> depilage puis return adresse sommet pile (case vide)
Expression: tPARENTHESEOUVRANTE Expression tPARENTHESEFERMANTE;
Expression: Terme tADD Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("ADD",0,1,0);
	ADD_INS("STORE", last(),0);
}; 
Expression: Terme tSUB Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("SUB",0,1,0);
	ADD_INS("STORE", last(),0);
}; 
Expression: Terme tMUL Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("MUL",0,1,0);
	ADD_INS("STORE", last(),0);
}; 
Expression: Terme tDIV Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("DIV",0,1,0);
	ADD_INS("STORE", last(),0);
}; 

Ligne: Declaration {display_pile();}tPOINTVIRGULE;
Declaration: Type tVARIABLE {type = $1;empiler($2,type,depth,'0');} DeclarationSuite  ;
Declaration: tVARIABLE {empiler($1,type,depth,'0');} DeclarationSuite ;
DeclarationSuite: tVIRGULE Declaration;
DeclarationSuite: ;

Ligne: tPRINTF tPARENTHESEOUVRANTE tCHAINE tPARENTHESEFERMANTE tPOINTVIRGULE ;
Ligne: tPRINTF tPARENTHESEOUVRANTE tVARIABLE tPARENTHESEFERMANTE tPOINTVIRGULE;

Ligne: tIF tPARENTHESEOUVRANTE Conditions tPARENTHESEFERMANTE tACCOLADEOUVRANTE Body tACCOLADEFERMANTE{ADD_INS("JMP",-1,0);majJumpcIf();} tELSE tACCOLADEOUVRANTE Body tACCOLADEFERMANTE {majJump();};
Ligne: tIF tPARENTHESEOUVRANTE Conditions tPARENTHESEFERMANTE tACCOLADEOUVRANTE Body tACCOLADEFERMANTE{majJumpcIf();};
Ligne: tWHILE tPARENTHESEOUVRANTE {temp=getTaille()-1;} Conditions tPARENTHESEFERMANTE tACCOLADEOUVRANTE Body tACCOLADEFERMANTE{ADD_INS("JMP",temp,0);majJumpcWhile();};  


Conditions: Condition suiteConditions;
Condition: tPARENTHESEOUVRANTE Condition tPARENTHESEFERMANTE;
Condition:Terme tINFEGAL Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("INFE",0,1,0);
	ADD_INS("STORE", last(),0);
};
Condition:Terme tSUPEGAL Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("SUPE",0,1,0);
	ADD_INS("STORE", last(),0);
};
Condition:Terme tINF Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("INF",0,1,0);
	ADD_INS("STORE", last(),0);
};
Condition:Terme tSUP Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("SUP",0,1,0);
	ADD_INS("STORE", last(),0);
};
Condition:Terme tEGALEGAL Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("EQU",0,1,0);
	ADD_INS("STORE", last(),0);
};
Condition:Terme tDIFFERENT Terme{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("SUB",0,1,0);
	ADD_INS("STORE", last(),0);
};
/*Logique: tOU{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("ADD",0,1,0);
	ADD_INS("STORE", last(),0);
}
|tET{
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("MUL",0,1,0);
	ADD_INS("STORE", last(),0);
};*/

suiteConditions: tOU Condition  {
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("ADD",0,1,0);
	ADD_INS("STORE", last(),0);
} suiteConditions;
suiteConditions: tET Condition {
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("LOAD", 1, last());
	ADD_INS_2("MUL",0,1,0);
	ADD_INS("STORE", last(),0);
} suiteConditions;

suiteConditions: {
	ADD_INS("LOAD", 0, last());
	depiler();
	ADD_INS("JMPC", -1, 0);	
};


/*suiteConditions: Logique Conditions;*/


%%
int main() {
	//yydebug=1;
	yyparse();
}
