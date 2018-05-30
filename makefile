# Makefile
Gh:	y.tab.c
	$(CC) y.tab.c -ly -ll -o Gh
y.tab.c:	Gh.y lex.yy.c
	$(YACC) Gh.y
lex.yy.c:	Gh.l
	$(LEX) Gh.l
