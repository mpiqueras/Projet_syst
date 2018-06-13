#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct Symbole
{
	int adresse;
	char* id;
	char* type;
	int depth;
	char tmp;
	struct Symbole* suiv;
} Symbole ;

int adresse;
Symbole* pile;


void init_pile(void) {
	adresse = 0;
	pile = NULL;
}

void empiler(char *id, char* type, int depth, char tmp){
	Symbole* nouveau = malloc(sizeof(Symbole));
	nouveau->adresse = adresse++;
	nouveau->id = id;
	nouveau->type = type;
	nouveau->depth = depth;
	nouveau->tmp = tmp;
	nouveau->suiv = pile;
	pile = nouveau;
}

void depiler(){

	if(pile == NULL){
		exit(EXIT_FAILURE);
	}
	Symbole* aux;
	aux = pile;
	pile = pile->suiv;
	adresse--;
	//adresse = aux->adresse;
	free(aux);
}

int getAdress(char* nom){
	Symbole* aux=pile;
	while (aux) {
		if (! strcmp(aux->id, nom)){
			return aux->adresse;
		}
		aux=aux->suiv;
	}
	return -1;
}

void display_pile(void) {
	Symbole* aux=pile;
	printf("début de pile\n");
	while (aux) {
		printf("adresse : %d, id : %s, type : %s, depth : %d, tmp : %c \n",aux->adresse,aux->id,aux->type,aux->depth,aux->tmp);
		aux=aux->suiv;
	}
	printf("fin de pile \n\n");
}

int last(void){
	//depiler();
	return adresse-1;
} 
/*
int main(){
	init_pile();
	display_pile();
	empiler("a",'i',0,'0');
	display_pile();
	empiler("afhjzhfuahf",'f',1,'1');
	display_pile();
	empiler("b",'f',1,'0');
	display_pile();
	depiler();
	display_pile();
	return 0;
}*/

