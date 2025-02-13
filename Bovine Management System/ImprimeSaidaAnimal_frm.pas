unit ImprimeSaidaAnimal_frm;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Jpeg;

type
  TqrpImprimeSaidaAnimais = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel34: TQRLabel;
    qrlUsuario: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText33: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel24: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel35: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText27: TQRDBText;
    QRShape3: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText37: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel25: TQRLabel;
    qrlEntrada: TQRLabel;
    QRLabel41: TQRLabel;
    qrlDespesa: TQRLabel;
    QRLabel42: TQRLabel;
    qrlCusto: TQRLabel;
    QRShape4: TQRShape;
    QRLabel43: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrpImprimeSaidaAnimais: TqrpImprimeSaidaAnimais;

implementation

uses Carro_Comando_dm, SaidaAnimais_frm, DB, ADODB;

{$R *.DFM}

procedure TqrpImprimeSaidaAnimais.QuickRepStartPage(
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
       SQL.Add('Select * from saida_animais where sa_cod = '+QuotedStr(frmSaidaAnimais.edtCodSaida.Text)+'');
       Active := True;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    qrlEntrada.Caption := frmSaidaAnimais.edtArroba.Text;
    qrlDespesa.Caption := frmSaidaAnimais.edtAlimento.Text;
    qrlCusto.Caption := frmSaidaAnimais.edtCusto.Text;
end;

end.
