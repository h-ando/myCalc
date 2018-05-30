# Makefile
Gh:	y.tab.c lex.yy.c
	$(CC) y.tab.c -ly -ll -o Gh
y.tab.c:	Gh.y
	$(YACC) Gh.y
lex.yy.c:	Gh.l
	$(LEX) Gh.l
