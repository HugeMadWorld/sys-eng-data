unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Menus, ComCtrls;

type
  TFormMain = class(TForm)
    TabControl1: TTabControl;
    LblDoc: TLabel;
    LblWeb: TLabel;
    ChBNum: TCheckBox;
    ChBHyp: TCheckBox;
    ChBRght: TCheckBox;
    LblAgr: TLabel;
    CBoxAgr: TComboBox;
    BvlGen: TBevel;
    LblGen: TLabel;
    LblForm: TLabel;
    LblName: TLabel;
    ChBFull: TCheckBox;
    CBoxPttrn: TComboBox;
    CBoxImg: TComboBox;
    BttnSett: TButton;
    BttnChng: TButton;
    BttnOk: TButton;
    BttnCancel: TButton;
    ScrDoc: TScrollBar;
    ScrWeb: TScrollBar;
    ImgDoc: TImage;
    ImgWeb: TImage;
    BvlDoc: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

end.
