uses crt;
var x:single; n:byte;
vidpov: real;

Function RP:boolean;
var s:char;
begin
   Write('Продовжити? Y/N: ');
   readln(s);
   if (s='Y') or (s='y') or (s='Н') or (s='н') then
   RP:=True
   else RP:=False;
end;


Function InputX:single;
   begin
   repeat
   Writeln('Input x:');
   Readln(x);
   until (x<1);
end;

Function InputN:byte;
   begin
   Writeln('Input n:');
   Readln(n);
end;

Function Calc(x:single; n:byte):double;
var member:real;
begin
   member:=exp((n+1)*ln(x))/(N+1);
   if n=1 then
   calc:=x
   else
   calc:=member+calc(x,n-1)
end;

Procedure Print(vidpov:single);
begin
Writeln('Vidpovid: ',vidpov:3:n);
end;

begin
   clrscr;
   repeat
   x:=inputx;
   n:=inputn;
   Vidpov:=calc(x,n);
   Print(vidpov);
   until RP=false;
end.