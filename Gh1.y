%start	S
%token	EOLN NUMBER REGISTER PLUS
%%
S	: S PLUS T
	| T
	;
T	: F
	;
F	: NUMBER
	| REGISTER
	;
%%
#include "lex.yy.c"
