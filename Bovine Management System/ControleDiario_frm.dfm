object frmControleDiario: TfrmControleDiario
  Left = 191
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Omega - Controle de Produ'#231#227'o e Custo Di'#225'rio da Dieta'
  ClientHeight = 566
  ClientWidth = 456
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
    Width = 441
    Height = 553
    Caption = 'Controle de Produ'#231#227'o e Custo Di'#225'rio da Dieta '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 288
      Top = 96
      Width = 8
      Height = 16
      Caption = #224
    end
    object Label3: TLabel
      Left = 264
      Top = 24
      Width = 28
      Height = 16
      Caption = 'Lote'
    end
    object Label4: TLabel
      Left = 192
      Top = 72
      Width = 35
      Height = 16
      Caption = 'In'#237'cio'
    end
    object Label5: TLabel
      Left = 304
      Top = 72
      Width = 24
      Height = 16
      Caption = 'Fim'
    end
    object dtpIni: TDateTimePicker
      Left = 192
      Top = 88
      Width = 89
      Height = 24
      Date = 41032.657766250000000000
      Time = 41032.657766250000000000
      TabOrder = 0
      OnChange = dtpIniChange
    end
    object dtpFim: TDateTimePicker
      Left = 304
      Top = 88
      Width = 89
      Height = 24
      Date = 41032.657990532410000000
      Time = 41032.657990532410000000
      TabOrder = 1
      OnChange = dtpFimChange
    end
    object edtDias: TLabeledEdit
      Left = 288
      Top = 136
      Width = 105
      Height = 24
      EditLabel.Width = 27
      EditLabel.Height = 16
      EditLabel.Caption = 'Dias'
      ReadOnly = True
      TabOrder = 3
    end
    object LabeledEdit1: TLabeledEdit
      Left = 288
      Top = 280
      Width = 105
      Height = 24
      EditLabel.Width = 181
      EditLabel.Height = 16
      EditLabel.Caption = 'Quantidade da Dieta (K)/Dia:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 4
    end
    object LabeledEdit2: TLabeledEdit
      Left = 288
      Top = 312
      Width = 105
      Height = 24
      EditLabel.Width = 192
      EditLabel.Height = 16
      EditLabel.Caption = 'Quantidade Total da Dieta (K):'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 5
    end
    object LabeledEdit4: TLabeledEdit
      Left = 288
      Top = 376
      Width = 105
      Height = 24
      EditLabel.Width = 151
      EditLabel.Height = 16
      EditLabel.Caption = 'Valor Total da Dieta R$:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 10
    end
    object LabeledEdit6: TLabeledEdit
      Left = 288
      Top = 416
      Width = 105
      Height = 24
      EditLabel.Width = 177
      EditLabel.Height = 16
      EditLabel.Caption = 'Valor da Dieta p/ (K)/Dia R$:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 11
    end
    object LabeledEdit7: TLabeledEdit
      Left = 288
      Top = 448
      Width = 105
      Height = 24
      EditLabel.Width = 134
      EditLabel.Height = 16
      EditLabel.Caption = 'Consumo (K)/Boi/Dia:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 12
    end
    object LabeledEdit8: TLabeledEdit
      Left = 288
      Top = 480
      Width = 105
      Height = 24
      EditLabel.Width = 186
      EditLabel.Height = 16
      EditLabel.Caption = 'Valor da Dieta (K)/Boi/Dia R$:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 13
    end
    object LabeledEdit9: TLabeledEdit
      Left = 288
      Top = 344
      Width = 105
      Height = 24
      EditLabel.Width = 156
      EditLabel.Height = 16
      EditLabel.Caption = 'Valor da Dieta p/ Dia R$:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 9
    end
    object LabeledEdit10: TLabeledEdit
      Left = 288
      Top = 240
      Width = 105
      Height = 24
      EditLabel.Width = 111
      EditLabel.Height = 16
      EditLabel.Caption = 'Total de Animais:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 8
    end
    object LabeledEdit11: TLabeledEdit
      Left = 288
      Top = 176
      Width = 105
      Height = 24
      EditLabel.Width = 128
      EditLabel.Height = 16
      EditLabel.Caption = 'Entrada de Animais:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 6
    end
    object LabeledEdit12: TLabeledEdit
      Left = 288
      Top = 208
      Width = 105
      Height = 24
      EditLabel.Width = 116
      EditLabel.Height = 16
      EditLabel.Caption = 'Sa'#237'da de Animais:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 7
    end
    object btnImprimir: TBitBtn
      Left = 128
      Top = 512
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Hint = 'Imprimir Relat'#243'rio'
      Caption = '&Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = btnImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object btnLimpar: TBitBtn
      Left = 224
      Top = 512
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Hint = 'Limpar todos os campos'
      Caption = '&Limpar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = btnLimparClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object btnSair: TBitBtn
      Left = 320
      Top = 512
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Hint = 'Fechar Tela'
      Caption = '&Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = btnSairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object btnCalcular: TBitBtn
      Left = 32
      Top = 512
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Hint = 'Calcular as Di'#225'rias do Confinamento'
      Caption = '&Calcular'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = btnCalcularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
    object cbxLote: TComboBox
      Left = 264
      Top = 40
      Width = 129
      Height = 24
      CharCase = ecUpperCase
      ItemHeight = 16
      TabOrder = 2
      OnChange = cbxLoteChange
    end
    object DateTimePicker1: TDateTimePicker
      Left = 16
      Top = 184
      Width = 89
      Height = 24
      Date = 41170.483177500000000000
      Time = 41170.483177500000000000
      TabOrder = 18
      Visible = False
      OnChange = DateTimePicker1Change
    end
    object rgpControle: TRadioGroup
      Left = 16
      Top = 24
      Width = 233
      Height = 41
      Caption = 'Controle:'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Items.Strings = (
        'Pasto'
        'Confinamento')
      ParentFont = False
      TabOrder = 19
      OnClick = rgpControleClick
    end
    object Edit1: TEdit
      Left = 16
      Top = 216
      Width = 89
      Height = 24
      TabOrder = 20
      Visible = False
    end
    object edtCodLote: TEdit
      Left = 16
      Top = 248
      Width = 89
      Height = 24
      TabOrder = 21
      Visible = False
    end
    object btnPeriodo: TBitBtn
      Left = 32
      Top = 88
      Width = 121
      Height = 25
      Cursor = crHandPoint
      Hint = 'Buscar datas do in'#237'cio at'#233' a '#250'ltima dieta existente'
      Caption = 'Buscar Datas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnClick = btnPeriodoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
    end
  end
end
