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
   WriteLn('��������� ��� ���������� ����� ���������� ���� ����������');
   WriteLn();
   WriteLn('�����: Serg Ivanov');
   WriteLn();
skorost:
   Write('������� �������� ���������� (��/�): ');
   ReadLn(l);
   V:=l/C;
   If (V<5) or (V>200) then
   begin
      WriteLn('[18 - 720 ��/�]');
      GoTo skorost;
   end;
Trenija:
   Write('������� ����������� ������: ');
   ReadLn(k);
   If (k<0.01) or (k>1) then
   begin
      WriteLn('[0.01-1]');
      GoTo trenija;
   end;
   S:=sqr(V)/(2*g*k);
   Write('����� ���������� ���� ���������� (�)= ',S:5:3);
   WriteLn();
quit:
   Write('����������? Y/N: ');
   ReadLn(ans);
   If (ans='y') or (ans='Y') or (ans='�') or (ans='�') then GoTo cp
   else if (ans='n') or (ans='N') or (ans='�') or (ans='�') then exit
   else GoTo quit;
   ReadKey;
end.