object frmImprimeTerceiro: TfrmImprimeTerceiro
  Left = 192
  Top = 109
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Toras - Emiss'#227'o de Relat'#243'rio de Entrada '
  ClientHeight = 336
  ClientWidth = 485
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
    Width = 473
    Height = 289
    Caption = 'Op'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 88
      Width = 457
      Height = 65
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 72
        Height = 16
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 208
        Top = 32
        Width = 65
        Height = 16
        Caption = 'Data Final'
      end
      object dtpDtInicial: TDateTimePicker
        Left = 88
        Top = 24
        Width = 89
        Height = 24
        Date = 40444.947411747690000000
        Time = 40444.947411747690000000
        TabOrder = 0
      end
      object dtpDtFinal: TDateTimePicker
        Left = 280
        Top = 24
        Width = 89
        Height = 24
        Date = 40444.947478287040000000
        Time = 40444.947478287040000000
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 160
      Width = 457
      Height = 121
      Caption = 'Filtro'
      TabOrder = 1
      object Label3: TLabel
        Left = 32
        Top = 32
        Width = 55
        Height = 16
        Caption = 'Empresa'
      end
      object Label6: TLabel
        Left = 32
        Top = 64
        Width = 53
        Height = 16
        Caption = 'Terceiro'
      end
      object Label8: TLabel
        Left = 24
        Top = 96
        Width = 65
        Height = 16
        Caption = 'Romaneio'
      end
      object edtIdEmp: TEdit
        Left = 96
        Top = 24
        Width = 73
        Height = 24
        Color = 12450555
        TabOrder = 0
      end
      object edtIForn: TEdit
        Left = 96
        Top = 56
        Width = 73
        Height = 24
        Color = 12450555
        TabOrder = 1
      end
      object edtRomaneio: TEdit
        Left = 96
        Top = 88
        Width = 73
        Height = 24
        Color = clWhite
        TabOrder = 2
        Text = '0'
      end
      object cbxEmpresa: TComboBox
        Left = 176
        Top = 24
        Width = 249
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 3
        OnChange = cbxEmpresaChange
      end
      object cbxForn: TComboBox
        Left = 176
        Top = 56
        Width = 249
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 4
        OnChange = cbxFornChange
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 24
      Width = 457
      Height = 57
      Caption = 'Tipo'
      TabOrder = 2
      object RadioButton1: TRadioButton
        Left = 8
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Fornecedor'
        TabOrder = 0
      end
      object RadioButton2: TRadioButton
        Left = 120
        Top = 24
        Width = 105
        Height = 17
        Caption = 'Freteiro'
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
        Left = 240
        Top = 24
        Width = 193
        Height = 17
        Caption = 'Imprimir Planilha de Toras'
        TabOrder = 2
        OnClick = CheckBox1Click
      end
    end
  end
  object btnImprimir: TBitBtn
    Left = 152
    Top = 304
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Hint = 'Imprimir Relat'#243'rio'
    Caption = 'Imprimir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
  object btnFechar: TBitBtn
    Left = 248
    Top = 304
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Hint = 'Fechar a tela'
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
  object btnImprimir2: TBitBtn
    Left = 152
    Top = 304
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Hint = 'Imprimir Relat'#243'rio'
    Caption = 'Imprimir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
    OnClick = btnImprimir2Click
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
  object ADOQuery1: TADOQuery
    Connection = dmVendas.ADOConnection1
    Parameters = <>
    Left = 392
    Top = 304
  end
  object ADOQuery2: TADOQuery
    Connection = dmVendas.ADOConnection1
    Parameters = <>
    Left = 424
    Top = 304
  end
end
