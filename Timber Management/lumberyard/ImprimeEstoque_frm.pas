unit ImprimeEstoque_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ADODB, Jpeg;

type
  TfrmImprimeEstoq = class(TForm)
    qrpEstoque: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimeEstoq: TfrmImprimeEstoq;

implementation

uses Carro_Comando_dm, Impressao_frm;

{$R *.dfm}

end.
