unit Contas_qrp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TqrpContas = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlMes: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    qrlAno: TQRLabel;
    qrlTipo: TQRLabel;
    QRLabel11: TQRLabel;
    qrlSituacao: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrlTotal: TQRLabel;
    QRImage1: TQRImage;
    QRDBText16: TQRDBText;
    ZQuery1: TZQuery;
    QRShape3: TQRShape;
  private

  public

  end;

var
  qrpContas: TqrpContas;

implementation

uses Enterprise_dm;

{$R *.DFM}

end.
