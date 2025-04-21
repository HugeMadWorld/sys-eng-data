unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFormMain = class(TForm)
    Label1: TLabel;
    BtnAbout: TButton;
    TmrShow: TTimer;
    EditSymb: TEdit;
    procedure BtnAboutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TmrShowTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.BtnAboutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.MessageBox('Программа для подсчета выделенных символов'+#13+#13+'Coded by Serge Ivanov'+#13+#13+'-Contacts-'+#13+'Email: serega.iv.1407@gmail.com', 'About Program');//Показ инфы о программе
end;

procedure TFormMain.TmrShowTimer(Sender: TObject);//Таймер с настраиваемой частотой обновления
const s='Количество выделенных символов: ';
var k:integer;
begin
  k:=EditSymb.SelLength;//Считаем количество выделенных символов
  Label1.Caption:=s+IntToStr(k);//Показ текста + количество выделенных символов
end;

end.
