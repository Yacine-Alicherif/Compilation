%{
	open AST
%}

%token <int> NOMBRE
%token <float> FLOAT
%token PLUS MOINS FOIS GPAREN DPAREN EOL MOD

%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS

%type <AST.expression_a> main expression
%start main
%%
main:
	expression EOL	{ $1 }

;

expression:
	expression PLUS expression	{ Plus ($1,$3) }
	| expression MOINS expression	{ Moins($1,$3) }
	| expression FOIS expression	{ Mult($1,$3) }
	| expression MOD expression	{ Mod($1,$3)}
	| GPAREN expression DPAREN	{ $2 }
	| MOINS expression %prec UMOINS	{ Neg $2 }
	| NOMBRE { Num $1 }
	| FLOAT { Flo $1 }
; 
	
