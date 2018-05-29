%{
#include <stdio.h>
#include <string.h>

int s[10] = { 0 };
%}
%start	S
%token	EOLN PLUS EQUAL
%token	NUMBER REGISTER
%%
S	: EOLN
	| Sent EOLN
	| Sent EOLN S
	;
Sent	: E
	  { printf("%d\n", $1); }
	;
E	: E PLUS T
	  { $$ = $1 + $3; }
	| T
	  { $$ = $1; }
	;
T	: F
	  { $$ = $1; }
	;
F	: NUMBER
	  { $$ = $1; }
	;
%%
#include "lex.yy.c"
