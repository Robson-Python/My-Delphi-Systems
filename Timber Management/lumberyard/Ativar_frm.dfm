object frmAtivar: TfrmAtivar
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Controle de Toras - Ativar Licen'#231'a'
  ClientHeight = 104
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 89
    Caption = 'Digite o N'#186' da Licen'#231'a fornecida pelo Programador'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object edtLicenca: TEdit
      Left = 56
      Top = 24
      Width = 169
      Height = 20
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Wingdings'
      Font.Style = []
      ParentFont = False
      PasswordChar = 'l'
      TabOrder = 0
      OnKeyUp = edtLicencaKeyUp
    end
    object btnRegist: TBitBtn
      Left = 96
      Top = 56
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Enabled = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = btnRegistClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
end
