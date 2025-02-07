unit EntradaResumo_qrp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, Jpeg, DateUtils;

type
  TqrpEntradaResumo = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel34: TQRLabel;
    qrlUsuario: TQRLabel;
    QRDBText34: TQRDBText;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel37: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrpEntradaResumo: TqrpEntradaResumo;

implementation

uses Carro_Comando_dm, Impressao_frm;

{$R *.DFM}

function AnoConfinamento: String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select c_ano from confinamento where c_status = ''ATIVO''');
       Active := True;
       AnoConfinamento := FieldByName('c_ano').AsString;
    end;
end;

function Controle() : String;
begin
    If frmImpressao.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmImpressao.rgpControle.ItemIndex = -1 then
       Controle := '';
end;

procedure TqrpEntradaResumo.QuickRepStartPage(Sender: TCustomQuickRep);
var fFoto : TStream;
    Jpeg : TJPEGImage;
    vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
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
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select ea_cod ''cod'', ea_data ''data'', ea_qtdboi+ea_qtdvaca+ea_qtdnovilha ''cabecas'', ea_pesoboi+ea_pesovaca+ea_pesonovilha ''peso vivo'', ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha ''peso @'', '+
       '(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha)/(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha) ''media @'', (ea_vltotalboi+ea_vltotalvaca+ea_vltotalnovilha)/(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha) ''valor @'', '+
       'ea_vltotalboi+ea_vltotalvaca+ea_vltotalnovilha ''valor total @'' from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+' order by ea_data');
       Active := True;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

end.
