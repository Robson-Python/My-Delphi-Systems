object frmPagarProduto: TfrmPagarProduto
  Left = 192
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Rental - Pagar Produtos'
  ClientHeight = 128
  ClientWidth = 575
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 561
    Height = 113
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object edtSaldo: TLabeledEdit
      Left = 16
      Top = 32
      Width = 81
      Height = 24
      EditLabel.Width = 37
      EditLabel.Height = 16
      EditLabel.Caption = 'Saldo'
      TabOrder = 0
    end
    object edtDinheiro: TLabeledEdit
      Left = 192
      Top = 32
      Width = 81
      Height = 24
      EditLabel.Width = 54
      EditLabel.Height = 16
      EditLabel.Caption = 'Dinheiro'
      TabOrder = 2
      OnExit = edtDinheiroExit
    end
    object edtTroco: TLabeledEdit
      Left = 280
      Top = 32
      Width = 81
      Height = 24
      EditLabel.Width = 36
      EditLabel.Height = 16
      EditLabel.Caption = 'Troco'
      TabOrder = 3
    end
    object edtSaldoAtual: TLabeledEdit
      Left = 368
      Top = 32
      Width = 81
      Height = 24
      EditLabel.Width = 74
      EditLabel.Height = 16
      EditLabel.Caption = 'Saldo Atual'
      TabOrder = 4
    end
    object btnOk: TBitBtn
      Left = 240
      Top = 72
      Width = 81
      Height = 25
      Cursor = crHandPoint
      Caption = '&Ok'
      TabOrder = 5
      OnClick = btnOkClick
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
    object edtValor: TLabeledEdit
      Left = 104
      Top = 32
      Width = 81
      Height = 24
      EditLabel.Width = 71
      EditLabel.Height = 16
      EditLabel.Caption = 'Valor Pago'
      TabOrder = 1
      OnExit = edtValorExit
    end
    object edtProduto: TLabeledEdit
      Left = 456
      Top = 32
      Width = 89
      Height = 24
      EditLabel.Width = 86
      EditLabel.Height = 16
      EditLabel.Caption = 'Qtd. Produtos'
      TabOrder = 6
    end
  end
end
