%{
#include <stdio.h>
#include <string.h>

int s[10] = { 0 };
int i, n, res;
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
E	: E PLUS T0
	  { $$ = $1 + $3; }
	| E MINUS T0
	  { $$ = $1 - $3; }
/*
	| PLUS T0
	  { $$ = +$2; }
	| MINUS T0
	  { $$ = -$2; }
*/
	| T0
	  { $$ = $1; }
	;
T0	: T0 ASTERISK T1
	  { $$ = $1 * $3; }
	| T0 SLASH T1
	  { $$ = $1 / $3; }
	| T0 PERCENT T1
	  { $$ = $1 % $3; }
	| T1
	  { $$ = $1; }
	;
T1	: T1 CIRCUMFLEX F0
	  { 
	    n = $1, res = 1;
	    
	    for (i = 1; i <= $3; i <<= 1) {
	      
	      if ($3 & i) {
	        res *= n;
	      }
	      
	      n *= n;
	    }
	    
	    $$ = res;
	  }
	| F0
	  { $$ = $1; }
	;
F0	: F1
	  { $$ = $1; }
	| MINUS F1
	  { $$ = -$2; }
	;
F1	: NUMBER
	  { $$ = $1; }
	| REGISTER
	  { $$ = s[$1]; }
	| LP E RP
	  { $$ = $2; }
	;
%%
#include "lex.yy.c"
