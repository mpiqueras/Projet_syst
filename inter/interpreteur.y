%{
	#include <stdio.h>
	#include "tabInstructions.h"
	#include<string.h>
	int registres[4];
	int memoire[300];
	int yylex(void);
	void yyerror(char*);	
%}

%union {
	int nb;
	char* str;
}

%token tSTORE tAFC tLOAD tJMPC tJMP tSUB tMUL tADD tDIV tEQU tINF tINFE tSUP tSUPE tNOMBRE

%type <nb> tNOMBRE  
%type <str> tSTORE tAFC tLOAD tJMPC tJMP tSUB tMUL tADD tDIV tEQU tINF tINFE tSUP tSUPE

%%

S: Ligne ;

Ligne: tSTORE tNOMBRE tNOMBRE{
	remplirTab($1,$2,$3);
} Ligne;

Ligne: tAFC tNOMBRE tNOMBRE{
	remplirTab($1,$2,$3);
} Ligne;
Ligne: tLOAD tNOMBRE tNOMBRE{
	remplirTab($1,$2,$3);
} Ligne;
Ligne: tJMPC tNOMBRE tNOMBRE{
	remplirTab($1,$2,$3);
} Ligne;
Ligne: tJMP tNOMBRE tNOMBRE{
	remplirTab($1,$2,$3);
} Ligne;

Ligne: tSUB tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;
Ligne: tMUL tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;
Ligne: tADD tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;
Ligne: tDIV tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;


Ligne: tEQU tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;
Ligne: tINF tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;
Ligne: tINFE tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne; 
Ligne: tSUP tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;
Ligne: tSUPE tNOMBRE tNOMBRE tNOMBRE{
	remplirTab2($1,$2,$3,$4);
} Ligne;

Ligne: ;

%%
int main() {
	int i,r,m;
	//yydebug=1;
	yyparse();
	//displayTab();
	Instruction* tab;
	tab = getTab(); 
	for(i=0;i<getTaille();i++){
		printf("i:%d, instruction: %s %d %d %d \n",i,tab[i].nom,tab[i].a,tab[i].b,tab[i].c);
		if (strcmp(tab[i].nom,"JMPC")==0){
			if(registres[tab[i].b]==0){i=tab[i].a;}
		} else if (strcmp(tab[i].nom,"JMP")==0){
			i=tab[i].a;
		} else if(strcmp(tab[i].nom,"STORE")==0){
			memoire[tab[i].a]=registres[tab[i].b];
		} else if (strcmp(tab[i].nom,"AFC")==0){
			registres[tab[i].a]=tab[i].b;
		} else if (strcmp(tab[i].nom,"LOAD")==0){
			registres[tab[i].a]=memoire[tab[i].b];
		} else if (strcmp(tab[i].nom,"SUB")==0){
			registres[tab[i].a]=registres[tab[i].b]-registres[tab[i].c];
		} else if (strcmp(tab[i].nom,"MUL")==0){
			registres[tab[i].a]=registres[tab[i].b]*registres[tab[i].c];
		} else if (strcmp(tab[i].nom,"ADD")==0){
			registres[tab[i].a]=registres[tab[i].b]+registres[tab[i].c];
		} else if (strcmp(tab[i].nom,"DIV")==0){
			registres[tab[i].a]=registres[tab[i].b]/registres[tab[i].c];
		} else if (strcmp(tab[i].nom,"EQU")==0){
			if(registres[tab[i].b]==registres[tab[i].c]){registres[tab[i].a]=1;}else{registres[tab[i].a]=0;}
		} else if (strcmp(tab[i].nom,"INF")==0){
			if(registres[tab[i].b]<registres[tab[i].c]){registres[tab[i].a]=1;}else{registres[tab[i].a]=0;}
		} else if (strcmp(tab[i].nom,"INFE")==0){
			if(registres[tab[i].b]<=registres[tab[i].c]){registres[tab[i].a]=1;}else{registres[tab[i].a]=0;}
		} else if (strcmp(tab[i].nom,"SUP")==0){
			if(registres[tab[i].b]>registres[tab[i].c]){registres[tab[i].a]=1;}else{registres[tab[i].a]=0;}
		} else if (strcmp(tab[i].nom,"SUPE")==0){
			if(registres[tab[i].b]>=registres[tab[i].c]){registres[tab[i].a]=1;}else{registres[tab[i].a]=0;}
		}
	}
	
	for(r=0;r<3;r++){
		printf("registre %d a la valeur %d\n",r,registres[r]);
	} 
	for(m=0;m<100;m++){
		printf("adresse memoire %d a la valeur %d\n",m,memoire[m]);
	}
}
