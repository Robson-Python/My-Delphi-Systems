object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MyContatos - Gerador de Relat'#243'rios'
  ClientHeight = 430
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 671
    Height = 349
    Caption = 'Selecione uma op'#231#227'o para gerar o relat'#243'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Items.Strings = (
      'LISTAGEM DE VENDAS POR CATEGORIA'
      'LISTAGEM DE FEEDBACKS PENDENDTES'
      'LISTAGEM DE CLIENTES QUE PERDERAM A GARANTIA'
      'LISTAGEM DE CLIENTES PARA REALIZAR O P'#211'S VENDA NO M'#202'S'
      
        'LISTAGEM DE CLIENTES QUE DERAM: SUGEST'#195'O DE MELHORIA, ELOGIO, RE' +
        'CLAMA'#199#195'O E D'#218'VIDA'
      'LISTAGEM DE CLIENTES QUE FORAM AUDITADOS'
      'LISTAGEM DE ANIVERSARIANTES DO M'#202'S'
      'LISTAGEM DE LIGA'#199#213'ES EFETIVADAS'
      'LISTAGEM DE CLASSIFICA'#199#195'O DE ATENDIMENTO')
    ParentFont = False
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 363
    Width = 671
    Height = 59
    Caption = 'Gerar relat'#243'rios entre as datas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblDtPosvenda: TLabel
      Left = 144
      Top = 32
      Width = 8
      Height = 16
      Caption = #224
    end
    object dtpInicio: TDateTimePicker
      Left = 33
      Top = 24
      Width = 105
      Height = 24
      Date = 42664.485240023150000000
      Time = 42664.485240023150000000
      TabOrder = 0
    end
    object dtpFim: TDateTimePicker
      Left = 158
      Top = 24
      Width = 105
      Height = 24
      Date = 42664.485240023150000000
      Time = 42664.485240023150000000
      TabOrder = 1
    end
    object btnVisualizar: TBitBtn
      Left = 360
      Top = 23
      Width = 113
      Height = 25
      Hint = 'Visualizar Relat'#243'rios e imprimir'
      Caption = '&Visualizar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnVisualizarClick
    end
    object btnFechar: TBitBtn
      Left = 479
      Top = 23
      Width = 105
      Height = 25
      Hint = 'Fechar esta tela'
      Caption = '&Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnFecharClick
    end
  end
  object cbxMes: TComboBox
    Left = 319
    Top = 250
    Width = 100
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    Items.Strings = (
      'JANEIRO'
      'FEVEREIRO'
      'MAR'#199'O'
      'ABRIL'
      'MAIO'
      'JUNHO'
      'JULHO'
      'AGOSTO'
      'SETEMBRO'
      'OUTUBRO'
      'NOVEMBRO'
      'DEZEMBRO')
  end
  object frxVendasCategoria: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42769.473977500000000000
    ReportOptions.Name = 'MyContatos - Listagem de Vendas por Categoria'
    ReportOptions.LastChange = 42769.680033622700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 24
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = ''
      end
      item
        Name = 'Fim'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 219.212740000000000000
          Top = 3.779530000000001000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE VENDAS POR CATEGORIA')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 332.598640000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Inicio: TfrxMemoView
          Left = 279.685220000000000000
          Top = 56.692950000000000000
          Width = 75.590599999999990000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 355.275820000000000000
          Top = 56.692950000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
        object Fim: TfrxMemoView
          Left = 374.173470000000000000
          Top = 56.692950000000000000
          Width = 75.590599999999990000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          Top = 3.779529999999994000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_CATEGORIA"]')
        end
        object frxDBDataset1cp_categoria_1: TfrxMemoView
          Left = 154.960730000000000000
          Top = 3.779529999999994000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."cp_categoria_1"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Align = baLeft
          Top = 3.779529999999966000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL:')
          ParentFont = False
        end
        object frxDBDataset2cp_categoria: TfrxMemoView
          Left = 154.960730000000000000
          Top = 3.779529999999966000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."cp_categoria_1">,MasterData1)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 49.133890000000000000
          Top = 18.897650000000110000
          Width = 102.047310000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Top = 3.779529999999994000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CATEGORIA')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 117.165430000000000000
          Top = 3.779529999999994000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#176' DE VENDAS')
          ParentFont = False
        end
      end
      object Chart1: TfrxChartView
        Left = 15.118120000000000000
        Top = 325.039580000000000000
        Width = 680.315400000000000000
        Height = 302.362400000000000000
        HighlightColor = clBlack
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
          697369626C65080D4672616D652E56697369626C6508175669657733444F7074
          696F6E732E456C65766174696F6E033B01195669657733444F7074696F6E732E
          50657273706563746976650200165669657733444F7074696F6E732E526F7461
          74696F6E0368010A426576656C4F75746572070662764E6F6E6505436F6C6F72
          0707636C57686974650D44656661756C7443616E766173060E54474449506C75
          7343616E76617311436F6C6F7250616C65747465496E646578020D000A544261
          7253657269657307536572696573310E436F6C6F7245616368506F696E74090C
          5856616C7565732E4E616D650601580D5856616C7565732E4F72646572070B6C
          6F417363656E64696E670C5956616C7565732E4E616D6506034261720D595661
          6C7565732E4F7264657207066C6F4E6F6E65000000}
        ChartElevation = 315
        SeriesData = <
          item
            InheritedName = 'TfrxSeriesItem2'
            DataType = dtDBData
            DataSet = dmContato.frxDBRelatorios
            DataSetName = 'frxDBDataset1'
            SortOrder = soNone
            TopN = 0
            XType = xtText
            Source1 = 'frxDBDataset1."CP_CATEGORIA"'
            Source2 = 'frxDBDataset1."cp_categoria_1"'
            XSource = 'frxDBDataset1."CP_CATEGORIA"'
            YSource = 'frxDBDataset1."cp_categoria_1"'
          end>
      end
    end
  end
  object frxChartObject1: TfrxChartObject
    Left = 608
    Top = 352
  end
  object frxPercaGarantia: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42772.497466504600000000
    ReportOptions.Name = 'MyContatos - Listagem de Clientes que Perderam a Garantia'
    ReportOptions.LastChange = 42772.497466504600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 456
    Top = 88
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = ''
      end
      item
        Name = 'Fim'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 117.165430000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1C_NOME: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = 'C_NOME'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_NOME"]')
        end
        object frxDBDataset1CP_CATEGORIA: TfrxMemoView
          Left = 188.976500000000000000
          Top = 3.779529999999937000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_CATEGORIA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_CATEGORIA"]')
        end
        object frxDBDataset1CP_MODELO: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779529999999937000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_MODELO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_MODELO"]')
        end
        object frxDBDataset1CP_PLACA: TfrxMemoView
          Left = 359.055350000000000000
          Top = 3.779529999999937000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_PLACA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_PLACA"]')
        end
        object frxDBDataset1PV_MOTIVO_PERDA_GARANTIA: TfrxMemoView
          Left = 445.984540000000000000
          Top = 3.779529999999994000
          Width = 264.567100000000000000
          Height = 109.606370000000000000
          DataField = 'PV_MOTIVO_PERDA_GARANTIA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PV_MOTIVO_PERDA_GARANTIA"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 445.984540000000000000
          Top = 7.559059999999988000
          Width = 374.173470000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Motivo de Perca de Garantia')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 188.976500000000000000
          Top = 7.559059999999988000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 275.905690000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 359.055350000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Placa')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 173.858380000000000000
          Top = 11.338590000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE CLIENTES QUE PERDERAM A GARANTIA')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 325.039580000000000000
          Top = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 343.937230000000000000
          Top = 68.031540000000010000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
        object Inicio: TfrxMemoView
          Left = 272.126160000000000000
          Top = 68.031540000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Fim: TfrxMemoView
          Left = 359.055350000000000000
          Top = 68.031540000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
      end
    end
  end
  object frxLigacoes: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42769.473977500000000000
    ReportOptions.Name = 'MyContatos - Listagem de Liga'#231#245'es Efetivadas'
    ReportOptions.LastChange = 42769.680033622700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 280
    Top = 280
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = ''
      end
      item
        Name = 'Fim'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488249999999990000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 228.661565000000000000
          Width = 260.787570000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE LIGA'#199#213'ES EFETIVADAS')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 328.819110000000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Inicio: TfrxMemoView
          Left = 268.346630000000000000
          Top = 60.472479999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Fim: TfrxMemoView
          Left = 362.834880000000000000
          Top = 60.472479999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 347.716760000000000000
          Top = 60.472479999999990000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 22.677180000000000000
          Top = 3.779529999999994000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'A_CONFIRMACAO_CONTATO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."A_CONFIRMACAO_CONTATO"]')
        end
        object frxDBDataset1cp_categoria_1: TfrxMemoView
          Left = 188.976500000000000000
          Top = 3.779529999999994000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."A_CONFIRMACAO_CONTATO_1"]')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Confirma'#231#227'o de Contato')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 219.212740000000000000
          Top = 7.559059999999988000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
      end
      object Chart1: TfrxChartView
        Left = 7.559060000000000000
        Top = 291.023810000000000000
        Width = 680.315400000000000000
        Height = 302.362400000000000000
        HighlightColor = clBlack
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
          697369626C65080D4672616D652E56697369626C6508175669657733444F7074
          696F6E732E456C65766174696F6E033B01195669657733444F7074696F6E732E
          50657273706563746976650200165669657733444F7074696F6E732E526F7461
          74696F6E0368010A426576656C4F75746572070662764E6F6E6505436F6C6F72
          0707636C57686974650D44656661756C7443616E766173060E54474449506C75
          7343616E76617311436F6C6F7250616C65747465496E646578020D000A544261
          7253657269657307536572696573310E436F6C6F7245616368506F696E74090C
          5856616C7565732E4E616D650601580D5856616C7565732E4F72646572070B6C
          6F417363656E64696E670C5956616C7565732E4E616D6506034261720D595661
          6C7565732E4F7264657207066C6F4E6F6E65000000}
        ChartElevation = 315
        SeriesData = <
          item
            InheritedName = 'TfrxSeriesItem2'
            DataType = dtDBData
            DataSet = dmContato.frxDBRelatorios
            DataSetName = 'frxDBDataset1'
            SortOrder = soNone
            TopN = 0
            XType = xtText
            Source1 = 'frxDBDataset1."A_CONFIRMACAO_CONTATO"'
            Source2 = 'frxDBDataset1."A_CONFIRMACAO_CONTATO_1"'
            XSource = 'frxDBDataset1."A_CONFIRMACAO_CONTATO"'
            YSource = 'frxDBDataset1."A_CONFIRMACAO_CONTATO_1"'
          end>
      end
    end
  end
  object frxClassifAtend: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42769.760298634300000000
    ReportOptions.Name = 'MyContatos - Listagem de Classifica'#231#227'o de Atendimento'
    ReportOptions.LastChange = 42769.760298634300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 336
    Top = 312
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = ''
      end
      item
        Name = 'Fim'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 188.976500000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE CLASSIFICA'#199#195'O DE ATENDIMENTO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 328.819110000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 347.716760000000000000
          Top = 56.692950000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
        object Inicio: TfrxMemoView
          Left = 268.346630000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Fim: TfrxMemoView
          Left = 362.834880000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset3CP_MES: TfrxMemoView
          Top = 3.779529999999937000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'A_CLASSIFICACAO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."A_CLASSIFICACAO"]')
        end
        object frxDBDataset3cp_mes_1: TfrxMemoView
          Left = 196.535560000000000000
          Top = 3.779529999999937000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'a_classificacao_1'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."a_classificacao_1"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Top = 3.779529999999994000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Classifica'#231#227'o do P'#243's Venda')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 219.212740000000000000
          Top = 3.779529999999994000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
      end
      object Chart1: TfrxChartView
        Left = 7.559060000000000000
        Top = 317.480520000000000000
        Width = 680.315400000000000000
        Height = 302.362400000000000000
        HighlightColor = clBlack
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
          697369626C65080D4672616D652E56697369626C6508175669657733444F7074
          696F6E732E456C65766174696F6E033B01195669657733444F7074696F6E732E
          50657273706563746976650200165669657733444F7074696F6E732E526F7461
          74696F6E0368010A426576656C4F75746572070662764E6F6E6505436F6C6F72
          0707636C57686974650D44656661756C7443616E766173060E54474449506C75
          7343616E76617311436F6C6F7250616C65747465496E646578020D000A544261
          7253657269657307536572696573310E436F6C6F7245616368506F696E74090C
          5856616C7565732E4E616D650601580D5856616C7565732E4F72646572070B6C
          6F417363656E64696E670C5956616C7565732E4E616D6506034261720D595661
          6C7565732E4F7264657207066C6F4E6F6E65000000}
        ChartElevation = 315
        SeriesData = <
          item
            InheritedName = 'TfrxSeriesItem2'
            DataType = dtDBData
            DataSet = dmContato.frxDBRelatorios
            DataSetName = 'frxDBDataset1'
            SortOrder = soNone
            TopN = 0
            XType = xtText
            Source1 = 'frxDBDataset1."A_CLASSIFICACAO"'
            Source2 = 'frxDBDataset1."a_classificacao_1"'
            XSource = 'frxDBDataset1."A_CLASSIFICACAO"'
            YSource = 'frxDBDataset1."a_classificacao_1"'
          end>
      end
    end
  end
  object frxFeedPendente: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42772.497466504600000000
    ReportOptions.Name = 'MyContatos - Listagem de Feedbacks Pendentes'
    ReportOptions.LastChange = 42772.497466504600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 392
    Top = 56
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = ''
      end
      item
        Name = 'Fim'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1C_NOME: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'C_NOME'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_NOME"]')
        end
        object frxDBDataset1CP_CATEGORIA: TfrxMemoView
          Left = 291.023810000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_CATEGORIA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_CATEGORIA"]')
        end
        object frxDBDataset1CP_MODELO: TfrxMemoView
          Left = 381.732530000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_MODELO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_MODELO"]')
        end
        object frxDBDataset1CP_PLACA: TfrxMemoView
          Left = 468.661720000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_PLACA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_PLACA"]')
        end
        object frxDBDataset1PV_MOTIVO_PERDA_GARANTIA: TfrxMemoView
          Left = 570.709030000000000000
          Top = 3.779529999999994000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'F_DATA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."F_DATA"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 570.709030000000000000
          Top = 7.559059999999988000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data do Feedback')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Top = 11.338590000000010000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 291.023810000000000000
          Top = 7.559059999999988000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 381.732530000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 468.661720000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Placa')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 219.212740000000000000
          Top = 11.338590000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE FEEDBACKS PENDENDTES')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 325.039580000000000000
          Top = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 347.716760000000000000
          Top = 68.031540000000010000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
        object Inicio: TfrxMemoView
          Left = 275.905690000000000000
          Top = 68.031540000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Fim: TfrxMemoView
          Left = 362.834880000000000000
          Top = 68.031540000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
      end
    end
  end
  object frxClientesPosVenda: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42772.497466504600000000
    ReportOptions.Name = 
      'MyContatos - Listagem de Clientes Para Realizar o P'#243's Venda no M' +
      #234's'
    ReportOptions.LastChange = 42772.497466504600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 520
    Top = 120
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = ''
      end
      item
        Name = 'Fim'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1C_NOME: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = 'C_NOME'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_NOME"]')
        end
        object frxDBDataset1CP_CATEGORIA: TfrxMemoView
          Left = 238.110390000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_CATEGORIA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_CATEGORIA"]')
        end
        object frxDBDataset1CP_MODELO: TfrxMemoView
          Left = 325.039580000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_MODELO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_MODELO"]')
        end
        object frxDBDataset1CP_PLACA: TfrxMemoView
          Left = 408.189240000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_PLACA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_PLACA"]')
        end
        object frxDBDataset1PV_MOTIVO_PERDA_GARANTIA: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779529999999994000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = 'CT_DATA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CT_DATA"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 506.457020000000000000
          Top = 7.559059999999988000
          Width = 374.173470000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data do P'#243's Venda')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 238.110390000000000000
          Top = 7.559059999999988000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 325.039580000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 408.189240000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Placa')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 139.842610000000000000
          Top = 11.338590000000000000
          Width = 438.425480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE CLIENTES PARA REALIZAR O P'#211'S VENDA NO M'#202'S')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 325.039580000000000000
          Top = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 343.937230000000000000
          Top = 68.031540000000010000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
        object Inicio: TfrxMemoView
          Left = 272.126160000000000000
          Top = 68.031540000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Fim: TfrxMemoView
          Left = 359.055350000000000000
          Top = 68.031540000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
      end
    end
  end
  object frxClientesSugMelEloRec: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42772.497466504600000000
    ReportOptions.Name = 
      'MyContatos - Listagem de Clientes que deram: Sugest'#227'o de Melhori' +
      'a, Elogio, Reclama'#231#227'o e D'#250'vida'
    ReportOptions.LastChange = 42772.497466504600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 632
    Top = 144
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = Null
      end
      item
        Name = 'Fim'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 143.622140000000000000
        Top = 245.669450000000000000
        Width = 1046.929810000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1C_NOME: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'C_NOME'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_NOME"]')
        end
        object frxDBDataset1CP_CATEGORIA: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_CATEGORIA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_CATEGORIA"]')
        end
        object frxDBDataset1CP_MODELO: TfrxMemoView
          Left = 298.582870000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_MODELO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_MODELO"]')
        end
        object frxDBDataset1CP_PLACA: TfrxMemoView
          Left = 381.732530000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_PLACA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_PLACA"]')
        end
        object frxDBDataset1PV_MOTIVO_PERDA_GARANTIA: TfrxMemoView
          Left = 472.441250000000000000
          Top = 3.779529999999994000
          Width = 170.078850000000000000
          Height = 136.063080000000000000
          DataField = 'PV_SUGESTAO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PV_SUGESTAO"]')
        end
        object frxDBDataset1PV_ELOGIO: TfrxMemoView
          Left = 672.756340000000000000
          Top = 3.779529999999994000
          Width = 128.504020000000000000
          Height = 136.063080000000000000
          DataField = 'PV_ELOGIO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PV_ELOGIO"]')
        end
        object frxDBDataset1PV_RECLAMACAO: TfrxMemoView
          Left = 808.819420000000000000
          Top = 3.779529999999994000
          Width = 124.724490000000000000
          Height = 136.063080000000000000
          DataField = 'PV_RECLAMACAO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PV_RECLAMACAO"]')
        end
        object frxDBDataset1PV_DUVIDA: TfrxMemoView
          Left = 948.662030000000000000
          Top = 3.779529999999994000
          Width = 102.047310000000000000
          Height = 136.063080000000000000
          DataField = 'PV_DUVIDA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PV_DUVIDA"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 151.181200000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Left = 472.441250000000000000
          Top = 7.559059999999988000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sugest'#227'o de Melhoria')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 211.653680000000000000
          Top = 7.559059999999988000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 298.582870000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 381.732530000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Placa')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 672.756340000000000000
          Top = 7.559059999999988000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Elogio')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 808.819420000000000000
          Top = 7.559059999999988000
          Width = 86.929190000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Reclama'#231#227'o')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 948.662030000000000000
          Top = 7.559059999999988000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'D'#250'vida')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 194.645795000000000000
          Top = 11.338590000000000000
          Width = 657.638220000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'LISTAGEM DE CLIENTES QUE DERAM: SUGEST'#195'O DE MELHORIA, ELOGIO, RE' +
              'CLAMA'#199#195'O E D'#218'VIDA')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 491.338900000000000000
          Top = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 510.236550000000000000
          Top = 68.031540000000010000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
        object Inicio: TfrxMemoView
          Left = 438.425480000000000000
          Top = 68.031540000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Fim: TfrxMemoView
          Left = 525.354670000000100000
          Top = 68.031540000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
      end
    end
  end
  object frxCliAuditados: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42772.497466504600000000
    ReportOptions.Name = 'MyContatos - Listagem de Clientes que Foram Auditados'
    ReportOptions.LastChange = 42772.497466504600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 360
    Top = 200
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Periodo'
        Value = Null
      end
      item
        Name = 'Inicio'
        Value = ''
      end
      item
        Name = 'Fim'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1C_NOME: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'C_NOME'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_NOME"]')
        end
        object frxDBDataset1CP_CATEGORIA: TfrxMemoView
          Left = 188.976500000000000000
          Top = 3.779529999999937000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_CATEGORIA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_CATEGORIA"]')
        end
        object frxDBDataset1CP_MODELO: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779529999999937000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_MODELO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_MODELO"]')
        end
        object frxDBDataset1CP_PLACA: TfrxMemoView
          Left = 359.055350000000000000
          Top = 3.779529999999937000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CP_PLACA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CP_PLACA"]')
        end
        object frxDBDataset1PV_MOTIVO_PERDA_GARANTIA: TfrxMemoView
          Left = 449.764070000000000000
          Top = 3.779529999999994000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'A_DT_AUDITORIA'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."A_DT_AUDITORIA"]')
        end
        object frxDBDataset1A_CONFIRMACAO_CONTATO: TfrxMemoView
          Left = 548.031850000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'A_CONFIRMACAO_CONTATO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."A_CONFIRMACAO_CONTATO"]')
        end
        object frxDBDataset1A_CLASSIFICACAO: TfrxMemoView
          Left = 646.299630000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'A_CLASSIFICACAO'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."A_CLASSIFICACAO"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 449.764070000000000000
          Top = 7.559059999999988000
          Width = 86.929190000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Auditoria')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 188.976500000000000000
          Top = 7.559059999999988000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 275.905690000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 359.055350000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Placa')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 548.031850000000000000
          Top = 7.559059999999988000
          Width = 86.929190000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Confirma'#231#227'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 646.299630000000000000
          Top = 7.559059999999988000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Classif.')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 192.756030000000000000
          Top = 11.338590000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE CLIENTES QUE FORAM AUDITADOS')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 328.819110000000000000
          Top = 37.795300000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 347.716760000000000000
          Top = 68.031540000000010000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #224)
        end
        object Inicio: TfrxMemoView
          Left = 275.905690000000000000
          Top = 68.031540000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Inicio]')
          ParentFont = False
        end
        object Fim: TfrxMemoView
          Left = 362.834880000000000000
          Top = 68.031540000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fim]')
          ParentFont = False
        end
      end
    end
  end
  object frxNiver: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42772.497466504600000000
    ReportOptions.Name = 'MyContatos - Listagem de Aniversariantes do M'#234's'
    ReportOptions.LastChange = 42772.497466504600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 432
    Top = 248
    Datasets = <
      item
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Niver'
        Value = Null
      end
      item
        Name = 'Mes'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = dmContato.frxDBRelatorios
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1C_NOME: TfrxMemoView
          Left = 196.535560000000000000
          Top = 3.779529999999994000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataField = 'C_NOME'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_NOME"]')
        end
        object frxDBDataset1PV_MOTIVO_PERDA_GARANTIA: TfrxMemoView
          Left = 18.897650000000000000
          Top = 3.779529999999994000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataField = 'C_DIA_NASC'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_DIA_NASC"]')
        end
        object frxDBDataset1C_MES_NASC: TfrxMemoView
          Left = 56.692950000000000000
          Top = 3.779529999999994000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'C_MES_NASC'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_MES_NASC"]')
        end
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Top = 3.779529999999994000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'de')
        end
        object frxDBDataset1C_CONTATO1: TfrxMemoView
          Left = 461.102660000000000000
          Top = 3.779529999999994000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'C_CONTATO1'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_CONTATO1"]')
        end
        object frxDBDataset1C_CONTATO2: TfrxMemoView
          Left = 597.165740000000000000
          Top = 3.779529999999994000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'C_CONTATO2'
          DataSet = dmContato.frxDBRelatorios
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."C_CONTATO2"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 18.897650000000000000
          Top = 7.559060000000002000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data do Anivers'#225'rio')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 196.535560000000000000
          Top = 7.559060000000002000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 461.102660000000000000
          Top = 7.559060000000002000
          Width = 75.590599999999990000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contato 1')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 597.165740000000000000
          Top = 7.559060000000002000
          Width = 75.590599999999990000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contato 2')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 68.031540000000010000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 219.212740000000000000
          Top = 11.338590000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'LISTAGEM DE ANIVERSARIANTES DO M'#202'S')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 302.362400000000000000
          Top = 37.795300000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'M'#234's:')
          ParentFont = False
        end
        object Mes: TfrxMemoView
          Left = 336.378170000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Mes]')
          ParentFont = False
        end
      end
    end
  end
end
