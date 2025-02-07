object PasswordDlg: TPasswordDlg
  Left = 193
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Omega - Administrador'
  ClientHeight = 93
  ClientWidth = 233
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 180
    Height = 14
    Caption = 'Digite a Senha do Administrador:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Password: TEdit
    Left = 8
    Top = 27
    Width = 217
    Height = 20
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Wingdings'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = 'l'
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 70
    Top = 59
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 150
    Top = 59
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
end
