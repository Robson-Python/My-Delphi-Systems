object frmConsultas: TfrmConsultas
  Left = 192
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Rental - Consultas'
  ClientHeight = 510
  ClientWidth = 768
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
  object Shape3: TShape
    Left = -7
    Top = 88
    Width = 776
    Height = 25
    Brush.Color = 13998884
  end
  object Shape2: TShape
    Left = -1
    Top = 462
    Width = 770
    Height = 49
    Brush.Color = 13998884
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 753
    Height = 73
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 64
      Height = 16
      Caption = 'Consultar:'
    end
    object Label2: TLabel
      Left = 312
      Top = 16
      Width = 29
      Height = 16
      Caption = 'Data'
    end
    object cbxConsultar: TComboBox
      Left = 16
      Top = 32
      Width = 281
      Height = 24
      CharCase = ecUpperCase
      ItemHeight = 16
      Sorted = True
      TabOrder = 0
      OnChange = cbxConsultarChange
      Items.Strings = (
        'CLIENTES EM D'#201'BITO'
        'FILMES N'#195'O DEVOLVIDOS'
        'LOCA'#199#213'ES'
        'LOCA'#199#213'ES '#192' PRAZO'
        'LOCA'#199#213'ES '#192' VISTA'
        'LOCA'#199#213'ES MENSAIS'
        'VENDAS '#192' PRAZO'
        'VENDAS MENSAIS'
        'VENDAS PRODUTOS')
    end
    object DateTimePicker1: TDateTimePicker
      Left = 312
      Top = 32
      Width = 89
      Height = 24
      Date = 41472.435651087970000000
      Time = 41472.435651087970000000
      TabOrder = 1
    end
    object btnConsultar: TBitBtn
      Left = 480
      Top = 32
      Width = 97
      Height = 25
      Hint = 'Executa a consulta selecionada'
      Caption = '&Consultar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnConsultarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object btnFechar: TBitBtn
      Left = 592
      Top = 32
      Width = 97
      Height = 25
      Hint = 'Fechar a tela'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
  end
  object Panel4: TPanel
    Left = 0
    Top = 88
    Width = 769
    Height = 25
    BevelOuter = bvLowered
    Caption = 'Resultado da Consulta'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 462
    Width = 769
    Height = 49
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 281
      Top = 8
      Width = 216
      Height = 33
      DataSource = dmLocadora.dsLocadora
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo'
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      ParentShowHint = False
      ConfirmDelete = False
      ShowHint = True
      TabOrder = 0
    end
    object edtTotal: TLabeledEdit
      Left = 656
      Top = 16
      Width = 97
      Height = 24
      Color = 12320767
      EditLabel.Width = 56
      EditLabel.Height = 16
      EditLabel.Caption = 'Total R$:'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 112
    Width = 769
    Height = 353
    DataSource = dmLocadora.dsLocadora
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
  end
end
