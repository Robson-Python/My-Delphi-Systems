unit BuscaRegistro_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmBuscaRegistro = class(TForm)
    Label1: TLabel;
    btnAtivo: TButton;
    btnEncerrado: TButton;
    procedure btnAtivoClick(Sender: TObject);
    procedure btnEncerradoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaRegistro: TfrmBuscaRegistro;

implementation

uses Lavoura_frm, Carro_Comando_dm, ConsultaLavoura_frm;

{$R *.dfm}

procedure TfrmBuscaRegistro.btnAtivoClick(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from lavoura where l_plantacao = '+QuotedStr(frmLavoura.edtProduto.Text)+' and l_status = ''ATIVO''');
       Active := True;
       frmLavoura.edtCod.Text := FieldByName('l_cod').AsString;
       frmLavoura.dtpData.Date := FieldByName('l_dtinicio').AsDateTime;
       frmLavoura.dtpDataFinal.Date := FieldByName('l_dtfim').AsDateTime;
       frmLavoura.edtProduto.Text := FieldByName('l_plantacao').AsString;
       frmLavoura.edtQtd.Text := FieldByName('l_qtd').AsString;
       frmLavoura.edtValorGasto.Text := FieldByName('l_valor').AsString;
       frmLavoura.edtProducao.Text := FieldByName('l_finalidade').AsString;
       frmLavoura.edtQtdProducao.Text := FieldByName('l_qtdfinalidade').AsString;
       frmLavoura.edtCusto.Text := FieldByName('l_custokilo').AsString;
       frmLavoura.edtCusto.Text := FormatCurr('0.000', StrToCurr(frmLavoura.edtCusto.Text));
       frmLavoura.edtValorGasto.Text := FormatCurr('0.00', StrToCurr(frmLavoura.edtValorGasto.Text));
       frmLavoura.edtQtd.Text := FormatFloat('0.##',(StrToFloat(frmLavoura.edtQtd.Text)));
       frmLavoura.edtQtdProducao.Text := FormatFloat('0.##',(StrToFloat(frmLavoura.edtQtdProducao.Text)));
       If FieldByName('l_status').AsString = 'ATIVO' then
          frmLavoura.rdgSituacao.ItemIndex := 0
       else
          frmLavoura.rdgSituacao.ItemIndex := 1;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select il_cod ''C�digo Item'', il_produto ''Produto'', replace(format(il_vlunit,3), ".", ",") ''Valor Unit�rio'', il_qtd ''Quantidade'', replace(format(il_vltotal,2), ".", ",") ''Valor Total'' from itens_lavoura '+
          'where l_cod = '+QuotedStr(frmLavoura.edtCod.Text)+' order by il_produto');
          Active := True;
          frmLavoura.DBGrid1.DataSource.Enabled := True;
          frmLavoura.DBGrid1.Columns.Items[0].FieldName := FieldByName('C�digo Item').FieldName;
          frmLavoura.DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto').FieldName;
          frmLavoura.DBGrid1.Columns.Items[1].Width := 150;
          frmLavoura.DBGrid1.Columns.Items[2].FieldName := FieldByName('Valor Unit�rio').FieldName;
          frmLavoura.DBGrid1.Columns.Items[2].Width := 90;
          frmLavoura.DBGrid1.Columns.Items[3].FieldName := FieldByName('Quantidade').FieldName;
          frmLavoura.DBGrid1.Columns.Items[3].Width := 80;
          frmLavoura.DBGrid1.Columns.Items[4].FieldName := FieldByName('Valor Total').FieldName;
          frmLavoura.DBGrid1.Columns.Items[4].Width := 75;
      end;
      Close;
end;

procedure TfrmBuscaRegistro.btnEncerradoClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsultaLavoura, frmConsultaLavoura);
      frmConsultaLavoura.ShowModal;
    Finally
         frmConsultaLavoura.Free;
    end;
    Close;
end;

end.
