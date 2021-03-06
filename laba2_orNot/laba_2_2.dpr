program laba_2_2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
    formula = function (x:real):real;
    formula_x = function (a,h:real;i:integer):real;
var n : integer;

function FirstInt(x:real):real;
begin
  Result:=(sqrt(0.5*x+2))/(sqrt(2*x*x+1)+0.8);
end;

function SecondInt(x:real):real;
begin
  Result:=(1)/(sqrt(x*x+3.2));
end;

function ThirdInt(x:real):real;
begin
  Result:=(cos(0.8*x+1.2))/(1.5+sin(x*x+0.6));
end;

function FourthInt(x:real):real;
begin
  Result:=(x+1)*(sin(x));
end;

Function Liberal(a, h:real; i:integer):real;
begin
  result:=(a+i*h+h/2);
end;

Function Nacionalist(a, h:real; i :integer):real;
begin
 result:=(a+i*h);
end;

function Integral(integ : formula ; left, right, accur : real; method : boolean ) : real;
var i, c: integer;
    znachenie,h, prev_znach, x, sum:real;
    form_x : formula_x;
begin
  if method then
  begin
    c:=1;
    form_x:=Nacionalist;
  end
  else
  begin
    c:=0;
    form_x:=Liberal;
  end;
  n:=5;
  znachenie:=integ(left)*(right-left);
  repeat
    sum:=0;
    prev_znach:=znachenie;
    h:=(right-left)/n;
    for i :=c to n+c-1 do
    begin
      x:=form_x(left,h,i);
      sum:=sum+integ(x);
    end;
    znachenie:=sum*h;
    n:=n*2;
  until abs(prev_znach-znachenie) < accur;
  n:=n div 2;
  result:=znachenie;
end;

Procedure stroka (num:integer;Integ:Formula; a,b:real);
begin
  begin
    write('|     ', num,'-�', '    |',integral(integ,a,b,0.01,true):10:3,'|':8,N:4,' |');
    write(integral(integ,a,b,0.001,true):10:4,'|':8,N:4,' |');
    write(integral(integ,a,b,0.01,false):10:3,'|':8,N:4,' |');
    write(integral(integ,a,b,0.001,false):10:4,'|':8,N:4,' |');
    writeln;
  end;
end;


begin
  writeln('+------------------------------------------------------------------------------------------------------------+');
  writeln('|            |         ����� ������ ���������������          |       ����� ����������� ���������������       |');
  writeln('|            |-----------------------------------------------|-----------------------------------------------|');
  writeln('|            |       e=0.01          |       e=0.001         |       e=0.01          |        e=0.001        |');
  writeln('|            |-----------------------|-----------------------|-----------------------|-----------------------|');
  writeln('|            |     ��������    |  N  |     ��������    |  N  |     ��������    |  N  |      ��������   |  N  |');
  writeln('|------------|-----------------------------------------------------------------------------------------------|');
  stroka(1,FirstInt,0.4,1.2);
  stroka(2,SecondInt,1.2,2.7);
  stroka(3,ThirdInt,0.3,0.9);
  stroka(4,FourthInt,1.6,2.4);
  writeln('+------------------------------------------------------------------------------------------------------------+');
  readln;
end.

