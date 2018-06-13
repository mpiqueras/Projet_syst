#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"tabInstructions.h"

	
Instruction tabInstructions[300];
int tailleTabInstructions = 0;

void remplirTab(char* op,int a,int b) {
	Instruction i;
	i.nom=op;
	i.a=a;
	i.b=b; 
	tabInstructions[tailleTabInstructions]=i; 
	tailleTabInstructions++;
}
void remplirTab2(char* op,int a,int b,int c) {
	Instruction i;
	i.nom=op;
	i.a=a;
	i.b=b; 
	i.c=c;
	tabInstructions[tailleTabInstructions]=i; 
	tailleTabInstructions++;
}

int getTaille () {
	return tailleTabInstructions;
}

Instruction* getTab () {
	return tabInstructions;
}

void majJumpcIf(){
	int i, trouve;
 	i = tailleTabInstructions-1;
 	trouve=0;
	while(i>0 && trouve==0){
		printf("On est la avec i = %d\n",i);
		if((strcmp(tabInstructions[i].nom,"JMPC")==0)&&tabInstructions[i].a==-1){
			trouve = 1;
			tabInstructions[i].a=(tailleTabInstructions);
		}
		i--;
	}
}

void majJumpcWhile(){
	int i, trouve;
 	i = tailleTabInstructions-1;
 	trouve=0;
	while(i>0 && trouve==0){
		printf("On est la avec i = %d\n",i);
		if((strcmp(tabInstructions[i].nom,"JMPC")==0)&&tabInstructions[i].a==-1){
			trouve = 1;
			tabInstructions[i].a=(tailleTabInstructions-1);
		}
		i--;
	}
}

void majJump(){
	int i, trouve;
 	i = tailleTabInstructions-1;
 	trouve=0;
	while(i>0 && trouve==0){
		printf("On est la avec i = %d\n",i);
		if((strcmp(tabInstructions[i].nom,"JMP")==0)&&tabInstructions[i].a==-1){
			trouve = 1;
			tabInstructions[i].a=(tailleTabInstructions);
		}
		i--;
	}
}

void displayTab () {
	int i;
	
	for (i=0;i<tailleTabInstructions;i++){
		if(strcmp(tabInstructions[i].nom,"LOAD")==0||strcmp(tabInstructions[i].nom,"STORE")==0||strcmp(tabInstructions[i].nom,"AFC")==0||strcmp(tabInstructions[i].nom,"JMPC")==0||strcmp(tabInstructions[i].nom,"JMP")==0){
			printf("%s %d %d \n", tabInstructions[i].nom,tabInstructions[i].a,tabInstructions[i].b);
		}
		else{
			printf("%s %d %d %d \n", tabInstructions[i].nom,tabInstructions[i].a,tabInstructions[i].b, tabInstructions[i].c);
		}
	}
}
	
	
