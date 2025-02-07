object frmEmisRelEntrada: TfrmEmisRelEntrada
  Left = 192
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Relat'#243'rio de Entrada'
  ClientHeight = 420
  ClientWidth = 504
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
    Width = 489
    Height = 361
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
      Top = 24
      Width = 473
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
      Top = 96
      Width = 473
      Height = 249
      Caption = 'Filtro'
      TabOrder = 1
      object Label3: TLabel
        Left = 32
        Top = 32
        Width = 55
        Height = 16
        Caption = 'Empresa'
      end
      object Label4: TLabel
        Left = 40
        Top = 64
        Width = 49
        Height = 16
        Caption = 'Esp'#233'cie'
      end
      object Label5: TLabel
        Left = 8
        Top = 96
        Width = 83
        Height = 16
        Caption = 'Classifica'#231#227'o'
      end
      object Label6: TLabel
        Left = 16
        Top = 128
        Width = 73
        Height = 16
        Caption = 'Fornecedor'
      end
      object Label7: TLabel
        Left = 40
        Top = 160
        Width = 50
        Height = 16
        Caption = 'Freteiro'
      end
      object Label8: TLabel
        Left = 24
        Top = 192
        Width = 65
        Height = 16
        Caption = 'Romaneio'
      end
      object Label9: TLabel
        Left = 24
        Top = 224
        Width = 63
        Height = 16
        Caption = 'Utiliza'#231#227'o'
      end
      object edtIdEmp: TEdit
        Left = 96
        Top = 24
        Width = 73
        Height = 24
        Color = 12450555
        TabOrder = 0
      end
      object edtIdEspecie: TEdit
        Left = 96
        Top = 56
        Width = 73
        Height = 24
        Color = 12450555
        TabOrder = 1
        Text = '0'
      end
      object edtIdClass: TEdit
        Left = 96
        Top = 88
        Width = 73
        Height = 24
        Color = 12450555
        TabOrder = 2
        Text = '0'
      end
      object edtIForn: TEdit
        Left = 96
        Top = 120
        Width = 73
        Height = 24
        Color = 12450555
        TabOrder = 3
        Text = '0'
      end
      object edtRomaneio: TEdit
        Left = 96
        Top = 184
        Width = 73
        Height = 24
        Color = clWhite
        TabOrder = 4
        OnEnter = edtRomaneioEnter
      end
      object edtIdFreteiro: TEdit
        Left = 96
        Top = 152
        Width = 73
        Height = 24
        Color = 12450555
        TabOrder = 5
        Text = '0'
      end
      object cbxEmpresa: TComboBox
        Left = 176
        Top = 24
        Width = 249
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 6
        OnChange = cbxEmpresaChange
        OnEnter = cbxEmpresaEnter
      end
      object cbxEspecie: TComboBox
        Left = 176
        Top = 56
        Width = 249
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 7
        Text = 'TODOS'
        OnChange = cbxEspecieChange
        OnEnter = cbxEspecieEnter
        Items.Strings = (
          'TODOS')
      end
      object cbxClass: TComboBox
        Left = 176
        Top = 88
        Width = 249
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 8
        Text = 'TODOS'
        OnChange = cbxClassChange
        OnEnter = cbxClassEnter
        Items.Strings = (
          'TODOS')
      end
      object cbxForn: TComboBox
        Left = 176
        Top = 120
        Width = 249
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 9
        Text = 'TODOS'
        OnChange = cbxFornChange
        OnEnter = cbxFornEnter
        OnExit = cbxFornExit
        Items.Strings = (
          'TODOS')
      end
      object cbxFreteiro: TComboBox
        Left = 176
        Top = 152
        Width = 249
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 10
        Text = 'TODOS'
        OnChange = cbxFreteiroChange
        OnEnter = cbxFreteiroEnter
        OnExit = cbxFreteiroExit
        Items.Strings = (
          'TODOS')
      end
      object cbxUtiliz: TComboBox
        Left = 96
        Top = 216
        Width = 329
        Height = 24
        CharCase = ecUpperCase
        ItemHeight = 16
        TabOrder = 11
        Text = 'TODOS'
        Items.Strings = (
          'TODOS'
          'BAIXADAS'
          'N'#195'O BAIXADAS')
      end
    end
  end
  object btnImprimir: TBitBtn
    Left = 168
    Top = 384
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
    Left = 264
    Top = 384
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
  object Edit1: TEdit
    Left = 432
    Top = 384
    Width = 57
    Height = 21
    TabOrder = 3
    Visible = False
  end
end
