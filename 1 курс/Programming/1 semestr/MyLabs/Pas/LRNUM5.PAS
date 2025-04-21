program massiv;
uses CRT;

var X:array [1..20, 1..20] of integer;
   max1, max2, o, I, J, n:integer;
   
Function Hope(var max1, max2:integer):integer;   
begin 
   max1:=1; max2:=1; 
   if (x[i,j]> x[max1,max2]) then
   max1:=i;
   max2:=j;
   writeln('Max: ', x[max1,max2]);
end;
begin
   TextColor(Black);
   TextBackground(White);
   clrscr;
   Write('Matrica N*N, N: ');
   readln(n); 
   randomize;
   for i:=1 to n do
   for j:=1 to n do
   x [I, J]:=random (100);
   for i:=1 to n do
begin
   for j:=1 to n do
   if (x [I, J]<10) then write ('  ',X[I,J])
   else write (' ',X[I,J]);
   writeln;
   end;
   
   
   for i:=1 to n do 
   for j:=1 to n do 
   if (i<=j) and (i+j>=n+1) then
   Hope(max1, max2);
   readln
end.