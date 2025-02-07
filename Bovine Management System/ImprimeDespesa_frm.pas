unit ImprimeDespesa_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmImprimeDespesa = class(TForm)
    qrpDespesa: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlUsuario: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape4: TQRShape;
    QRDBText15: TQRDBText;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimeDespesa: TfrmImprimeDespesa;

implementation

uses Carro_Comando_dm;

{$R *.dfm}

end.
