object frmRelatAbast: TfrmRelatAbast
  Left = 192
  Top = 114
  Width = 696
  Height = 480
  HorzScrollBar.Position = 114
  Caption = 'Relatorio de Abastecimento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrpRelatAbast: TQuickRep
    Left = -116
    Top = -5
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    ReportTitle = 'Carro Comando - Relat'#243'rio de Bordo [Abastecimentos]'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object TitleBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 352
        Top = 8
        Width = 357
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          931.333333333333500000
          21.166666666666670000
          944.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Relat'#243'rio de Bordo de Abastecimentos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
    end
    object QRShape9: TQRShape
      Left = 32
      Top = 368
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        973.666666666666900000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape8: TQRShape
      Left = 32
      Top = 336
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        889.000000000000000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape7: TQRShape
      Left = 32
      Top = 304
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        804.333333333333200000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape6: TQRShape
      Left = 32
      Top = 272
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        719.666666666666800000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape5: TQRShape
      Left = 32
      Top = 240
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        635.000000000000000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape4: TQRShape
      Left = 32
      Top = 208
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        550.333333333333400000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape39: TQRShape
      Left = 992
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        2624.666666666667000000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape38: TQRShape
      Left = 40
      Top = 72
      Width = 1049
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        105.833333333333300000
        190.500000000000000000
        2775.479166666667000000)
      Shape = qrsHorLine
    end
    object QRShape37: TQRShape
      Left = 704
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        1862.666666666667000000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape36: TQRShape
      Left = 600
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        1587.500000000000000000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape35: TQRShape
      Left = 520
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        1375.833333333333000000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape34: TQRShape
      Left = 320
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        846.666666666666600000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape33: TQRShape
      Left = 32
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        84.666666666666680000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape32: TQRShape
      Left = 136
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        359.833333333333400000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape3: TQRShape
      Left = 32
      Top = 176
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        465.666666666666700000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape25: TQRShape
      Left = 1080
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        2857.500000000000000000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape24: TQRShape
      Left = 32
      Top = 688
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1820.333333333333000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape23: TQRShape
      Left = 32
      Top = 720
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1905.000000000000000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape22: TQRShape
      Left = 32
      Top = 752
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1989.666666666667000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape20: TQRShape
      Left = 912
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        2413.000000000000000000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape2: TQRShape
      Left = 32
      Top = 144
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        381.000000000000000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape19: TQRShape
      Left = 808
      Top = 72
      Width = 9
      Height = 689
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1822.979166666667000000
        2137.833333333333000000
        190.500000000000000000
        23.812500000000000000)
      Shape = qrsVertLine
    end
    object QRShape18: TQRShape
      Left = 32
      Top = 656
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1735.666666666667000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape17: TQRShape
      Left = 32
      Top = 624
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1651.000000000000000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape16: TQRShape
      Left = 32
      Top = 592
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1566.333333333333000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape15: TQRShape
      Left = 32
      Top = 560
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1481.666666666667000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape14: TQRShape
      Left = 32
      Top = 528
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1397.000000000000000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape13: TQRShape
      Left = 32
      Top = 496
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1312.333333333333000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape12: TQRShape
      Left = 32
      Top = 464
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1227.666666666667000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape11: TQRShape
      Left = 32
      Top = 432
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1143.000000000000000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape10: TQRShape
      Left = 32
      Top = 400
      Width = 1057
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        84.666666666666680000
        1058.333333333333000000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object QRShape1: TQRShape
      Left = 32
      Top = 112
      Width = 1057
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        84.666666666666680000
        296.333333333333400000
        2796.645833333333000000)
      Shape = qrsHorLine
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 78
      Width = 1047
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.604166666666680000
        2770.187500000000000000)
      BandType = rbDetail
      object QRLabel2: TQRLabel
        Left = 16
        Top = 16
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          42.333333333333340000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Abast.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 160
        Top = 16
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          423.333333333333300000
          42.333333333333340000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Motorista'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 360
        Top = 16
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          42.333333333333340000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ve'#237'culo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 504
        Top = 16
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          42.333333333333340000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Placa'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 888
        Top = 16
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2349.500000000000000000
          42.333333333333340000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Km Inicial'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 976
        Top = 16
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2582.333333333333000000
          42.333333333333340000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Km Final'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 576
        Top = 16
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          42.333333333333340000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantidade (L)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 680
        Top = 16
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1799.166666666667000000
          42.333333333333340000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Unit. (L)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 784
        Top = 16
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2074.333333333333000000
          42.333333333333340000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Total (L)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
