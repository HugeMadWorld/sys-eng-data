unit UnitMain;
 
interface
 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp;
 
type
  TForm1 = class(TForm)
    ServerBtn: TButton;
    ServerSocket: TServerSocket;
    ClientSocket: TClientSocket;
    PortEdit: TEdit;
    HostEdit: TEdit;
    NikEdit: TEdit;
    TextEdit: TEdit;
    ChatMemo: TMemo;
    ClientBtn: TButton;
    SendBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ServerBtnClick(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SendBtnClick(Sender: TObject);
    procedure ClientBtnClick(Sender: TObject);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 
var
  Form1: TForm1;
 
implementation
 
{$R *.dfm}
 
procedure TForm1.FormCreate(Sender: TObject);
begin
  // предложенное значения порта
  PortEdit.Text:='777';
  // адрес при проверке программы на одном ПК ("сам на себя")
  HostEdit.Text:='127.0.0.1';
  // остальные поля просто очистим
  NikEdit.Clear;
  TextEdit.Clear;
  ChatMemo.Lines.Clear;
end;
 
procedure TForm1.ServerBtnClick(Sender: TObject);
begin
  If ServerBtn.Tag = 0 then
    Begin
    // клавишу ClientBtn и поля HostEdit, PortEdit заблокируем
    ClientBtn.Enabled:=False;
    HostEdit.Enabled:=False;
    PortEdit.Enabled:=False;
    // запишем указанный порт в ServerSocket
    ServerSocket.Port:=StrToInt(PortEdit.Text);
    // запускаем сервер
    ServerSocket.Active:=True;
    // добавим в ChatMemo сообщение с временем создания
    ChatMemo.Lines.Add('['+TimeToStr(Time)+'] Сервер создан');
    // изменяем тэг
    ServerBtn.Tag:=1;
    // меняем надпись клавиши
    ServerBtn.Caption:='Закрыть сервер';
  end
  else
    Begin
    // клавишу ClientBtn и поля HostEdit, PortEdit разблокируем
    ClientBtn.Enabled:=True;
    HostEdit.Enabled:=True;
    PortEdit.Enabled:=True;
    // закрываем сервер
    ServerSocket.Active:=False;
    // выводим сообщение в ChatMemo
    ChatMemo.Lines.Add('['+TimeToStr(Time)+'] Сервер закрыт.');
    // возвращаем тэгу исходное значение
    ServerBtn.Tag:=0;
    // возвращаем исходную надпись клавиши
    ServerBtn.Caption:='Создать сервер';
    end;
end;
 
procedure TForm1.ServerSocketClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  // добавим в ChatMemo сообщение с временем подключения клиента
  ChatMemo.Lines.Add('['+TimeToStr(Time)+'] Подключился клиент.');
end;
 
procedure TForm1.ServerSocketClientDisconnect(Sender: TObject;
Socket: TCustomWinSocket);
begin
// добавим в ChatMemo сообщение с временем отключения клиента
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] Клиент отключился.');
end;
 
procedure TForm1.ServerSocketClientRead(Sender: TObject;
Socket: TCustomWinSocket);
begin
// добавим в ChatMemo клиентское сообщение
ChatMemo.Lines.Add(Socket.ReceiveText());
end;
 
procedure TForm1.SendBtnClick(Sender: TObject);
begin
// проверка, в каком режиме находится программа
If ServerSocket.Active=True then
// отправляем сообщение с сервера (он под номером 0, поскольку один)
ServerSocket.Socket.Connections[0].SendText('['+TimeToStr(Time)+'] '+NikEdit.Text+': '+TextEdit.Text)
else
// отправляем сообщение с клиента
ClientSocket.Socket.SendText('['+TimeToStr(Time)+'] '+NikEdit.Text+': '+TextEdit.Text);
// отобразим сообщение в ChatMemo
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] '+NikEdit.Text+': '+TextEdit.Text);
end;
 
procedure TForm1.ClientBtnClick(Sender: TObject);
begin
If ClientBtn.Tag=0 then
Begin
// клавишу ServerBtn и поля HostEdit, PortEdit заблокируем
ServerBtn.Enabled:=False;
HostEdit.Enabled:=False;
PortEdit.Enabled:=False;
// запишем указанный порт в ClientSocket
ClientSocket.Port:=StrToInt(PortEdit.Text);
// запишем хост и адрес (одно значение HostEdit в оба)
ClientSocket.Host:=HostEdit.Text;
ClientSocket.Address:=HostEdit.Text;
// запускаем клиента
ClientSocket.Active:=True;
// изменяем тэг
ClientBtn.Tag:=1;
// меняем надпись клавиши
ClientBtn.Caption:='Отключиться';
end
else
Begin
// клавишу ServerBtn и поля HostEdit, PortEdit разблокируем
ServerBtn.Enabled:=True;
HostEdit.Enabled:=True;
PortEdit.Enabled:=True;
// закрываем клиента
ClientSocket.Active:=False;
// выводим сообщение в ChatMemo
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] Сессия закрыта.');
// возвращаем тэгу исходное значение
ClientBtn.Tag:=0;
// возвращаем исходную надпись клавиши
ClientBtn.Caption := 'Подключиться';
end;
end;
 
procedure TForm1.ClientSocketRead(Sender: TObject;
Socket: TCustomWinSocket);
begin
// добавим в ChatMemo пришедшее сообщение
ChatMemo.Lines.Add(Socket.ReceiveText());
end;
 
procedure TForm1.ClientSocketConnect(Sender: TObject;
Socket: TCustomWinSocket);
begin
// добавим в ChatMemo сообщение о соединении с сервером
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] Подключение к серверу.');
end;
 
procedure TForm1.ClientSocketDisconnect(Sender: TObject;
Socket: TCustomWinSocket);
begin
// добавим в ChatMemo сообщение о потере связи
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] Сервер не найден.');
end;
 
 
 
 
 
 
 
end.
