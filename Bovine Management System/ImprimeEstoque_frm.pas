unit ImprimeEstoque_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Jpeg;

type
  TfrmImprimeEstoque = class(TForm)
    qrpEstoque: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    qrlUsuario: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRShape1: TQRShape;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrtCod: TQRDBText;
    qrtProd: TQRDBText;
    qrtQtd: TQRDBText;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    procedure qrpEstoqueStartPage(Sender: TCustomQuickRep);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimeEstoque: TfrmImprimeEstoque;

implementation

uses Carro_Comando_dm, DB, Impressao_frm;

{$R *.dfm}

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

procedure TfrmImprimeEstoque.qrpEstoqueStartPage(Sender: TCustomQuickRep);
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
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select P.p_cod ''Código'', P.p_nome ''Produto'', P.p_qtd ''Quantidade em Estoque'', sum(EP.ep_vltotal)/sum(EP.ep_qtd) ''Valor Unitário'', (sum(EP.ep_vltotal)/sum(EP.ep_qtd))*P.p_qtd ''Valor Total'' '+
       'from produtos P, entrada_produtos EP where P.p_cod = EP.p_cod and EP.ep_ano = '+QuotedStr(vAno)+' and EP.ep_controle = '+QuotedStr(vControle)+' group by P.p_nome');
       Active := True;
    end;
end;

end.
