unit Pagamentos_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPagamentos = class(TForm)
    GroupBox1: TGroupBox;
    edtSaldo: TLabeledEdit;
    edtDinheiro: TLabeledEdit;
    edtTroco: TLabeledEdit;
    edtSaldoAtual: TLabeledEdit;
    btnOk: TBitBtn;
    edtValor: TLabeledEdit;
    edtFilmes: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure edtDinheiroExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagamentos: TfrmPagamentos;

implementation

uses Locacoes_frm, Locadora_dm, DateUtils, ZDataset, ZAbstractRODataset,
  DB;

{$R *.dfm}

function fConvertVlLocacao() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLocacoes.edtVlTotal.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLocacoes.edtVlTotal.Text := valor;
end;

procedure TfrmPagamentos.FormShow(Sender: TObject);
begin
    edtSaldo.Text := frmLocacoes.edtVlTotal.Text;
    edtDinheiro.Text := '0,00';
    edtTroco.Text := '0,00';
    edtSaldoAtual.Text := '0,00';
    edtValor.Text := '0,00';
    edtFilmes.Text := '0';
    edtValor.SetFocus;
end;

procedure TfrmPagamentos.edtDinheiroExit(Sender: TObject);
var vValor, vDinheiro, vSaldo : Double;
begin
    vValor := StrToFloat(edtValor.Text);
    vDinheiro := StrToFloat(edtDinheiro.Text);
    vSaldo := StrToFloat(edtSaldo.Text);
    edtTroco.Text := FloatToStr(vDinheiro-vValor);
    edtSaldoAtual.Text := FloatToStr(vSaldo-vValor);
    edtDinheiro.Text := FormatCurr('0.00', StrToCurr(edtDinheiro.Text));
    edtTroco.Text := FormatCurr('0.00', StrToCurr(edtTroco.Text));
    edtSaldoAtual.Text := FormatCurr('0.00', StrToCurr(edtSaldoAtual.Text));
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select count (*) from itens_locacao where il_pagamento = ''NÃO'' and l_cod = '+QuotedStr(frmLocacoes.edtCod.Text)+'');
       Active := True;
       edtFilmes.Text := FieldByName('count (*)').AsString;
    end;
end;

procedure TfrmPagamentos.edtValorExit(Sender: TObject);
begin
    edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
end;

procedure TfrmPagamentos.btnOkClick(Sender: TObject);
var cCount, vCod : Integer;
begin
    cCount := 0;
    While cCount < StrToInt(edtFilmes.Text) do begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from itens_locacao where il_pagamento = ''NÃO'' and l_cod = '+QuotedStr(frmLocacoes.edtCod.Text)+' order by il_cod');
          Active := True;
          vCod := FieldByName('il_cod').AsInteger;
          Active := False;
          SQL.Clear;
          SQL.Add('Update itens_locacao set il_pagamento = ''SIM'' where il_cod = '+IntToStr(vCod)+'');
          ExecSQL;
       end;
       cCount := cCount+1;
    end;
    frmLocacoes.edtVlTotal.Text := edtSaldoAtual.Text;
    fConvertVlLocacao;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update locacoes set L_SALDO = '+QuotedStr(frmLocacoes.edtVlTotal.Text)+' where l_cod = '+QuotedStr(frmLocacoes.edtCod.Text)+'');
       ExecSQL;
       fConvertVlLocacao;
    end;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(frmLocacoes.edtCod.Text)+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
       Active := True;
       frmLocacoes.DBGrid1.DataSource.Enabled := True;
       Open;
       (FieldByName('il_valor') as TNumericField).DisplayFormat := ',0.00';
       frmLocacoes.DBGrid1.Columns.Items[0].FieldName := FieldByName('il_cod').FieldName;
       frmLocacoes.DBGrid1.Columns.Items[1].FieldName := FieldByName('il_data').FieldName;
       frmLocacoes.DBGrid1.Columns.Items[2].FieldName := FieldByName('f_cod').FieldName;
       frmLocacoes.DBGrid1.Columns.Items[3].FieldName := FieldByName('f_nome').FieldName;
       frmLocacoes.DBGrid1.Columns.Items[4].FieldName := FieldByName('il_valor').FieldName;
       frmLocacoes.DBGrid1.Columns.Items[5].FieldName := FieldByName('il_devolucao').FieldName;
       frmLocacoes.DBGrid1.Columns.Items[6].FieldName := FieldByName('il_pagamento').FieldName;
    end;
    frmLocacoes.GroupBox1.SetFocus;
    Application.MessageBox('Pagamento concluído com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
    Close;
end;

end.
