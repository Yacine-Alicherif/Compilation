(* fichier main.ml *)
let _ =
	try
		let lexbuf = Lexing.from_channel stdin in
		while true do
			Parseur.main Lexeur.token lexbuf
			|> Printf.printf "%i\n%!";
		done
	with
	| Lexeur.Eof -> exit 0
	| Lexeur.TokenInconu
	| Parsing.Parse_error -> Printf.printf("Ceci n'est pas une expression arithmetique\n")
