(* fichier main.ml *)

(* evaluation expression *)

let rec eval (exp:AST.expression_a):float =
	match exp with
	| AST.Plus(g,d) -> (eval g) +. (eval d)
	| AST.Moins(g,d) -> (eval g) -. (eval d) 
	| AST.Mult(g,d) -> (eval g) *. (eval d)
	| AST.Div(g,d) -> (eval g) /. (eval d)
	| AST.Neg e -> (eval e)
	| AST.Num n -> n 


let _ =
	try
		let argc= Array.length Sys.argv in
		let lexbuf = if (argc == 2) then Lexing.from_channel (open_in Sys.argv.(1)) else
			Lexing.from_channel stdin in
		while true do
			Parseur.main Lexeur.token lexbuf
			|> eval |> (Printf.printf "%f\n");
			(*Format.printf "%a\n%!" AST.print_AST;*)
		done
		
	with
	| Lexeur.Eof -> exit 0
	| Lexeur.TokenInconu
	| Parsing.Parse_error -> Printf.printf("Ceci n'est pas une expression arithmetique\n")
	
	
