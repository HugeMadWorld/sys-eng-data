uses crt;

var i, k, n, j: byte; 

Function RP:boolean;
var s:char;
begin
   Write('Continue? Y/N: ');
   readln(s);
   if (s='Y') or (s='y') or (s='Н') or (s='н') then
   RP:=True
   else RP:=False;
end;

Procedure Hi;
begin
   TextColor(Black);
   TextBackground(White);
   clrscr;
   WriteLn('1341.I1off');
   WriteLn('Программа для знаходження координат вершин та довжини iнших вершин ромба.');
   WriteLn;
end;

Function Vopros:integer;
var a,b,c,d:integer;
begin
   Write('Вершина A: ');
   Readln(a,b);
   Write('Точка перетину дiагоналей: ');
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