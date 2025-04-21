USES CRT;

Label
   quit,trenija,cp,skorost;

Const
   g=9.8;
   C=3.6;
   
Var
   S,l,k,V:real;
   ans:char;

Begin
cp:
   TextBackground(White);
   TextColor(Black);
   ClrScr;
   WriteLn('Программа для вычисления длины тормозного пути автомобиля');
   WriteLn();
   WriteLn('Автор: Serg Ivanov');
   WriteLn();
skorost:
   Write('Введите скорость автомобиля (Км/Ч): ');
   ReadLn(l);
   V:=l/C;
   If (V<5) or (V>200) then
   begin
      WriteLn('[18 - 720 Км/Ч]');
      GoTo skorost;
   end;
Trenija:
   Write('Введите коэффициент трения: ');
   ReadLn(k);
   If (k<0.01) or (k>1) then
   begin
      WriteLn('[0.01-1]');
      GoTo trenija;
   end;
   S:=sqr(V)/(2*g*k);
   Write('Длина тормозного пути автомобиля (м)= ',S:5:3);
   WriteLn();
quit:
   Write('Продолжить? Y/N: ');
   ReadLn(ans);
   If (ans='y') or (ans='Y') or (ans='н') or (ans='Н') then GoTo cp
   else if (ans='n') or (ans='N') or (ans='т') or (ans='Т') then exit
   else GoTo quit;
   ReadKey;
end.