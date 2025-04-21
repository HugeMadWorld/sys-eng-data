uses crt;
{Перелік приголосних букв}
const
  symbols = ['Б', 'б', 'В', 'в', 'Г', 'г', 'Д', 'д', 'Ж', 'ж', 'З', 'з', 'Й', 'й', 'К', 'к', 'Л', 'л', 'М', 'м', 'Н', 'н', 'П', 'п', 'Р', 'р', 'С', 'с', 'Т', 'т', 'Ф', 'ф', 'Х', 'х', 'Ц', 'ц', 'Ч', 'ч', 'Ш', 'ш', 'Щ', 'щ'];



{Repeat Program}    
function RepProg: boolean;
var
  s: char;
begin
  Write('Continue? Y/N: ');
  readln(s);
  if (s = 'Y') or (s = 'y') or (s = 'Н') or (s = 'н') then
    RepProg := False
  else RepProg := True;
end;

{Info About Program}
procedure InfoProg;
begin
  TextColor(Black);
  TextBackground(White);
  clrscr;
  WriteLn('1341.I1off');
  WriteLn('Програма для виводу множини приголосних букв без урахування регiстру, що зустрiчаються у рядку');
  WriteLn;
  WriteLn;
end;

{Main Procedure}
procedure Main;
var
  a: array[1..20]of string;
  s, sl: string;
  i, k, n, j: byte;
begin
  Write('Введiть сиволи: ');
  Readln(s);
  s := s + ' ';
  sl := '';
  n := 0;
  for i := 1 to length(s) do
    sl := sl + s[i];
  if length(sl) > 0 then 
  begin
    k := 0;
    for j := 1 to n do
      if a[j] = sl then
        k := k + 1;
    if k = 0 then
    begin
      n := n + 1;a[n] := sl; 
    end;
    sl := '';  
  end;
  Write('Приголоснi: ');
  for i := 1 to length(s) do
    if s[i] in symbols then //Буква належить до приголосних
    begin
      s[i] := s[i].ToLower; //Прирівнюємо букву до нижнього регістру
      write(s[i], ' ');// Виводимо букву на екран
    end;
  WriteLn;
end;

begin
  repeat
    InfoProg;
    Main;
  until RepProg;
end.