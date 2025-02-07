unit ImprimeConsultaGasto_frm;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Jpeg;

type
  TqrpConsultaGasto = class(TQuickRep)
    PageHeaderBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlDataIni: TQRLabel;
    QRLabel4: TQRLabel;
    qrlUsuario: TQRLabel;
    QRImage1: TQRImage;
    qrlDataFim: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    qrlabel: TQRLabel;
    qrlValorGeral: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrpConsultaGasto: TqrpConsultaGasto;

implementation

uses Carro_Comando_dm, DB, ConsultaGastos_frm;

{$R *.DFM}

procedure TqrpConsultaGasto.QuickRepStartPage(Sender: TCustomQuickRep);
//var fFoto : TStream;
//    Jpeg : TJPEGImage;
begin
//    With dmCarroComando.ADOQuery1 do begin
//       Active := False;
//       SQL.Clear;
//       SQL.Add('Select usuario, foto from registro where codigo = 1');
//       Active := True;
//       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
//       If fFoto.Size > 0 then begin
//          Jpeg := TJPEGImage.Create;
//          Jpeg.LoadFromStream(fFoto);
//          QRImage1.Picture.Assign(Jpeg);
//       end
//       else begin
//          QRImage1.Picture.Assign(nil);
//       end;
//       Jpeg.Free;
//       fFoto.Destroy;
//       qrlUsuario.Caption := FieldByName('usuario').AsString;
//       qrlValorGeral.Caption := frmCosultaGastos.edtValorTotal.Text;
//       frmCosultaGastos.btnExecutarClick(Sender);
//    end;
end;

end.
