%token <int> NOMBRE
%token PLUS MOINS FOIS GPAREN DPAREN EOL MOD

%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS

%type <int> main expression
%start main
%%
main:
	expression EOL	{ $1 }

;

expression:
	expression PLUS expression	{ $1+$3 }
	| expression MOINS expression	{ $1-$3 }
	| expression FOIS expression	{ $1*$3 }
	| expression MOD expression	{ $1 mod $3}
	| GPAREN expression DPAREN	{ $2 }
	| MOINS expression %prec UMOINS	{ -$2 }
	| NOMBRE { $1 }

;
