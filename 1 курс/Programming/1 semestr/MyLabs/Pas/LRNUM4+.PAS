program FourthLaba;
USES CRT;
Var
   i,n:integer;
   s:char;
Label
   quit,return;
Procedure PrepScr;
begin
   TextBackground(White);
   TextColor(Black);
   ClrScr;
   WriteLn('��������� ��� ���������� ������� ��������� ����� n');
   WriteLn;
   WriteLn('�����: Serg Ivanov');
   WriteLn;
end;
   
Begin
return:
   PrepScr;
   Write('Input n: ');
   ReadLn(n);
   WriteLn('Dividers: ');
   {for i:=1 to n do
   if (n mod i)=0 then write('[',i,'] ');//���� ����� ������� �� i, �� �������}
   for i:=1 to n do
   if (n / i) = (n div i) then
   Write('[',i,'] ');
   WriteLn;
quit:
   Write('Continue? Y/N: ');
   ReadLn(s);
   If (s='y') or (s='Y') or (s='�') or (s='�') then GoTo return
   else if (s='n') or (s='N') or (s='�') or (s='�') then exit
   else GoTo quit;
end.