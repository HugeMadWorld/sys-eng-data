program massiv;
uses CRT;
var X:array [1..20, 1..20] of integer;
   tpt,m,n:integer;

Function RP:boolean;
var s:char;
begin
   Write('Continue? Y/N: ');
   readln(s);
   if (s='Y') or (s='y') or (s='Í') or (s='í') then
   RP:=True
   else RP:=False;
end;

Function Maximum:integer;
var max,i,j:integer;
begin
   max:=0; 
   for i:=1 to n do 
   for j:=1 to n do 
   if (i<=j) and (i+j>=n+1) then
   if max<x[i,j] then
   max:=x[i,j];
   maximum:=max;
   end;


Procedure Hi;
begin
   TextColor(Black);
   TextBackground(White);
   clrscr;
   WriteLn('1341.I1off');
   WriteLn('Program for finding max number from matrix');
   WriteLn;
   WriteLn;
   Write('Matrix N*N, N: ');
   readln(n);
   if (n<1) or (n>20) then
begin
   WriteLn('1<n<20');
   randomize;
   n:=random(20);
end;
end;


Procedure Matrix;
var i,j:integer;
begin
   randomize;
   for i:=1 to n do
   begin;
   for j:=1 to n do
   begin;
   x [I, J]:=random (100);
   if (x [I, J]<10) then write ('  ',X[I,J])
   else write (' ',X[I,J]);
   end;
   writeln;
   end;
end;

begin
   repeat
   Hi;
   Matrix;
   tpt:=Maximum;
   WriteLn('Max: ',tpt);
   until RP=false;
end.