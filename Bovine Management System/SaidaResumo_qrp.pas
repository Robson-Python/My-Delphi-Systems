unit SaidaResumo_qrp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, Jpeg, DateUtils;

type
  TqrpSaidaResumo = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel34: TQRLabel;
    qrlUsuario: TQRLabel;
    QRDBText34: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel37: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText33: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRExpr1: TQRExpr;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel9: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrpSaidaResumo: TqrpSaidaResumo;

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

procedure TqrpSaidaResumo.QuickRepStartPage(Sender: TCustomQuickRep);
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
       SQL.Add('select sa_cod ''cod'', sa_data ''data'', sa_qtdboi+sa_qtdvaca+sa_qtdnovilha ''cabecas'', sa_pesoboi+sa_pesovaca+sa_pesonovilha ''peso vivo'', '+
       '(sa_pesototalboi+sa_pesototalvaca+sa_pesototalnovilha)/(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha) ''valor @'', '+
       'sa_pesofrigoboi+sa_pesofrigovaca+sa_pesofrigonovilha ''frigo'', sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha ''peso @'', '+
       '(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha)/(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha) ''media @'', (sa_pesofrigoboi+sa_pesofrigovaca+sa_pesofrigonovilha)/(sa_pesoboi+sa_pesovaca+sa_pesonovilha)*100 ''rend'', '+
       'sa_pesototalboi+sa_pesototalvaca+sa_pesototalnovilha ''valor total @'' from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+' order by sa_data');
       Active := True;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

end.
