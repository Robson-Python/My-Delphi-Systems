object frmImpressao: TfrmImpressao
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema Almoxarifado - Gerador de Impress'#227'o'
  ClientHeight = 296
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 577
    Height = 241
    Caption = 'Selecione a op'#231#227'o de impress'#227'o desejada:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 67
      Height = 16
      Caption = 'Filtrar por:'
    end
    object Label2: TLabel
      Left = 16
      Top = 136
      Width = 67
      Height = 16
      Caption = 'Filtrar por:'
    end
    object Label5: TLabel
      Left = 248
      Top = 80
      Width = 77
      Height = 16
      Caption = 'Fornecedor:'
    end
    object Label6: TLabel
      Left = 16
      Top = 216
      Width = 54
      Height = 16
      Caption = 'Produto:'
    end
    object Label7: TLabel
      Left = 272
      Top = 136
      Width = 49
      Height = 16
      Caption = 'Cliente:'
    end
    object rdbSaida: TRadioButton
      Left = 16
      Top = 112
      Width = 169
      Height = 17
      Caption = 'Relat'#243'rio Sa'#237'da'
      TabOrder = 0
      OnClick = rdbSaidaClick
    end
    object rdbEstq: TRadioButton
      Left = 16
      Top = 24
      Width = 177
      Height = 17
      Caption = 'Saldo atual do estoque'
      TabOrder = 1
      OnClick = rdbEstqClick
    end
    object rdbEntrada: TRadioButton
      Left = 16
      Top = 56
      Width = 193
      Height = 17
      Caption = 'Relat'#243'rio Entrada'
      TabOrder = 2
      OnClick = rdbEntradaClick
    end
    object chbResumo: TCheckBox
      Left = 160
      Top = 80
      Width = 81
      Height = 17
      Caption = 'Resumo'
      TabOrder = 3
      OnClick = chbResumoClick
    end
    object chbTodos: TCheckBox
      Left = 88
      Top = 80
      Width = 65
      Height = 17
      Caption = 'Todos'
      TabOrder = 4
      OnClick = chbTodosClick
    end
    object chbTodosSaida: TCheckBox
      Left = 88
      Top = 136
      Width = 81
      Height = 17
      Caption = 'Todos'
      TabOrder = 5
      OnClick = chbTodosSaidaClick
    end
    object chbResSaida: TCheckBox
      Left = 160
      Top = 136
      Width = 73
      Height = 17
      Caption = 'Resumo'
      TabOrder = 6
      OnClick = chbResSaidaClick
    end
    object GroupBox2: TGroupBox
      Left = 336
      Top = 168
      Width = 233
      Height = 65
      Caption = 'Filtrar entre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 35
        Height = 16
        Caption = 'In'#237'cio'
      end
      object Label4: TLabel
        Left = 112
        Top = 16
        Width = 24
        Height = 16
        Caption = 'Fim'
        Color = clBtnFace
        ParentColor = False
      end
      object DateTimePicker1: TDateTimePicker
        Left = 16
        Top = 32
        Width = 89
        Height = 24
        Date = 39759.726079016200000000
        Time = 39759.726079016200000000
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 112
        Top = 32
        Width = 89
        Height = 24
        Date = 39759.726079016200000000
        Time = 39759.726079016200000000
        TabOrder = 1
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 88
      Top = 160
      Width = 161
      Height = 33
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Items.Strings = (
        'Consumo'
        'Servi'#231'o')
      ParentFont = False
      TabOrder = 8
      Visible = False
      OnClick = RadioGroup1Click
    end
    object cbxForn: TComboBox
      Left = 328
      Top = 72
      Width = 241
      Height = 24
      CharCase = ecUpperCase
      ItemHeight = 16
      TabOrder = 9
    end
    object cbxProd: TComboBox
      Left = 72
      Top = 208
      Width = 257
      Height = 24
      CharCase = ecUpperCase
      ItemHeight = 16
      TabOrder = 10
    end
    object cbxCliente: TComboBox
      Left = 328
      Top = 128
      Width = 241
      Height = 24
      CharCase = ecUpperCase
      ItemHeight = 16
      TabOrder = 11
    end
  end
  object btnOk: TBitBtn
    Left = 216
    Top = 264
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Hint = 'Abre a tela para impress'#227'o'
    Caption = 'Visualizar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
    Left = 312
    Top = 264
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fecha o Gerador de Impress'#245'es'
    Caption = 'Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
  object ADOQuery2: TADOQuery
    Connection = dmVendas.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 160
    Top = 264
  end
  object ADOQuery1: TADOQuery
    Connection = dmVendas.ADOConnection1
    Parameters = <>
    Left = 128
    Top = 264
  end
  object DataSource1: TDataSource
    Left = 512
    Top = 264
  end
  object ADOQuery4: TADOQuery
    Connection = dmVendas.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 440
    Top = 264
  end
  object ADOQuery5: TADOQuery
    Connection = dmVendas.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 472
    Top = 264
  end
end
