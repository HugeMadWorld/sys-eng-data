unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls;

type
  Dot=record
   x,y:integer;
   R:integer;
  end;
  TVec=class (TObject)
  private
    x,y:single;
    lth:single;
  public
    procedure Length ;
    Procedure VecKoord (A,C:Dot);
  end;
  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuSettings: TMenuItem;
    mnuHelp: TMenuItem;
    mnuClear: TMenuItem;
    N5: TMenuItem;
    mnuExit: TMenuItem;
    mnuAboutAuther: TMenuItem;
    mnuAboutProgr: TMenuItem;
    mnuFirstHelp: TMenuItem;
    Timer: TTimer;
    PopupMenu: TPopupMenu;
    prmnuClear: TMenuItem;
    prmnuSettings: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuSettingsClick(Sender: TObject);
    procedure Draw(Fi:real;hide:boolean;dFi:real);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure mnuClearClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutAutherClick(Sender: TObject);
    procedure mnuAboutProgrClick(Sender: TObject);
    procedure mnuFirstHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    width:byte;
    clActive:COLORREF;
    clBg:COLORREF;
    Fi:real;
    C,L,K,F:Dot;
    A:array [0..20] of Dot;
    R:TVec;
    p:TVec;
    KF:TVec;
  end;

var
  FormMain: TFormMain;

implementation

uses Setting;

{$R *.dfm}

Procedure TVec.VecKoord (A,C:Dot);
   BEGIN
      x:=C.x-A.x;
      y:=C.y-A.y;
   END;

procedure TVec.Length;
begin
   lth:=sqrt(sqr(x)+sqr(y));
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
   p:=TVec.Create;
   R:=TVec.Create;
   KF:=TVec.Create;
   clBg:=color;
   clActive:=RGB(0,0,0);
   width:=2;
   Fi:=0;

end;

procedure TFormMain.mnuSettingsClick(Sender: TObject);
begin
   FormSettings.ShowModal;
   width:=StrToInt(FormSettings.txtWidth.Text);
   clActive:=FormSettings.ClBxActColor.Selected;
   clBg:=FormSettings.clbxBgColor.Selected;
   color:=clBg;
end;

procedure TFormMain.Draw(Fi:real;hide:boolean;dFi:real);
var
   i:byte;
begin
   Canvas.Pen.Width:=width;
   if hide then
      Canvas.Pen.Color:=clBg
   else
      Canvas.Pen.Color:=clActive;
   dFi:=2*pi/5;

{1}
   for i:=1 to 5 do
   begin
      A[i].x:=round(K.x+KF.lth*cos(Fi+dFi*i));
      A[i].y:=round(K.y+KF.lth/4*sin(Fi+dFi*i));

   end;
   Canvas.MoveTo(A[5].x,A[5].y);
      for i:=1 to 5 do
         Canvas.LineTo(A[i].x,A[i].y);

{2}
   for i:=6 to 10 do
   begin
      A[i].x:=round(K.x+(KF.lth+(KF.lth+KF.lth/2)/2)*cos(Fi+dFi*i));
      A[i].y:=round(K.y-2*p.lth/3+KF.lth/4*sin(Fi+dFi*i));

   end;

{3}
   for i:=11 to 15 do
   begin
      A[i].x:=round(K.x+(KF.lth+(KF.lth+KF.lth/2)/2)*cos(2*pi/10+Fi+dFi*i));
      A[i].y:=round(K.y-4*p.lth/3+KF.lth/4*sin(2*pi/10+Fi+dFi*i));

   end;

{4}
   for i:=16 to 20 do
   begin
      A[i].x:=round(K.x+KF.lth*cos(2*pi/10+Fi+dFi*i));
      A[i].y:=round(K.y-2*p.lth+KF.lth/4*sin(2*pi/10+Fi+dFi*i));

   end;
   Canvas.MoveTo(A[20].x,A[20].y);
      for i:=16 to 20 do
         Canvas.LineTo(A[i].x,A[i].y);

{1}
   for i:=1 to 5 do
   begin
      Canvas.MoveTo(A[i].x,A[i].y);
      CAnvas.LineTo(A[i+5].x,A[i+5].y);
   end;

{2}
   for i:=6 to 9 do
      Canvas.Polyline([Point(A[i].x, A[i].y), Point(A[i+5].x, A[i+5].y), Point(A[i+1].x, A[i+1].y)]);
   Canvas.Polyline([Point(A[10].x, A[10].y), Point(A[15].x, A[15].y), Point(A[6].x, A[6].y)]);

{3}
   for i:=11 to 15 do
   begin
      Canvas.MoveTo(A[i].x,A[i].y);
      CAnvas.LineTo(A[i+5].x,A[i+5].y);
   end;

end;

procedure TFormMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  P:TPoint;
begin
   if Button=mbLeft then
                       begin
                          //FormMain.Refresh;
                          C.x:=x;
                          C.y:=y;
                          Timer.Enabled:=false;
                       end
                    else
                       begin
                          P.X:=X;
                          P.Y:=Y;
                          P:=ClientToScreen(P);
                          PopupMenu.Popup(P.X,P.Y);
                       end
end;

procedure TFormMain.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   L.x:=x;
   L.y:=y;
   K.x:=L.x;
   K.y:=C.y;
   p.VecKoord(L,K);
   p.Length;
   R.lth:=(p.lth*(1+sqrt(5))*sqrt(3))/sqrt(10+(22/sqrt(5)));
   KF.lth:=sqrt(sqr(R.lth)-sqr(p.lth));
   Timer.Enabled:=true;
end;

procedure TFormMain.TimerTimer(Sender: TObject);
begin
   Draw(Fi,true,0);
   if FormSettings.chkbxRound.Checked then
                                        Fi:=Fi+(2*pi)/256
                                      else
                                        Fi:=0;
   Draw(Fi,false,0);
end;

procedure TFormMain.mnuClearClick(Sender: TObject);
begin
   FormMain.Refresh;
   Timer.Enabled:=false;
end;

procedure TFormMain.mnuExitClick(Sender: TObject);
begin
   if mrYes =MessageDlg('Вы действительно хотите выйти?',mtConfirmation,[mbYes,mbNo],0)
   then Halt;
end;

procedure TFormMain.mnuAboutAutherClick(Sender: TObject);
begin
   MessageDlg('Программа разарботана студентом группы 1342 Петровым Юрием',
   mtInformation, [mbOK], 0);
end;

procedure TFormMain.mnuAboutProgrClick(Sender: TObject);
begin
   MessageDlg('Программа рисует вращающийся относительно вертикальной'+
   ' оси контур правильного додекаэдра (содержит 12 правильных пятиугольных'+
   ' граней), начальное положение додекаэдра и его размеры устанавливаются'+
   ' пользователем протяжкой указателя по рисунку!', mtInformation, [mbOK], 0);
end;

procedure TFormMain.mnuFirstHelpClick(Sender: TObject);
begin
   ShowMessage('Нажмите левой кнопкой мышки на форме и протяните указатель'+
   ' мыши, таким образом задавая радиус вписанной сферы в додекаэдр');
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if mrYes =MessageDlg('Вы действительно хотите выйти?',mtConfirmation,[mbYes,mbNo],0)
   then Halt
   else Action:=caNone;
end;

end.
