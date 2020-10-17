program laba_1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const N = 1000;
      M = 200;

type zap=record
  num: integer;
  str: string;
  src: boolean;
end;
  Tmas=array[1..N] of zap;
  SMas=array[1..3, 1..27] of integer;
  CheckFunc = Function (a: Tmas; b:integer; c: integer; d: string): boolean;

Procedure Divide;
begin
 writeln;
 writeln('-------------------------------------------------------------------');
 writeln('|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
 writeln('-------------------------------------------------------------------');
end;

Procedure Output(_Arr:Tmas);
var i:integer;
begin
 for i := 1 to N do
   with _Arr[i] do
    Writeln(num:5, str:15, src:9);
 Divide;
end;

Procedure Filling(var _Arr:Tmas);
var i,k:integer;
begin
  k:=1;
  for i := 1 to N do
  begin
    _Arr[i].num:=Random(M+1);
    _Arr[i].str:='my_test_'+IntToStr(k);
    _Arr[i].src:=false;
    inc(k);
  end;
end;

Procedure Swap (var a, b:zap);
var temp:zap;
begin
 temp:=a;
 a:=b;
 b:=temp;
end;


Procedure SortStr(var _Arr:Tmas);
var i:integer;
    f: boolean;
begin
  f:=true;
  while f do
  begin
    f:=false;
    for i:=1 to N-1 do
    begin
      if _Arr[i].str>_Arr[i+1].str then
      begin
        Swap(_Arr[i],_Arr[i+1]);
        f:=true;
      end;
    end;
  end;
end;

Procedure SortNum(var _Arr:Tmas);
var i:integer;
    f: boolean;
begin
  f:=true;
  while f do
  begin
    f:=false;
    for i:=1 to N-1 do
    begin
      if (_Arr[i].num>_Arr[i+1].num) then
      begin
        Swap(_Arr[i],_Arr[i+1]);
        f:=true;
      end;
    end;
  end;
end;

Procedure SrcOutN (var _Arr:Tmas; _lim, _field:integer);
begin
  while _arr[_lim].num=_field do
  begin
    dec(_lim);
    _arr[_lim].src:=true;
  end;
  while (_arr[_lim+1].num=_field) and (_lim<1000) do
  begin
    inc(_lim);
    with _Arr[_lim] do
      Writeln('Your line: ', num:5, str:15, src:9);
  end;
end;

Function ChkNH (_Arr:Tmas; _lim, _field:integer; a:string):boolean;
begin
  if _arr[_lim].num<_field then
    result:=true
  else
    result:=false;
end;

Function ChkNE (_Arr:Tmas; _lim, _field:integer; a:string):boolean;
begin
  if _arr[_lim].num=_field then
    result:=true
  else
    result:=false;
end;

Function ChkSH (_Arr:Tmas; _lim, a:integer; _field:string):boolean;
begin
  if _arr[_lim].str<_field then
    result:=true
  else
    result:=false;
end;

Function ChkSE (_Arr:Tmas; _lim,a:integer; _field:string):boolean;
begin
  if _arr[_lim].str=_field then
    result:=true
  else
    result:=false;
end;

Function Check(src_field: string):boolean;
var i: integer;
begin
  result:=true;
  i:=1;
  if src_field<>'' then
    while (i<=length(src_field)) and result do
    begin
      if not (src_field[i] in ['0'..'9'])  then
        result:=false;
      inc(i);
    end
  else
    result:=false;
end;

Procedure Search(var _Arr:Tmas; src_field:string; ChkH, ChkE:CheckFunc; blo:boolean);
var L_lim,r_lim, range, src_field_num:integer;
    f: boolean;
begin
  if Copy(src_field,1,8)='my_test_' then
    src_field_num:=-1
  else
  begin
    if check(src_field) then
      src_field_num:=StrToInt(src_field)
    else
     src_field_num:=-1;
  end;
  f:=true;
  if Blo then
  begin
   range:=Round(sqrt(N));
   r_lim:=range;
   l_lim:=1;
   while f and (r_lim<>l_lim) do
   begin
    _Arr[r_lim].src:=true;
    if ChkE(_Arr,r_lim, src_field_num, src_field) then
      f:=false
    else
    begin
      if ChkH(_Arr,r_lim,src_field_num, src_field) then
      begin
        if r_lim+range<=N then
        begin
          l_lim:=l_lim+range;
          r_lim:=r_lim+range
        end
        else
        begin
          l_lim:=r_lim;
          r_lim:=N;
        end;
      end
      else
      begin
        range:=Round(sqrt(range));
        if range>1 then
          r_lim:=l_lim+range-1
        else
        begin
         r_lim:=l_lim;
         _Arr[r_lim].src:=True;
         if ChkE(_Arr,r_lim, src_field_num, src_field) then
           f:=false;
        end;
      end;
    end;
   end;
  end
  else
  begin
    r_lim:=N;
    l_lim:=1;
    range:=-1;
    while f and (r_lim<>range) and (l_lim<>range) do
    begin
      range:=(l_lim+r_lim) div 2;
      if ChkE(_Arr,range, src_field_num, src_field) then
        f:=false
      else
      begin
        if ChkH(_Arr,range, src_field_num, src_field) then
          l_lim:=range+1
        else
          r_lim:=range-1;
       end;
      _Arr[range].src:=true;
    end;
    r_lim:=range;
  end;
  if f then
    writeln('no matches')
  else
  begin
    if src_field_num=-1 then
      with _Arr[r_lim] do
        Writeln('Your line: ', num:5, str:15, src:9)
    else
    begin
      SrcOutN(_Arr,r_lim, src_field_num);
    end;
  end;
end;


Function CountTrues(_Arr:Tmas):integer;
var i: integer;
begin
  result:=0;
  for i := 1 to N do
    if _Arr[i].src=True then
      inc(result);
end;

Procedure SetFalses(var _Arr:Tmas);
var i:integer;
begin
  for i := 1 to N do
    _Arr[i].src:=false;
end;

Procedure Pause;
begin
  writeln('Tap to continue');
  readln;
end;


Procedure CompLine(f:boolean; var _S:Smas; _i,_trues: integer);
begin
  if f then
    _s[1,_i]:=_trues
  else
    _s[2,_i]:=_trues;
end;

Procedure TableFill(var TF_S:Smas;_Arr:Tmas;var TF_j:integer;TF_i:integer);
var k:integer;
begin
  for k := TF_i to TF_i+8 do
  begin
    Search(_Arr,'my_test_'+inttostr(k),ChkSH,ChkSE, True);
    CompLine(True, TF_S, TF_j , CountTrues(_Arr));
    SetFalses(_Arr);
    Search(_Arr,'my_test_'+inttostr(k),ChkSH,ChkSE, False);
    CompLine(False, TF_S, TF_j, CountTrues(_Arr));
    SetFalses(_Arr);
    inc(TF_j);
  end;
end;


Procedure TableSegment(_S:Smas; TS_i:integer);
var j,k:integer;
begin
  for k := TS_i to TS_i+8 do
  begin
    for j := 1 to 2 do
     write('|',_S[j,k]:6,'|');
    if _S[1,k]>_S[2,k] then
     write('|Binary is better on ', Round(100/(_S[2,k]/_S[1,k])-100):3, ' percents', '|':2)
    else
    begin
      if _S[1,k]<_S[2,k] then
       write('|Block is better  on ', Round(100/(_S[1,k]/_S[2,k])-100):3, ' percents','|':2)
      else
       write('|equalent results', '|':18);
    end;
    writeln;
  end;
end;

Procedure Table(T_s:Smas);
begin
  writeln('|','String Search':25, '|':25);
  writeln('|Block ||Binary||','Conclusion':19,'|':15);
  writeln('|','111-119':11, '||':5,'|':34);
  TableSegment(T_s, 1);
  writeln('|','511-519':11, '||':5,'|':34);
  TableSegment(T_s,9);
  writeln('|','991-999':11, '||':5,'|':34);
  TableSegment(T_s,19);
end;

var Arr: Tmas;
    j: integer;
    S: SMas;
    s_f:string;

begin
  Randomize;
  Filling(Arr);
  Output(Arr);
  Pause;
  SortStr(Arr);
  Output(Arr);
  write('Block Search String: ');
  readln(s_f);
  Search(Arr,s_f,ChkSH,ChkSE, True);
  Divide; Pause;
  Output(Arr);
  Pause;
  writeln('You have ', CountTrues(Arr), ' trues');
  SetFalses(Arr);
  Divide;
  write('Binary Search String: ');
  readln(s_f);
  Search(Arr,s_f,ChkSH,ChkSE, False);
  Divide; Pause;
  Output(Arr);
  Pause;
  writeln('You have ', CountTrues(Arr), ' trues');
  SetFalses(Arr);
  Divide; Pause;
  SortNum(Arr);
  output(Arr);
  write('Block Search Number: ');
  readln(s_f);
  Search(Arr,s_f,ChkNH,ChkNE, True);
  Divide; Pause;
  Output(Arr);
  Pause;
  writeln('You have ', CountTrues(Arr), ' trues');
  SetFalses(Arr);
  Divide;
  write('Binary Search Number: ');
  readln(s_f);
  Search(Arr,s_f,ChkNH,ChkNE, False);
  Divide; Pause;
  Output(Arr);
  writeln('You have ', CountTrues(Arr), ' trues');
  SetFalses(Arr);
  Divide; Pause;
  SortStr(Arr);
  j:=1;
  TableFill(S,Arr,j,111);
  TableFill(S,Arr,j,511);
  TableFill(S,Arr,j,991);
  divide;
  Table(s);
  readln;
end.
