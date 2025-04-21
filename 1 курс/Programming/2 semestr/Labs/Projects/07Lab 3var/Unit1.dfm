object FormMain: TFormMain
  Left = 570
  Top = 168
  BorderStyle = bsDialog
  Caption = #1050#1086#1083#1077#1089#1086' '#1082#1088#1091#1090#1080#1090#1100#1089#1103
  ClientHeight = 529
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 584
    Top = 482
    Width = 130
    Height = 13
    Caption = #1047#1072#1076#1072#1081#1090#1077' '#1082#1091#1090#1086#1074#1091' '#1096#1074#1080#1076#1082#1110#1089#1100' '
  end
  object Label2: TLabel
    Left = 688
    Top = 506
    Width = 53
    Height = 13
    Caption = #1074' '#1088#1072#1076'/'#1089#1077#1082':'
  end
  object Button1: TButton
    Left = 17
    Top = 488
    Width = 113
    Height = 33
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 169
    Top = 488
    Width = 113
    Height = 33
    Caption = #1057#1090#1086#1087
    TabOrder = 1
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 617
    Top = 500
    Width = 65
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 25
    OnTimer = Timer1Timer
    Left = 760
    Top = 474
  end
end
