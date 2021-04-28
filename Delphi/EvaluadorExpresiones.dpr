program EvaluadorExpresiones;

{$APPTYPE CONSOLE}

{$R *.res}

uses
	System.SysUtils,
	Evaluador3 in 'Evaluador3.pas',
	EvaluaSintaxis in 'EvaluaSintaxis.pas',
	Partes in 'Partes.pas',
	Piezas in 'Piezas.pas';

	procedure UsoEvaluador;
	{	Una expresi�n algebraica:
		N�meros reales usan el punto decimal
		Uso de par�ntesis
		Las variables deben estar en min�sculas van de la 'a' a la 'z' excepto �
		Las funciones (de tres letras) son:
			Sen	Seno
			Cos	Coseno
			Tan	Tangente
			Abs	Valor absoluto
			Asn	Arcoseno
			Acs	Arcocoseno
			Atn	Arcotangente
			Log	Logaritmo Natural
			Cei	Valor techo
			Exp	Exponencial
			Sqr	Ra�z cuadrada
			Rcb	Ra�z C�bica
		Los operadores son:
			+ (suma)
			- (resta)
			* (multiplicaci�n)
			/ (divisi�n)
			^ (potencia)
		No se acepta el "-" unario. Luego expresiones como: 4*-2 o (-5+3) o (-x^2) o (-x)^2 son inv�lidas.
	}
	var
		expresion: string;
		evaluador: TEvaluador3;
		resultado: double;
		num: integer;
		valor: double;
		unError: integer;
	begin
		expresion := 'Cos(0.004 * x) - (Tan(1.78 /  k + h) * SEN(k ^ x) + abs (k^3-h^2))';

		//Instancia el evaluador
		evaluador := TEvaluador3.Create;

		Randomize;

		//Analiza la expresi�n (valida sintaxis)
		if evaluador.Analizar(expresion) then
		begin
			//Si no hay fallos de sintaxis, puede evaluar la expresi�n

			//Da valores a las variables que deben estar en min�sculas
			evaluador.DarValorVariable('k', 1.6);
			evaluador.DarValorVariable('x', -8.3);
			evaluador.DarValorVariable('h', 9.29);

			//Eval�a la expresi�n
			resultado := evaluador.Evaluar();
			WriteLn(resultado:15:10);

			//Eval�a con ciclos
			for num := 1 to 10 do
			begin
					valor := Random();
					evaluador.DarValorVariable('k', valor);
					resultado := evaluador.Evaluar();
					WriteLn(resultado:15:10);
				end;
			end
		else
		begin
			//Si se detect� un error de sintaxis
			for unError := 0 to Length(evaluador.Sintaxis.EsCorrecto) do
			begin
				//Muestra que error de sintaxis se produjo
				if evaluador.Sintaxis.EsCorrecto[unError] = false then
				begin
					WriteLn(evaluador.Sintaxis.MensajesErrorSintaxis(unError));
				end;
			end;
		end;
	end;

begin
	UsoEvaluador;
	ReadLn;
end.
