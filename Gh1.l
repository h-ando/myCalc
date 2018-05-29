numb	[0-9]+
reg	S[0-9]
%%
{numb}	{ return NUMBER; }
{reg}	{ return REGISTER; }
\+	{ return PLUS; }
([ ]|\t|\n)*	{ /* nop */ }
%%
