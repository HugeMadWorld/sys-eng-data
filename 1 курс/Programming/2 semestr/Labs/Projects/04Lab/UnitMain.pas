unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFormMain = class(TForm)
    MenuBar: TMainMenu;
    F1: TMenuItem;
    Edit1: TMenuItem;
    View1: TMenuItem;
    Insert1: TMenuItem;
    Project1: TMenuItem;
    Build1: TMenuItem;
    ools1: TMenuItem;
    Window1: TMenuItem;
    Help41: TMenuItem;
    SetActiveProject1: TMenuItem;
    AddtoProject1: TMenuItem;
    Settings1: TMenuItem;
    InsertProjectintoWorkspace1: TMenuItem;
    New1: TMenuItem;
    NewFolder1: TMenuItem;
    Files1: TMenuItem;
    DataConnection1: TMenuItem;
    ProjectMain1: TMenuItem;
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
