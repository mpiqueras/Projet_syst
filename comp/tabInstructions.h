typedef struct Instruction
	{
	char* nom;
	int a;
	int b;
	int c;
	
	}Instruction;

void remplirTab(char* op,int a,int b);

void remplirTab2(char* op,int a,int b,int c);

int getTaille();

Instruction* getTab();

void majJump();

void majJump2();

void displayTab ();
