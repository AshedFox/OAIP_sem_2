unit Unit3;

interface

uses
  Windows, SysUtils, Variants, Graphics, Classes, Forms;

type
TForm3= class (Tform)

end;


var
  Form3 :TForm3;

  procedure DrawImage(var P, Q:real);

  procedure PaintBackGround(canvas: TCanvas);
  procedure fon(offset: integer);
  procedure Human_first_pos(x, y: integer; k: real);
  procedure Human_second_pos(x, y: integer; k: real);
  procedure Human_third_pos(x, y: integer; k: real);
  procedure Human_forth_pos(x, y: integer; k: real);


  Procedure BodyR (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure HandsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure LegsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Jump_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Jump_LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Jump_HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Jump_HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_BodyR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_BodyR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_BodyR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_BodyR4 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_LegsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_LegsR4 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_HandsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Rotate_HandsR4 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Back_HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Back_HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Back_HandsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Back_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Back_LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure Back_LegsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);
  Procedure LongJump_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);

  Procedure Body     (a, b:real; k,HK:real; canvas:TCanvas);
  //--------------------------------------------------- Первый кадр
  Procedure Head1    (a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Forearms1(a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Arms1    (a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Knees1   (a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Legs1    (a, b:real; k, HK:real; canvas:TCanvas);
  procedure Sticks1  (a, b, k, HK: real; canvas: TCanvas);
  procedure Ski1     (a, b, k, HK: real; canvas: TCanvas);
  //--------------------------------------------------- Второй кадр
  Procedure Head2    (a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Forearms2(a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Arms2    (a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Knees2   (a, b:real; k, HK:real; canvas:TCanvas);
  Procedure Legs2    (a, b:real; k, HK:real; canvas:TCanvas);
  procedure Sticks2  (a, b, k, HK: real; canvas: TCanvas);
  procedure Ski2     (a, b, k, HK: real; canvas: TCanvas);
  //---------------------------------------------------
  procedure Ski3     (a, b, k, HK:real; canvas: TCanvas); //Лыжи на спуске
  
implementation
{$R *.dfm}

uses Unit1;

const
  n=60;        // длина тела
  arm1=0.5*n;  // коэффициент для плеча
  arm2=0.3*n;  // коэффициент для предплечья
  leg1=0.4*n;  // коэффициент для бедра
  leg2=0.6*n;  // коэффициент для голени
  l1 = 100;
  line = 70;


Procedure BodyR (x, y: integer; k, P,Q: real; canvas: TCanvas);  // процедура рисования тела
begin
with canvas do
  begin
    Brush.Color:=clWhite;
    ellipse(round((x - 15) * k * P), round((y - 30) * k * Q),
            round((x + 15) * k * P), round(y* k * Q));
    moveto(round(x * k * P), round(y * k * Q));
    lineto(round(x * k * P), round((y + n) * k * Q));
  end;
end;

Procedure HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas); // 1 положение рук при беге вправо
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x+arm1*sin(pi/6))*k*P), round((y+10+arm1*cos(pi/6))*k*Q));   // используем коэффициенты для частей тела и углы, под которыми эти части тела должны быть расположены
    lineTo(round((x+arm1*sin(pi/6)+arm2*sin(pi/2))*k*P), round((y+10+arm1*cos(pi/6)+arm2*cos(pi/2))*k*Q));
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x-arm1*sin(pi/4))*k*P), round((y+10+arm1*cos(pi/4))*k*Q));
    lineTo(round((x-arm1*sin(pi/4))*k*P), round((y+10+arm1*cos(pi/4)+arm2)*k*Q));
  end;
end;

Procedure HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas); // 2 положение рук при беге вправо
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x+arm1*sin(pi/18))*k*P), round((y+10+arm1*cos(pi/18))*k*Q));
    lineTo(round((x+arm1*sin(pi/18)+arm2*sin(pi/18))*k*P), round((y+10+arm1*cos(pi/18)+arm2*cos(pi/18))*k*Q));
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x-arm1*sin(pi/12))*k*P), round((y+10+arm1*cos(pi/12))*k*Q));
    lineTo(round((x-arm1*sin(pi/12))*k*P), round((y+10+arm1*cos(pi/12)+arm2)*k*Q));
  end;
end;

Procedure HandsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas); // 3 положение рук при беге вправо
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x+arm1*sin(pi/12))*k*P), round((y+10+arm1*cos(pi/12))*k*Q));
    lineTo(round((x+arm1*sin(pi/12)+arm2*sin(pi/2))*k*P), round((y+10+arm1*cos(pi/12)+arm2*cos(pi/2))*k*Q));
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x-arm1*sin(pi/9))*k*P), round((y+10+arm1*cos(pi/9))*k*Q));
    lineTo(round((x-arm1*sin(pi/9)+arm2*sin(pi/6))*k*P), round((y+10+arm1*cos(pi/9)+arm2*cos(pi/6))*k*Q));
  end;
end;

Procedure LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение ног при беге вправо
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x+leg1*sin(pi/6))*k*P), round((y+n+leg1*cos(pi/6))*k*Q));
    lineTo(round((x+leg1*sin(pi/6)+leg2*sin(pi/6))*k*P), round((y+n+leg1*cos(pi/6)+leg2*cos(pi/6))*k*Q));
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x-leg1*sin(pi/9))*k*P), round((y+n+leg1*cos(pi/9))*k*Q));
    lineTo(round((x-leg1*sin(pi/9)-leg2)*k*P), round((y+n+leg1*cos(pi/9))*k*Q));
  end;
end;

Procedure LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 2 положение ног при беге вправо
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x+leg1*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/4))*k*Q));
    lineTo(round((x+leg1*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/4)+leg2)*k*Q));
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round(x*k*P), round((y+n+leg1)*k*Q));
    lineTo(round((x-leg1*sin(pi/4)-leg2*sin(pi/8))*k*P), round((y+n+leg1*cos(pi/4)+leg2*cos(pi/8))*k*Q));
  end;
end;

Procedure LegsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 3 положение ног при беге вправо
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x+leg1*sin(pi/9))*k*P), round((y+n+leg1*cos(pi/9))*k*Q));
    lineTo(round((x+leg1*sin(pi/9)-leg2*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/9)+leg2*cos(pi/4))*k*Q));
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round(x*k*P), round((y+n+leg1)*k*Q));
    lineTo(round(x*k*P), round((y+n+leg1+leg2)*k*Q));
  end;
end;

Procedure Jump_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение ног при прижке для кувырка
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x+leg1*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/4))*k*Q));
    lineTo(round((x+leg1*sin(pi/4)-leg2*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/4)+leg2*cos(pi/4))*k*Q));
  end;
end;

Procedure Jump_HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение рук при прыжке для кувырка
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x-arm1*sin(pi/6))*k*P), round((y+10+arm1*cos(pi/6))*k*Q));
    lineTo(round((x-arm1*sin(pi/6)+arm2)*k*P), round((y+10+arm1*cos(pi/6))*k*Q));
  end;
end;

Procedure Jump_LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 2 положение ног при прыжке для кувырка
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x-leg1*sin(pi/6))*k*P), round((y+n+leg1*cos(pi/6))*k*Q));
    lineTo(round((x-leg1*sin(pi/6)-leg2*sin(pi/6))*k*P), round((y+n+leg1*cos(pi/6)+leg2*cos(pi/6))*k*Q));
  end;
end;

Procedure Jump_HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas); // 2 положение рук при прыжке для кувырка
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x+arm1*sin(pi/4))*k*P), round((y+10-arm1*cos(pi/4))*k*Q));
    lineTo(round((x+arm1*sin(pi/4)+arm2*sin(pi/4))*k*P), round((y+10-arm1*cos(pi/4)-arm2*cos(pi/4))*k*Q));
  end;
end;

Procedure Rotate_BodyR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение тела при кувырке
begin
with canvas do
  begin
    Brush.Color:=clWhite;
    ellipse(round((x - 15) * k * P), round((y - 30) * k * Q),
      round((x + 15) * k * P), round(y* k * Q));
    moveto(round((x-15) * k * P), round((y-15) * k * Q));
    lineto(round((x-15-n) * k * P), round((y-15) * k * Q));
  end;
end;

Procedure Rotate_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение ног при кувырке
begin
  with canvas do
  begin
    moveTo(round((x-15-n)*k*P), round((y-15)*k*Q));
    lineTo(round((x-15-n+leg1*sin(pi/6))*k*P), round((y-15+leg1*cos(pi/6))*k*Q));
    lineTo(round((x-15-n+leg1*sin(pi/6)-leg2*sin(pi/4))*k*P), round((y-15+leg1*cos(pi/6)+leg2*cos(pi/4))*k*Q));
  end;
end;

Procedure Rotate_HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение рук при кувырке
begin
  with canvas do
  begin
    moveTo(round((x-25)*k*P), round((y-15)*k*Q));
    lineTo(round(((x-25)-arm1*sin(pi/6))*k*P), round((y-15+arm1*cos(pi/6))*k*Q));
    lineTo(round(((x-25)-arm1*sin(pi/6)-arm2*sin(pi/6))*k*P), round((y-15+arm1*cos(pi/6)+arm2*cos(pi/6))*k*Q));
  end;
end;

Procedure Rotate_BodyR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 2 положение тела при кувырке
begin
with canvas do
  begin
    Brush.Color:=clWhite;
    ellipse(round((x - 15) * k * P), round((y - 30) * k * Q),
      round((x + 15) * k * P), round(y* k * Q));
    moveto(round(x * k * P), round((y-30) * k * Q));
    lineto(round((x+n/2*sin(pi/3)) * k * P), round((y-30-n/2*cos(pi/3)) * k * Q));
    lineTo(round((x+n/2*sin(pi/3)) * k * P), round((y-30-n/2*cos(pi/3)-n/2) * k * Q));
  end;
end;

Procedure Rotate_LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 2 положение ног при кувырке
begin
  with canvas do
  begin
    moveTo(round((x+n/2*sin(pi/3))*k*P), round((y-30-n/2*cos(pi/3)-n/2)*k*Q));
    lineTo(round((x+n/2*sin(pi/3)-leg1*sin(pi/4))*k*P), round((y-30-n/2*cos(pi/3)-n/2+leg1*cos(pi/4))*k*Q));
    lineTo(round((x+n/2*sin(pi/3)-leg1*sin(pi/4)-leg2*sin(pi))*k*P), round((y-30-n/2*cos(pi/3)-n/2+leg1*cos(pi/4)+leg2*cos(pi))*k*Q));
  end;
end;

Procedure Rotate_HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas); // 2 положение рук при кувырке
begin
  with canvas do
  begin
    moveTo(round((x+5*sin(pi/3))*k*P), round((y-30-5*cos(pi/3))*k*Q));
    lineTo(round((x+5*sin(pi/3)+arm1*sin(pi/9))*k*P), round((y-30-5*cos(pi/3)-arm1*cos(pi/9))*k*Q));
    lineTo(round((x+5*sin(pi/3)+arm1*sin(pi/9)+arm2*sin(pi/9))*k*P), round((y-30-5*cos(pi/3)-arm1*cos(pi/9)-arm2*cos(pi/9))*k*Q));
  end;
end;

Procedure Rotate_BodyR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 3 положение тела при кувырке
begin
  with canvas do
  begin
    Brush.Color:=clWhite;
    ellipse(round((x - 15) * k * P), round((y - 30) * k * Q),
      round((x + 15) * k * P), round(y* k * Q));
    moveto(round(x * k * P), round(y * k * Q));
    lineto(round((x-n/2*sin(pi/3)) * k * P), round((y+n/2*cos(pi/3)) * k * Q));
    lineTo(round((x-n/2*sin(pi/3)+n/2*sin(pi/12)) * k * P), round((y+n/2*cos(pi/3)+n/2*cos(pi/12)) * k * Q));
  end;
end;

Procedure Rotate_LegsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);   // 3 положение ног при кувырке
begin
  with canvas do
  begin
    moveTo(round((x-n/2*sin(pi/3)+n/2*sin(pi/12)) * k * P), round((y+n/2*cos(pi/3)+n/2*cos(pi/12)) * k * Q));
    lineTo(round((x-n/2*sin(pi/3)+n/2*sin(pi/12)+leg1*sin(pi/3))*k*P), round((y+n/2*cos(pi/3)+n/2*cos(pi/12)-n/2+leg1*cos(pi/3))*k*Q));
    lineTo(round((x-n/2*sin(pi/3)+n/2*sin(pi/12)+leg1*sin(pi/3)+leg2*sin(pi))*k*P), round((y+n/2*cos(pi/3)+n/2*cos(pi/12)+n/2+leg1*cos(pi/3)+leg2*cos(pi))*k*Q));
  end;
end;

Procedure Rotate_HandsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 3 положение рук при кувырке
begin
  with canvas do
  begin
    moveTo(round((x-5*sin(pi/3))*k*P), round((y+5*cos(pi/3))*k*Q));
    lineTo(round((x-5*sin(pi/3)-arm1*sin(pi/15))*k*P), round((y+5*cos(pi/3)+arm1*cos(pi/15))*k*Q));
    lineTo(round((x-5*sin(pi/3)-arm1*sin(pi/15)-arm2*sin(pi/15))*k*P), round((y+5*cos(pi/3)+arm1*cos(pi/15)+arm2*cos(pi/15))*k*Q));
  end;
end;

Procedure Rotate_BodyR4 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 4 положение тела при кувырке
begin
with canvas do
  begin
    Brush.Color:=clWhite;
    ellipse(round((x - 15) * k * P), round((y - 30) * k * Q),
      round((x + 15) * k * P), round(y* k * Q));
    moveto(round(x * k * P), round(y * k * Q));
    lineto(round((x+n*sin(pi/12)) * k * P), round((y+n*cos(pi/12)) * k * Q));
  end;
end;

Procedure Rotate_LegsR4 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 4 положение ног при кувырке
begin
  with canvas do
  begin
    moveTo(round((x+n*sin(pi/12)) * k * P), round((y+n*cos(pi/12)) * k * Q));
    lineTo(round((x+n*sin(pi/12)+leg1*sin(pi/3))*k*P), round((y+n*cos(pi/12)+leg1*cos(pi/3))*k*Q));
    lineTo(round((x+n*sin(pi/12)+leg1*sin(pi/3)+leg2*sin(pi/15))*k*P), round((y+n*cos(pi/12)+leg1*cos(pi/3)+leg2*cos(pi/15))*k*Q));
  end;
end;

Procedure Rotate_HandsR4 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 4 положение рук при кувырке
begin
  with canvas do
  begin
    moveTo(round((x+5*sin(pi/12))*k*P), round((y+5*cos(pi/12))*k*Q));
    lineTo(round((x-5*sin(pi/12)-arm1*sin(pi/6))*k*P), round((y+5*cos(pi/12)+arm1*cos(pi/6))*k*Q));
    lineTo(round((x-5*sin(pi/12)-arm1*sin(pi/6)+arm2*sin(pi/3))*k*P), round((y+5*cos(pi/12)+arm1*cos(pi/6)+arm2*cos(pi/3))*k*Q));
  end;
end;

Procedure Back_HandsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение рук при беге влево
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x-arm1*sin(pi/6))*k*P), round((y+10+arm1*cos(pi/6))*k*Q));
    lineTo(round((x-arm1*sin(pi/6)-arm2*sin(pi/2))*k*P), round((y+10+arm1*cos(pi/6)+arm2*cos(pi/2))*k*Q));
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x+arm1*sin(pi/4))*k*P), round((y+10+arm1*cos(pi/4))*k*Q));
    lineTo(round((x+arm1*sin(pi/4))*k*P), round((y+10+arm1*cos(pi/4)+arm2)*k*Q));
  end;
end;

Procedure Back_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 1 положение ног при беге влево
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x-leg1*sin(pi/6))*k*P), round((y+n+leg1*cos(pi/6))*k*Q));
    lineTo(round((x-leg1*sin(pi/6)-leg2*sin(pi/6))*k*P), round((y+n+leg1*cos(pi/6)+leg2*cos(pi/6))*k*Q));
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x+leg1*sin(pi/9))*k*P), round((y+n+leg1*cos(pi/9))*k*Q));
    lineTo(round((x+leg1*sin(pi/9)+leg2)*k*P), round((y+n+leg1*cos(pi/9))*k*Q));
  end;
end;

Procedure Back_HandsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 2 положение рук при беге влево
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x-arm1*sin(pi/18))*k*P), round((y+10+arm1*cos(pi/18))*k*Q));
    lineTo(round((x-arm1*sin(pi/18)-arm2*sin(pi/18))*k*P), round((y+10+arm1*cos(pi/18)+arm2*cos(pi/18))*k*Q));
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x+arm1*sin(pi/12))*k*P), round((y+10+arm1*cos(pi/12))*k*Q));
    lineTo(round((x+arm1*sin(pi/12))*k*P), round((y+10+arm1*cos(pi/12)+arm2)*k*Q));
  end;
end;

Procedure Back_LegsR2 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 2 положение ног при беге влево
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x-leg1*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/4))*k*Q));
    lineTo(round((x-leg1*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/4)+leg2)*k*Q));
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round(x*k*P), round((y+n+leg1)*k*Q));
    lineTo(round((x+leg1*sin(pi/4)+arm2*sin(pi/8))*k*P), round((y+n+leg1*cos(pi/4)+leg2*cos(pi/8))*k*Q));
  end;
end;

Procedure Back_HandsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 3 положение рук при беге влево
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x-arm1*sin(pi/12))*k*P), round((y+10+arm1*cos(pi/12))*k*Q));
    lineTo(round((x-arm1*sin(pi/12)-arm2*sin(pi/2))*k*P), round((y+10+arm1*cos(pi/12)+arm2*cos(pi/2))*k*Q));
    moveTo(round(x*k*P), round((y+10)*k*Q));
    lineTo(round((x+arm1*sin(pi/9))*k*P), round((y+10+arm1*cos(pi/9))*k*Q));
    lineTo(round((x+arm1*sin(pi/9)-arm2*sin(pi/6))*k*P), round((y+10+arm1*cos(pi/9)+arm2*cos(pi/6))*k*Q));
  end;
end;

Procedure Back_LegsR3 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // 3 положение ног при беге влево
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x-leg1*sin(pi/9))*k*P), round((y+n+leg1*cos(pi/9))*k*Q));
    lineTo(round((x-leg1*sin(pi/9)+leg2*sin(pi/4))*k*P), round((y+n+leg1*cos(pi/9)+leg2*cos(pi/4))*k*Q));
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round(x*k*P), round((y+n+leg1)*k*Q));
    lineTo(round(x*k*P), round((y+n+leg1+leg2)*k*Q));
  end;
end;

Procedure LongJump_LegsR1 (x, y: integer; k, P,Q: real; canvas: TCanvas);  // положение ног при прыжке через препятствие
begin
  with canvas do
  begin
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x+leg1*sin(pi/3))*k*P), round((y+n+leg1*cos(pi/3))*k*Q));
    lineTo(round((x+leg1*sin(pi/3)+leg2*sin(pi/2.25))*k*P), round((y+n+leg1*cos(pi/3)+leg2*cos(pi/2.25))*k*Q));
    moveTo(round(x*k*P), round((y+n)*k*Q));
    lineTo(round((x-leg1*sin(pi/2.25))*k*P), round((y+n+leg1*cos(pi/2.25))*k*Q));
    lineTo(round((x-leg1*sin(pi/2.25)-leg2*sin(pi/3))*k*P), round((y+n+leg1*cos(pi/2.25)+leg2*cos(pi/6))*k*Q));
  end;
end;

Procedure Body(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
    begin
      moveto(round(a), round(b*HK));
      lineto(round(a), round((b+line*k)*HK));
    end;
end;
//----------------------------------------------- Первый кадр
Procedure Head1(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
    begin
      moveto(round(a), round(b));
      ellipse(round((a-(line*k/3))),round((b-(line*k/3))*HK),round((a+(line*k/3))),round((b+(line*k/3))*Hk));
    end;
end;

Procedure Forearms1(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a),round((b+(line*k/3))*HK));
    lineto(round((a-(line*k/3))),round((b+(line*k/3))*HK));   //отрисовка левого предплечья
    moveto(round(a),round((b+(line*k/3))*HK));
    lineto(round((a+(line*k/3))),round((b+(line*k/3))*HK));   //отрисовка правого предплечья
  end;
end;

Procedure Arms1(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round((a-(line*k/3))),round((b+line*k/3)*HK));
    lineto(round((a-(line*k/4))),round((b+line*k/2)*HK));     //отрисовка левой руки
    moveto(round(a+(line*k/3)),round(HK*(b+line*k/3)));
    lineto(round((a+(line*k/2))),round((b+line*k/2)*HK));     //отрисовка правой руки
  end;
end;

Procedure Knees1(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a),round((b+line*k)*HK));
    lineto(round((a-line*k/6)),round((b+6*line*k/5)*HK));     //отрисовка левого колена
    moveto(round(a),round((b+line*k)*HK));
    lineto(round((a+line*k/6)),round((b+6*line*k/5)*HK));     //отрисовка правого колена
  end;
end;

Procedure Legs1(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round((a-line*k/6)),round(HK*(b+6*line*k/5)));
    lineto(round((a-line*k/6)),round(HK*(b+7*line*k/5)));     //отрисовка левой ступни
    moveto(round((a+line*k/6)),round(HK*(b+6*line*k/5)));
    lineto(round((a+line*k/6)),round(HK*(b+7*line*k/5)));     //отрисовка правой ступни
  end;
end;

procedure Sticks1  (a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a-(line*k/(26/10))),round(HK*(b+line*k/(21/10))));
    lineto(round(a+(line*k*0.8)),round(HK*(b+line*k/3)));                  //отрисовка правой палки
    moveto(round(a+(line*(k/(26/10)))),round(HK*(b+line*k/(21/10))));     //отрисовка левой палки
    lineto(round(a+(line*k*1.5)), round(HK*(b+line*k/3)));
  end;
end;

Procedure Ski1     (a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round((a+line*k/2)),round(HK*(b+6.7*line*k/5)));
    lineto(round((a-line*k/(5/3))),round(HK*(b+7.2*line*k/5)));     //отрисовка левой лыжи
    moveto(round((a+line*(k/2+k/3))),round(HK*(b+6.7*line*k/5)));
    lineto(round((a-line*(k/(5/3)-k/3))),round(HK*(b+7.2*line*k/5)));     //отрисовка правой лыжи
  end;
end;


//----------------------------------------------- Второй кадр
Procedure Head2(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
    begin
      moveto (round(a), round(HK*b));
      ellipse(round(a-(line*k/3)+line*k/8),round(HK*(b-(line*k/3))),round(a+(line*k/3)+line*k/8),round(HK*(b+(line*k/3))));
    end;
end;

Procedure Forearms2(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a),round(HK*(b+(line*k/3))));
    lineto(round(a-(line*k/3)),round(HK*(b+(line*k/2.5))));   //отрисовка левого предплечья
    moveto(round(a),round(HK*(b+(line*k/3))));
    lineto(round(a+(line*k/3)),round(HK*(b+(line*k/2.5))));   //отрисовка правого предплечья
  end;
end;

Procedure Arms2(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a-(line*k/3)),round(HK*(b+line*k/2.5)));
    lineto(round(a-(line*k/2)),round(HK*(b+line*k/1.5)));     //отрисовка левой руки
    moveto(round(a+(line*k/3)),round(HK*(b+line*k/2.5)));
    lineto(round(a+(line*k/4)),round(HK*(b+line*k/1.5)));     //отрисовка правой руки
  end;
end;

Procedure Knees2(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a),round(HK*(b+line*k)));
    lineto(round(a-line*k/6),round(HK*(b+6*line*k/5.5)));     //отрисовка левого колена
    moveto(round(a),round(HK*(b+line*k)));
    lineto(round(a+line*k/6),round(HK*(b+6*line*k/5.5)));     //отрисовка правого колена
  end;
end;

Procedure Legs2(a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a-line*k/6),round(HK*(b+6*line*k/5.5)));
    lineto(round(a-line*k/4),round(HK*(b+7*line*k/5)));     //отрисовка левой ступни
    moveto(round(a+line*k/6),round(HK*(b+6*line*k/5.5)));
    lineto(round(a+line*k/4),round(HK*(b+7*line*k/5)));     //отрисовка правой ступни
  end;
end;

procedure Sticks2  (a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a-(line*k/(18/10))),round(HK*(b+line*k/(13/8))));
    lineto(round(a+(line*k/24)),round(HK*(b+line*k*1.4)));                  //отрисовка правой палки
    moveto(round(a+(line*k*(3/4-10/18))),round(HK*(b+line*k/(13/8))));     //отрисовка левой палки
    lineto(round(a+(line*k*(1/20+2/4))), round(HK*(b+line*k*1.5)));
  end;
end;

Procedure Ski2     (a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a+line*k/2),round(HK*(b+6.8*line*k/5)));
    lineto(round(a-line*k/(5/3)),round(HK*(b+7.2*line*k/5)));     //отрисовка левой лыжи
    moveto(round(a+line*(k/2+k/3)),round(HK*(b+6.8*line*k/5)));
    lineto(round(a-line*(k/(5/3)-k/3)),round(HK*(b+7.2*line*k/5)));     //отрисовка правой лыжи
  end;
end;

procedure Ski3     (a, b, k, HK: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a+line*k/2),round(HK*(b+5.8*line*k/5)));
    lineto(round(a-line*k/(5/3)),round(HK*(b+8.1*line*k/5)));     //отрисовка  лыж при спуске
    moveto(round(a+line*(k/2+k/3)),round(HK*(b+5.8*line*k/5)));
    lineto(round(a-line*(k/(5/3)-k/3)),round(HK*(b+8*line*k/5)));
  end;
end;


  
procedure fon(offset:integer);
var x,z,offX2:integer;
  k:real;
begin
  offX2:=offset*2;
  x:=550;
  k:=1.5 ;
  z:=0;
  with Form1.canvas do
  begin
    pen.Color:=clBlack;
    Brush.Color:=clBlack;

    Moveto(150-offset,Round(k*320)-z);
    Lineto(220-offset,Round(k*320)-z);
    Lineto(230-offset,Round(k*300)-z);
    Lineto(130-offset,Round(k*300)-z);
    Lineto(150-offset,Round(k*320)-z);
    Moveto(160-offset,Round(k*300)-z);
    Lineto(160-offset,Round(k*280)-z);
    Lineto(200-offset,Round(k*280)-z);
    Lineto(200-offset,Round(k*300)-z);

    Moveto(x+150-offX2,Round(Form1.ClientHeight/1.5));
    Lineto(x+220-offX2,Round(Form1.ClientHeight/1.5));
    Lineto(x+230-offX2,Round(Form1.ClientHeight/1.5)-20);
    Lineto(x+130-offX2,Round(Form1.ClientHeight/1.5)-20);
    Lineto(x+150-offX2,Round(Form1.ClientHeight/1.5));
    Moveto(x+160-offX2,Round(Form1.ClientHeight/1.5)-20);
    Lineto(x+160-offX2,Round(Form1.ClientHeight/1.5)-40);
    Lineto(x+200-offX2,Round(Form1.ClientHeight/1.5)-40);
    Lineto(x+200-offX2,Round(Form1.ClientHeight/1.5)-20);
    Brush.Color:=clWhite;
  end;
end;

procedure Human_second_pos(x, y: integer; k: real);
var
  Fcord, Scord, Ccord, Acord: integer;
  l: integer;
begin
  with Form1.canvas do
  begin
    l := round(l1 * k);
    Fcord := round(l / 3);
    Scord := round(l / 2);
    Ccord := round(l / 4);
    Acord := round(l / 5);
    Ellipse(x - Ccord, y - Ccord, x + Ccord, y + Ccord);
    y := y + Ccord;

    moveto(x - 2 * l, y + l);
    lineto(x + 2 * l, y + l);
    lineto(x + 2 * l - Scord, y + l + Scord);
    lineto(x - 2 * l + Scord, y + l + Scord);
    lineto(x - 2 * l, y + l);

    moveto(x, y);
    lineto(x, y + l);
    lineto(x - Scord, y + Scord);
    lineto(x - l, y + l);
    moveto(x, y);
    lineto(x - Fcord, y + Fcord);
    lineto(x - Scord - Fcord, y + Fcord);
    if pen.Color <> clwhite then
      pen.Color := clMaroon;
    lineto(x, y + l + Scord);
    moveto(x - Scord - Fcord, y + Fcord);
    lineto(x - Scord - Acord, y + l);
    if pen.Color <> clwhite then
      pen.Color := clBlack;
  end;

end;

procedure Human_third_pos(x, y: integer; k: real);
var
  Fcord, Scord, Ccord, Acord: integer;
  l: integer;
begin
  with Form1.Canvas do
  begin
    l := round(l1 * k);
    Fcord := round(l / 3);
    Scord := round(l / 2);
    Ccord := round(l / 4);
    Acord := round(l / 5);

    // голова
    Ellipse(x - Ccord + Scord, y - Ccord, x + Ccord + Scord, y + Ccord);
    y := y + Ccord;

    // лодка

    moveto(x - 2 * l, y + l);
    lineto(x + 2 * l, y + l);
    lineto(x + 2* l - Scord, y + l + Scord);
    lineto(x - 2 * l + Scord, y + l + Scord);
    lineto(x - 2 * l, y + l);
    // туловище
    moveto(x, y + l);
    lineto(x + Scord, y);
    lineto(x + Scord + Fcord, y + Scord);
    lineto(x + Scord - Ccord, y + Scord);

    if pen.Color <> clwhite then
      pen.Color := clMaroon;
    // вёсла
    lineto(x - l, y + l + Scord);
    moveto(x + Scord - Ccord, y + Scord);
    lineto(x - Scord, y + l);

    if pen.Color <> clwhite then
      pen.Color := clBlack;
  end;

end;

procedure Human_forth_pos(x, y: integer; k: real);
var
  Fcord, Scord, Ccord, Acord: integer;
  l: integer;
  t: tcolor;
begin
  with Form1.Canvas do
  begin
    l := round(l1 * k);
    Fcord := round(l / 3);
    Scord := round(l / 2);
    Ccord := round(l / 4);
    Acord := round(l / 5);
    Ellipse(x - Ccord, y - Ccord, x + Ccord, y + Ccord);
    y := y + Ccord;

    moveto(x - 2 * l, y + l);
    lineto(x + 2 * l, y + l);
    lineto(x + 2 * l - Scord, y + l + Scord);
    lineto(x - 2 * l + Scord, y + l + Scord);
    lineto(x - 2 * l, y + l);

    moveto(x, y);
    lineto(x, y + l);
    lineto(x - Scord, y + Scord);
    lineto(x - l, y + l);
    moveto(x, y);
    lineto(x - Fcord, y + Fcord);
    lineto(x - Scord - Fcord, y + Fcord);
    if pen.Color <> clwhite then
    begin
      pen.Color := clMaroon;
      t := clMaroon;
    end
    else
      t := clwhite;

    lineto(x - l - Acord, y + l + Ccord);
    pen.Width := 1;
    brush.Color := clMaroon;
    lineto(x - l - 2 * Acord + Ccord, y + l + Fcord);
    lineto(x - l - Acord, y + l + Ccord + 2 * Acord);
    lineto(x - l - Fcord - Ccord + Acord, y + l + 3 * Acord);
    lineto(x - l - 2 * Ccord + Acord, y + l + Fcord);
    lineto(x - l - Acord, y + l + Ccord);

    flooDfill(x - l - Acord, y + l + Ccord + round(l / 20), t, fsborder);
    pen.Width := 5;
    moveto(x - Scord - Fcord, y + Fcord);
    lineto(x - l - Scord, y + l);
    brush.Color := clwhite;
    if pen.Color <> clwhite then
      pen.Color := clBlack;
  end;

end;

procedure Human_first_pos(x, y: integer; k: real);
var
  Fcord, Scord, Ccord, Acord: integer;
  l: integer;
begin
  with Form1.Canvas do
  begin
    l := round(l1 * k);
    Fcord := round(l / 3);
    Scord := round(l / 2);
    Ccord := round(l / 4);
    Acord := round(l / 5); // голова
    Ellipse(x - Fcord - Ccord, y - Ccord, x - Fcord + Ccord, y + Ccord);
    y := y + Ccord;

    // лодка
    moveto(x - 2 * l, y + l);
    lineto(x + 2 * l, y + l);
    lineto(x + 2 * l - Scord, y + l + Scord);
    lineto(x - 2 * l + Scord, y + l + Scord);
    lineto(x - 2 * l, y + l);
    // туловище
    moveto(x - Fcord, y);
    lineto(x, y + l);
    lineto(x - Fcord - Acord, y + Scord);
    lineto(x - Fcord - Acord, y + l);
    moveto(x - Fcord, y);
    lineto(x - l - Fcord, y + Scord);

    if pen.Color <> clwhite then
      pen.Color := clMaroon;
    // вёсла
    lineto(x, y + l + Scord);
    moveto(x - l - Fcord, y + Scord);
    lineto(x - l, y + l);

    if pen.Color <> clwhite then
      pen.Color := clBlack;
  end;

end;


procedure PaintBackGround(canvas: TCanvas);
var r, y, g: integer;
    pt: real;
    Points: array[0..2] of TPoint;
begin
  with Canvas do
  begin
    with Form1 do
    begin
      Pen.Width:=5;
      r:=160;
      g:=160;
      y:=0;
      while y<(ClientHeight) do      //небо
      begin
        if r<225 then
          Pen.Color:=RGB(r,g,250);
        moveto(0,y);
        lineto(ClientWidth, y);
        inc(y, 5);
        inc(g);
        inc(r);
      end;

      Pen.Color:=clWebOrange;
      Image1.Canvas.Brush.Color:=clWebGold;
      Pen.Width:=5;
      Ellipse(20, 20, 150, 150);           //Солнце

      Pen.Color:=RGB(225,225,250);
      Image1.Canvas.Brush.Color:=clWhite;

      Pen.Width:=5;


      Randomize;
      Points[0].X:=ClientWidth+500;
      Points[0].Y:=Round(0.8*ClientHeight);
      Points[1].X:=ClientWidth-200;
      Points[1].Y:=Round(ClientHeight*0.1+100);     //Горы на заднем плане
      Points[2].X:=ClientWidth-800;
      Points[2].Y:=Round(0.8*ClientHeight);
      Polygon(Points);
      pt:=0.8;
      while Points[0].X>0 do
      begin
        Points[0].X:=Points[1].X+500;
        Points[0].Y:=Round(pt*ClientHeight);
        Points[1].X:=Points[2].X+100;
        Points[1].Y:=Round(ClientHeight*0.1+100);
        Points[2].X:=Points[2].X-600+100;
        Points[2].Y:=Round(pt*ClientHeight);
        pt:=pt/0.95;
        Polygon(Points);
      end;


      Pen.Width:=37;
      r:=230;
      y:=ClientHeight;
      while y>ClientHeight/2 do          // Часть горы, на которой лыжня (нижняя белая)
      begin
        if r<240 then
          Pen.Color:=RGB(r,255,255);
        moveto(-400,ClientHeight);
        lineto(ClientWidth-Round(ClientWidth/3), y);
        lineto(ClientWidth, y-20);
        dec(y, 5);
        inc(r);
      end;


      Pen.Width:=20;
      r:=220;
      g:=0;
      y:=ClientHeight div 2;
      while y>ClientHeight/2.2 do             //Лыжня
      begin
        if (r=220) then
          Pen.Color:=clScrollBar            //Нижняя граница лыжни(первая кривая)
        else
          if r<240 then
            Pen.Color:=RGB(r,240,240);
        moveto(0,ClientHeight-g*20);
        lineto(ClientWidth-Round(ClientWidth/3), y);
        lineto(ClientWidth, Round(y-20+g*3));
        dec(y, 5);
        inc(g);
        inc(r);
      end;

      pen.Color:=clWebPeru;
      pen.Width:=10;                              //Флажок
      moveto(ClientWidth-Round(ClientWidth/3), y-7);
      lineto(ClientWidth-Round(ClientWidth/3), y-60);
      Brush.Color:=clRed;
      Pen.Color:=clRed;
      rectangle(ClientWidth-Round(ClientWidth/3)+1,y-60,ClientWidth-Round(ClientWidth/3)-45, y-70);
      Brush.Color:=ClBlack;
      Pen.Color:=ClBlack;
      rectangle(ClientWidth-Round(ClientWidth/3)+1,y-75,ClientWidth-Round(ClientWidth/3)-45, y-80);

      Pen.Width:=3;
      Pen.Color:=clScrollBar;                    //Верхняя граница лыжни
      moveto(ClientWidth, y-28+g*3);
      lineto(ClientWidth-Round(ClientWidth/3), y-3);
      Pen.Width:=5;
      lineto(0,ClientHeight-g*20);
      moveto(ClientWidth-Round(ClientWidth/3), y-3);
      lineTo(0,ClientHeight-g*20+5);
      moveto(ClientWidth-Round(ClientWidth/3), y-3);
      lineTo(0,ClientHeight-g*20+10);

    end;
  end;
end;

procedure DrawImage(var P, Q:real);
begin
  with form1 do
  begin
    P := ClientWidth / 1000;     // Коэффициент масштабирования по ширине
    Q := ClientHeight / 600;     // Коэффициент масштабирования по высоте
    with Image1.Canvas do begin
      //             Небо
      //----------------------------------------
        Brush.Color:=clSkyBlue;
        Pen.Color:=clSkyBlue;
        Rectangle(round(0*P),round(0*Q),round(1000*P),round(120*Q));

      //             Cолнце
      //----------------------------------------
        Brush.Color:=clYellow;
        Pen.Color:=clYellow;
        Pen.Width:=4;
        Ellipse(round(450*P),round(70*Q),round(550*P),round(170*Q));
        moveTo(round(450*P),round(110*Q));
        lineTo(round(400*P),round(110*Q));
        moveTo(round(550*P),round(110*Q));
        lineTo(round(600*P),round(110*Q));
        moveTo(round(500*P),round(70*Q));
        lineTo(round(500*P),round(40*Q));
        moveTo(round(475*P),round(95*Q));
        lineTo(round((475-50*sin(pi/3))*P),round((95-50*cos(pi/3))*Q));
        moveTo(round(525*P),round(95*Q));
        lineTo(round((525+50*sin(pi/3))*P),round((95-50*cos(pi/3))*Q));
        moveTo(round(475*P),round(75*Q));
        lineTo(round((475-50*sin(pi/6))*P),round((75-50*cos(pi/6))*Q));
        moveTo(round(525*P),round(75*Q));
        lineTo(round((525+50*sin(pi/6))*P),round((75-50*cos(pi/6))*Q));

      //             Трава
      //----------------------------------------
        Brush.Color:=clGreen;
        Pen.Color:=clGreen;
        Rectangle(round(0*P),round(120*Q),round(1000*P),round(1000*Q));

      //             Дорога
      //----------------------------------------
        Brush.Color:=clGrayText;
        Pen.Color:=clGrayText;
        Ellipse(round(0*P),round(150*Q),round(800*P),round(600*Q));
        Rectangle(round(0*P),round(150*Q),round(420*P),round(300*Q));
        Rectangle(round(0*P),round(450*Q),round(420*P),round(600*Q));

      //        Трава внутри дороги
      //----------------------------------------
        Brush.Color:=clGreen;
        Pen.Color:=clGreen;
        Ellipse(round(320*P),round(280*Q),round(520*P),round(450*Q));
        Rectangle(round(0*P),round(280*Q),round(420*P),round(450*Q));

      //             Дерево
      //----------------------------------------
        Brush.Color:=clMaroon;
        Pen.Color:=clMaroon;
        Rectangle(round(920*P),round(150*Q),round(930*P),round(300*Q));
        Rectangle(round(850*P),round(270*Q),round(860*P),round(420*Q));
        Rectangle(round(900*P),round(400*Q),round(910*P),round(550*Q));
        Brush.Color:=clLime;
        Pen.Color:=clLime;
        Ellipse(round(880*P),round(150*Q),round(970*P),round(20*Q));
        Ellipse(round(810*P),round(270*Q),round(900*P),round(140*Q));
        Ellipse(round(860*P),round(400*Q),round(950*P),round(280*Q));

      //        Препятствие 1
      //----------------------------------------
        Pen.Color:=clBlack;
        Pen.Width:=3;
        moveTo(round(440*P),round(510*Q));
        lineTo(round(440*P),round(460*Q));
        lineTo(round(540*P),round(510*Q));
        lineTo(round(540*P),round(560*Q));

      //        Препятствие 2
      //----------------------------------------
        moveTo(round(250*P),round(510*Q));
        lineTo(round(250*P),round(460*Q));
        lineTo(round(350*P),round(510*Q));
        lineTo(round(350*P),round(560*Q));

      //        Препятствие 3
      //----------------------------------------
        moveTo(round(60*P),round(510*Q));
        lineTo(round(60*P),round(460*Q));
        lineTo(round(160*P),round(510*Q));
        lineTo(round(160*P),round(560*Q));
    end;
  end;
end;

end.
