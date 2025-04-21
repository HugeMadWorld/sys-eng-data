object FormMain: TFormMain
  Left = 219
  Top = 200
  Width = 870
  Height = 570
  Caption = #1044#1086#1076#1077#1082#1072#1101#1076#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnMouseUp = FormMouseUp
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 160
    Top = 104
    object mnuFile: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object mnuClear: TMenuItem
        Caption = '&'#1054#1095#1080#1089#1080#1090#1100
        ShortCut = 116
        OnClick = mnuClearClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = #1042'&'#1099#1093#1086#1076
        ShortCut = 27
        OnClick = mnuExitClick
      end
    end
    object mnuSettings: TMenuItem
      Caption = #1055'&'#1072#1088#1072#1084#1077#1090#1088#1099
      ShortCut = 113
      OnClick = mnuSettingsClick
    end
    object mnuHelp: TMenuItem
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      object mnuFirstHelp: TMenuItem
        Caption = #1055#1086#1084#1086'&'#1097#1100
        ShortCut = 112
        OnClick = mnuFirstHelpClick
      end
      object mnuAboutAuther: TMenuItem
        Caption = #1054'&'#1073' '#1072#1074#1090#1086#1088#1077
        ShortCut = 117
        OnClick = mnuAboutAutherClick
      end
      object mnuAboutProgr: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        ShortCut = 118
        OnClick = mnuAboutProgrClick
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerTimer
    Left = 368
    Top = 88
  end
  object PopupMenu: TPopupMenu
    Left = 392
    Top = 232
    object prmnuClear: TMenuItem
      Caption = '&'#1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = mnuClearClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object prmnuSettings: TMenuItem
      Caption = #1055'&'#1072#1088#1072#1084#1077#1090#1088#1099
      OnClick = mnuSettingsClick
    end
  end
end
