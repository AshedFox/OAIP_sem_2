program laba_4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const N=7;

type TDish = record
       DiCode:string[10];
       DiName: string[60];
       DiCat: string[30];
       DiCost: real;
     end;
     TDiRecAdr = ^TDiRec;
     TDiRec = record
       DiInfo: TDish;
       DiAdr: TDiRecAdr;
     end;

     TOrder = record
       OrCode: string[16];
       TaCode: string[5];
       OrDiCode: string[10];
       Amount: integer;
     end;
     TOrRecAdr = ^TOrRec;
     TOrRec = record
       OrInfo: TOrder;
       OrAdr: TOrRecAdr;
     end;
     TDiFile = file of TDish;
     TOrFile = file of TOrder;

     TCategories=array [1..N] of string[20];

var HeadDi, CurDi: TDiRecAdr;
    HeadOr, CurOr: TOrRecAdr;
    Cats: TCategories=('Salads', 'Hell', 'High cuisine', 'Economic', 'Appetizers', 'Drinks', 'Desserts');
    DiFile: TDiFile;
    OrFile: TOrFile;


Procedure OpenFile;
var
    s: string;
    i: integer;
    choise: integer;
    CurDi: TDiRecAdr;
    CurOr: TOrRecAdr;
    OpenChoise: boolean;
begin
  OpenChoise:=True;
  while OpenChoise do
  begin
  writeln('+------------------------------+');
  writeln('What files do you what to open?');
  writeln('1. Open list of dishes.');
  writeln('2. Open list of orders.');
  writeln('3. Open both files.');
  writeln('4. Go back.');
  writeln('+------------------------------+');
  readln(choise);
   case Choise of
    1:
    begin
      AssignFile(DiFile,'DishList.txt');
      New(HeadDi);
      CurDi:=HeadDi;
      CurDi^.DiAdr:=nil;
      if FileExists('DishList.txt') then
      begin
        Reset(DiFile);
        i:=0;
        while not (EOF(DiFile)) do
        begin
          seek(DiFile, i);
          New(CurDI^.DiAdr);
          CurDi:=CurDi^.DiAdr;
          Read(DiFile, CurDi^.DiInfo);
          CurDi^.DiAdr:=nil;
          inc(i);
        end;
        writeln('File has been succesfully opened');
      end
      else
      begin
        repeat
          writeln('There is no search file here');
          writeln('Create?  (yes/no)');
          readln(s);
          if s='yes' then
          begin
            Rewrite(DiFile);
            writeln('File has been succesfully created');
          end
          else
          if s<>'no' then
            writeln('incorrect input');
        until (s='no') or (s='yes');
      end;
      closeFile(DiFile);
    end;
    2:
    begin
      Assign(OrFile,'OrderList.txt');
      New(HeadOr);
      CurOr:=HeadOr;
      CurOr^.OrAdr:=nil;
      if FileExists('OrderList.txt') then
      begin
        Reset(OrFile);
        i:=0;
        while not (EOF(OrFile)) do
        begin
          seek(OrFile, i);
          New(CurOr^.OrAdr);
          CurOr:=CurOr^.OrAdr;
          Read(OrFile, CurOr^.OrInfo);
          CurOr^.OrAdr:=nil;
          inc(i);
        end;
        writeln('File has been succesfully opened');
      end
      else
      begin
        repeat
          writeln('There is no search file here');
          writeln('Create?  (yes/no)');
          readln(s);
          if s='yes' then
          begin
            Rewrite(OrFile);
            writeln('File has been succesfully created');
          end
          else
          if s<>'no' then
            writeln('incorrect input');
        until (s='no') or (s='yes');
      end;
      CloseFile(OrFile);
    end;
    3:
    begin
      Assign(DiFile,'DishList.txt');
      New(HeadDi);
      CurDi:=HeadDi;
      CurDi^.DiAdr:=nil;
      if FileExists('DishList.txt') then
      begin
        Reset(DiFile);
        i:=0;
        while not (EOF(DiFile)) do
        begin
          seek(DiFile, i);
          New(CurDI^.DiAdr);
          CurDi:=CurDi^.DiAdr;
          Read(DiFile, CurDi^.DiInfo);
          CurDi^.DiAdr:=nil;
          inc(i);
        end;
        writeln('Dishes file has been succesfully opened');
      end
      else
      begin
        repeat
          writeln('There is no search file here');
          writeln('Create dishes file?  (yes/no)');
          readln(s);
          if s='yes' then
          begin
            Rewrite(DiFile);
            writeln('Dishes file has been succesfully created');
          end
          else
          if s<>'no' then
            writeln('Incorrect input');
        until (s='no') or (s='yes');
      end;
      CloseFile(DiFile);
      ///////////////////////////////////////////////////////////
      Assign(OrFile,'OrderList.txt');
      New(HeadOr);
      CurOr:=HeadOr;
      CurOr^.OrAdr:=nil;
      if FileExists('OrderList.txt') then
      begin
        Reset(OrFile);
        i:=0;
        while not (EOF(OrFile)) do
        begin
          seek(OrFile, i);
          New(CurOr^.OrAdr);
          CurOr:=CurOr^.OrAdr;
          Read(OrFile, CurOr^.OrInfo);
          CurOr^.OrAdr:=nil;
          inc(i);
        end;
        writeln('Orders file has been succesfully opened');
      end
      else
      begin
        repeat
          writeln('There is no search file here');
          writeln('Create orders file?  (yes/no)');
          readln(s);
          if s='yes' then
          begin
            Rewrite(OrFile);
            writeln('Orders file has been succesfully created');
          end
          else
          if s<>'no' then
            writeln('Incorrect input');
        until (s='no') or (s='yes');
      end;
      CLoseFile(OrFile);
    end;
    4:
      OpenChoise:=False
    else
      writeln('Incorrect input, try again or go back.');
   end;
  end;
end;


Procedure ShowData;
var CurDi: TDiRecAdr;
    CurOr: TOrRecAdr;
    choise: integer;
    ExChoise: boolean;
begin
  ExChoise:=True;
  while ExChoise do
  begin
    writeln('+------------------------------------+');
    writeln('1. Show dishes data ');
    writeln('2. Show orders data ');
    writeln('3. Go back ');
    writeln('+------------------------------------+');
    readln(choise);
    writeln('+------------------------------------+');
    case choise of
     1:
     begin
      if HeadDi.DiAdr<>nil then  ////////
      begin
       writeln('+--------------------------------------------------------------------------------------------------------------------+');
       writeln('|','Dish code':10,'|','Name':60,'|','Category':30,'|','Price':12,'|');
       writeln('+--------------------------------------------------------------------------------------------------------------------+');
       CurDi:=HeadDi;
       while CurDi^.DiAdr<>nil do
       begin
        with (CurDi^.DiAdr.DiInfo) do
          writeln('|', DiCode:10,'|', DiName:60,'|', DiCat:30,'|', DiCost:12:2,'|');
        CurDi:=CurDi^.DiAdr;
        writeln('+--------------------------------------------------------------------------------------------------------------------+');
       end;
      end
      else
        writeln('Your Dishes List is Empty');
     end;
     2:
     begin
      if headOr.OrAdr<>nil then    ////////
      begin
        writeln('+-----------------------------------------+');
        writeln('|','Order code':16,'|','Table','|','Dish Code':10,'|','Amount', '|');
        writeln('+-----------------------------------------+');
        CurOr:=HeadOr;
        while CurOr^.OrAdr<>nil do
        begin
          with (CurOr^.OrAdr^.OrInfo) do
            writeln('|',OrCode:16,'|', TaCode:5,'|', OrDiCode:10,'|', Amount:6, '|');
          CurOr:=CurOr^.OrAdr;
          writeln('+-----------------------------------------+');
        end;
      end
      else
        writeln('Your Orders List is Empty');
     end;
     3:
       ExChoise:=False
     else
       writeln('Incorrect input, try again or go back');
    end;
  end;
end;

Function CheckDiCode(Check_info:string):boolean;
var CurDi: TDiRecAdr;
begin
  result:=false;
  CurDi:=HeadDi;
  while (CurDi <> nil) and (not result) do
  begin
    if CurDi^.DiInfo.DiCode=Check_info then
      result:=true;
    CurDi:=CurDi^.DiAdr;
  end;
end;

Function CheckDiName(Check_info:string):boolean;
var CurDi: TDiRecAdr;
begin
  result:=false;
  CurDi:=HeadDi;
  while (CurDi <> nil) and (not result) do
  begin
    if UpperCase(CurDi^.DiInfo.DiName)=UpperCase(Check_info) then
      result:=true;
    CurDi:=CurDi^.DiAdr;
  end;
end;

Function CheckOrCode(Check_info:string):boolean;
var CurOr: TOrRecAdr;
begin
  result:=false;
  CurOr:=HeadOr;
  while (CurOr <> nil) and (not result) do
  begin
    if CurOr^.OrInfo.OrCode=Check_info then
      result:=true;
    CurOr:=CurOr^.OrAdr;
  end;
end;

Function CheckOrOrTaCode(Check_info, Table:string):boolean;
var CurOr: TOrRecAdr;
begin
  result:=false;
  CurOr:=HeadOr;
  while (CurOr <> nil) and (not result) do
  begin
    if CurOr^.OrInfo.OrCode=Check_info then
      if CurOr^.OrInfo.TaCode=Table then
        result:=True;
    CurOr:=CurOr^.OrAdr;
  end;
end;

Function CheckDiOrCode(Check_info:string):boolean;
var CurOr:TOrRecAdr;
begin
  result:=false;
  CurOr:=HeadOr;
  while (CurOr <> nil) and (not result) do
  begin
    if CurOr^.OrInfo.OrDiCode=Check_info then
      result:=true;
    CurOr:=CurOr^.OrAdr;
  end;
end;


Function CheckDiOrCodeName(Check_info:string):Boolean;
var CurDI:TDIRecAdr;
begin
  result:=false;
  CurDi:=HeadDi;
  while (CurDi <> nil) and (not result) do
  begin
    if UpperCase(CurDi^.DiInfo.DiName)=UpperCase(Check_info) then
      if CheckDIOrCode(CurDi^.DiInfo.DiCode) then
        result:=True;
    CurDi:=CurDi^.DiAdr;
  end;
end;

Function CheckDiCodeOrCode(DishCode, OrderCode:string):Boolean;
begin
  result:=false;
  CurOr:=HeadOr;
  while (CurOr <> nil) and (not result) do
  begin
    if CurOr^.OrInfo.OrCode=OrderCode then
      if CurOr^.OrInfo.OrDiCode=DishCode then
        result:=true;
    CurOr:=CurOr^.OrAdr;
  end;
end;

Procedure FillOrder(OrderCode, DishCode, TCode:string; OrAm:integer);
var Flaq:boolean;
    CurDi:TDIRecAdr;
    CuOr: TOrRecAdr;
begin
  Flaq:=false;
  CurOr:=HeadOr;
  while (CurOr.OrAdr <> nil) and (not Flaq) do
  begin
    CurOr:=CurOr^.OrAdr;
    if CurOr^.OrInfo.OrCode=OrderCode then
      if CurOr^.OrInfo.OrDiCode=DishCode then
      begin
        writeln('You have dish with this code in this order, amount will be added to current');
        Flaq:=true;
        CurOr.OrInfo.Amount:=CurOr.OrInfo.Amount+OrAm;
      end;
  end;
  if not flaq then
  begin
    New(CurOr^.OrAdr);
    CurOr:=CurOr^.OrAdr;
    CurOr^.OrAdr:=nil;
    with CurOr.OrInfo do
    begin
      OrCode:=OrderCode;
      Amount:=OrAm;
      TaCode:=TCode;
      OrDiCode:=DishCode;
    end;
  end;

end;

Procedure AddData;
var CurDi: TDIRecAdr;
    CurOr: TOrRecAdr;
    OrderCode, DishCode, DishName,DishCost, TCode, ExAddChoise:string;
    choise,i, num, OrAm: integer;
    ExChoise, ExAdd, OrFlaq, DiFlaq, Flaq2: boolean;
begin
  ExChoise:=True;
  while ExChoise do
  begin
    writeln('+------------------------------------+');
    writeln('1. Add to Dishes list');
    writeln('2. Add to Orders list');
    writeln('3. Go back');
    writeln('+------------------------------------+');
    readln(choise);
    ExAdd:=True;
    case choise of
      1:
      begin
        CurDi:=HeadDi;
        while CurDi^.DiAdr<>nil do
          CurDi:=CurDi^.DiAdr;
        writeln('How much do you want to add (enter negative to add until you stop)?');
        readln(num);
        while ExAdd and (num<>0) do
        begin
          writeln('+------------------------------------+');
          writeln('Write Dish Code: ');
          readln(DishCode);
          writeln('+------------------------------------+');
          if DishCode<>'' then
          begin
            if CheckDiCode(DishCode) then
            begin
              writeln('You have dish with similar code, please, use another one');
              writeln('+------------------------------------+');
            end
            else
            begin
              DiFlaq:=False;
              while not DiFlaq do
              begin
                writeln('Write Dish Name: ');
                readln(DishName);
                writeln('+------------------------------------+');
                if DishName<>'' then
                begin
                  if CheckDiName(DishName) then
                  begin
                    writeln('You have dish with similar name, please, use another one');
                    writeln('+------------------------------------+');
                  end
                  else
                  begin
                    DiFlaq:=True;
                    New(CurDi^.DiAdr);
                    CurDi:=CurDi^.DiAdr;
                    CurDi^.DiAdr:=nil;
                    with CurDi^.DiInfo do
                    begin
                      DiCode:=DishCode;
                      DishName:=LowerCase(DishName);
                      DishName[1]:=UpCase(DishName[1]);
                      DiName:=DishName;
                      writeln('Choose and write Dish Category: ');
                      writeln('|Salads|', '|Hell|', '|High cuisine|', '|Economic|', '|Appetizers|', '|Drinks|', '|Desserts|');                
                      readln(DiCat);
                      writeln('+------------------------------------+');
                      Flaq2:=False;
                      i:=1;
                      while (i <= N) and not Flaq2 do
                      begin
                        if UpperCase(DiCat)=UpperCase(Cats[i]) then
                        begin
                          Flaq2:=True;
                          DiCat:=Cats[i];
                        end;
                        inc(i);
                      end;
                      if not Flaq2 then
                      begin
                        writeln('This category not exist, category will be marked as ''none''');
                        DiCat:='None';
                        writeln('+------------------------------------+');
                      end;
                      flaq2:=False;
                      while not Flaq2 do
                      begin
                        writeln('Write Dish Cost (it will be rounded to 2 decimal places)');
                        readln(DishCost);
                        DishCost := StringReplace(DishCost, '.', ',', [rfReplaceAll]);
                        writeln('+------------------------------------+');
                        if StrToFLoat(DishCost)>0 then
                        begin
                          DiCost:=Round(StrTOFloat(DishCost)*100)/100;
                          Flaq2:=True;
                          dec(num);
                          writeln('+------------------------------------+');
                          if num<>0 then
                          begin
                            writeln('End (yes/no)?');
                            ExAddChoise:='';
                            while (LowerCase(ExAddChoise)<>'yes') and (LowerCase(ExAddChoise)<>'no') do
                            begin
                              readln(ExAddChoise);
                              if LowerCase(ExAddChoise)='yes' then
                                ExAdd:=False
                              else
                                if LowerCase(ExAddChoise)<>'no' then
                                  writeln('incorrect input');
                            end;
                          end;
                        end
                        else
                        begin
                          writeln('Dish cost should be positive');
                          writeln('+------------------------------------+');
                        end;
                      end;
                    end;
                  end;
                end
                else
                begin
                  writeln('You''ve entered empty line');
                  writeln('+------------------------------------+');
                end;
              end;
            end;
          end
          else
          begin
            writeln('You''ve entered empty line');
            writeln('+------------------------------------+');
          end;
        end;
      end;
      2:
      begin
        if HeadDi.DiAdr <>nil then
        begin
         CurOr:=HeadOr;
         while CurOr^.OrAdr<>nil do
          CurOr:=CurOr^.OrAdr;
         writeln('How much do you want to add (enter negative to add until you stop)?');
         readln(num);
         while ExAdd and (num<>0) do
         begin
          writeln('+------------------------------------+');
          writeln('Write Order Code: ');      
          readln(OrderCode);
          writeln('+------------------------------------+');
          Flaq2:=False;
          while not Flaq2 do
          begin
            if CheckOrCode(orderCode) then
            begin
              CurOr:=HeadOr;
              while CurOr.OrInfo.OrCode<>OrderCode do
                CurOr:=CurOr.OrAdr;                               
              TCode:=CurOr.OrInfo.TaCode;
              writeln('Table code of this order is currently defined, it has been chosen automatically.');
            end
            else
            begin
              writeln('Write Table Number: ');
              readln(TCode);
            end;
            writeln('+------------------------------------+');
            if TCode<>'' then
            begin
              if StrToInt(TCode)>0 then
              begin                
                OrFlaq:=False;
                while not OrFlaq do
                begin
                  writeln('Write Dish Code');
                  readln(DishCode);
                  writeln('+------------------------------------+');
                  if DishCode<>'' then
                  begin
                    if CheckDiCode(DishCode) then
                    begin
                      OrFLaq:=True;
                      Flaq2:=False;
                      while not Flaq2 do
                      begin
                        writeln('Write Amount');
                        readln(OrAm);
                        writeln('+------------------------------------+');
                        if OrAm>0 then
                          Flaq2:=True
                          else
                        begin
                          writeln('Amount should be positive');
                          writeln('+------------------------------------+');
                        end;
                      end;
                      FillOrder(OrderCode, DishCode,TCode, OrAm);
                      dec(num);
                      writeln('+------------------------------------+');
                      if num<>0 then
                      begin
                        writeln('End (yes/no)?');
                        ExAddChoise:='';
                        while (LowerCase(ExAddChoise)<>'yes') and (LowerCase(ExAddChoise)<>'no') do
                        begin
                          readln(ExAddChoise);
                          if ExAddChoise='yes' then
                            ExAdd:=False
                          else
                            if LowerCase(ExAddChoise)<>'no' then
                              writeln('incorrect input');
                        end;
                        writeln('+------------------------------------+');
                      end;
                    end
                    else
                    begin
                      writeln('There is no dish with such code');
                      writeln('+------------------------------------+');
                    end;
                  end
                  else
                  begin
                      writeln('You''ve entered empty line, try again');
                      writeln('+------------------------------------+');                      
                  end;
                end;
              end
              else
              begin
                Writeln('Table code should be positive');
                writeln('+------------------------------------+');
              end;
            end
            else
            begin 
              writeln('You''ve entered empty line, try again');
              writeln('+------------------------------------+');
            end;
          end;
         end;
        end
        else
          writeln('You don''t have any dish to organize order');
      end;
      3:
        ExChoise:=False
      else
        writeln('Incorrect input, try again or go back');
    end;
  end;
end;


Procedure ChangeData;
var CurDi:TDiRecAdr;
    CurOr:TOrRecAdr;
    choise,i: integer;
    Ex, ExChoise, SFlaq, Flaq2:boolean;
    field, field2, field3:string;
    fieldC:real;
begin
  Ex:=False;
  while not Ex do
  begin
    writeln('+------------------------------------+');
    writeln('1. Change in Dishes list');
    writeln('2. Change in Orders list');
    writeln('3. Go back');
    writeln('+------------------------------------+');
    readln(choise);
    case choise of
      1:
      begin
        ExChoise:=False;
        if HeadDi.DiAdr<>nil then
        begin
         while not ExChoise do
         begin
          writeln('+------------------------------------+');
          writeln('1. Change Dish Code');
          writeln('2. Change Dish Name');
          writeln('3. Change Dish Category');
          writeln('4. Change Dish Cost');
          writeln('5. Go back');
          writeln('+------------------------------------+');
          readln(choise);
          case choise of
            1:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
               writeln('+------------------------------------------------------------------------------------------------------------+');
               writeln('Please, enter the code of the dish you want to change or go back(write ''back'')');
               readln(field);
               writeln('+------------------------------------------------------------------------------------------------------------+');
               if UpperCase(field)='BACK' then
                  SFlaq:=True
               else
               begin
                 if not CheckDiOrCode(field) then
                 begin
                   CurDi:=HeadDi;
                   while (CurDi.DiAdr<>nil) and not SFlaq do
                   begin
                     CurDi:=CurDi.DiAdr;
                     if field=CurDi.DiInfo.DiCode then
                     begin
                       writeln('Name of the dish: ', CurDi.DiInfo.DiName);
                       writeln('+------------------------------------------------------------------------------------------------------------+');                       
                       writeln('Current dish code: ', CurDi.DiInfo.DiCode);
                       writeln('+------------------------------------------------------------------------------------------------------------+');
                       while not SFlaq do
                       begin
                         writeln('+------------------------------------------------------------------------------------------------------------+');
                         writeln('Enter new code of the dish or write ''back'' to go back');
                         readln(field);
                         writeln('+------------------------------------------------------------------------------------------------------------+');
                         if UpperCase(field)='BACK'  then
                           SFlaq:=True
                         else
                         begin
                           if field=CurDi.DiInfo.DiCode then
                             writeln('You''ve entered the same code it was')
                           else
                           begin
                             if not CheckDiCode(field) then
                             begin
                               CurDi.DiInfo.DiCode:=field;
                               SFlaq:=True;
                             end
                             else
                               writeln('You already have dish with this code, try again');
                           end;
                         end;
                       end;
                     end;
                   end;
                   if not SFlaq then
                     writeln('Dish with this code not found, try again or go back');
                 end
                 else
                   writeln('Dish with this code is used in Orders List, unable to change.');
               end;
              end;
            end;
            2:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
               writeln('+------------------------------------------------------------------------------------------------------------+');
               writeln('Please, enter the name of the dish you want to change or go back(write ''back'')');
               readln(field);
               writeln('+------------------------------------------------------------------------------------------------------------+');
               if UpperCase(field)='BACK' then
                  SFlaq:=True
               else
               begin
                 if not CheckDiORCodeName(field) then
                 begin
                   CurDi:=HeadDi;
                   while (CurDi.DiAdr<>nil) and not SFlaq do
                   begin
                     CurDi:=CurDi.DiAdr;
                     if field=CurDi.DiInfo.DiName then
                     begin
                       writeln('Current name of the dish: ', CurDi.DiInfo.DiName);
                       writeln('+------------------------------------------------------------------------------------------------------------+');
                       while not SFlaq do
                       begin
                         writeln('+------------------------------------------------------------------------------------------------------------+');
                         writeln('Enter new name of the dish or write ''back'' to go back');
                         readln(field);
                         writeln('+------------------------------------------------------------------------------------------------------------+');
                         if UpperCase(field)='BACK' then
                           SFlaq:=True
                         else
                         begin
                           if UpperCase(field)=UpperCase(CurDi.DiInfo.DiName) then
                             writeln('You''ve entered the same name it was')
                           else
                           begin
                             if not CheckDiName(field) then
                             begin
                               if field<>'' then
                               begin
                                 field:=LowerCase(field);
                                 field[1]:=UpCase(field[1]);
                                 CurDi.DiInfo.DiName:=field;
                                 SFlaq:=True;
                               end
                               else
                                 writeln('You''ve entered empty line');
                             end
                             else
                               writeln('You already have dish with this name, try again');
                           end;
                         end;
                       end;
                     end;
                   end;
                   if not SFlaq then
                     writeln('Dish with this name not found, try again or go back');
                 end
                 else
                   writeln('Dish with this name is used in Orders List, unable to change.');
               end;
              end;
            end;
            3:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+------------------------------------------------------------------------------------------------------------+');
                writeln('Please, enter the code of the dish, category of what you want to change or go back(write ''back'')');
                readln(field);
                writeln('+------------------------------------------------------------------------------------------------------------+');
                if UpperCase(field)='BACK' then
                  SFlaq:=True
                else
                begin
                  CurDi:=HeadDi;
                  while (CurDi.DiAdr<>nil) and not SFlaq do
                  begin
                    CurDi:=CurDi.DiAdr;
                    if field=CurDi.DiInfo.DiCode then
                    begin
                      writeln('Name of the dish: ',CurDi.DiInfo.DiName);
                      writeln('+------------------------------------------------------------------------------------------------------------+');
                      writeln('Current category of the dish: ',CurDi.DiInfo.DiCat);
                      writeln('+------------------------------------------------------------------------------------------------------------+');
                      writeln('Choose and enter new category of the dish or write ''back'' to go back');
                      writeln('|Salads|', '|Hell|', '|High cuisine|', '|Economic|', '|Appetizers|', '|Drinks|', '|Desserts|');
                      readln(field);
                      writeln('+------------------------------------------------------------------------------------------------------------+');
                      if UpperCase(field)='BACK' then
                        SFlaq:=True
                      else
                      begin
                        if UpperCase(field)=UpperCase(CurDi.DiInfo.DiCat) then
                          writeln('You''ve entered the same category it was')
                        else
                        begin
                          Flaq2:=False;
                          i:=1;
                          while (i <= N) and not Flaq2 do
                          begin
                            if UpperCase(field)=UpperCase(Cats[i]) then
                            begin
                              Flaq2:=True;
                              field:=Cats[i];
                            end;
                            inc(i);
                          end;
                          if not Flaq2 then
                          begin
                            writeln('This category not exist, it wil be marked as ''none''');
                            field:='None';
                          end;
                          CurDi.DiInfo.DiCat:=field;
                          SFlaq:=True;
                        end;
                      end;
                    end;
                  end;
                  if not SFlaq then
                    writeln('Dish with this name not found, try again or go back');
                end;
              end;
            end;
            4:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+------------------------------------------------------------------------------------------------------------+');
                writeln('Please, enter the code of the dish, cost of what you want to change or go back(write ''back'')');
                readln(field);
                writeln('+------------------------------------------------------------------------------------------------------------+');
                if UpperCase(field)='BACK' then
                  SFlaq:=True
                else
                begin
                  CurDi:=HeadDi;
                  while (CurDi.DiAdr<>nil) and not SFlaq do
                  begin
                    CurDi:=CurDi.DiAdr;
                    if field=CurDi.DiInfo.DiCode then
                    begin
                      writeln('Name of the dish: ', CurDi.DiInfo.DiName);
                      writeln('+------------------------------------------------------------------------------------------------------------+');
                      writeln('Current cost of the dish: ', CurDi.DiInfo.DiCost:14:2);
                      writeln('+------------------------------------------------------------------------------------------------------------+');
                      while not SFlaq do
                      begin
                        writeln('+------------------------------------------------------------------------------------------------------------+');
                        writeln('Enter new cost of the dish or write ''back'' to go back (cost will be rounded to 2 decimal places)');
                        readln(field);
                        writeln('+------------------------------------------------------------------------------------------------------------+');
                        if UpperCase(field)='BACK' then
                          SFlaq:=True
                        else
                        begin
                          if field<>'' then
                          begin
                            field := StringReplace(field, '.', ',', [rfReplaceAll]);
                            if Trunc(StrToFloat(field)*100)=Trunc(CurDi.DiInfo.DiCost*100) then
                              writeln('You''ve entered the same cost it was (to 2 decimal places)');
                            if StrToFLoat(field)>0 then
                            begin
                              CurDi.DiInfo.DiCost:=Round(StrToFLoat(field)*100)/100;
                              SFlaq:=True;
                            end
                            else
                              writeln('Cost of the dish should be positive');
                          end
                          else
                            writeln('You''ve entered empty line');
                        end;
                        
                      end;
                    end;
                  end;
                  if not SFlaq then
                    writeln('Dish with this name not found, try again or go back');
                end;
              end;
            end;
            5:
              ExChoise:=True;
            else
              writeln('incorrect input, try again or go back');
          end;
         end;
        end
        else
        begin
          ExChoise:=True;
          writeln('You don''t have any dish in your dish list, unable to change');
        end;
      end;
      2:
      begin
        ExChoise:=False;
        if HeadOr.OrAdr<>nil then
        begin
         while not ExChoise do
         begin
          writeln('+------------------------------------+');
          writeln('1. Change Order Code and Table');
          writeln('2. Change All Table Codes of the Order');
          writeln('3. Change Dish Code');
          writeln('4. Change Amount');
          writeln('5. Go back');
          writeln('+------------------------------------+');
          readln(choise);
          case choise of
            1:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+-------------------------------------------------------------------------------------------------------------------------------------+');
                writeln('Please, enter order and dish codes of the order position, table and order codes of what you want to change or go back(write ''back'')');
                writeln('+-------------------------------------------------------------------------------------------------------------------------------------+');
                Writeln('Order Code');
                readln(field);
                if (UpperCase(field)='BACK') then
                  SFlaq:=True
                else
                begin
                  writeln('+-------------------------------------------------------------------------------------------------------------------------------------+');
                  writeln('Dish Code');
                  readln(Field2);
                  writeln('+-------------------------------------------------------------------------------------------------------------------------------------+');
                  if (UpperCase(field2)='BACK') then
                    SFlaq:=True
                  else
                  begin
                    CurOr:=HeadOr;
                    while (CurOr.OrAdr<>nil) and not SFlaq do
                    begin
                      CurOr:=CurOr.OrAdr;
                      if (field=CurOr.OrInfo.OrCode) and (field2=CurOr.OrInfo.OrDiCode) then
                      begin
                        writeln('+-----------------------------------------------------------------------------------------------------------------+');
                        writeln('Current order code: ', CurOr.OrInfo.OrCode);
                        writeln('+-----------------------------------------------------------------------------------------------------------------+');
                        writeln('Current table: ', CurOr.OrInfo.TaCode);
                        while not SFlaq do
                        begin
                          writeln('+-------------------------------------------------------------------------------------------------------------------------------------+');
                          writeln('Enter new code of this order position or write ''back'' to go back');
                          readln(field);
                          if UpperCase(field)='BACK' then
                            SFlaq:=True
                          else
                          begin
                            if field=CurOr.OrInfo.OrCode then
                              writeln('You''ve entered the same order code it was')
                            else
                            begin
                              if field<>'' then
                              begin
                                Flaq2:=False;
                                while not Flaq2 do
                                begin
                                  writeln('+-------------------------------------------------------------------------------------------------------------------------------------+');
                                  Writeln('Enter new table of this order position or write ''back'' to go back');
                                  readln(field2);
                                  writeln('+-------------------------------------------------------------------------------------------------------------------------------------+');
                                  if UpperCase(field2)='BACK' then
                                    Flaq2:=True
                                  else
                                  begin
                                    if field2=CurOr.OrInfo.TaCode then
                                      writeln('You''ve entered the same table code it was')
                                    else
                                    begin
                                      if field2<>'' then
                                      begin
                                        if StrToInt(Field2)>0 then
                                        begin
                                          Flaq2:=True;
                                          if CheckOrOrTaCode(field, field2) or (not CheckOrCode(field)) then
                                          begin
                                            CurOr.OrInfo.OrCode:=field;
                                            CurOr.OrInfo.TaCode:=field2;
                                            SFlaq:=True;
                                          end
                                          else
                                            writeln('You have order with this code and another table, try again');
                                        end
                                        else
                                          writeln('Table code should be positive, try again');
                                
                                      end
                                      else
                                        writeln('You''ve entered empty line, try again');
                                    end;
                                  end;
                                end;
                              end
                              else
                                writeln('You''ve entered empty line');
                            end;
                          end;
                        end;
                      end;
                    end;
                    if not SFlaq then
                      writeln('Order with this code and dish code not found, try again or go back');
                  end;
                end;
              end;
            end;
            2:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+-----------------------------------------------------------------------------------------------------------------+');
                writeln('Please, enter order code of the order, table of what you want to change or go back(write ''back'')');
                readln(field);
                writeln('+-----------------------------------------------------------------------------------------------------------------+');
                if UpperCase(field)='BACK' then
                  SFlaq:=True
                else
                begin
                  if CheckOrCode(field) then
                  begin
                    CurOr:=HeadOr;
                    while CurOr.OrInfo.OrCode<>field do
                      CurOr:=CurOr.OrAdr;
                    writeln('+-----------------------------------------------------------------------------------------------------------------+');
                    writeln('Code of the order: ', CurOr.OrInfo.OrCode);
                    writeln('+-----------------------------------------------------------------------------------------------------------------+');
                    writeln('Current table: ', CurOr.OrInfo.TaCode);
                    CurOr:=HeadOr;
                    while not SFlaq do
                    begin
                      writeln('+-----------------------------------------------------------------------------------------------------------------+');
                      Writeln('Enter new table of the order');
                      readln(field2);
                      writeln('+-----------------------------------------------------------------------------------------------------------------+');
                      if UpperCase(field2)='BACK' then
                        SFlaq:=True
                      else
                      begin
                        if field2=CurOr.OrInfo.TaCode then
                          writeln('You''ve entered the same table code it was')
                        else
                        begin
                          if field2<>'' then
                          begin
                            if StrToInt(field2)>0 then
                            begin
                              while CurOr.OrAdr<>nil do
                              begin
                                CurOr:=CurOr.OrAdr;
                                if field=CurOr.OrInfo.OrCode then
                                begin
                                  CurOr.OrInfo.TaCode:=field2;
                                  SFlaq:=True;
                                end;
                              end;
                            end
                            else
                              writeln('Table code should be positive, try again');
                          end
                          else
                            writeln('You''ve entered empty line');                        
                        end;
                      end;
                    end;
                  end
                  else
                    writeln('Order with this code not found, try again or go back');
                end;
              end;
            end;
            3:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+------------------------------------------------------------------------------------------------------------------------+');
                writeln('Please, enter order and dish codes of the order position, dish code of what you want to change or go back(write ''back'')');
                writeln('+------------------------------------------------------------------------------------------------------------------------+');
                Writeln('Order Code');
                readln(field);
                writeln('+------------------------------------------------------------------------------------------------------------------------+');
                writeln('Dish Code');
                readln(Field2);
                writeln('+------------------------------------------------------------------------------------------------------------------------+');
                if (UpperCase(field)='BACK') or (UpperCase(field2)='BACK') then
                  SFlaq:=True
                else
                begin
                  CurOr:=HeadOr;
                  while (CurOr.OrAdr<>nil) and not SFlaq do
                  begin
                    CurOr:=CurOr.OrAdr;
                    if (field=CurOr.OrInfo.OrCode) and (field2=CurOr.OrInfo.OrDiCode) then
                    begin
                      writeln('+------------------------------------------------------------------------------------------------------------------------+');
                      writeln('Current dish code: ', CurOr.OrInfo.OrDiCode);
                      while not SFlaq do
                      begin
                        writeln('+------------------------------------------------------------------------------------------------------------------------+');
                        writeln('Enter new dish code of this order position or write ''back''to go back');
                        readln(field2);
                        writeln('+------------------------------------------------------------------------------------------------------------------------+');
                        if UpperCase(field2)='BACK' then
                          Sflaq:=True
                        else
                        begin
                          if field2=CurOr.OrInfo.OrDiCode then
                            writeln('You''ve entered the same dish code it was')
                          else
                          begin
                            if field2<>'' then
                            begin
                              if CheckDiCode(field2) then
                              begin
                                if not CheckDiCodeOrCode(field2,field) then
                                begin                                                            
                                  CurOr.OrInfo.OrDICode:=field2;
                                  SFlaq:=True;
                                end
                                else
                                  writeln('You also have position with this dish code in this order');
                              end
                              else
                                writeln('You don''t have dish with this dish code in your Dish list');                          
                            end
                            else
                              writeln('You''ve entered empty line');                        
                          end;
                        end;
                      end;
                    end;
                  end;
                  if not SFlaq then
                    writeln('Order with this code and dish code not found, try again or go back');
                end;
              end;
            end;
            4:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+-----------------------------------------------------------------------------------------------------------------+');
                writeln('Please, enter order and dish codes of the order position, amount of what you want to change or go back(write ''back'')');
                writeln('+-----------------------------------------------------------------------------------------------------------------+');
                Writeln('Order Code');
                readln(field);
                if (UpperCase(field)='BACK') then
                  SFlaq:=True
                else
                begin
                  writeln('+-----------------------------------------------------------------------------------------------------------------+');
                  writeln('Dish Code');
                  readln(Field2);
                  writeln('+-----------------------------------------------------------------------------------------------------------------+');
                  if (UpperCase(field2)='BACK') then
                    SFlaq:=True
                  else
                  begin
                    CurOr:=HeadOr;
                    while (CurOr.OrAdr<>nil) and not SFlaq do
                    begin
                      CurOr:=CurOr.OrAdr;
                      if (field=CurOr.OrInfo.OrCode) and (field2=CurOr.OrInfo.OrDiCode) then
                      begin
                        Flaq2:=False;
                        writeln('+-----------------------------------------------------------------------------------------------------------------+');
                        writeln('Current amount: ', CurOr.OrInfo.Amount);
                        while not flaq2 do
                        begin
                          writeln('+-----------------------------------------------------------------------------------------------------------------+');
                          writeln('Enter new amount of this order position or write ''back'' to go back');
                          readln(field);
                          writeln('+------------------------------------------------------------------------------------------------------------------+');
                          if UpperCase(field)='BACK' then
                          SFlaq:=True
                          else
                          begin
                            if StrToInt(field)=CurOr.OrInfo.Amount then
                              writeln('You''ve entered the same amount it was')
                            else
                            begin
                              if field<>'' then
                              begin
                                if StrToInt(Field)>0 then
                                begin
                                  Flaq2:=True;
                                  CurOr.OrInfo.Amount:=StrToInt(field);
                                  SFlaq:=True;
                                end
                                else
                                  writeln('Amount should be positive, try again');
                              end
                              else
                                writeln('You''ve entered empty line');
                            end;
                          end;
                        end;
                      end;
                    end;
                    if not SFlaq then
                      writeln('Order with this code and dish code not found, try again or go back');
                  end;
                end;
              end;
            end;
            5:
              ExChoise:=True;
            else
              writeln('Incorrect input, try again or go back');
          end;
         end;
        end
        else
        begin
          ExChoise:=True;
          writeln('You don''t have any order in your order list, unable to change');
        end;
      end;
      3:
        Ex:=True;
      else
        writeln('Incorrect input, try again or go back');
        writeln('+------------------------------------+');
    end;
  end;
end;


 Procedure SortDish(Field: integer);
var Cur, Temp1, Temp2, Temp3:TDiRecAdr;
    i, size:integer;
begin
  size:=0;
  case field of
    1:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if StrToInt(Cur.DiAdr.DiInfo.DiCode)<StrToInt(Cur.DiAdr.DiAdr.DiInfo.DiCode) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
    2:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if UpperCase(Cur.DiAdr.DiInfo.DiName)<UpperCase(Cur.DiAdr.DiAdr.DiInfo.DiName) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
    3:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if (Cur.DiAdr.DiInfo.DiCat)<(Cur.DiAdr.DiAdr.DiInfo.DiCat) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
    4:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if (Cur.DiAdr.DiInfo.DiCost)<(Cur.DiAdr.DiAdr.DiInfo.DiCost) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
  end;
end;

Procedure SortDishRev(Field: integer);
var Cur, Temp1, Temp2, Temp3:TDiRecAdr;
    i, size:integer;
begin
  size:=0;
  case field of
    1:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if StrToInt(Cur.DiAdr.DiInfo.DiCode)>StrToInt(Cur.DiAdr.DiAdr.DiInfo.DiCode) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
    2:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if UpperCase(Cur.DiAdr.DiInfo.DiName)>UpperCase(Cur.DiAdr.DiAdr.DiInfo.DiName) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
    3:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if (Cur.DiAdr.DiInfo.DiCat)>(Cur.DiAdr.DiAdr.DiInfo.DiCat) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
    4:
    begin
      Cur:=HeadDi;
      while Cur.DiAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.DiAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadDi;
        while Cur.DiAdr.DiAdr<>nil do
        begin
          if (Cur.DiAdr.DiInfo.DiCost)>(Cur.DiAdr.DiAdr.DiInfo.DiCost) then
          begin
            Temp1:=Cur.DiAdr;
            Temp2:=Temp1.DiAdr;
            Temp3:= Temp2.DiAdr;

            Cur.DiAdr:=temp2;
            temp2.DiAdr:=temp1;
            temp1.DiAdr:=temp3;
          end;
          Cur:=Cur.DiAdr;
        end;
      end;
    end;
  end;
end;


Procedure SortOrder(Field: integer);
var Cur, Temp1, Temp2, Temp3:TOrRecAdr;
    i, size: integer;
begin
  size:=0;
  case field of
    1:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if StrToInt(Cur.OrAdr.OrInfo.OrCode)<StrToInt(Cur.OrAdr.OrAdr.OrInfo.OrCode) then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
    2:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if StrToInt(Cur.OrAdr.OrInfo.TaCode)<StrToInt(Cur.OrAdr.OrAdr.OrInfo.TaCode) then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
    3:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if StrToInt(Cur.OrAdr.OrInfo.OrDiCode)<StrToInt(Cur.OrAdr.OrAdr.OrInfo.OrDiCode) then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
    4:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if Cur.OrAdr.OrInfo.Amount<Cur.OrAdr.OrAdr.OrInfo.Amount then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
  end;
end;

Procedure SortOrderRev(Field: integer);
var Cur, Temp1, Temp2, Temp3:TOrRecAdr;
    i, size: integer;
begin
  size:=0;
  case field of
    1:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if StrToInt(Cur.OrAdr.OrInfo.OrCode)>StrToInt(Cur.OrAdr.OrAdr.OrInfo.OrCode) then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
    2:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if StrToInt(Cur.OrAdr.OrInfo.TaCode)>StrToInt(Cur.OrAdr.OrAdr.OrInfo.TaCode) then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
    3:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if StrToInt(Cur.OrAdr.OrInfo.OrDiCode)>StrToInt(Cur.OrAdr.OrAdr.OrInfo.OrDiCode) then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
    4:
    begin
      Cur:=HeadOr;
      while Cur.OrAdr<>nil do
      begin
        inc(size);
        Cur:=Cur.OrAdr
      end;
      for i := 1 to size-1 do
      begin
        Cur:=HeadOr;
        while Cur.OrAdr.OrAdr<>nil do
        begin
          if Cur.OrAdr.OrInfo.Amount>Cur.OrAdr.OrAdr.OrInfo.Amount then
          begin
            Temp1:=Cur.OrAdr;
            Temp2:=Temp1.OrAdr;
            Temp3:= Temp2.OrAdr;

            Cur.OrAdr:=temp2;
            temp2.OrAdr:=temp1;
            temp1.OrAdr:=temp3;
          end;
          Cur:=Cur.OrAdr;
        end;
      end;
    end;
  end;
end;


Procedure SortData;
var choise: integer;
    Ex, ExCase, ExCaseType: boolean;
begin
  Ex:=False;
  while not Ex do
  begin
   writeln('+------------------------------------+');
   writeln('Choose, which list do you want to sort?');
   writeln('1. List of Dishes');
   writeln('2. List of Orders');
   writeln('3. Go Back');
   writeln('+------------------------------------+');
   readln(choise);
   case choise of
    1:
    begin
      ExCase:=false;
      while not ExCase do
      begin
      if (HeadDi.DiAdr<>nil) and (HeadDi.DiAdr.DiAdr<>nil) then
      begin
       writeln('+------------------------------------+');
       writeln('Based on what data do you want to sort?');
       writeln('1. Dish Code');
       writeln('2. Dish Name');
       writeln('3. Dish Category');
       writeln('4. Dish Cost');
       writeln('5. Go Back');
       writeln('+------------------------------------+');
       readln(choise);
       case choise of
         1:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from lower to higher');
            writeln('2. Sort from higher to lower');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortDishRev(1);
               ExCaseType:=True;
             end;
             2:
             begin
               SortDish(1);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         2:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from A to Z');
            writeln('2. Sort from Z to A');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortDishRev(2);
               ExCaseType:=True;
             end;
             2:
             begin
               SortDish(2);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         3:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from A to Z');
            writeln('2. Sort from Z to A');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortDishRev(3);
               ExCaseType:=True;
             end;
             2:
             begin
               SortDish(3);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         4:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from lower to higher');
            writeln('2. Sort from higher to lower');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortDishRev(4);
               ExCaseType:=True;
             end;
             2:
             begin
               SortDish(4);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         5:
           ExCase:=True
         else
           writeln('incorrect input, try again or go back');
       end;
      end
      else
      begin
        writeln('You don''t have any dish or have only one');
        ExCase:=True;
      end;
     end;
    end;
    2:
    begin
      ExCase:=false;
      while not ExCase do
      begin
       if (HeadOr.OrAdr<>nil) and (HeadOr.OrAdr.OrAdr<>nil) then
       begin
       writeln('+------------------------------------+');
       writeln('Based on what data do you want to sort?');
       writeln('1. Order Code');
       writeln('2. Table Code');
       writeln('3. Dish Code');
       writeln('4. Amount');
       writeln('5. Go Back');
       writeln('+------------------------------------+');
       readln(choise);
       case choise of
         1:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from lower to higher');
            writeln('2. Sort from higher to lower');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortOrderRev(1);
               ExCaseType:=True;
             end;
             2:
             begin
               SortOrder(1);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         2:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from lower to higher');
            writeln('2. Sort from higher to lower');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortOrderRev(2);
               ExCaseType:=True;
             end;
             2:
             begin
               SortOrder(2);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         3:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from lower to higher');
            writeln('2. Sort from higher to lower');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortOrderRev(3);
               ExCaseType:=True;
             end;
             2:
             begin
               SortOrder(3);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         4:
         begin
           ExCaseType:=false;
           while not ExCaseType do
           begin
            writeln('+------------------------------------+');
            writeln('1. Sort from lower to higher');
            writeln('2. Sort from higher to lower');
            writeln('3. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
             1:
             begin
               SortOrderRev(4);
               ExCaseType:=True;
             end;
             2:
             begin
               SortOrder(4);
               ExCaseType:=True;
             end;
             3:
               ExCaseType:=True;
             else
               writeln('incorrect input');
            end;
           end;
           ExCase:=True;
         end;
         5:
           ExCase:=True
         else
           writeln('incorrect input, try again or go back');
       end;
      end
      else
      begin
        writeln('You don''t have any order or have only one');
        ExCase:=True;
      end;
     end;
    end;
    3:
      Ex:=True
    else
      writeln('Incorrect input, try again or go back');
   end;
  end;
end;

Procedure ClearingMemory;
begin
  while HeadDi.DiAdr<>nil do
  begin
    dispose(HeadDi);
    HeadDi:=HeadDi.DiAdr;
  end;
  while HeadOr.OrAdr<>nil do
  begin
    dispose(HeadOr);
    HeadOr:=HeadOr.OrAdr;
  end;
end;

Procedure SavingEx(var Ex: boolean);
var CurDi: TDiRecAdr;
    CurOr: TOrRecAdr;
    choise: integer;
    i:integer;
    DiFileT, OrFileT: TextFile;
    ExFlaq: boolean;
begin
  ExFlaq:=False;
  while not ExFlaq do
  begin
   writeln('+------------------------------------+');
   writeln('1. Save changes only in dish list');
   writeln('2. Save changes only in order list');
   writeln('3. Save changes in both lists');
   writeln('4. Go Back');
   writeln('+------------------------------------+');
   readln(choise);
   case choise of
    1:
    begin
      ExFlaq:=True;
      CurDi:=HeadDi;
      AssignFile(DiFileT,'DishListT.txt');
      AssignFile(DiFile, 'DishList.txt');
      Rewrite(DiFileT);
      Rewrite(DiFile);
      i:=0;
      while CurDi.DiAdr<>nil do
      begin
        seek(DiFile, i);
        with CurDi.DiAdr.DiInfo do
          writeln(DiFileT, DiCode:10,DiName:60 ,DiCat:30 ,DiCost:12:2);
        write(DiFile, CurDi.DiAdr.DiInfo);
        CurDi:=CurDi.DiAdr;
        inc(i);
      end;
      CloseFile(DiFileT);
      ClearingMemory;
    end;
    2:
    begin
      Assign(OrFileT,'OrderListT.txt');
      Assign(OrFile,'OrderList.txt');
      Rewrite(OrFileT);
      Rewrite(OrFile);
      i:=0;
      while CurOr.OrAdr<>nil do
      begin
        seek(OrFile,i);
        with CurOr.OrAdr.OrInfo do
          writeln(OrFileT, OrCode:16, TaCode:5,OrDiCode:10 ,Amount:6);
        write(OrFile, CurOr.OrAdr.OrInfo);
        CurOr:=CurOr.OrAdr;
        inc(i);
      end;
      CloseFile(OrFileT);
      CloseFile(OrFile);
    end;
    3:
    begin
      ExFlaq:=True;
      CurDi:=HeadDi;
      AssignFile(DiFileT,'DishListT.txt');
      AssignFile(DiFile, 'DishList.txt');
      Rewrite(DiFileT);
      Rewrite(DiFile);
      i:=0;
      while CurDi.DiAdr<>nil do
      begin
        seek(DiFile, i);
        with CurDi.DiAdr.DiInfo do
          writeln(DiFileT, DiCode:10,DiName:60 ,DiCat:30 ,DiCost:12:2);
        write(DiFile, CurDi.DiAdr.DiInfo);
        CurDi:=CurDi.DiAdr;
        inc(i);
      end;
      CloseFile(DiFileT);
      CloseFile(DiFile);
      CurOr:=HeadOr;
      Assign(OrFileT,'OrderListT.txt');
      Assign(OrFile,'OrderList.txt');
      Rewrite(OrFileT);
      Rewrite(OrFile);
      i:=0;
      while CurOr.OrAdr<>nil do
      begin
        seek(OrFile,i);
        with CurOr.OrAdr.OrInfo do
          writeln(OrFileT, OrCode:16, TaCode:5,OrDiCode:10 ,Amount:6);
        write(OrFile, CurOr.OrAdr.OrInfo);
        CurOr:=CurOr.OrAdr;
        inc(i);
      end;
      CloseFile(OrFileT);
      CloseFile(OrFile);
      ClearingMemory;
    end;
    4:
    begin
      ExFlaq:=True;
      Ex:=False;
    end
    else
      writeln('Incorrect input, try again or go back');
   end;
  end;
end;

Procedure SearchDi(field: integer; SearchField: string);
var FoundFlaq:boolean;
    CurDi:TdiRecAdr;
begin
  case field of
    1:
    begin
      FoundFlaq:=False;
      CurDi:=HeadDi;
      while (CurDi.DiAdr<>nil) and not FoundFlaq do
      begin
        CurDi:=CurDi.DiAdr;
        if UpperCase(SearchField)=UpperCase(CurDi.DiInfo.DiCode) then
        begin
          if not FoundFlaq then
          begin
            writeln('+--------------------------------------------------------------------------------------------------------------------+');
            writeln('|','Dish code':10,'|','Name','|':57,'Category','|':23,'Price':12,'|');
            writeln('+--------------------------------------------------------------------------------------------------------------------+');
          end;
          with (CurDi.DiInfo) do
            writeln('|', DiCode:10,'|', DiName:60,'|', DiCat:30,'|', DiCost:12:2,'|');
          writeln('+--------------------------------------------------------------------------------------------------------------------+');
          FoundFlaq:=True;
        end;
      end;
      if not FoundFlaq then
      begin
        writeln('Dish not found');
        writeln('+------------------------------------+');
      end;
    end;
    2:
    begin
      FoundFlaq:=False;
      CurDi:=HeadDi;
      while CurDi.DiAdr<>nil do
      begin
        CurDi:=CurDi.DiAdr;
        if pos(UpperCase(SearchField),UpperCase(CurDi.DiInfo.DiName))<>0 then
        begin
           if not FoundFlaq then
          begin
            writeln('+--------------------------------------------------------------------------------------------------------------------+');
            writeln('|','Dish code':10,'|','Name','|':57,'Category','|':23,'Price':12,'|');
            writeln('+--------------------------------------------------------------------------------------------------------------------+');
          end;
          with (CurDi.DiInfo) do
            writeln('|', DiCode:10,'|', DiName:60,'|', DiCat:30,'|', DiCost:12:2,'|');
          writeln('+--------------------------------------------------------------------------------------------------------------------+');
          FoundFlaq:=True;
        end;
      end;
      if not FoundFlaq then
      begin
        writeln('Dish not found');
        writeln('+------------------------------------+');
      end;
    end;
    3:
    begin
      FoundFlaq:=False;
      CurDi:=HeadDi;
      while CurDi.DiAdr<>nil do
      begin
        CurDi:=CurDi.DiAdr;
        if pos(UpperCase(SearchField),UpperCase(CurDi.DiInfo.DiCat))<>0 then
        begin
           if not FoundFlaq then
          begin
            writeln('+--------------------------------------------------------------------------------------------------------------------+');
            writeln('|','Dish code':10,'|','Name','|':57,'Category','|':23,'Price':12,'|');
            writeln('+--------------------------------------------------------------------------------------------------------------------+');
          end;
          with (CurDi.DiInfo) do
            writeln('|', DiCode:10,'|', DiName:60,'|', DiCat:30,'|', DiCost:12:2,'|');
          writeln('+--------------------------------------------------------------------------------------------------------------------+');
          FoundFlaq:=True;
        end;
      end;
      if not FoundFlaq then
      begin
        writeln('Dish not found');
        writeln('+------------------------------------+');
      end;
    end;
  end;
end;

Procedure SearchDiCost(SearchField: real);
var FoundFlaq:boolean;
    CurDi:TDiRecAdr;
begin
  FoundFlaq:=False;
  CurDi:=HeadDi;
  while (CurDi.DiAdr<>nil) and not FoundFlaq do
  begin
    CurDi:=CurDi.DiAdr;
    if Trunc(CurDi.DiInfo.DiCost)=Trunc(SearchField) then
    begin
       if not FoundFlaq then
       begin
         writeln('+--------------------------------------------------------------------------------------------------------------------+');
         writeln('|','Dish code':10,'|','Name','|':57,'Category','|':23,'Price':12,'|');
         writeln('+--------------------------------------------------------------------------------------------------------------------+');
       end;
       with (CurDi.DiInfo) do
         writeln('|', DiCode:10,'|', DiName:60,'|', DiCat:30,'|', DiCost:12:2,'|');
       writeln('+--------------------------------------------------------------------------------------------------------------------+');
       FoundFlaq:=True;
    end;
  end;
  if not FoundFlaq then
  begin
    writeln('Dish not found');
    writeln('+------------------------------------+');
  end;
end;

Procedure SearchOr(field: integer; SearchField: string);
var FoundFlaq:boolean;
begin
  case field of
    1:
    begin
      FoundFlaq:=False;
      CurOr:=HeadOr;
      while CurOr.OrADr<>nil do
      begin
        Curor:=Curor.orAdr;
        if UpperCase(SearchField)=UpperCase(CurOr.OrInfo.OrCode) then
        begin
          if not FoundFlaq then
          begin
            writeln('+------------------------------------+');
            writeln('|','Order code':16,'|','Table','|','Dish Code':10,'|','Amount', '|');
            writeln('+------------------------------------+');
          end;
          with (CurOr.OrInfo) do
            writeln('|',OrCode:16,'|', TaCode:5,'|', OrDiCode:10,'|', Amount:6, '|');
          writeln('+------------------------------------+');
          FoundFlaq:=True;
        end;
      end;
      if not FoundFlaq then
      begin
        writeln('Order not found');
        writeln('+------------------------------------+');
      end;
    end;
    2:
    begin
      FoundFlaq:=False;
      CurOr:=HeadOr;
      while CurOr.OrADr<>nil do
      begin
        Curor:=Curor.orAdr;
        if UpperCase(SearchField)=UpperCase(CurOr.OrInfo.TaCode) then
        begin
          if not FoundFlaq then
          begin
            writeln('+------------------------------------+');
            writeln('|','Order code':16,'|','Table','|','Dish Code':10,'|','Amount', '|');
            writeln('+------------------------------------+');
          end;
          with (CurOr^.OrInfo) do
            writeln('|',OrCode:16,'|', TaCode:5,'|', OrDiCode:10,'|', Amount:6, '|');
          writeln('+------------------------------------+');
          FoundFlaq:=True;
        end;
      end;
      if not FoundFlaq then
      begin
        writeln('Order not found');
        writeln('+------------------------------------+');
      end;
    end;
    3:
    begin
      FoundFlaq:=False;
      CurOr:=HeadOr;
      while CurOr.OrADr<>nil do
      begin
        Curor:=Curor.orAdr;
        if UpperCase(SearchField)=UpperCase(CurOr.OrInfo.OrDiCode) then
        begin
          if not FoundFlaq then
          begin
            writeln('+------------------------------------+');
            writeln('|','Order code':16,'|','Table','|','Dish Code':10,'|','Amount', '|');
            writeln('+------------------------------------+');
          end;
          with (CurOr^.OrInfo) do
            writeln('|',OrCode:16,'|', TaCode:5,'|', OrDiCode:10,'|', Amount:6, '|');
          writeln('+------------------------------------+');
          FoundFlaq:=True;
        end;
      end;
      if not FoundFlaq then
      begin
        writeln('Order not found');
        writeln('+------------------------------------+');
      end;
    end;
    4:
    begin
      FoundFlaq:=False;
      CurOr:=HeadOr;
      while CurOr.OrADr<>nil do
      begin
        Curor:=Curor.orAdr;
        if StrToInt(SearchField)=CurOr.OrInfo.Amount then
        begin
          if not FoundFlaq then
          begin
            writeln('+------------------------------------+');
            writeln('|','Order code':16,'|','Table','|','Dish Code':10,'|','Amount', '|');
            writeln('+------------------------------------+');
          end;
          with (CurOr^.OrInfo) do
            writeln('|',OrCode:16,'|', TaCode:5,'|', OrDiCode:10,'|', Amount:6, '|');
          writeln('+------------------------------------+');
          FoundFlaq:=True;
        end;
      end;
      if not FoundFlaq then
      begin
        writeln('Order not found');
        writeln('+------------------------------------+');
      end;
    end;
  end;
end;


Procedure Search;
var CurDi:TDiRecAdr;
    CurOr:TOrRecAdr;
    choise: integer;
    SearchFieldR:Real;
    ex, ExCase: boolean;
    SearchField: string;
begin
  Ex:=False;
  while not Ex do
  begin
    writeln('+------------------------------------+');
    writeln('1. Search in Dish List');
    writeln('2. Search in Order List');
    writeln('3. Go Back');
    writeln('+------------------------------------+');
    readln(choise);
    writeln('+------------------------------------+');
    case choise of
      1:
      begin
        if HeadDi.DiAdr=nil then
          writeln('You don''t have any dish')
        else
        begin
          ExCase:=False;
          while not ExCase do
          begin
            CurDi:=HeadDi;
            writeln('+------------------------------------+');
            writeln('1. Search by dish Code');
            writeln('2. Search by dish Name');
            writeln('3. Search by dish Category');
            writeln('4. Search by dish Price');
            writeln('5. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
              1:
              begin
                writeln('Enter dish code');
                readln(SearchField);
                writeln('+------------------------------------+');
                SearchDi(1, SearchField);
              end;
              2:
              begin
                writeln('Enter dish name or its fragment');
                readln(SearchField);
                writeln('+------------------------------------+');
                SearchDi(2, SearchField);
              end;
              3:
              begin
                writeln('Enter dish Category or its fragment');
                readln(SearchField);
                writeln('+------------------------------------+');
                SearchDi(3, SearchField);
              end;
              4:
              begin
                writeln('Enter dish price');
                readln(SearchFieldR);
                writeln('+------------------------------------+');
                SearchDiCost(SearchFieldR);
              end;
              5:
                ExCase:=True
              else
                writeln('Incorrect input, try again or go back');
            end;
          end;
        end;
      end;
      2:
      begin
        if HeadOr.OrAdr=nil then
          writeln('You dont''t have any order')
        else
        begin
          ExCase:=False;
          while not ExCase do
          begin
            CurOr:=HeadOr;
            writeln('+------------------------------------+');
            writeln('1. Search by order code');
            writeln('2. Search by table code');
            writeln('3. Search by dish code');
            writeln('4. Search by Amount');
            writeln('5. Go Back');
            writeln('+------------------------------------+');
            readln(choise);
            writeln('+------------------------------------+');
            case choise of
              1:
              begin
                writeln('Enter order code');
                readln(SearchField);
                SearchOr(1, SearchField);
              end;
              2:
              begin
                writeln('Enter table code');
                readln(SearchField);
                SearchOr(2, SearchField);
              end;
              3:
              begin
                writeln('Enter dish code');
                readln(SearchField);
                SearchOr(3, SearchField);
              end;
              4:
              begin
                writeln('Enter Amount');
                readln(SearchField);
                SearchOr(4, SearchField);
              end;
              5:
                ExCase:=True
              else
                writeln('Incorrect input, try again or go back');
            end;
          end;
        end;
      end;
      3:
        Ex:=True
      else
        writeln('incorrect input, try again or go back');
    end;
  end;
end;

Procedure DeleteDish(field: integer; Search_Data: string; var SFlaq:boolean);
var CurDi, PrevDi:TDIRecAdr;
    endFlaq:boolean;
begin
  case field of
    1:
    begin
      EndFlaq:=False;
      CurDi:=HeadDi;
      while (CurDi.DiAdr<>nil) and not EndFlaq do
      begin
        PrevDi:=CurDi;
        CurDi:=CurDi.DiAdr;
        if CurDi.DiInfo.DiCode=Search_Data then
          EndFlaq:=True;
      end;
      if EndFlaq then
      begin
        SFlaq:=True;
        PrevDi.DiAdr:=CurDi.DiAdr;
        Dispose(CurDi);
        CurDi:=nil;
        writeln('Dish has been succesfully deleted');
      end
      else
        writeln('Dish with this code not found');
    end;
    2:
    begin
      EndFlaq:=False;
      CurDi:=HeadDi;
      while (CurDi.DiAdr<>nil) and not EndFlaq do
      begin
        PrevDi:=CurDi;
        CurDi:=CurDi.DiAdr;
        if UpperCase(CurDi.DiInfo.DiName)=UpperCase(Search_Data) then
          EndFlaq:=True;
      end;
      if EndFlaq then
      begin
        SFlaq:=True;
        PrevDi.DiAdr:=CurDi.DiAdr;
        Dispose(CurDi);
        CurDi:=nil;
        writeln('Dish has been succesfully deleted');
      end
      else
        writeln('Dish with this code not found, try again');
    end;
  end;
end;

Procedure DeleteOrder(Search_CodeOr,Search_CodeDi:string;var SFlaq:boolean);
var CurOr, PrevOr:TOrRecAdr;
    endFlaq:boolean;
begin
   EndFlaq:=False;
   CurOr:=HeadOr;
   while (CurOr.OrAdr<>nil) and not EndFlaq do
   begin
     PrevOr:=CurOr;
     CurOr:=CurOr.OrAdr;
     if (CurOr.OrInfo.OrCode=Search_CodeOr) and (CurOR.OrInfo.OrDiCode=Search_CodeDi) then
       EndFlaq:=True;
   end;
   if EndFlaq then
   begin
     SFlaq:=True;
     PrevOr.OrAdr:=CurOr.OrAdr;
     Dispose(CurOr);
     CurOr:=nil;
     writeln('Order has been succesfully deleted');
   end
   else
     writeln('Order not found, try again');
end;

Procedure DeleteOrderAll(Search_CodeOr:string;var SFlaq:Boolean);
var CurOr, PrevOr:TOrRecAdr;
    endFlaq:boolean;
begin
   CurOr:=HeadOr;
   EndFlaq:=False;
   CurOr:=HeadOr;
   while CurOr.OrAdr<>nil do
   begin
     PrevOr:=CurOr;
     CurOr:=CurOr.OrAdr;
     if CurOr.OrInfo.OrCode=Search_CodeOr then
     begin
       PrevOr.OrAdr:=CurOr.OrAdr;
       Dispose(CurOr);
       CurOr:=nil;
       EndFlaq:=True;
       CurOr:=HeadOr;
     end;
   end;
   if not EndFlaq then
     writeln('Order not found, try again')
   else
   begin
     SFlaq:=True;
     writeln('All Orders with this code has been succesfully deleted');
   end;
end;

Procedure DeleteData;
var choise: integer;
    Ex, ExCase, SFlaq: boolean;
    bufer1, bufer2: string;
begin
  Ex:=False;
  while not Ex do
  begin
   writeln('+------------------------------------+');
   writeln('1. Delete in Dishes List');
   writeln('2. Delete in Orders List');
   writeln('3. Go Back');
   writeln('+------------------------------------+');
   readln(choise);
   case choise of
    1:
    begin
      ExCase:=False;
      while not ExCase do
      begin
       if HeadDi.DiAdr<>nil then
       begin
        writeln('+--------------------------------------------+');
        writeln('1. Delete by dish code');
        writeln('2. Delete by dish name');
        writeln('3. Go back');
        writeln('+--------------------------------------------+');
        readln(choise);
        case choise of
          1:
          begin
            SFlaq:=False;
            while not SFlaq do
            begin
              writeln('+---------------------------------------------------------------------+');
              writeln('Enter Dish Code or write ''back'' to go back');
              readln(bufer1);
              writeln('+---------------------------------------------------------------------+');
              if UpperCase(bufer1)='BACK' then
                SFlaq:=True
              else
              begin
                if not CheckDiOrCode(bufer1) then
                  DeleteDish(1,bufer1, SFlaq)
                else
                begin
                  writeln('Dish with this code is used in Order''s list, impossible to delete');
                  writeln('+---------------------------------------------------------------------+');
                end;
              end;
            end;
          end;
          2:
          begin
            SFlaq:=False;
            while not SFlaq do
            begin
              writeln('+---------------------------------------------------------------------+');
              writeln('Enter Dish Name or write ''back'' to go back');
              readln(bufer1);
              writeln('+---------------------------------------------------------------------+');
              if UpperCase(bufer1)='BACK' then
                SFlaq:=True
              else
              begin
                if not CheckDiOrCodeName(bufer1) then
                  DeleteDish(2,bufer1,SFlaq)
                else
                begin
                  writeln('Dish with this name is used in Order''s list, impossible to delete');
                  writeln('+---------------------------------------------------------------------+');
                end;
              end;
            end;
          end;
          3:
            ExCase:=True
          else
          begin
            writeln('incorrect input, try again or go back');
            writeln('+---------------------------------------------------------------------+');
          end;
        end;
       end
       else
       begin
         writeln('Your dishes list is empty, you can''t delete anything');
         writeln('+---------------------------------------------------------------------+');
         exCase:=True;
       end;
      end;
    end;
    2:
    begin
      ExCase:=False;
      while not ExCase do
      begin
        if HeadOr.OrAdr<>nil then
        begin
          writeln('+------------------------------------+');
          writeln('1. Delete by order and dish codes');
          writeln('2. Delete all Positions by Order Code');
          writeln('3. Go back');
          writeln('+------------------------------------+');
          readln(choise);
          case choise of
            1:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+---------------------------------------------------------------------+');
                writeln('Enter Order Code');
                readln(bufer1);
                writeln('+---------------------------------------------------------------------+');
                if UpperCase(bufer1)='BACK' then
                  SFlaq:=True
                else
                begin
                  writeln('+---------------------------------------------------------------------+');
                  writeln('Enter Dish Code');
                  readln(bufer2);
                  writeln('+---------------------------------------------------------------------+');
                  if UpperCase(bufer2)='BACK' then
                    SFlaq:=True
                  else
                    DeleteOrder(bufer1,bufer2,sFlaq);
                end;
              end;
            end;
            2:
            begin
              SFlaq:=False;
              while not SFlaq do
              begin
                writeln('+---------------------------------------------------------------------+');
                writeln('Enter Order Code or write ''back'' to go back');
                readln(bufer1);
                writeln('+---------------------------------------------------------------------+');
                if UpperCase(bufer1)='BACK' then
                  SFlaq:=True
                else
                  DeleteOrderAll(bufer1, SFlaq);
                writeln('+---------------------------------------------------------------------+');
              end;
            end;
            3:
              ExCase:=True;
            else
            begin
              writeln('incorrect input');
              writeln('+---------------------------------------------------------------------+');
            end;
          end;
        end
        else
        begin
          writeln('Your orders list is empty, you can''t delete anything');
          exCase:=True;
        end;
      end;

    end;
    3:
      Ex:=True;
    else
      writeln('Incorrect input, try again or go back');
   end;
  end;
end;

Procedure Popular;
var i, amount, prev_amount: Integer;
    CurDi: TDiRecAdr;
    CurOr: TOrRecAdr;
    prev_mp, mp:string;
begin
  writeln('+-----------------------------------------------------------------------------------------------------------------------+');
  writeln('|','Category':30,'|','Name of the dish(Code)':80,'|','Amount','|');
  writeln('+-----------------------------------------------------------------------------------------------------------------------+');
  for i := 1 to N do
  begin
    CurDi:=HeadDi;
    prev_amount:=0;
    prev_mp:='';
    mp:='';
    while CurDi.DiAdr<>nil do
    begin
      CurDi:=CurDi.DiAdr;
      if CurDi.DiInfo.DiCat=Cats[i] then
      begin
        amount:=0;
        mp:=CurDi.DiInfo.DiName+'('+CurDi.DiInfo.DiCode+')';
        CurOR:=HeadOr;
        while CurOr.OrAdr<>nil do
        begin
          CurOr:=CurOr.OrAdr;
          if CurDi.DiInfo.DiCode=CurOr.OrInfo.OrDiCode then
          begin
            amount:=amount+CurOr.OrInfo.Amount;
          end;
        end;
        if amount>prev_amount then
        begin
          prev_amount:=amount;
          prev_mp:=mp;
        end;
      end;
    end;
    if prev_mp='' then
    begin
      writeln('+-----------------------------------------------------------------------------------------------------------------------+');
      writeln('|',Cats[i]:30,'|','undefined':80, '|', 'xxxxxx', '|');
      writeln('+-----------------------------------------------------------------------------------------------------------------------+');
    end
    else
    begin
      writeln('+-----------------------------------------------------------------------------------------------------------------------+');
      writeln('|',Cats[i]:30,'|',prev_mp:80, '|', prev_amount:6,'|');
      writeln('+-----------------------------------------------------------------------------------------------------------------------+');
    end;
  end;
  writeln('Press any key to return to main menu');
  readln;
end;

Procedure Bill;
var Input:string;
    CurOr: TORRecAdr;
    CurDi: TDiRecAdr;
    TotalPrice: real;
    ExFlaq: boolean;
    Bill: TextFile;
begin
  if (HeadOr.OrAdr<>nil) and (HeadDi.DiAdr<>nil) then
  begin
   ExFlaq:=False;
   while not ExFlaq do
   begin
    writeln('+-----------------------------------------+');
    writeln('Enter order code or write ''back'' to go back');
    readln(input);
    writeln('+-----------------------------------------+');
    if UpperCase(input)='BACK' then
      ExFlaq:=True
    else
    begin
      if CheckOrCode(input) then
      begin
        AssignFile(Bill,'Bill.txt');
        if FileExists('Bill.txt') then
          Append(Bill)
        else
          Rewrite(Bill);
        TotalPrice:=0;
        CurOr:=HeadOr;
        while CurOr.OrInfo.OrCode<>input do
          CurOr:=CurOr.OrAdr;
        writeln(Bill, '+-------------------------------------------------------------------------------------------------+');
        writeln(Bill, '|','Order', '#':46,CurOr.OrInfo.OrCode:16,'|', 'Table' ,'#':19, CurOr.OrInfo.TaCode:5,'|');
        writeln(Bill, '+-------------------------------------------------------------------------------------------------+');
        writeln(Bill, '|','Name','|':57, 'Price':12,'|', 'Amount','|', 'Sum','|':14);
        writeln(Bill, '+-------------------------------------------------------------------------------------------------+');
        while CurOr<>nil do
        begin
          if CurOr.OrInfo.OrCode=input then
          begin
            CurDi:=HeadDi;
            while (CurDi<>nil) and (CurDi.DiInfo.DiCode<>CurOr.OrInfo.OrDiCode)  do
              CurDi:=CurDi.DiAdr;
            if CurDi.DiInfo.DiCode=CurOr.OrInfo.OrDiCode then
            begin
              TotalPrice:=TotalPrice+(CurDi.DiInfo.DiCost*CurOr.OrInfo.Amount);
              writeln(Bill,'|', CurDi.DiInfo.DiName:60,'|', CurDi.DiInfo.DiCost:12:2,'|', CurOr.OrInfo.Amount:6,'|', (CurDi.DiInfo.DiCost*CurOr.OrInfo.Amount):16:2,'|')
            end;
          end;
          CurOr:=CurOr.OrAdr
        end;
        writeln(Bill, '+-------------------------------------------------------------------------------------------------+');
        writeln(Bill, '|Total', TotalPrice:92:2,'|');
        writeln(Bill, '+-------------------------------------------------------------------------------------------------+');
        writeln(Bill, '+-------------------------------------------------------------------------------------------------+');
        CloseFile(Bill);
      end
      else
      begin
        writeln('+-----------------------------------------+');
        writeln('You don''t have orders with this code');
        writeln('+-----------------------------------------+');
      end;

    end;
   end;
  end
  else
  begin
    writeln('+-----------------------------------------+');
    writeln('Unable to make a bill');
    writeln('+-----------------------------------------+');
  end;
end;

Procedure MainMenu;
var choise: integer;
    Ex: boolean;
begin
  Ex:=False;
  while not ex do
  begin
   writeln('+------------------------------------+');
   writeln('1. Open files');
   writeln('2. Show data');
   writeln('3. Sort data');
   writeln('4. Search data');
   writeln('5. Add data');
   writeln('6. Change data');
   writeln('7. Delete data');
   writeln('8. Get a bill');
   writeln('9. Identify the most popular dishes in categories');
   writeln('10. Exit with changes');
   writeln('11. Exit without changes ');
   writeln('+------------------------------------+');
   readln(choise);
   case choise of
    1:
      OpenFile;
    2:
      ShowData;
    3:
      SortData;
    4:
      Search;
    5:
      AddData;
    6:
      ChangeData;
    7:
      DeleteData;
    8:
      Bill;
    9:
      Popular;
    10:
    begin
      ex:=True;
      SavingEx(ex);
    end;
    11:
    begin
      ex:=True;
      ClearingMemory;
    end
    else
      writeln('incorrect input, try again')
   end;
  end;
end;


begin
  New(HeadDi);
  New(HeadOr);
  CurDi:=HeadDi;
  CurOr:=HeadOr;
  CurDi^.DiAdr:=nil;
  CurOr^.OrAdr:=nil;
  MainMenu;
end.
