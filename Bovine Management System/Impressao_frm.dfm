object frmImpressao: TfrmImpressao
  Left = 189
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Omega - Gerador de Impress'#227'o'
  ClientHeight = 201
  ClientWidth = 528
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
    Width = 513
    Height = 145
    Caption = 'Selecione a op'#231#227'o de impress'#227'o desejada:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object RadioButton4: TRadioButton
      Left = 24
      Top = 120
      Width = 249
      Height = 17
      Caption = 'Relat'#243'rio de Estoque de Alimentos'
      TabOrder = 0
    end
    object RadioButton3: TRadioButton
      Left = 24
      Top = 88
      Width = 257
      Height = 17
      Caption = 'Relat'#243'rio Geral Confinamento/Pasto'
      TabOrder = 1
      OnClick = RadioButton3Click
    end
    object GroupBox2: TGroupBox
      Left = 296
      Top = 72
      Width = 201
      Height = 65
      Hint = 'Para calculos mensais selecione as datas aqui'
      Caption = 'Filtrar entre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object lblInicio: TLabel
        Left = 8
        Top = 16
        Width = 35
        Height = 16
        Caption = 'In'#237'cio'
      end
      object lblFinal: TLabel
        Left = 104
        Top = 16
        Width = 32
        Height = 16
        Caption = 'Final'
      end
      object dtpInic: TDateTimePicker
        Left = 8
        Top = 32
        Width = 89
        Height = 24
        Date = 39765.601082175930000000
        Time = 39765.601082175930000000
        TabOrder = 0
      end
      object dtpFin: TDateTimePicker
        Left = 104
        Top = 32
        Width = 89
        Height = 24
        Date = 39765.601846585640000000
        Time = 39765.601846585640000000
        TabOrder = 1
      end
    end
    object RadioButton1: TRadioButton
      Left = 24
      Top = 24
      Width = 273
      Height = 17
      Caption = 'Relat'#243'rio de Entrada de Animais'
      TabOrder = 3
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 24
      Top = 56
      Width = 225
      Height = 17
      Caption = 'Relat'#243'rio de Sa'#237'da de Animais'
      TabOrder = 4
      OnClick = RadioButton2Click
    end
    object rgpControle: TRadioGroup
      Left = 280
      Top = 24
      Width = 225
      Height = 41
      Caption = 'Controle:'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Items.Strings = (
        'Pasto '
        'Confinamento')
      ParentFont = False
      TabOrder = 5
    end
  end
  object btnOk: TBitBtn
    Left = 112
    Top = 168
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Hint = 'Abre a tela para impress'#227'o'
    Caption = 'Visualizar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnOkClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
  end
  object btnFechar: TBitBtn
    Left = 336
    Top = 168
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fecha a Tela'
    Caption = 'Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnFecharClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F3333333F7F333301111111B10333337F333333737F33330111111111
      0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
      0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
      0333337F377777337F333301111111110333337F333333337F33330111111111
      0333337FFFFFFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object btnPeriodo: TBitBtn
    Left = 216
    Top = 168
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Hint = 'Buscar a data inicial '
    Caption = 'Buscar Datas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 22
    Top = 164
  end
end
