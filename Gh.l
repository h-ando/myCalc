numb	[0-9]+
reg	S[0-9]
%%
{numb}	{ sscanf(yytext, "%d", &yylval);
	  return NUMBER; }
{reg}	{ sscanf(yytext, "S%d", &yylval);
	  return REGISTER; }
\+	{ return PLUS; }
\-	{ return MINUS; }
\*	{ return ASTERISK; }
\/	{ return SLASH; }
\(	{ return LP; }
\)	{ return RP; }
\n	{ return EOLN; }
([ ]|\t)*	{ /* nop */ }
%%
