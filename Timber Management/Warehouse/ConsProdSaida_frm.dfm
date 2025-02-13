object frmConsProdSaida: TfrmConsProdSaida
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema Almoxarifado - Consulta de Produtos Incluidos na Sa'#237'da'
  ClientHeight = 374
  ClientWidth = 625
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
    Left = -8
    Top = -8
    Width = 633
    Height = 49
    Brush.Color = 10858823
  end
  object Shape1: TShape
    Left = -1
    Top = 40
    Width = 626
    Height = 25
    Brush.Color = 13998884
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 625
    Height = 305
    DataSource = dmVendas.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        Title.Caption = 'C'#243'digo'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Nome do Produto'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Qtd.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'U.M.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vl. Unit'#225'rio'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vl. Total'
        Width = 76
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 41
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 56
      Top = 8
      Width = 232
      Height = 25
      DataSource = dmVendas.DataSource1
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
    object btnFechar: TBitBtn
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Fecha a tela'
      Caption = 'Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    Left = -2
    Top = 40
    Width = 627
    Height = 25
    BevelOuter = bvLowered
    Caption = 'Itens Sa'#237'da/Vendas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
