%{
#include <stdio.h>
#include <string.h>

int s[10] = { 0 };
%}
%start	S
%token	EOLN PLUS MINUS ASTERISK SLASH PERCENT CIRCUMFLEX LP RP EQUAL
%token	NUMBER REGISTER
%%
S	: EOLN
	| Sent EOLN
	| Sent EOLN S
	;
Sent	: E
	  { printf("%d\n", $1); }
	| REGISTER EQUAL E
	  { printf("%d\n", s[$1] = $3); }
	;
E	: E PLUS T
	  { $$ = $1 + $3; }
	| E MINUS T
	  { $$ = $1 - $3; }
	| PLUS T
	  { $$ = +$2; }
	| MINUS T
	  { $$ = -$2; }
	| T
	  { $$ = $1; }
	;
T	: T ASTERISK F
	  { $$ = $1 * $3; }
	| T SLASH F
	  { $$ = $1 / $3; }
	| T PERCENT F
	  { $$ = $1 % $3; }
	| F
	  { $$ = $1; }
	;
F	: NUMBER
	  { $$ = $1; }
	| MINUS NUMBER
	  { $$ = -$2; }
	| REGISTER
	  { $$ = s[$1]; }
	| MINUS REGISTER
	  { $$ = -s[$2]; }
	| LP E RP
	  { $$ = $2; }
	;
%%
#include "lex.yy.c"
