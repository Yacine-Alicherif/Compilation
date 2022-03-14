(* fichier main.ml *)
let _ =
	try
		let argc= Array.length Sys.argv in
		let lexbuf = if (argc == 2) then Lexing.from_channel (open_in Sys.argv.(1)) else
			Lexing.from_channel stdin in
		while true do
		
			Parseur.main Lexeur.token lexbuf
			|> Printf.printf "%i\n%!";

		done
		
	with
	| Lexeur.Eof -> exit 0
	| Lexeur.TokenInconu
	| Parsing.Parse_error -> Printf.printf("Ceci n'est pas une expression arithmetique\n")
	
