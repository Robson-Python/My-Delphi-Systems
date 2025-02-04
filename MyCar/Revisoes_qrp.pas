unit Revisoes_qrp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrpRevisao = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel20: TQRLabel;
    qrlVeiculo: TQRLabel;
    qrlCodVeiculo: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
  private

  public

  end;

var
  qrpRevisao: TqrpRevisao;

implementation

uses Carro_Comando_dm;

{$R *.DFM}

end.
