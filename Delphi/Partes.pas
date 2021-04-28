unit Partes;

interface
type
  TParte = class
  public
    Tipo: integer; // Acumulador, funci�n, par�ntesis que abre, par�ntesis que cierra, operador, n�mero, variable
    Funcion: integer; // C�digo de la funci�n 1:seno, 2:coseno, 3:tangente, 4: valor absoluto, 5: arcoseno, 6: arcocoseno, 7: arcotangente, 8: logaritmo natural, 9: valor tope, 10: exponencial, 11: ra�z cuadrada, 12: ra�z c�bica
    Operador: char; // + suma - resta * multiplicaci�n / divisi�n ^ potencia
    Numero: double; // N�mero literal, por ejemplo: 3.141592
    UnaVariable: integer; // Variable algebraica */
    Acumulador: integer; { Usado cuando la expresi�n se convierte en piezas. Por ejemplo:
      							3 + 2 / 5  se convierte as�:
			      				|3| |+| |2| |/| |5|
      							|3| |+| |A|  A es un identificador de acumulador }
    Constructor Create(Tipo: integer; Funcion: integer; Operador: char; Numero: double; UnaVariable: integer);
  end;

implementation

Constructor TParte.Create(Tipo: integer; Funcion: integer; Operador: char; Numero: double; UnaVariable: integer);
begin
  self.Tipo := Tipo;
  self.Funcion := Funcion;
  self.Operador := Operador;
  self.Numero := Numero;
  self.UnaVariable := UnaVariable;
  self.Acumulador := 0;
end;
end.
