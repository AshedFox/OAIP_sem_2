program binomial;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Math;

const N=2020;

type Tmas=array[0..N] of Extended;

var Mas:Tmas;
    Mas2:Tmas;

function C(i:integer):Extended;
begin
  case i of
    0:
      result:=2;
    1:
      result:=(-4);
    else
      result:= 111-(1130/Mas[i-1])+(3000/(Mas[i-1]*Mas[i-2]));
  end;
end;

procedure Count;
var i:integer;
    buf:extended;
begin
  i:=0;
  while (i<=2020) do
  begin
    Mas[i]:=C(i);
    writeln(Mas2[i]:25:10);
    inc(i);
  end;
  writeln(99999999999999999999981672.0000000000037488629343360005937898707645*2020:100:20);
end;
Procedure MasFill(var Mas:Tmas);
var
  i: Integer;
begin
  for i := 0 to 2020 do
    Mas[i]:=0;
end;

begin
  MasFill(Mas);
  Count;
  readln;
end.
