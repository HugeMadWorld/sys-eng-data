unit Setting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFormSettings = class(TForm)
    PnSet: TPanel;
    txtWidth: TEdit;
    lblBgColor: TLabel;
    lblActColor: TLabel;
    lblWidth: TLabel;
    clbxBgColor: TColorBox;
    clbxActColor: TColorBox;
    BitBtn1: TBitBtn;
    UpDownWidth: TUpDown;
    chkbxRound: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure txtWidthExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.dfm}

procedure TFormSettings.BitBtn1Click(Sender: TObject);
begin
   close;
end;

procedure TFormSettings.txtWidthExit(Sender: TObject);
var
   code:integer;
   c:byte;
begin
   Val(txtWidth.Text,c,code);
   if code <> 0 then
      begin
         ShowMessage('¬ведите числовое значение');
         txtWidth.SetFocus;
      end;
   if (code=0) and (c<1) or (c>25) then
      begin
         ShowMessage('Ўирина линий желательна в диапазоне от 1 до 25.');
         txtWidth.SetFocus;
      end;
end;

end.
