object Form1: TForm1
  Left = 181
  Top = 109
  Width = 510
  Height = 139
  Caption = 'Ivanov, Zapov'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PortEdit: TEdit
    Left = 8
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Port'
  end
  object HostEdit: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Host'
  end
  object NikEdit: TEdit
    Left = 160
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Nik'
  end
  object TextEdit: TEdit
    Left = 160
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Text'
  end
  object ChatMemo: TMemo
    Left = 312
    Top = 8
    Width = 185
    Height = 89
    Lines.Strings = (
      'ChatMemo')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object ServerBtn: TButton
    Left = 8
    Top = 80
    Width = 89
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1077#1088#1074#1077#1088
    TabOrder = 5
    OnClick = ServerBtnClick
  end
  object ClientBtn: TButton
    Left = 104
    Top = 80
    Width = 89
    Height = 25
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    TabOrder = 6
    OnClick = ClientBtnClick
  end
  object SendBtn: TButton
    Left = 200
    Top = 80
    Width = 81
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 7
    OnClick = SendBtnClick
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    Left = 504
    Top = 40
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    Left = 504
    Top = 8
  end
end
