object frmSetores: TfrmSetores
  Left = 227
  Top = 163
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Toras - Confirmar Per'#237'odo para Saldo'
  ClientHeight = 220
  ClientWidth = 425
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
  object Label4: TLabel
    Left = 32
    Top = 184
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 32
    Top = 200
    Width = 32
    Height = 13
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 304
    Top = 184
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 409
    Height = 169
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 40
      Width = 8
      Height = 16
      Caption = #224
    end
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 35
      Height = 16
      Caption = 'In'#237'cio'
    end
    object Label3: TLabel
      Left = 128
      Top = 16
      Width = 24
      Height = 16
      Caption = 'Fim'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 8
      Top = 32
      Width = 97
      Height = 24
      Date = 40866.536876250000000000
      Time = 40866.536876250000000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 128
      Top = 32
      Width = 97
      Height = 24
      Date = 40866.537005370370000000
      Time = 40866.537005370370000000
      TabOrder = 1
    end
    object edtIdEmp: TLabeledEdit
      Left = 8
      Top = 88
      Width = 73
      Height = 24
      EditLabel.Width = 71
      EditLabel.Height = 16
      EditLabel.Caption = 'Empresa Id'
      TabOrder = 2
    end
    object edtEmpresa: TLabeledEdit
      Left = 96
      Top = 88
      Width = 297
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'Empresa'
      TabOrder = 3
    end
    object edtIdEsp: TLabeledEdit
      Left = 8
      Top = 137
      Width = 73
      Height = 24
      EditLabel.Width = 65
      EditLabel.Height = 16
      EditLabel.Caption = 'Especie Id'
      TabOrder = 4
    end
    object edtEspecie: TLabeledEdit
      Left = 96
      Top = 137
      Width = 297
      Height = 24
      EditLabel.Width = 49
      EditLabel.Height = 16
      EditLabel.Caption = 'Especie'
      TabOrder = 5
    end
  end
  object btnConfirmar: TBitBtn
    Left = 160
    Top = 184
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Caption = 'Confirmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
end
