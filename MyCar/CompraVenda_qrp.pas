unit CompraVenda_qrp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrpCompraVenda = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    qrlNome: TQRLabel;
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
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    qrlVeiculo: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
  private

  public

  end;

var
  qrpCompraVenda: TqrpCompraVenda;

implementation

uses Carro_Comando_dm;

{$R *.DFM}

end.
