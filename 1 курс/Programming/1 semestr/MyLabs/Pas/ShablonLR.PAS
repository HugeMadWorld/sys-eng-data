uses crt;

var i, k, n, j: byte; 

Function RP:boolean;
var s:char;
begin
   Write('Continue? Y/N: ');
   readln(s);
   if (s='Y') or (s='y') or (s='�') or (s='�') then
   RP:=True
   else RP:=False;
end;

Procedure Hi;
begin
   TextColor(Black);
   TextBackground(White);
   clrscr;
   WriteLn('1341.I1off');
   WriteLn('��������� ��� ����������� ��������� ������ �� ������� i���� ������ �����.');
   WriteLn;
end;

Function Vopros:integer;
var a,b,c,d:integer;
begin
   Write('������� A: ');
   Readln(a,b);
   Write('����� �������� �i��������: ');
   Readln(c,d);
   end;

Function vOA:integer;
var a,b,c,d:integer;
begin
  x[i,j]:=[b-a,c-d]
end;

begin
   Hi;
   Vopros;   
   Write(voa)
end.