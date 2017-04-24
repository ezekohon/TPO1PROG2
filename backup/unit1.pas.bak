unit unit1;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, LO_LeyendaMovil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  var juego: tipoJuego;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  pal: tipoPalabra;
  obst: tipoObstaculo;
  i, j: integer;
begin
    //capturar palabra y obst
    pal:= edit1.Text;
    obst:= StrToInt(edit2.Text);
    crearJuego(juego, obst, pal);
    cargarJuego(juego);  {el problema es aca}
    //llenar el stringgrid con la matriz



    {while (i < juego.control.ultimoL.fil) do
          begin
              if j < _FINALCOL
                 then
                     begin
                         StringGrid1.Cells[i-1, j-1]:= juego.datos[i,j];
                         j:= j+1;
                     end
                 else
                     begin
                       i:=i+1;
                       j:=1;
                     end;

          end;
      }
                                            //no cambiar como se llena el stringgrid
      for i:=0 to 24 do                     //ahora esta bien
              for j:=0 to 59 do
                       StringGrid1.Cells[j,i]:= juego.datos[i+1,j+1];


       //StringGrid1.Cells[4, 22]:= 'r'; //ESTA ES LA EXCEPCION
end;

end.

