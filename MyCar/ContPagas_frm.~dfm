object frmConPagas: TfrmConPagas
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Carro Comando - Contas '#224' Pagar [Contas Pagas]'
  ClientHeight = 446
  ClientWidth = 632
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
  object Shape2: TShape
    Left = -8
    Top = 404
    Width = 641
    Height = 42
    Brush.Color = 13998884
  end
  object Shape1: TShape
    Left = -8
    Top = 128
    Width = 641
    Height = 25
    Brush.Color = 13998884
  end
  object Panel4: TPanel
    Left = 0
    Top = 128
    Width = 633
    Height = 25
    BevelOuter = bvLowered
    Caption = 'Contas Pagas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 633
    Height = 41
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 201
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 129
    BevelInner = bvLowered
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 345
      Height = 57
      Caption = 'Consultar Ve'#237'culo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cbxVeic: TComboBox
        Left = 8
        Top = 24
        Width = 241
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnExit = cbxVeicExit
      end
      object edtPlaca: TEdit
        Left = 256
        Top = 24
        Width = 81
        Height = 24
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 376
      Top = 8
      Width = 121
      Height = 113
      Caption = 'Filtrar entre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 35
        Height = 16
        Caption = 'In'#237'cio'
      end
      object Label2: TLabel
        Left = 16
        Top = 64
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
        Left = 16
        Top = 80
        Width = 89
        Height = 24
        Date = 39759.726079016200000000
        Time = 39759.726079016200000000
        TabOrder = 1
      end
    end
    object CheckBox1: TCheckBox
      Left = 224
      Top = 88
      Width = 129
      Height = 17
      Caption = 'Filtrar por datas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnExecutar: TBitBtn
      Left = 520
      Top = 32
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
      TabOrder = 3
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
      Left = 520
      Top = 72
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
      TabOrder = 4
      OnClick = btnSairClick
      Glyph.Data = {
        06080000424D060800000000000036000000280000001A000000190000000100
        180000000000D007000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000498BB302629C016096145B871E5F853B647B
        4F6B7B6D7C840000000000000000000000000000000000000000000000000000
        000000000000000000000000000000D9E7F04E8FB7498BB34E8FB74E8FB70160
        961570BF126EB90E6BB10B6CA90968A602629C02629C02629C02629C02629C02
        629C02629C00000000000000000000000000000000000000000000000000005D
        97BF094C7B0F3E680F3E680F3E68015C911E7CCE2184D12588D32184D12184D1
        2184D11F80CF1F80CF1E7CCE1E7CCE1C79C70968A60000000000000000000000
        0000000000000000000000000000004283AB0C44701338601338601033530160
        962588D32D8ED8268CD52A91D8288FD7288FD7268CD5268CD5258AD52588D321
        84D10E6BB100000000000000000000000000000000006F926F0C94115978592A
        74A40F3E68103353054A2F45B24D0160962D8ED82A91D8268CD52D94DA2D94DA
        2D94DA278DD62C92D92A91D8288FD7278DD61273B40000000000000000000000
        0000001681252ABE3C38C34B056E0A056E0A1D8D2245B24D7BD89290E5A2015C
        912D8ED83295DC228AD53399DD3097DB3097DB2A91D82D94DA2D94DA2A91D82A
        91D81977B90000000000000000000000068B0924BA352ABE3C34BC4443C55655
        CA6962CF7667D17C7BD89225982A02629C3295DC3399DD228AD5389CDE389CDE
        3399DD2A91D83399DD3399DD2A91D82D94DA1C79C70000000000000000AFD5AF
        12AA1E18B8292ABE3C34BC4443C5564CC96062CF766FD38434A83C1033530262
        9C3399DD3BA1E31B6D9F3280B23BA1E33BA1E32D94DA389CDE379EE12C92D933
        99DD1F81C65F747D00000000000000000000000E9D162ABE3C34BC4438C34B34
        BC441D8D2206642813386013386002629C2F8BCB0D539B126EB90D539B296F8C
        3BA1E33097DB3BA1E33BA1E32C92D9379EE12685C94F6B7B0000000000000000
        0000000000001D8D2224AD31597859005D9B1338601338601338601338600968
        A61563A81570BF2184D11C79C7084E823794CC3399DD3FA5E53FA5E52A91D83B
        A1E32D8ED84F6B7B0000000000000000000000000000000000F2F5F2A4BEA901
        5C911338601338601338601338600968A61563A85D97BF86C2E474ACD41B6D9F
        42A8E63399DD42A8E642A8E6288FD73FA5E53295DC3B647B0000000000000000
        000000000000000000000000000000015C911338601338601338601338600B6C
        A92F8BCB2A74A4E2EEF56E9FC03E9BD148AEEB379EE142A8E645AAEA288FD73F
        A5E53295DC3B647B000000000000000000000000000000000000000000000001
        5C911338601338601338600F3E681273B445AAEA4EB5F0238AD24BB1EE48AEEB
        4BB1EE379EE148AEEB48AEEB278DD645AAEA379EE12A607F0000000000000000
        0000000000000000000000000000000357891033531033531338600C44701977
        B948AEEB4EB5F03BA1E34EB5F04BB1EE4EB5F0379EE14BB1EE4BB1EE268CD542
        A8E642A8E6145B87000000000000000000000000000000000000000000000008
        4E82056E0A0252141033530C44702685C94BB1EE68BBEC5CB2E873BBE67AC1E7
        86C2E48CB9D19AC9DC9AC9DC8CB9D1A7C8D742A8E6145B870000000000000000
        0000000000000000000000005F747D02521455C06374D68B025214133860278D
        D6D4D5D1FFF9D8FFFBF2F2F2F1FFFBF2FFFBF2D3CFF2C4C0F2F6F6F69A97F6F6
        EDEE73BBE60357890000000000000000000000000000128414189B1F43C5565C
        CE7167D17C6FD38483DC9A0F78533097DBEFEDD77B75EE544EF1A6A2F63D36EF
        BDBBFABDBBFA2B24EEFFFFFE2B24EEEAE6F973BBE6015C910000000000000000
        0000000E9D1634BC4434BC4443C55655CA6967D17C6FD3847BD892338E953BA1
        E3F9F2D77B75EE7974F5BDBBFA8681F50F08EDFFFFFE2B27F0FFFFFE2B24EEE6
        E5FC7AC1E7015C910000000000000000068B0924BA352ABE3C38C34B43C55655
        CA6967D17C6FD38483DC9A0B6E753BA9EDF9F2D77B75EEDFDDFBEEEEFD2B27F0
        9A97F6BDBBFA211BED7974F5897EC2C8B7A45CB2E8015C910000000000E2EDE2
        18B82918B8291D8D224A8F4A296F8C13386055C06374D68B02521403578942AC
        F1F9F2D7A6A2F68681F5B6B3F8E6E5FCFFFFFEEEEEFDFBFBFCFFFFFEFCE5C79A
        C9DC55B8F502629C00000000008BC38B0E9D16D4D5D10000000000001B6D9F13
        3860056E0A054A2F13386003578945B0F7FCE5C7FFF3E2FEF6EAFFF3E2FFEFDB
        FFEFDBFDECD3FAE7D5F1E3CF84BEDE4CB7F44BB1EE02629C00000000008BC38B
        A5A8A70000000000000000002A74A4015C91015893015C91015C91015C9145AA
        EA68BBEC7AC1E768BBEC60BCF34FB5F74FB5F742ACF1379EE13293D41F81C619
        77B91271AC02629C0000000000ECF5EC00000000000000000000000000000000
        00000000000000000000001B6D9F1273B40968A60C6498016096015C91015C91
        015C910160960C64984E8FB789A3B2B9D1DD0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000008CB9D15D97
        BFA9BCC700000000000000000000000000000000000000000000000000000000
        00000000000000000000}
    end
    object RadioButton1: TRadioButton
      Left = 24
      Top = 88
      Width = 129
      Height = 17
      Caption = 'Todos as contas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 152
    Width = 633
    Height = 257
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
    Columns = <
      item
        Expanded = False
        Title.Caption = 'C'#243'digo'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Ve'#237'culo'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Placa'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'N'#186' Nota Fiscal'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Fornecedor'
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Refer'#234'ncia'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Valor'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vencimento'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Situa'#231#227'o'
        Width = 98
        Visible = True
      end>
  end
end
