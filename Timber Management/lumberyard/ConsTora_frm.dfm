object frmConsTora: TfrmConsTora
  Left = 194
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Controle de Toras - Consulta de Toras'
  ClientHeight = 549
  ClientWidth = 981
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
    Width = 969
    Height = 65
    Caption = 'Busca'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 55
      Height = 16
      Caption = 'Empresa'
    end
    object edtIdEmp1: TEdit
      Left = 64
      Top = 32
      Width = 57
      Height = 24
      Color = 12450555
      TabOrder = 0
    end
    object cbxEmpresa: TComboBox
      Left = 128
      Top = 32
      Width = 249
      Height = 24
      CharCase = ecUpperCase
      ItemHeight = 16
      TabOrder = 1
      OnChange = cbxEmpresaChange
    end
    object edtPlaqueta: TLabeledEdit
      Left = 472
      Top = 33
      Width = 89
      Height = 24
      BiDiMode = bdLeftToRight
      EditLabel.Width = 57
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Plaqueta'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clBlack
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
    end
    object btnExecutar: TBitBtn
      Left = 584
      Top = 24
      Width = 89
      Height = 25
      Hint = 'Carrega os dados referente a tora consultada'
      Caption = 'Executar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnExecutarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
        00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
        70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
        70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
        70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
        70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
        70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
        00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
      NumGlyphs = 2
    end
    object btnFechar: TBitBtn
      Left = 680
      Top = 24
      Width = 89
      Height = 25
      Hint = 'Fecha a tela'
      Caption = 'Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object CheckBox1: TCheckBox
      Left = 416
      Top = 8
      Width = 145
      Height = 17
      Caption = 'Filtrar por Plaqueta'
      TabOrder = 5
    end
    object DBNavigator1: TDBNavigator
      Left = 784
      Top = 16
      Width = 160
      Height = 41
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
      ShowHint = True
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 80
    Width = 969
    Height = 209
    Caption = 'Dados'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 953
      Height = 185
      DataSource = dmVendas.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Id'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Empresa'
          Width = 174
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Plaqueta'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Data'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Romaneio'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Esp'#233'cie'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Classif.'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'D1'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'D2'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Comp'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Volume'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Custo M3'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Valor'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'M3 Utiliz'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'M3 Disp.'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'ML Util.'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'ML Disp.'
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 295
    Width = 969
    Height = 250
    Caption = 'Detalhes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 97
      Width = 49
      Height = 16
      Caption = 'Esp'#233'cie'
    end
    object Label7: TLabel
      Left = 16
      Top = 129
      Width = 45
      Height = 16
      Caption = 'Classif.'
    end
    object Label3: TLabel
      Left = 40
      Top = 160
      Width = 29
      Height = 16
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 55
      Height = 16
      Caption = 'Empresa'
    end
    object Label5: TLabel
      Left = 208
      Top = 160
      Width = 65
      Height = 16
      Caption = 'Romaneio'
    end
    object edtPlaq2: TLabeledEdit
      Left = 280
      Top = 24
      Width = 89
      Height = 24
      BiDiMode = bdLeftToRight
      Color = 11845312
      EditLabel.Width = 57
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Plaqueta'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clBlack
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtMed2: TLabeledEdit
      Left = 440
      Top = 57
      Width = 81
      Height = 24
      BiDiMode = bdLeftToRight
      Color = 11845312
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Diam. 2'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clBlack
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtComprimento: TLabeledEdit
      Left = 440
      Top = 89
      Width = 81
      Height = 24
      BiDiMode = bdLeftToRight
      Color = 11845312
      EditLabel.Width = 62
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Comprim.'
      EditLabel.ParentBiDiMode = False
      LabelPosition = lpLeft
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtVolume: TLabeledEdit
      Left = 440
      Top = 121
      Width = 81
      Height = 24
      BiDiMode = bdLeftToRight
      Color = 11845312
      EditLabel.Width = 49
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Volume'
      EditLabel.ParentBiDiMode = False
      LabelPosition = lpLeft
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtCustoPlaq: TLabeledEdit
      Left = 440
      Top = 153
      Width = 81
      Height = 24
      Color = 11845312
      EditLabel.Width = 35
      EditLabel.Height = 16
      EditLabel.Caption = 'Custo'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 4
    end
    object edtPreco: TLabeledEdit
      Left = 440
      Top = 185
      Width = 81
      Height = 24
      Color = 11845312
      EditLabel.Width = 37
      EditLabel.Height = 16
      EditLabel.Caption = 'Pre'#231'o'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 5
    end
    object edtM3Utilizada: TLabeledEdit
      Left = 72
      Top = 184
      Width = 89
      Height = 24
      Color = 11845312
      EditLabel.Width = 47
      EditLabel.Height = 16
      EditLabel.Caption = 'M3 Util.'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 6
    end
    object edtMed1: TLabeledEdit
      Left = 440
      Top = 25
      Width = 81
      Height = 24
      BiDiMode = bdLeftToRight
      Color = 11845312
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Diam. 1'
      EditLabel.ParentBiDiMode = False
      LabelPosition = lpLeft
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 7
    end
    object edtIdEspecie: TEdit
      Left = 72
      Top = 89
      Width = 57
      Height = 24
      Color = 12450555
      Enabled = False
      TabOrder = 8
    end
    object edtIdClass: TEdit
      Left = 72
      Top = 121
      Width = 57
      Height = 24
      Color = 12450555
      Enabled = False
      TabOrder = 9
    end
    object DateTimePicker1: TDateTimePicker
      Left = 72
      Top = 152
      Width = 89
      Height = 24
      Date = 39750.932117696760000000
      Time = 39750.932117696760000000
      Color = 11845312
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object edtId: TLabeledEdit
      Left = 72
      Top = 24
      Width = 57
      Height = 24
      Color = 11845312
      EditLabel.Width = 12
      EditLabel.Height = 16
      EditLabel.Caption = 'Id'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 11
    end
    object edtEspecie: TEdit
      Left = 136
      Top = 88
      Width = 233
      Height = 24
      Color = 11845312
      ReadOnly = True
      TabOrder = 12
    end
    object edtClass: TEdit
      Left = 136
      Top = 120
      Width = 233
      Height = 24
      Color = 11845312
      ReadOnly = True
      TabOrder = 13
    end
    object edtRomaneio: TEdit
      Left = 280
      Top = 152
      Width = 89
      Height = 24
      Color = 11845312
      ReadOnly = True
      TabOrder = 14
    end
    object edtEmpresa: TEdit
      Left = 136
      Top = 56
      Width = 233
      Height = 24
      Color = 11845312
      ReadOnly = True
      TabOrder = 15
    end
    object edtIdEmp2: TEdit
      Left = 72
      Top = 57
      Width = 57
      Height = 24
      Color = 12450555
      Enabled = False
      TabOrder = 16
    end
    object edtMLUtiliz: TLabeledEdit
      Left = 72
      Top = 216
      Width = 89
      Height = 24
      Color = 11845312
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.Caption = 'ML Util.'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 17
    end
    object edtM3Disp: TLabeledEdit
      Left = 280
      Top = 184
      Width = 89
      Height = 24
      Color = 11845312
      EditLabel.Width = 88
      EditLabel.Height = 16
      EditLabel.Caption = 'M3 Disponivel'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 18
    end
    object edtMLDisp: TLabeledEdit
      Left = 280
      Top = 216
      Width = 89
      Height = 24
      Color = 11845312
      EditLabel.Width = 89
      EditLabel.Height = 16
      EditLabel.Caption = 'ML Disponivel'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 19
    end
    object DBGrid2: TDBGrid
      Left = 528
      Top = 24
      Width = 433
      Height = 209
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 20
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid2DrawColumnCell
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Data Sa'#237'da'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Tipo'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'ML Utilizada'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'M3 Utilizada'
          Width = 84
          Visible = True
        end>
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dmVendas.ADOConnection1
    Parameters = <>
    Left = 616
    Top = 391
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 648
    Top = 391
  end
end
