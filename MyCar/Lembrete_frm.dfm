object frmLembrete: TfrmLembrete
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Carro Comando - Lembrete de Manuten'#231#245'es'
  ClientHeight = 304
  ClientWidth = 568
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
  object Shape1: TShape
    Left = -8
    Top = -8
    Width = 577
    Height = 41
    Brush.Color = 13998884
  end
  object Shape2: TShape
    Left = -1
    Top = 264
    Width = 570
    Height = 42
    Brush.Color = 13998884
  end
  object Panel1: TPanel
    Left = -8
    Top = -8
    Width = 577
    Height = 41
    BevelOuter = bvLowered
    Caption = 
      'Os seguinte(s) servi'#231'o(s) para o(s) seguinte(s) ve'#237'culo(s) vence' +
      '(m) hoje: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 24
    Width = 569
    Height = 249
    DataSource = dmCarroComando.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        Title.Caption = 'Servi'#231'o'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Placa'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Ve'#237'culo'
        Width = 209
        Visible = True
      end
      item
        Color = clRed
        Expanded = False
        Title.Caption = 'Vencimento'
        Width = 81
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = -1
    Top = 265
    Width = 570
    Height = 41
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 25
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
    object btnOk: TBitBtn
      Left = 360
      Top = 8
      Width = 81
      Height = 25
      Cursor = crHandPoint
      Hint = 'Fecha a tela'
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnOkClick
      Glyph.Data = {
        D6050000424DD605000000000000360000002800000017000000140000000100
        180000000000A005000000000000000000000000000000000000000000000000
        00000000000000000000000001017D1C1CBC1C1CBC0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000001717C9090AE8090AE80A0B66
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000C0BE502
        00FE0000FE040575000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000908EA0200FE0000FE00008500000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000A09690201FB0000FE0000FE0E0EDE00008B0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000001017D0000FE0000FE0000FE0C0CE2
        0000910000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000001007E1515CD090BE509
        0BE50304F60505F11516CC000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000001110580000000000001515
        CD0707ED1F1FB30000000A0BE50202FA1011D700000000000000000000000000
        00000000000000000000000000000000000000000000000000000000001919BF
        0A0AE60A0CE30303F70304F60000000000001C1CBC0405F70707ED01027A0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000001717C90203F50201FB0304F60C0CE20000000000000000000707ED
        0304F40000910000000000000000000000000000000000000000000000000000
        000000000000000000000000001E1EB80A0BE50304F60A0BE51A1AC000000000
        00000000000C0CE20303F700009A000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000002525A70000
        000000000000000000000000001C1DBB0A0CE30C0DDF00008800000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000001617CD0707ED1515
        CD01017D00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000304F60201FB0C0BE30000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000A0BE50304F60505F100008A000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001E1EB80A0BE50202FA05
        05F11213D3000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        002020B40001FD0202FA0708EC00000000000000000013125400000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000002020B40A0BE50001FD0A0CE30F0FDD1515CD2321
        B000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000001E1EB81010DA0302FC
        0201FB1010DA2724A90000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000704F30505F3000000000000000000000000000000}
    end
  end
  object MediaPlayer1: TMediaPlayer
    Left = 142
    Top = 232
    Width = 253
    Height = 30
    FileName = 
      'C:\Arquivos de Programas\RS Softwares\Carro Comando\Sons\Buzina.' +
      'wav'
    Visible = False
    TabOrder = 3
  end
end
