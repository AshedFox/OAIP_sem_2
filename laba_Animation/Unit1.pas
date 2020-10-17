unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    TimerSki: TTimer;
    MediaPlayer1: TMediaPlayer;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure TimerSkiTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3;

var
  i,j,off:integer;
  x,y, WK, HK,P,Q, k:real;
  AnimCase: byte;


{$R *.dfm}


//--------------------------------------------------
Procedure TForm1.FormActivate(Sender: TObject);
begin
  case AnimCase of
    1:
    begin
      off:=0;
      x := 100;
      y := Round(ClientHeight/1.5) ;
      k := 0.3;
      i := 1;
      TimerSki.Interval:=50;
    end;
    2:
    begin
      x:=ClientWidth;
      y:=254.4+12*CLientHeight/694;
      k:=0.5;
      canvas.Pen.Width:=3;
      i:=1;
      MediaPlayer1.Close;
      if FileExists('song.mp3') then
      begin
        MediaPlayer1.FileName := 'song.mp3';
        MediaPlayer1.Open;
        MediaPlayer1.Play;
      end;
      TimerSki.Interval:=310;
      Image1.Picture:=nil;
      PaintBackGround(Image1.canvas);
    end;
    3:
    begin
      canvas.Pen.Width := 4;
      x:=50;  // координата х начального положения
      y:=100; // координата у начального положения
      k:=1;   // начальное значение кооэффициента масштабирования
      i:=1;   // начальное значение переменной, отвечающей за смену движения
      TimerSki.Interval:=80;
      MediaPlayer1.Close;
      if FileExists('GymnasticSong.mp3') then
      begin
        MediaPlayer1.FileName := 'GymnasticSong.mp3';   // присвоение нового значения
        Mediaplayer1.Open;             // сканирование значения FileName  и запуск
        Mediaplayer1.Play;
      end;
      DrawImage(P, Q);
    end;
  end;
end;

Procedure TForm1.TimerSkiTimer(Sender: TObject);
begin
  case AnimCase of
    1:
    begin
      Repaint;
      DoubleBuffered:=True;
      if i = 5 then
        i := 1;
      Inc(off,4);
      fon(off);
      Canvas.pen.Width := 5;
      canvas.pen.Color := clBlack;
      case i of // Прорисовка нового изображения
        1:
          Human_first_pos(Round(x), Round(y), k);
        2:
          Human_second_pos(Round(x), Round(y), k);
        3:
          begin
            x:=x+ 20;
            k := k + 0.0035;
            Human_third_pos(Round(x), Round(y), k);
          end;
        4:
          Human_forth_pos(Round(x), Round(y), k);
      end;
      if x>=ClientWidth+200 then
      begin
         AnimCase:=2;
         FormActivate(nil);
      end;
      Inc(i);
    end;
    2:
    begin
      WK:=ClientWidth/1211;
      HK:=ClientHeight/694;
      with canvas do
      begin
        Repaint;
        DoubleBuffered:=True;
      end;
      case i of
         1:
         begin
           Body      (WK*x,y,k, HK,canvas);
           Head1     (WK*x,y,k, HK,canvas);             //первая анимация движения
           Forearms1 (WK*x,y,k, HK,canvas);
           Arms1     (WK*x,y,k, HK,canvas);
           Knees1    (WK*x,y,k, HK,canvas);
           Sticks1   (WK*x,y,k, HK,canvas);
           Legs1     (WK*x,y,k, HK,canvas);
           Ski1      (WK*x,y,k, HK,canvas);
           if x*WK>Clientwidth-Round(Clientwidth/3) then
             inc(i)
           else
             i:=3;
         end;
         2:
         begin
           Body      (WK*x,y,k, HK,canvas);

           Head2     (WK*x,y,k, HK,canvas);             //вторая анимация движения
           Forearms2 (WK*x,y,k, HK,canvas);
           Arms2     (WK*x,y,k, HK,canvas);
           Sticks2   (WK*x,y,k, HK,canvas);
           Knees2    (WK*x,y,k, HK,canvas);
           Legs2     (WK*x,y,k, HK,canvas);
           Ski2      (WK*x,y,k, HK,canvas);
           i:=1;
         end;
         3:
         begin
           Body      (WK*x,y,k, HK,canvas);

           Head1     (WK*x,y,k, HK,canvas);
           Forearms1 (WK*x,y,k, HK,canvas);
           Arms1     (WK*x,y,k, HK,canvas);                //анимация спуска
           Knees1    (WK*x,y,k, HK,canvas);
           Sticks1   (WK*x,y,k, HK,canvas);
           Legs1     (WK*x,y,k, HK,canvas);
           Ski3      (WK*x,y,k, HK,canvas);
         end;
      end;
      if x*WK>ClientWidth-Round(Clientwidth/3) then
      begin
        x:=x-15*(HK+WK)/2;
        y:=y-0.4*(HK+WK)/2;
        k:=k+0.008*(HK+WK)/2;
      end
      else
      begin
        TimerSki.Interval:=90;
        x:=x-23*(HK+WK)/2;
        y:=y+7*(HK+WK)/2;
        k:=k+0.02*(HK+WK)/2;
      end;
      if x*Wk<-80 then
      begin
        AnimCase:=3;
        FormActivate(nil);
      end;
    end;
    3:
    begin
      with canvas do
      begin
        Repaint;
        DoubleBuffered:=True;
      end;
      case i of
          1: // Положение 1 при беге вправо
          begin
            BodyR(Round(x), Round(y), k,P,Q, canvas);
            LegsR1(Round(x), Round(y), k,P,Q, canvas);;
            HandsR1(Round(x), Round(y), k,P,Q, canvas);
            inc(i);
          end;
          2: // Положение 2 при беге вправо
          begin
            BodyR(Round(x), Round(y), k,P,Q, canvas);
            LegsR2(Round(x), Round(y), k,P,Q, canvas);
            HandsR2(Round(x), Round(y), k,P,Q, canvas);
            inc(i);
          end;
          3: // Положение 3 при беге вправо
          begin
             BodyR(Round(x), Round(y), k,P,Q, canvas);
             LegsR3(Round(x), Round(y), k,P,Q, canvas);
             HandsR3(Round(x), Round(y), k,P,Q, canvas);
             i:=1;
          end;
          4:  // Положение 1 при прыжке перед кувырком
          begin
            BodyR(Round(x), Round(y+10), k,P,Q, canvas);
            Jump_LegsR1(Round(x), Round(y+10), k,P,Q, canvas);
            Jump_HandsR1(Round(x), Round(y+10), k,P,Q, canvas);
            inc(i)
          end;
          5:  // Положение 2 при прыжке перед кувырком
          begin
            BodyR(Round(x), Round(y-10), k,P,Q, canvas);
            Jump_LegsR2(Round(x), Round(y-10), k,P,Q, canvas);
            Jump_HandsR2(Round(x), Round(y-10), k,P,Q, canvas);
            inc(i);
          end;
          6:  // Положение 1 при кувырке
          begin
            x:=x+10;
            Rotate_BodyR1(Round(x), Round(y+30), k,P,Q, canvas);
            Rotate_LegsR1(Round(x), Round(y+30), k,P,Q, canvas);
            Rotate_HandsR1(Round(x), Round(y+30), k,P,Q, canvas);
            inc(i);
          end;
          7:  // Положение 2 при кувырке
          begin
            x:=x+10;
            Rotate_BodyR2(Round(x), Round(y+50), k,P,Q, canvas);
            Rotate_LegsR2(Round(x), Round(y+50), k,P,Q, canvas);
            Rotate_HandsR2(Round(x), Round(y+50), k,P,Q, canvas);
            inc(i);
          end;
          8:  // Положение 3 при кувырке
          begin
            x:=x+10;
            Rotate_BodyR3(Round(x), Round(y-50), k,P,Q, canvas);
            Rotate_LegsR3(Round(x), Round(y-50), k,P,Q, canvas);
            Rotate_HandsR3(Round(x), Round(y-50), k,P,Q, canvas);
            inc(i);
          end;
          9:  // Положение 2 при кувырке
          begin
            x:=x+10;
            Rotate_BodyR2(Round(x), Round(y+50), k,P,Q, canvas);
            Rotate_LegsR2(Round(x), Round(y+50), k,P,Q, canvas);
            Rotate_HandsR2(Round(x), Round(y+50), k,P,Q, canvas);
            inc(i);
          end;
          10: // Положение 4 при кувырке
          begin
            x:=x+10;
            Rotate_BodyR4(Round(x), Round(y-20), k,P,Q, canvas);
            Rotate_LegsR4(Round(x), Round(y-20), k,P,Q, canvas);
            Rotate_HandsR4(Round(x), Round(y-20), k,P,Q, canvas);
            i:=4;
          end;
          11:  // Положение 1 при беге влево
          begin
            BodyR(Round(x), Round(y), k,P,Q, canvas);
            Back_LegsR1(Round(x), Round(y), k,P,Q, canvas);
            Back_HandsR1(Round(x), Round(y), k,P,Q, canvas);
            inc(i);
          end;
          12:  // Положение 2 при беге влево
          begin
            BodyR(Round(x), Round(y), k,P,Q, canvas);
            Back_LegsR2(Round(x), Round(y), k,P,Q, canvas);
            Back_HandsR2(Round(x), Round(y), k,P,Q, canvas);
            inc(i);
          end;
          13:  // Положение 3 при беге влево
          begin
            BodyR(Round(x), Round(y), k,P,Q, canvas);
            Back_LegsR3(Round(x), Round(y), k,P,Q, canvas);
            Back_HandsR3(Round(x), Round(y), k,P,Q, canvas);
            i:=11;
          end;
          14:  //  положение при прыжке через препятствие
          begin
            x:=x-2;
            BodyR(Round(x), Round(y), k,P,Q, canvas);
            Back_HandsR1(Round(x), Round(y), k,P,Q, canvas);
            LongJump_LegsR1(Round(x), Round(y), k,P,Q, canvas);
            if j<=3 then
            begin
              i:=14;
              inc(j);
            end
            else
              i:=11;
          end;
      end;
      if (x<460) and (y=100) then  // бег вправо
      begin
        x := x + 2;
        if (x=130) or (x=220) or (x=310) then  // кувырки
          i:=4;
        if (x=194) or (x=284) or (x=374) then  // опять бежим
          i:=1;
      end;
      if (x>=460) and (y<200) then  // поворот (бег вправо)
      begin
        k := k+0.0027;   // увеличиваем коэффициент масштабирования
        x:=x+2;
        y:=y+2;
      end;
      if (x<=560) and (y>=200) and (y<300) then   // поворот (бег влево)
      begin
        if y=200 then   // меняем направление бега
          i:=11;
        k:=k+0.0027;    // увеличиваем коэффициент масштабирования
        x:=x-2;
        y:=y+2;
      end;
      if (x<=460) and (y=300) then  // бег влево
      begin
        x:=x-2;
        if (x=400) or (x=250) or (x=100)then  // прыжок через препятствия
        begin
          i:=14;
          j:=0;
        end;
      end;
      if (x=50) and (y=300) then   // возвращаемся в начальное положение
      begin
        x:=50;
        y:=100;
        k:=1;
        i:=1;
      end;
    end;
  end;

end;

Procedure TForm1.FormCreate(Sender: TObject);
begin
  if FileExists('song2.mp3') then
    MediaPlayer1.FileName := 'song2.mp3';
  Mediaplayer1.Open;
  Mediaplayer1.Play;
  AnimCase:=1;
end;

end.
