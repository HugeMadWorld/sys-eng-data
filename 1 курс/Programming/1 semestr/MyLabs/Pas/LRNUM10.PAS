uses crt;
{������ ����������� ����}
const
  symbols = ['�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�'];



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
  WriteLn('�������� ��� ������ ������� ����������� ���� ��� ���������� ���i����, �� �����i������� � �����');
  WriteLn;
  WriteLn;
end;

{Main Procedure}
procedure Main;
var
  a: array[1..20]of string;
  s, sl: string;
  i, k, n, j: byte;
begin
  Write('����i�� ������: ');
  Readln(s);
  s := s + ' ';
  sl := '';
  n := 0;
  for i := 1 to length(s) do
    sl := sl + s[i];
  if length(sl) > 0 then 
  begin
    k := 0;
    for j := 1 to n do
      if a[j] = sl then
        k := k + 1;
    if k = 0 then
    begin
      n := n + 1;a[n] := sl; 
    end;
    sl := '';  
  end;
  Write('���������i: ');
  for i := 1 to length(s) do
    if s[i] in symbols then //����� �������� �� �����������
    begin
      s[i] := s[i].ToLower; //���������� ����� �� �������� �������
      write(s[i], ' ');// �������� ����� �� �����
    end;
  WriteLn;
end;

begin
  repeat
    InfoProg;
    Main;
  until RepProg;
end.