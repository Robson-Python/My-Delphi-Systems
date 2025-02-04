unit PagarProduto_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPagarProduto = class(TForm)
    GroupBox1: TGroupBox;
    edtSaldo: TLabeledEdit;
    edtDinheiro: TLabeledEdit;
    edtTroco: TLabeledEdit;
    edtSaldoAtual: TLabeledEdit;
    btnOk: TBitBtn;
    edtValor: TLabeledEdit;
    edtProduto: TLabeledEdit;
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
  frmPagarProduto: TfrmPagarProduto;

implementation

uses VendaProduto_frm, Locadora_dm, DB;

{$R *.dfm}

function fConvertSaldo() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtSaldo.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtSaldo.Text := valor;
end;

procedure TfrmPagarProduto.FormShow(Sender: TObject);
begin
    edtSaldo.Text := frmVendaProduto.edtSaldo.Text;
    edtDinheiro.Text := '0,00';
    edtTroco.Text := '0,00';
    edtSaldoAtual.Text := '0,00';
    edtValor.Text := '0,00';
    edtProduto.Text := '0';
    edtValor.SetFocus;
end;

procedure TfrmPagarProduto.edtDinheiroExit(Sender: TObject);
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
       SQL.Add('select count (*) from itens_venda where iv_pagamento = ''NÃO'' and v_cod = '+QuotedStr(frmVendaProduto.edtCod.Text)+'');
       Active := True;
       edtProduto.Text := FieldByName('count (*)').AsString;
    end;
end;

procedure TfrmPagarProduto.edtValorExit(Sender: TObject);
begin
    edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
end;

procedure TfrmPagarProduto.btnOkClick(Sender: TObject);
var cCount, vCod : Integer;
begin
    cCount := 0;
    While cCount < StrToInt(edtProduto.Text) do begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from itens_venda where iv_pagamento = ''NÃO'' and v_cod = '+QuotedStr(frmVendaProduto.edtCod.Text)+' order by iv_cod');
          Active := True;
          vCod := FieldByName('iv_cod').AsInteger;
          Active := False;
          SQL.Clear;
          SQL.Add('Update itens_venda set iv_pagamento = ''SIM'' where iv_cod = '+IntToStr(vCod)+'');
          ExecSQL;
       end;
       cCount := cCount+1;
    end;
    frmVendaProduto.edtSaldo.Text := edtSaldoAtual.Text;
    fConvertSaldo;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update vendas set V_SALDO = '+QuotedStr(frmVendaProduto.edtSaldo.Text)+' where v_cod = '+QuotedStr(frmVendaProduto.edtCod.Text)+'');
       ExecSQL;
       fConvertSaldo;
    end;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select itens_venda.*, produtos.p_nome from itens_venda, produtos where v_cod = '+QuotedStr(frmVendaProduto.edtCod.Text)+' and itens_venda.p_cod = produtos.p_cod order by itens_venda.iv_cod desc');
       Active := True;
       frmVendaProduto.DBGrid1.DataSource.Enabled := True;
       Open;
       (FieldByName('iv_vltotal') as TNumericField).DisplayFormat := ',0.00';
       frmVendaProduto.DBGrid1.Columns.Items[0].FieldName := FieldByName('iv_cod').FieldName;
       frmVendaProduto.DBGrid1.Columns.Items[1].FieldName := FieldByName('iv_data').FieldName;
       frmVendaProduto.DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
       frmVendaProduto.DBGrid1.Columns.Items[3].FieldName := FieldByName('iv_qtd').FieldName;
       frmVendaProduto.DBGrid1.Columns.Items[4].FieldName := FieldByName('iv_vltotal').FieldName;
       frmVendaProduto.DBGrid1.Columns.Items[5].FieldName := FieldByName('iv_pagamento').FieldName;
    end;
    frmVendaProduto.GroupBox1.SetFocus;
    Application.MessageBox('Pagamento concluído com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
    Close;
end;

end.
