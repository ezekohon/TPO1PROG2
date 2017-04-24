unit LO_LeyendaMovil;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  _INICIO = 1;
  _FINALCOL = 60;
  _FINALFILA = 25;
  _RETARDO = 1000;
  _OBSTACULO = '#';



type
  rCol = _INICIO.._FINALCOL;
  rFila= _INICIO.._FINALFILA;
  tipoPos = record
                  fil: rFila;
                  col: rCol;
                  end;
  tipoPuntaje = 0..(_FINALCOL*_FINALFILA);
  tipoObstaculo = _INICIO..((_FINALCOL*_FINALFILA) div 8);
  tipoDatos = array[rFila, rCol] of char;
  tipoPalabra = array[1..15] of char;
  tipoControl = record
                      primeroL: tipoPos;
                      ultimoL: tipoPos;
                      primeroF: tipoPos;
                      ultimoF: tipoPos;
                      palabraMover: tipoPalabra;
                      palabraUbicada: tipoPalabra;
                      puntaje: tipoPuntaje;
                      cantObstaculos: tipoObstaculo;
                      posChar: tipoPos;
                      tiempoRet: integer;   //???
                      tipoObstaculo: char;  //???
                    end;
  tipoJuego = record
                    datos: tipoDatos;
                    control: tipoControl;
                end;
 var
   juego:tipoJuego;
   procedure crearJuego(var juego:tipoJuego; obst:tipoObstaculo; pal: tipoPalabra);
   procedure cargarJuego(var juego:tipoJuego);

implementation

procedure crearJuego(var juego:tipoJuego; obst:tipoObstaculo; pal: tipoPalabra);
          begin
            juego.control.primeroF.fil:= _INICIO;
            juego.control.primeroF.col:= _INICIO;
            juego.control.ultimoF.fil:= _FINALFILA;
            juego.control.ultimoF.col:= _FINALCOL;
            juego.control.primeroL.fil:= _INICIO;
            juego.control.primeroL.col:= _INICIO;
            juego.control.ultimoL.fil:= _FINALFILA;
            juego.control.ultimoL.col:= _FINALCOL;
            juego.control.cantObstaculos:= obst; // n ingresado por user
            juego.control.puntaje:= 0;
            juego.control.palabraMover:= pal; //palabra ingresada por user
            juego.control.palabraUbicada:= '';
            end;

procedure cargarJuego(var juego:tipoJuego);  {ANDA}
          var cantObst: tipoObstaculo;
            pal: tipoPalabra;
            i, j, fRandom, cRandom:integer;
            car: char;
          begin
              {FALTAN CHEQUEAR COSAS}
             { llenar la matriz con espacios }
             for i:=juego.control.primeroL.fil to juego.control.ultimoL.fil do
                 begin
                      for j:= juego.control.primeroL.col to juego.control.ultimoL.col do
                          begin
                               juego.datos[i,j]:= ' ';
                          end;
                end;


            {distribuir los obs random
            distribuir las letras random}
             cantObst:= juego.control.cantObstaculos;
             pal:= juego.control.palabraMover;
             i:=1;
             //ubicando obstaculos
             while (i < cantObst) do
                 begin
                   randomize;
                   fRandom:= (Random(25)+1);
                   cRandom:= (Random(60)+1);
                   {FALTA CHEQUEAR QUE UNO NO QUEDE AL LADO DEL OTRO}
                   if (juego.datos[fRandom, cRandom] = ' ') and (fRandom <> 13)
                      then
                          begin
                               juego.datos[fRandom, cRandom]:= _OBSTACULO;
                                i:=i+1;
                          end;
                 end;
             j:= 1;
             //ubicando letras
             while (j < Length(pal)) do
                 begin
                     car:= pal[j];
                     randomize;
                     fRandom:= Random(24)+1;
                     cRandom:= Random(59)+1;
                     if (juego.datos[fRandom, cRandom] = ' ') and (juego.datos[fRandom, cRandom] <> _OBSTACULO)
                      then
                          begin
                               juego.datos[fRandom, cRandom]:= car;
                               j:=j+1;
                          end;
                 end;
         end;

end.

