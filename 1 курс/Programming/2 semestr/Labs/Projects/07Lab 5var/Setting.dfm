object FormSettings: TFormSettings
  Left = 364
  Top = 287
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 318
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnSet: TPanel
    Left = 8
    Top = 8
    Width = 489
    Height = 233
    TabOrder = 0
    object lblBgColor: TLabel
      Left = 120
      Top = 48
      Width = 26
      Height = 13
      Caption = #1060#1086#1085':'
    end
    object lblActColor: TLabel
      Left = 120
      Top = 88
      Width = 28
      Height = 13
      Caption = #1062#1074#1077#1090':'
    end
    object lblWidth: TLabel
      Left = 120
      Top = 136
      Width = 75
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072' '#1083#1080#1085#1080#1081':'
    end
    object txtWidth: TEdit
      Left = 216
      Top = 128
      Width = 25
      Height = 21
      TabOrder = 0
      Text = '3'
      OnExit = txtWidthExit
    end
    object clbxBgColor: TColorBox
      Left = 216
      Top = 40
      Width = 145
      Height = 22
      NoneColorColor = clNavy
      Selected = clWindow
      ItemHeight = 16
      TabOrder = 1
    end
    object clbxActColor: TColorBox
      Left = 216
      Top = 88
      Width = 145
      Height = 22
      ItemHeight = 16
      TabOrder = 2
    end
    object UpDownWidth: TUpDown
      Left = 241
      Top = 128
      Width = 17
      Height = 21
      Associate = txtWidth
      Max = 25
      Position = 3
      TabOrder = 3
      Thousands = False
    end
    object chkbxRound: TCheckBox
      Left = 120
      Top = 184
      Width = 97
      Height = 17
      Caption = #1042#1088#1072#1097#1077#1085#1080#1077
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 280
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      0E010000424D0E01000000000000360000002800000007000000090000000100
      180000000000D8000000C40E0000C40E00000000000000000000FFFFFF800000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF800000800000FFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFF800000800000800000FFFFFFFFFFFFFFFFFF00
      0000FFFFFF800000800000800000800000FFFFFFFFFFFF000000FFFFFF800000
      800000800000800000800000FFFFFF000000FFFFFF8000008000008000008000
      00FFFFFFFFFFFF000000FFFFFF800000800000800000FFFFFFFFFFFFFFFFFF00
      0000FFFFFF800000800000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF800000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
  end
end
