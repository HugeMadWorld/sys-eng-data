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
   WriteLn('Программа для нахождения простых делителей числа n');
   WriteLn;
   WriteLn('Автор: Serg Ivanov');
   WriteLn;
end;
   
Begin
return:
   PrepScr;
   Write('Input n: ');
   ReadLn(n);
   WriteLn('Dividers: ');
   {for i:=1 to n do
   if (n mod i)=0 then write('[',i,'] ');//Если число делится на i, то выводим}
   for i:=1 to n do
   if (n / i) = (n div i) then
   Write('[',i,'] ');
   WriteLn;
quit:
   Write('Continue? Y/N: ');
   ReadLn(s);
   If (s='y') or (s='Y') or (s='н') or (s='Н') then GoTo return
   else if (s='n') or (s='N') or (s='т') or (s='Т') then exit
   else GoTo quit;
end.