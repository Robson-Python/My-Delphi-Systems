object frmAlerta: TfrmAlerta
  Left = 192
  Top = 113
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'MyCar - Alerta de Compromisso'
  ClientHeight = 289
  ClientWidth = 520
  Color = 8454143
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
    Width = 505
    Height = 217
    Caption = 'Voc'#234' tem o seguinte compromisso a cumprir:'
    Color = 8454143
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 120
      Width = 81
      Height = 16
      Caption = 'Observa'#231#245'es'
    end
    object Label2: TLabel
      Left = 442
      Top = 72
      Width = 47
      Height = 16
      Caption = 'Horario'
    end
    object edtCod: TLabeledEdit
      Left = 16
      Top = 40
      Width = 64
      Height = 24
      EditLabel.Width = 45
      EditLabel.Height = 16
      EditLabel.Caption = 'C'#243'digo'
      TabOrder = 0
    end
    object edtEvento: TLabeledEdit
      Left = 88
      Top = 40
      Width = 400
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 86
      EditLabel.Height = 16
      EditLabel.Caption = 'Compromisso'
      TabOrder = 1
    end
    object edtLocal: TLabeledEdit
      Left = 16
      Top = 88
      Width = 337
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 35
      EditLabel.Height = 16
      EditLabel.Caption = 'Local'
      TabOrder = 2
    end
    object mmObs: TMemo
      Left = 16
      Top = 136
      Width = 472
      Height = 65
      TabOrder = 3
    end
    object mkeHora: TMaskEdit
      Left = 440
      Top = 88
      Width = 49
      Height = 24
      Color = 8454016
      EditMask = '!90:00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 4
      Text = '  :  '
    end
    object edtData: TLabeledEdit
      Left = 360
      Top = 88
      Width = 73
      Height = 24
      Color = 8454016
      EditLabel.Width = 29
      EditLabel.Height = 16
      EditLabel.Caption = 'Data'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clBlack
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Arial'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object btnOk: TBitBtn
    Left = 216
    Top = 248
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Caption = '&Ok'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
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
  object MediaPlayer1: TMediaPlayer
    Left = -40
    Top = 248
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 'C:\Arquivos de programas\MyCar\Padr'#227'o.wav'
    Visible = False
    TabOrder = 2
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 352
    Top = 248
  end
end
