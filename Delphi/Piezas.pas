unit Piezas;

interface
type
  TPieza = class
  public
        ValorPieza: double; // Almacena el valor que genera la pieza al evaluarse
        Funcion: integer; // C�digo de la funci�n 1:seno, 2:coseno, 3:tangente, 4: valor absoluto, 5: arcoseno, 6: arcocoseno, 7: arcotangente, 8: logaritmo natural, 9: valor tope, 10: exponencial, 11: ra�z cuadrada, 12: ra�z c�bica
        TipoA: integer; // La primera parte es un n�mero o una variable o trae el valor de otra pieza
        NumeroA: double; // Es un n�mero literal
        VariableA: integer; // Es una variable
        PiezaA: integer; // Trae el valor de otra pieza
        Operador: char; // + suma - resta * multiplicaci�n / divisi�n ^ potencia
        TipoB: integer; // La segunda parte es un n�mero o una variable o trae el valor de otra pieza
        NumeroB: double; // Es un n�mero literal
        VariableB: integer; // Es una variable
        PiezaB: integer; // Trae el valor de otra pieza
        Constructor Create(Funcion: integer; TipoA: integer; NumeroA: double; VariableA: integer; PiezaA: integer; Operador: char; TipoB: integer; NumeroB: double; VariableB: integer; PiezaB: integer);
  end;

implementation

Constructor TPieza.Create(Funcion: integer; TipoA: integer; NumeroA: double; VariableA: integer; PiezaA: integer; Operador: char; TipoB: integer; NumeroB: double; VariableB: integer; PiezaB: integer);
begin
  self.Funcion := Funcion;

  self.TipoA := TipoA;
  self.NumeroA := NumeroA;
  self.VariableA := VariableA;
  self.PiezaA := PiezaA;

  self.Operador := Operador;

  self.TipoB := TipoB;
  self.NumeroB := NumeroB;
  self.VariableB := VariableB;
  self.PiezaB := PiezaB;
end;

end.
