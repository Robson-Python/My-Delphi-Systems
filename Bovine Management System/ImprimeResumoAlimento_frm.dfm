�
 TQRPIMPRIMERESUMOALIMENTO 0�(  TPF0TqrpImprimeResumoAlimentoqrpImprimeResumoAlimentoLeft Top WidthHeightcFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetdmCarroComando.ADOQuery1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OnStartPageQuickRepStartPageOptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeA4Page.Values       �@      ��
@       �@      @�
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinAutoPrintIfEmpty	ReportTitleOmega - Entradas Por Produto
SnapToGrid	UnitsMMZoomd TQRBandPageHeaderBand2Left&Top&Width�HeightkFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values XUUUU��@ �����v�	@ BandTyperbPageHeader TQRLabelQRLabel1Left� Top0WidthPHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values �����j�@ XUUUUu�@       �@      @�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption$   Relatório de Entradas Por AlimentosColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBoldfsUnderline 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2Left� TopPWidth5HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk������@      ��@ �������@ �����:�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
   Período: ColorclWhiteTransparentWordWrap	FontSize
  TQRLabel
qrlDataIniLeft0TopPWidth7HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk������@ PUUUU�@ �������@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
qrlDataIniColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel4LeftxTopPWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk������@ XUUUU��@ �������@�\UUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption   � ColorclWhiteTransparentWordWrap	FontSize
  TQRLabel
qrlUsuarioLeftHTopWidthyHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ `UUUU��@ XUUUUU�@ ������@ 	AlignmenttaCenterAlignToBandAutoSize	AutoStretchCaption
qrlUsuarioColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRImageQRImage1LeftTopWidthiHeightQFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      P�@�\UUUUU�@�\UUUUU�@      �@ Stretch	  TQRLabel
qrlDataFimLeft�TopPWidth@HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk������@ �����J�	@ �������@ XUUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
qrlDataFimColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel3Left�TopPWidth?HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUUe�	@ �������@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionQRLabel3ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
   TQRSubDetailQRSubDetail1Left&Top� Width�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values XUUUUU�@ �����v�	@ MasterOwnerDataSetdmCarroComando.ADOQuery1PrintBeforePrintIfEmpty	 	TQRDBText	QRDBText2LeftTopWidth4HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ �����*�@ XUUUUU�@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetdmCarroComando.ADOQuery1	DataFieldp_nomeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4LeftTopWidthGHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUU=�@ XUUUUU�@ �����ڻ@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetdmCarroComando.ADOQuery1	DataField>replace(format(sum(replace(EP.ep_qtd, ".", ",")),0), ",", ".")Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold Mask#,0
ParentFontTransparentWordWrap	FontSize
  TQRShapeQRShape1Left TopWidth�Height	Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@                 �@ �����t�	@ Shape
qrsHorLine  	TQRDBText	QRDBText9Left�TopWidthIHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUU��	@ XUUUUU�@ XUUUU%�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetdmCarroComando.ADOQuery1	DataFieldBreplace(format(sum(replace(Ep.ep_vltotal, ",", ".")),2), ".", ",")Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3LeftHTopWidthIHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUU%�	@ XUUUUU�@ XUUUU%�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetdmCarroComando.ADOQuery1	DataField>replace(format(sum(EP.ep_vltotal)/sum(EP.ep_qtd),3), ".", ",")Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold Mask#0.000
ParentFontTransparentWordWrap	FontSize
   TQRBandSummaryBand1Left&Top� Width�Height(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values �������@ �����v�	@ BandType	rbSummary TQRLabelqrlabelLeft�TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@      ��	@ XUUUUU�@      x�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionValor Total Geral R$:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelqrlValorGeralLeft0TopWidth_HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUU5�	@ XUUUUU�@ �����Z�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchCaptionqrlValorGeralColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandPageFooterBand1Left&Top� Width�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values XUUUUU�@ �����v�	@ BandTyperbPageFooter 
TQRSysData
QRSysData1LeftXTopWidth.HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk������@ �������@�\UUUUU�@ �����j�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	ColorclWhiteDataqrsPageNumberTransparentFontSize
  
TQRSysData
QRSysData2LeftXTopWidthDHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk������@      p�	@�\UUUUU�@ ������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	ColorclWhiteDataqrsDateTimeTransparentFontSize
   TQRBandDetailBand1Left&Top� Width�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values XUUUUU�@ �����v�	@ BandTyperbDetail TQRLabelQRLabel6Left TopWidth4HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUUU�@ XUUUUU�@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionAlimentoColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel7LeftTopWidthXHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ ������@ XUUUUU�@ `UUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionQuantidade (K)ColorclWhiteTransparentWordWrap	FontSize
  TQRShapeQRShape2Left TopWidth�Height	Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@                 �@ �����t�	@ 	Pen.WidthShape
qrsHorLine  TQRLabel	QRLabel12Left�TopWidthSHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ �����*�	@ XUUUUU�@ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionValor Total R$ColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel5LeftHTopWidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUU%�	@ XUUUUU�@       �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption   Valor Médio R$ColorclWhiteTransparentWordWrap	FontSize
    