unit Manutencao_qrp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrpManutencao = class(TQuickRep)
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
    qrlData: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrlTotal: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
  private

  public

  end;

var
  qrpManutencao: TqrpManutencao;

implementation

uses Carro_Comando_dm;

{$R *.DFM}

end.
