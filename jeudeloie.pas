Program Jeu_de_loie;

USES crt;

Const	depart=0;
		fin=66;
		double=9;
		pas_double=63;
		mort=58;
		min=2;
		max=12;
VAR des, cpt, place: INTEGER;

BEGIN
	clrscr;
	randomize;
	//initialistion des variables
	des:=9;
	place:=0;
	cpt:=1;

	Writeln ('Appuyez sur entrer pour commencer le jeu');
	readln;
	Writeln ('Ainsi que pour aller a l etape suivante');
	readln;
	Writeln ('Vous commencez a la case depart numeros:',depart);
	readln;

	//1 tour de boucle vaut 1 tour de jeu
	REPEAT
		clrscr;
		Writeln ('debut du tour:',cpt);
		readln;
		Writeln ('lancez des 2 des');
		// boucle de verif de l'aléatoire
		REPEAT
			des:= random(max+1);
		UNTIL (des>=2);
		Writeln ('obtenu:',des);
		readln;
		place:=(place+des);
		Writeln ('Vous allez a la case:', place);
		readln;

		IF (place Mod double = 0) AND (place <> pas_double) THEN // verif si c'est un multiple de 9
		BEGIN
			place:=place+des; // En réajoutant la valeur des dès, cela équivaut à les doubler
			Writeln ('Votre jet est double, donc vous allez a la case:', place);
			readln;
		END;

		IF (place=mort) THEN
		BEGIN
			place:=0;
			Writeln ('Vous etes sur la case tete de mort');
			Writeln ('Retour à la case depart');
			readln;
		END;

		// si le deplacement depasse la derniere case
		IF (place>fin) THEN 
		BEGIN
			Writeln ('Mais comme cela depasse de la case finale de:', (place-fin));
			place:=(place-(place-fin)*2); // soustrait le surplus
			Writeln ('Alors vous allez a la case:',place);
			readln;
		END;
		cpt:=cpt+1;	
		Writeln ('fin du tour numeros:',cpt-1);
		readln;
	UNTIL (place=fin); // quand le joueur arrive à la case finale 
	Writeln ('Le jeu est fini');
	Writeln ('Vous avez gagne en',' ', cpt,' ','tours');
	readln;
END.




