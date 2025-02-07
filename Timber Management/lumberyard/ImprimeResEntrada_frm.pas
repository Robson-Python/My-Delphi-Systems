unit ImprimeResEntrada_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmImprResEntrada = class(TForm)
    qrpResEntrada: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprResEntrada: TfrmImprResEntrada;

implementation

uses Impressao_frm;

{$R *.dfm}

end.
