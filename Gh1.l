numb	[0-9]+
reg	S[0-9]
%%
{numb}	{ sscanf(yytext, "%d", &yylval);
	  return NUMBER; }
{reg}	{ sscanf(yytext, "S%d", &yylval);
	  return REGISTER; }
\+	{ return PLUS; }
\n	{ return EOLN; }
([ ]|\t)*	{ /* nop */ }
%%
