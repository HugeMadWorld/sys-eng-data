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
  // ������������ �������� �����
  PortEdit.Text:='777';
  // ����� ��� �������� ��������� �� ����� �� ("��� �� ����")
  HostEdit.Text:='127.0.0.1';
  // ��������� ���� ������ �������
  NikEdit.Clear;
  TextEdit.Clear;
  ChatMemo.Lines.Clear;
end;
 
procedure TForm1.ServerBtnClick(Sender: TObject);
begin
  If ServerBtn.Tag = 0 then
    Begin
    // ������� ClientBtn � ���� HostEdit, PortEdit �����������
    ClientBtn.Enabled:=False;
    HostEdit.Enabled:=False;
    PortEdit.Enabled:=False;
    // ������� ��������� ���� � ServerSocket
    ServerSocket.Port:=StrToInt(PortEdit.Text);
    // ��������� ������
    ServerSocket.Active:=True;
    // ������� � ChatMemo ��������� � �������� ��������
    ChatMemo.Lines.Add('['+TimeToStr(Time)+'] ������ ������');
    // �������� ���
    ServerBtn.Tag:=1;
    // ������ ������� �������
    ServerBtn.Caption:='������� ������';
  end
  else
    Begin
    // ������� ClientBtn � ���� HostEdit, PortEdit ������������
    ClientBtn.Enabled:=True;
    HostEdit.Enabled:=True;
    PortEdit.Enabled:=True;
    // ��������� ������
    ServerSocket.Active:=False;
    // ������� ��������� � ChatMemo
    ChatMemo.Lines.Add('['+TimeToStr(Time)+'] ������ ������.');
    // ���������� ���� �������� ��������
    ServerBtn.Tag:=0;
    // ���������� �������� ������� �������
    ServerBtn.Caption:='������� ������';
    end;
end;
 
procedure TForm1.ServerSocketClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  // ������� � ChatMemo ��������� � �������� ����������� �������
  ChatMemo.Lines.Add('['+TimeToStr(Time)+'] ����������� ������.');
end;
 
procedure TForm1.ServerSocketClientDisconnect(Sender: TObject;
Socket: TCustomWinSocket);
begin
// ������� � ChatMemo ��������� � �������� ���������� �������
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] ������ ����������.');
end;
 
procedure TForm1.ServerSocketClientRead(Sender: TObject;
Socket: TCustomWinSocket);
begin
// ������� � ChatMemo ���������� ���������
ChatMemo.Lines.Add(Socket.ReceiveText());
end;
 
procedure TForm1.SendBtnClick(Sender: TObject);
begin
// ��������, � ����� ������ ��������� ���������
If ServerSocket.Active=True then
// ���������� ��������� � ������� (�� ��� ������� 0, ��������� ����)
ServerSocket.Socket.Connections[0].SendText('['+TimeToStr(Time)+'] '+NikEdit.Text+': '+TextEdit.Text)
else
// ���������� ��������� � �������
ClientSocket.Socket.SendText('['+TimeToStr(Time)+'] '+NikEdit.Text+': '+TextEdit.Text);
// ��������� ��������� � ChatMemo
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] '+NikEdit.Text+': '+TextEdit.Text);
end;
 
procedure TForm1.ClientBtnClick(Sender: TObject);
begin
If ClientBtn.Tag=0 then
Begin
// ������� ServerBtn � ���� HostEdit, PortEdit �����������
ServerBtn.Enabled:=False;
HostEdit.Enabled:=False;
PortEdit.Enabled:=False;
// ������� ��������� ���� � ClientSocket
ClientSocket.Port:=StrToInt(PortEdit.Text);
// ������� ���� � ����� (���� �������� HostEdit � ���)
ClientSocket.Host:=HostEdit.Text;
ClientSocket.Address:=HostEdit.Text;
// ��������� �������
ClientSocket.Active:=True;
// �������� ���
ClientBtn.Tag:=1;
// ������ ������� �������
ClientBtn.Caption:='�����������';
end
else
Begin
// ������� ServerBtn � ���� HostEdit, PortEdit ������������
ServerBtn.Enabled:=True;
HostEdit.Enabled:=True;
PortEdit.Enabled:=True;
// ��������� �������
ClientSocket.Active:=False;
// ������� ��������� � ChatMemo
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] ������ �������.');
// ���������� ���� �������� ��������
ClientBtn.Tag:=0;
// ���������� �������� ������� �������
ClientBtn.Caption := '������������';
end;
end;
 
procedure TForm1.ClientSocketRead(Sender: TObject;
Socket: TCustomWinSocket);
begin
// ������� � ChatMemo ��������� ���������
ChatMemo.Lines.Add(Socket.ReceiveText());
end;
 
procedure TForm1.ClientSocketConnect(Sender: TObject;
Socket: TCustomWinSocket);
begin
// ������� � ChatMemo ��������� � ���������� � ��������
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] ����������� � �������.');
end;
 
procedure TForm1.ClientSocketDisconnect(Sender: TObject;
Socket: TCustomWinSocket);
begin
// ������� � ChatMemo ��������� � ������ �����
ChatMemo.Lines.Add('['+TimeToStr(Time)+'] ������ �� ������.');
end;
 
 
 
 
 
 
 
end.
