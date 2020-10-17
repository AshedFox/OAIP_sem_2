program queens;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  N=8;

type
  TFerz = array[1..N] of Integer;
  TVert = array [1..N] of boolean;
  MDia = array [2..N*2] of boolean;
  SDia = array[1-N..N-1] of boolean;

var
  Vert: TVert;
  MD: MDia;
  SD: SDia;
  FerzArr: TFerz;
  Num:Byte;


procedure OutPut(FArr: TFerz);
var  i,j:integer;
begin
 writeln('+-----------------------+');
  Writeln('Variant ':15, Num+1);
  writeln('+-----------------------+');
  for i:=1 to N do
  begin
    for j := 1 to N do
    begin
      if (FArr[i] = j) then
        write('F':3)
      else
        write('*':3);
    end;
    writeln;
  end;
  Inc(num);
end;

procedure Mark(i,j:integer);
begin
  FerzArr[i] := j;
  Vert[j]:=false;
  MD[i+j]:=false;
  SD[i-j]:=false;
end;

procedure Remove(i,j:integer);
begin
  Vert[j]:=true;
  MD[i+j]:=true;
  SD[i-j]:=true;
end;

procedure tryFerz(i:integer);
var j:integer;
begin
  for j:=1 to N do
    if Vert[j] and MD[i+j] and SD[i-j] then
    begin
      Mark(i,j);
      if i<N then
        tryFerz(i+1)
      else
        OutPut(FerzArr);
      Remove(i,j);
    end;
end;

procedure Filling;
var
  i:integer;
begin
  for i:=1 to N do
    Vert[i]:=true;
  for i:=2 to N*2 do
    MD[i]:=true;
  for i:= (1-N) to (N-1) do
    SD[i]:=true;
end;

begin
  Filling;
  tryFerz(1);
  readln
end.
