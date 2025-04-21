program lr8;

uses crt;

{Repeat Program}    
function RepProg: boolean;
var
  s: char;
begin
  Write('Continue? Y/N: ');
  readln(s);
  if (s = 'Y') or (s = 'y') or (s = 'Н') or (s = 'н') then
    RepProg := False
  else RepProg := True;
end;

{Info About Program}
procedure InfoProg;
begin
  TextColor(Black);
  TextBackground(White);
  clrscr;
  WriteLn('1341.I1off');
  WriteLn('Програма для перевiрки балансу службових слiв BEGIN та END у рядку');
  WriteLn;
  WriteLn;
end;

procedure Main;
var
  i, k, l, z: integer;   
  s: string;
begin
  Write('Введiть рядок коду мови Pascal: ');
  Readln(s);
  s := s.ToLower;
  k := 0;l := 0;
  for i := 1 to length(s) do
    if (copy(s, i, 5) = 'begin') then //знаходимо begin
    begin
      inc(k);
      z := 0;
    end
    else if (copy(s, i, 3) = 'end') then //знаходимо end
    begin
      inc(l);
      z := 1;
    end;
  
  if (k = l) and (z = 1) then // кількість begin рівна кількості end, код закінчується на end
    Writeln('Операторнi дужки розставленi правильно')
  else if (k = 0) and (l = 0) then
    Writeln('Ви не ввели жодного службового слова')
  else Writeln('Операторнi дужки розставленi неправильно');
end;


begin
  repeat
    InfoProg;
    Main;
  until RepProg;
end.