program QuickSort;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const N=2000;

type Tmas=array[1..N] of integer;


Procedure MasFill(var mas_: Tmas);   //���������� �������
var i:integer;
begin
 Randomize;
 for i:= 1 to N do
  mas_[i]:=Random(200);
end;

Procedure MasOut(var Mas:Tmas; len:integer);
var j:integer;
begin
    for j := 1 to len+1 do
      write(Mas[j], ' ');
    writeln;
end;


Procedure MasSwap(var a, b:integer);        //���� ���������
var temp: integer;
begin
 temp:=a;
 a:=b;
 b:=temp;
end;


Procedure MasInversion(var mas_:Tmas; len:integer);
var i: integer;
begin
  i:=1;
  while i<=len-i do
  begin
    MasSwap(mas_[i], mas_[len+1-i]);
    inc(i);
  end;
end;


Procedure BubSortUpg(var mas_:Tmas;var comp,swap,len:integer);
var i, j: integer;                                     // ������ � ������
    f: boolean;
begin
 comp:=0;
 swap:=0;
 i:=1;
 f:=true;
 while f do
 begin
   f:=false;
   for j:=1 to len-i do
   begin
     comp:=comp+1;
     if mas_[j]>mas_[j+1] then
     begin
       MasSwap(mas_[j], mas_[j+1]);
       swap:=swap+3;
       f:=true;
     end;
   end;
   inc(i);
 end;

end;

Procedure ShakeSort(var mas_: Tmas; var comp, swap, len:integer);
var L,R, i: integer;                                  //��������� ����������
begin
  L:=2;
  R:=len;
  swap:=0;
  comp:=0;
  while L<=R do
  begin
    for i := R downto L do
    begin
      comp:=comp+1;
      if mas_[i-1]>mas_[i] then
      begin
        MasSwap(mas_[i-1], mas_[i]);
        swap:=swap+1;
      end;
    end;
    inc(L);
    for i := L to R do
    begin
      comp:=comp+1;
      if mas_[i-1]>mas_[i] then
      begin
        MasSwap(mas_[i-1], mas_[i]);
        swap:=swap+3;
      end;
    end;
    dec(R);
  end;
end;

Procedure QSort(var A_Mas:Tmas; L,R:integer; var comp, swap:integer);
Procedure QuickSort(L,R:integer);
var i, j, x: integer;
begin
  i:=L; j:=R;
  X:=A_Mas[(L+R) div 2];
  repeat
    while A_Mas[i]<x do
    begin
      inc(comp);
      inc(i);
    end;
    while A_mas[j]>x do
    begin
      dec(j);
      inc(comp);
    end;
    comp:=comp+2;
    if i<=j then
    begin
      MasSwap(A_mas[i], A_mas[j]);
      swap:=swap+3;
      inc(i);
      dec(j);
    end;
  until i>j;
  if j>L then
    QuickSort(L,j);
  if i<R then
    QuickSort(i,R);
end;
begin
  comp:=0;
  swap:=0;
  QuickSort(L,R);
end;

Procedure Filling(Pmas:Tmas; leng: integer);
var Shake_mas, Bubble_mas, Quick_Mas:Tmas;
    compar_sk,swap_sk,compar_bub,swap_bub, compar_q, swap_q:integer;
begin
 Shake_mas:=Pmas;
 Bubble_mas:=Pmas;
 Quick_mas:=Pmas;
 BubSortUpg(Bubble_mas, compar_bub,swap_bub, leng);
 ShakeSort(Shake_mas,compar_sk,swap_sk,leng);
 QSort(Quick_mas, 1, leng, compar_q, swap_q);
 writeln('|  ',leng:4,' ��.  |             |            |             |            |             |            |');
 writeln('|','��������.':12,'|',compar_sk:13,'|',swap_sk:12,'|',compar_bub:13,'|',swap_bub:12,'|', compar_q:13,'|', swap_q:12, '|');
 writeln('|------------|-------------|------------|-------------|------------|-------------|------------|');

 BubSortUpg(Bubble_mas, compar_bub,swap_bub, leng);
 ShakeSort(Shake_mas,compar_sk,swap_sk,leng);
 QSort(Quick_mas, 1, leng, compar_q, swap_q);
 writeln('|  ',leng:4,' ��.  |             |            |             |            |             |            |');
 writeln('|','  ������.':12,'|',compar_sk:13,'|',swap_sk:12,'|',compar_bub:13,'|',swap_bub:12,'|', compar_q:13,'|', swap_q:12, '|');
 writeln('|------------|-------------|------------|-------------|------------|-------------|------------|');

 MasInversion(Bubble_mas, leng);
 MasInversion(Shake_mas, leng);
 MasInversion(quick_mas, leng);
 BubSortUpg(Bubble_mas, compar_bub,swap_bub, leng);
 ShakeSort(Shake_mas,compar_sk,swap_sk,leng);
 QSort(Quick_mas, 1, leng, compar_q, swap_q);
 writeln('|  ',leng:4,' ��.  |             |            |             |            |             |            |');
 writeln('|','������.���':12,'|',compar_sk:13,'|',swap_sk:12,'|',compar_bub:13,'|',swap_bub:12,'|', compar_q:13,'|', swap_q:12, '|');
 writeln('|------------|-------------|------------|-------------|------------|-------------|------------|');
end;

var mas: Tmas;
    k:integer;


begin
 writeln('-----------------------------------------------------------------------------------------------');
 writeln('|            |   ��������� ����������   |     ������ � ������     |        Quick Sort        |');
 writeln('|    ���     |--------------------------|--------------------------|--------------------------|');
 writeln('|  �������   |    �����    |    �����   |   �����     |    �����   |   �����     |    �����   |');
 writeln('|            |  ���������  |   �������  |  ���������  |   �������  | ���������   |   �������  |');
 writeln('|------------|-------------|------------|-------------|------------|-------------|------------|');
 MasFill(mas);

 k:=10;
 Filling(mas, k);

 k:=100;
 Filling(mas, k);

 k:=2000;
 Filling(mas, k);
 readln; readln;
end.
