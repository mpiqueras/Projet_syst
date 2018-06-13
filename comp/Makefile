all : compiler

lex.yy.c : compiler.l
	./flex compiler.l
	
compiler.tab.c : compiler.y
	~/bison/bin/bison -d -v compiler.y
	
compiler : compiler.tab.c lex.yy.c
	gcc -o compiler lex.yy.c compiler.tab.c table_des_symboles.c tabInstructions.c libfl.a ~/bison/lib/liby.a
	
test : compiler
	./compiler < test.txt
