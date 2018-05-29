%start	S
%token	tA tB EOLN
%%
S	: tA B S
	| tA B
	| tB A S
	| tB A
	;
A	: tB A A
	| tA
	;
B	: tA B B
	| tB
	;
%%
#include "lex.yy.c"
