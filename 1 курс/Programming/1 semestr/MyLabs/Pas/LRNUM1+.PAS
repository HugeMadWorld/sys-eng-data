USES CRT;
Var
   X,Y:integer;
Const
   X1=10;Y1=5;X2=70;Y2=20;
   X3=13;Y3=7;X4=39;Y4=14;
BEGIN
   TextBackground(Blue);
   ClrScr;
   (*Draw our Main Menu*)
   TextBackground(LightGray);
   TextColor(Black);
   WriteLn('  File  Edit  Search  Run  Compile  Debug  Tools  Options  Window  Help         ');
   (*Pain some letters in red*)
   TextColor(Red);
   GoToXY(3,1);write('F');
   GoToXY(9,1);write('E');
   GoToXY(15,1);write('S');
   GoToXY(23,1);write('R');
   GoToXY(28,1);write('C');
   GoToXY(37,1);write('D');
   GoToXY(44,1);write('T');
   GoToXY(51,1);write('O');
   GoToXY(60,1);write('W');
   GoToXY(68,1);write('H');


   (*Draw black shadow of startup options*)
   TextBackground(Black);
   Window(X1+2,Y1+1,X2+2,Y2+1);
   ClrScr;


   (*Draw Startup Options*)
   TextBackground(LightGray);
   Window(X1,Y1,X2,Y2);
   ClrScr;
   TextBackground(LightGray);
   Window(X1,Y1,X2,Y2+1);
   TextColor(White);
   GoToXY(1,1);Write('ษอ[þ]ออออออออออออออออออStartup optionsออออออออออออออออออออออป');
   GoToXY(1,2);Write('บ                                                           บ');
   GoToXY(1,3);Write('บ                                                           บ');
   GoToXY(1,4);Write('บ                                                           บ');
   GoToXY(1,5);Write('บ                                                           บ');
   GoToXY(1,6);Write('บ                                                           บ');
   GoToXY(1,7);Write('บ                                                           บ');
   GoToXY(1,8);Write('บ                                                           บ');
   GoToXY(1,9);Write('บ                                                           บ');
  GoToXY(1,10);Write('บ                                                           บ');
  GoToXY(1,11);Write('บ                                                           บ');
  GoToXY(1,12);Write('บ                                                           บ');
  GoToXY(1,13);Write('บ                                                           บ');
  GoToXY(1,14);Write('บ                                                           บ');
  GoToXY(1,15);Write('บ                                                           บ');
  GoToXY(1,16);Write('ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   TextColor(LightGreen);
   GotoXY(4,1);Write('þ');
   TextColor(Black);
   GoToXY(34,4);Write('Window heap size');
   GoToXY(34,6);Write('Editor heap size');
   GoToXY(34,8);Write('Overlay heap size');
   GoToXY(4,12);Write('Swap file directory');
   TextColor(Yellow);
   GoToXY(34,4);Write('W');
   GoToXY(34,6);Write('E');
   GoToXY(34,8);Write('O');
   GoToXY(4,12);Write('S');







   (*First Blue Window*)
   TextBackground(Blue);
   TextColor(White);
   GoToXY(52,4);Write(' 32   ');


   (*Second Blue Window*)
   TextBackground(Blue);
   TextColor(White);
   GoToXY(52,6);Write(' 28   ');

   (*Third Blue Window*)
   TextBackground(Blue);
   TextColor(White);
   GoToXY(52,8);Write(' 90   ');


   (*Fourth Blue window*)
   TextBackground(Blue);
   GoToXY(24,12);Write('                                  ');

   Window(X1,Y1,X2,Y2);

   {button OK}
   X:=24;Y:=14;
   TextBackground(Green);
   TextColor(Black);
   GoToXY(x,y);Write('   OK   ');
   TextBackground(LightGray);
   TextColor(Black);
   Write('Ü');
   GoToXY(x+1,Y+1);Write('฿฿฿฿฿฿฿฿');
   TextBackground(Green);
   TextColor(LightCyan);
   GoToXY(X+3,Y);Write('O');
   TextColor(Yellow);
   GoToXY(X+4,Y);Write('K');


   {button Cancel}
   X:=37;Y:=14;
   TextBackground(Green);
   TextColor(Black);
   GoToXY(x,y);Write(' Cancel ');
   TextBackground(LightGray);
   TextColor(Black);
   Write(#220);
   GoToXY(x+1,Y+1);Write('฿฿฿฿฿฿฿฿');

   {button Help}
   X:=49;Y:=14;
   TextBackground(Green);
   TextColor(Black);
   GoToXY(x,y);Write('  Help  ');
   TextBackground(LightGray);
   TextColor(Black);
   Write(#220);
   GoToXY(x+1,Y+1);Write('฿฿฿฿฿฿฿฿');







   (*Draw Window Into Startup Options*)
   TextBackground(Cyan);
   Window(X3,Y3,X4,Y4);
   ClrScr;
   TextColor(White);
   GoToXY(2,1);Write('[_] Dual monitor support');
   TextColor(Black);
   GoToXY(2,2);Write('[ ] Graphics screen save');
   GoToXY(2,3);Write('[ ] EGA/VGA palette save');
   GoToXY(2,4);Write('[X] CGA snow checking');
   GoToXY(2,5);Write('[ ] LCD color set');
   GoToXY(2,6);Write('[X] Load TURBO.TPL');
   GoToXY(2,7);Write('[X] Use extended memory');
   GoToXY(2,8);Write('[ ] Return to last dir');
   TextColor(Yellow);
   GoToXY(6,1);Write('D');
   GoToXY(6,2);Write('G');
   GoToXY(14,3);Write('p');
   GoToXY(11,4);Write('n');
   GoToXY(6,5);Write('L');
   GoToXY(11,6);Write('T');
   GoToXY(11,7);Write('x');
   GoToXY(6,8);Write('R');




   ReadLn;

end.