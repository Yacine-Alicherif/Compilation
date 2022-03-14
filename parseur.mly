%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD

%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS

%type <unit> main expression
%start main
%%
main:
	expression PT_VIRG	{}
;

expression:
	expression PLUS expression	{}
	| expression MOINS expression	{}
	| expression FOIS expression	{}
	| expression MOD expression	{}
	| GPAREN expression DPAREN	{}
	| MOINS expression %prec UMOINS	{}
	| NOMBRE {}
;
