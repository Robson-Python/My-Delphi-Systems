unit ImprimeVenda_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, ADODB;

type
  TfrmImprimeVenda = class(TForm)
    qrpVenda: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape3: TQRShape;
    QRLabel23: TQRLabel;
    QRDBText18: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText24: TQRDBText;
    QRImage1: TQRImage;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRImage2: TQRImage;
    QRDBText25: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel26: TQRLabel;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel40: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText40: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimeVenda: TfrmImprimeVenda;

implementation

uses Carro_Comando_dm, Saida_frm;

{$R *.dfm}

end.
