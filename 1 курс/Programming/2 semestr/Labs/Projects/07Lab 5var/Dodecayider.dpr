program Dodecayider;

uses
  Forms,
  Main in 'Main.pas' {FormMain},
  Setting in 'Setting.pas' {FormSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
