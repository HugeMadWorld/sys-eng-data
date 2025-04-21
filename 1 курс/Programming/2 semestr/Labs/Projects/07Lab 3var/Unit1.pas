unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormMain = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  point=class
     x,y:integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Line=class(point)  //опис обєкта
    Xmax,scale,a,da,int,l,l1,t:real;
    Xpmax,Ypmax,X0,s,Y0,r,X1,Y1,dx:integer;
    constructor Init;
    procedure Weight(var a:real);
    procedure DrawWeight(col:TColor);
    procedure Move;
   end;
var
  FormMain: TFormMain;
  LineCircle:line;//сворюємо обєкт

implementation
{$R *.dfm}
constructor line.Init;
//ініціалізуємо дані
begin
        Xpmax:=FormMain.height;
        Ypmax:=FormMain.Height;
        Xmax:=45;//максимальний розмір в метрах
        X0:= Xpmax div 2;
        X1:=  Xpmax div 2;
        Y0:= Ypmax div 2;
        Y1:= Ypmax div 2;

        Scale:=Xmax/Xpmax; //маштаб
        int:=0.01;
        da:=(Strtoint(FormMain.Edit1.Text)*Int*57.3);
        dx:=round(da);
        s:=100;
        r:=15;
        l:=r;
        l1:=r;
        r:=Round(r/scale);
        t:=Strtofloat(FormMain.Edit1.text)*5/8;
end;
procedure Line.weight(var a:real);
begin
   a:=a-da;
   X1:=X0 + Round((l*cos(a/57.3))/scale);
   Y1:=Y0 - Round((l*sin(a/57.3))/scale);
   If (a>360) then a:=a-360;
end;

procedure line.DrawWeight(col:TColor);
Begin
with FormMain.Canvas do

     Pen.Color:=col;
      FormMain.Canvas.Pen.Width:=20;
      FormMain.Canvas.Ellipse(X0-r,Y0-r,X0+r,Y0+r);
        FormMain.Canvas.Ellipse(X0-5,Y0-5,X0+5,Y0+5);

     FormMain.Canvas.Pen.Width:=2;      //spici
     FormMain.Canvas.MoveTo(X0,Y0);
     weight(a);
     FormMain.Canvas.Lineto(X1,Y1);

     FormMain.Canvas.Pen.Width:=2;
     FormMain.Canvas.Moveto(X0,Y0);
     a:=a+90+da;
     weight(a);
     FormMain.Canvas.Lineto(X1,Y1);

     FormMain.Canvas.Moveto(X0,Y0);
      a:=a+90+da;
     weight(a);
     FormMain.Canvas.Lineto(X1,Y1);

     FormMain.Canvas.Moveto(X0,Y0);
     a:=a+90+da;
     weight(a);
     FormMain.Canvas.Lineto(X1,Y1);

     FormMain.Canvas.Moveto(X0,Y0);
     a:=a+45+da;
     weight(a);
     FormMain.Canvas.Lineto(X1,Y1);

     FormMain.Canvas.Moveto(X0,Y0);
      a:=a+90+da;
     weight(a);
     FormMain.Canvas.Lineto(X1,Y1);

end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
  close;
end;
procedure TFormMain.Button1Click(Sender: TObject);
begin
  Linecircle:=line.Init;
  FormMain.Canvas.Refresh;
  Timer1.Enabled:=True;
end;
procedure TFormMain.Timer1Timer(Sender: TObject);
begin
   //замальовуємо обэmrт
   FormMain.Canvas.Pen.Color:=clBtnFace;
   FormMain.Canvas.Brush.Color :=clBtnFace;
   //Form1.PaintBox1.Canvas.Rectangle(0,0,PaintBox1.Width,270);
   Linecircle.DrawWeight(clBtnFace);
   LineCircle.Move;
   //малюэмо обэкт
   FormMain.Canvas.Pen.Color:=clblack;
   FormMain.Canvas.Brush.Color:=clbtnface;
   Linecircle.DrawWeight(clBlack);
end;
procedure TFormMain.Button3Click(Sender: TObject);
begin
Timer1.Enabled :=false;
end;

procedure Line.Move;
begin
   x0:=x0+dx;
   if (x0 > FormMain.Width-135)or(x0<135) then
   begin
     dx:=-dx;
     da:=-da;
   end;

end;

end.
