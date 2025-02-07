object frmConsultaLavoura: TfrmConsultaLavoura
  Left = 150
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Omega - Consultar Lavouras Encerredas'
  ClientHeight = 446
  ClientWidth = 812
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
  object Shape2: TShape
    Left = -21
    Top = 400
    Width = 833
    Height = 46
    Brush.Color = 13998884
  end
  object Shape1: TShape
    Left = -21
    Top = 96
    Width = 833
    Height = 25
    Brush.Color = 13998884
  end
  object Panel4: TPanel
    Left = -13
    Top = 96
    Width = 825
    Height = 25
    BevelOuter = bvLowered
    Caption = 'Resultado da Consulta'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = -13
    Top = 400
    Width = 825
    Height = 46
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 305
      Top = 8
      Width = 232
      Height = 25
      DataSource = dmCarroComando.DataSource1
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
    object edtValorTotal: TLabeledEdit
      Left = 696
      Top = 8
      Width = 105
      Height = 24
      Color = 10944511
      EditLabel.Width = 126
      EditLabel.Height = 16
      EditLabel.Caption = 'ValorTotal Gasto R$'
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
  object Panel1: TPanel
    Left = -13
    Top = 0
    Width = 825
    Height = 97
    BevelInner = bvLowered
    TabOrder = 2
    object GroupBox2: TGroupBox
      Left = 352
      Top = 16
      Width = 217
      Height = 65
      Caption = 'Filtrar entre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 35
        Height = 16
        Caption = 'In'#237'cio'
      end
      object Label2: TLabel
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
    object CheckBox1: TCheckBox
      Left = 216
      Top = 56
      Width = 129
      Height = 17
      Caption = 'Filtrar por datas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btnExecutar: TBitBtn
      Left = 592
      Top = 40
      Width = 97
      Height = 33
      Cursor = crHandPoint
      Hint = 'Executa a consulta com base nos dados fornecidos pelo usu'#225'rio'
      Caption = 'Executar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnExecutarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000000000000000
        000000000000105B0F0A5F0B0000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000C5D0E06630817561800
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000095E0C1B8A20066A0A0E5B110000000000000000000000000000
        0000000000000000000000000000000000000000000005600B229C2A26A53210
        7D1A105816000000000000000000000000000000000000000000000000000000
        000000000000035F0E23A33327B13B22A935198C25095D0F0000000000000000
        00000000000000000000000000000000000000000000035E0F28AA3B28BA441E
        B4391EAC31178D24105915000000000000000000000000000000000000000000
        000000000000025E0F2DAF442FC25023BB441EB43920AA34198C24095D0F0000
        00000000000000000000000000000000000000000000025D112FB34937C95D28
        C25123BC4320B33922AB312089281C5020000000000000000000000000000000
        000000000000025D1130B34C3BCB6431CA5D29C35226BA4427B13B1E89291C50
        20000000000000000000000000000000000000000000015C1037BA533DCD6635
        CD6335CA5C36C051178B27095D0F000000000000000000000000000000000000
        000000000000025D113BBE5744D46D39CF6542CE5D178B281058160000000000
        00000000000000000000000000000000000000000000025D1141C2594EDC734B
        D36D178A29095C11000000000000000000000000000000000000000000000000
        000000000000035D114BC8605FE17617892C0E58180000000000000000000000
        00000000000000000000000000000000000000000000055E0F4FC15D1A832809
        5B13000000000000000000000000000000000000000000000000000000000000
        0000000000000C5C0F0361081555190000000000000000000000000000000000
        000000000000000000000000000000000000000000000E5D0E0A5F0A00000000
        0000000000000000000000000000000000000000000000000000}
    end
    object btnSair: TBitBtn
      Left = 704
      Top = 40
      Width = 97
      Height = 33
      Cursor = crHandPoint
      Hint = 'Fecha a tela'
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnSairClick
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
      Left = 752
      Top = 8
      Width = 65
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object RadioGroup1: TRadioGroup
      Left = 32
      Top = 8
      Width = 169
      Height = 81
      Caption = 'Consultar:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Items.Strings = (
        'Lavouras Ativas'
        'Lavouras Encerradas')
      ParentFont = False
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = -5
    Top = 120
    Width = 822
    Height = 281
    DataSource = dmCarroComando.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
  end
end
