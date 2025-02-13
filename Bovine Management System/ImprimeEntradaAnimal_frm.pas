unit ImprimeEntradaAnimal_frm;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Jpeg;

type
  TqrpImprimeEntradaAnimal = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRShape3: TQRShape;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRImage1: TQRImage;
    QRLabel34: TQRLabel;
    qrlUsuario: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel36: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText33: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel35: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrpImprimeEntradaAnimal: TqrpImprimeEntradaAnimal;

implementation

uses Carro_Comando_dm, DB, EntradaAnimais_frm;

{$R *.DFM}

procedure TqrpImprimeEntradaAnimal.QuickRepStartPage(
  Sender: TCustomQuickRep);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario, foto from registro where codigo = 1');
       Active := True;
       qrlUsuario.Caption := FieldByName('usuario').AsString;
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
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from entrada_animais where ea_cod = '+QuotedStr(frmEntradaAnimais.edtCodEntrada.Text)+'');
       Active := True;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    QRLabel40.Caption := frmEntradaAnimais.edtLote.Text;
end;

end.
