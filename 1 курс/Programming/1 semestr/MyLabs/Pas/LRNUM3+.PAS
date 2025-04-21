program ThirdLaba;
USES CRT;
Var
   Z:real;
   x:real;
   answer:char;
Label
   quit,return;
Begin
   return:
   TextBackground(Black);
   TextColor(White);
   ClrScr;
   WriteLn('Программа для нахождения Z');
   WriteLn();
   TextColor(Cyan);
   WriteLn('Автор: Serg I');
   TextColor(White);
   WriteLn();
   WriteLn('   ╔════════════════════════════════╗');  
   WriteLn('   ║     ┌─────────┐   ┌─────────┐  ║');
   WriteLn('   ║     │    ┌────┐   │    ┌────┐  ║');
   WriteLn('   ║ Z= \│x+2\│2x-4 + \│x-2\│2x-4   ║');
   WriteLn('   ╚════════════════════════════════╝');  
   WriteLn();
   Write('Введите x: ');
   ReadLn(x);
   If x<2 then 
      begin
         WriteLn('Для заданого числа нет решений, пожалуйста введите другое число');
         WriteLn('С условием, что х больше или равное 2');
         WriteLn('[Нажмите любую кнопку, чтобы продолжить..]');
         ReadKey;
         Goto return;
      end;

   Z:=(sqrt(x+2)*sqrt(2*x-4))+(sqrt(x-2)*sqrt(2*x-4));
   WriteLn('Z=',Z:5:5);
   quit:
   Write('Желаете ввести другое число? Y/N: ');
   ReadLn(answer);
   If (answer='y') or (answer='Y') or (answer='н') or (answer='Н') then GoTo return
   else if (answer='n') or (answer='N') or (answer='т') or (answer='Т') then exit
   else GoTo quit;
   ReadLn;
end.