unit ImprimeResumoAlimento_frm;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Jpeg;

type
  TqrpImprimeResumoAlimento = class(TQuickRep)
    PageHeaderBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlDataIni: TQRLabel;
    QRLabel4: TQRLabel;
    qrlUsuario: TQRLabel;
    QRImage1: TQRImage;
    qrlDataFim: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRDBText9: TQRDBText;
    SummaryBand1: TQRBand;
    qrlabel: TQRLabel;
    qrlValorGeral: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrpImprimeResumoAlimento: TqrpImprimeResumoAlimento;

implementation

uses Carro_Comando_dm, DB, ConsultaEntProd_frm;

{$R *.DFM}

procedure TqrpImprimeResumoAlimento.QuickRepStartPage(
  Sender: TCustomQuickRep);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario, foto from registro where codigo = 1');
       Active := True;
       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          QRImage1.Picture.Assign(Jpeg);
       end
       else begin
          QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       qrlUsuario.Caption := FieldByName('usuario').AsString;
       qrlValorGeral.Caption := frmConsultaEntProd.edtVlTotal.Text;
       frmConsultaEntProd.btnExecutarClick(Sender);
    end;
end;

end.
