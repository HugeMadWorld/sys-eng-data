program lr8;

uses crt;

{Repeat Program}    
function RepProg: boolean;
var
  s: char;
begin
  Write('Continue? Y/N: ');
  readln(s);
  if (s = 'Y') or (s = 'y') or (s = '�') or (s = '�') then
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
  WriteLn('�������� ��� �����i��� ������� ��������� ��i� BEGIN �� END � �����');
  WriteLn;
  WriteLn;
end;

procedure Main;
var
  i, k, l, z: integer;   
  s: string;
begin
  Write('����i�� ����� ���� ���� Pascal: ');
  Readln(s);
  s := s.ToLower;
  k := 0;l := 0;
  for i := 1 to length(s) do
    if (copy(s, i, 5) = 'begin') then //��������� begin
    begin
      inc(k);
      z := 0;
    end
    else if (copy(s, i, 3) = 'end') then //��������� end
    begin
      inc(l);
      z := 1;
    end;
  
  if (k = l) and (z = 1) then // ������� begin ���� ������� end, ��� ���������� �� end
    Writeln('���������i ����� ����������i ���������')
  else if (k = 0) and (l = 0) then
    Writeln('�� �� ����� ������� ���������� �����')
  else Writeln('���������i ����� ����������i �����������');
end;


begin
  repeat
    InfoProg;
    Main;
  until RepProg;
end.