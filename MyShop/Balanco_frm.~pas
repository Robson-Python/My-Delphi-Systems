unit Balanco_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ComCtrls;

type
  TfrmBalanco = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtTotalVendas: TEdit;
    edtVendasRecebidas: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edtTotalServico: TEdit;
    edtServicoRecebido: TEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    edtContaPagar: TEdit;
    edtContaReceber: TEdit;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    edtVendaLiquido: TEdit;
    edtServicoLiquido: TEdit;
    edtContaPaga: TEdit;
    edtLucro: TEdit;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    cbxMes: TComboBox;
    speAno: TSpinEdit;
    Label14: TLabel;
    chbAnual: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtPorcentagem: TEdit;
    Label17: TLabel;
    edtCredito: TEdit;
    Label18: TLabel;
    GroupBox7: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edtCaixaEntrada: TEdit;
    edtCaixaSaida: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtContaRecebida: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    edtEntrada: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    edtSaida: TEdit;
    Label27: TLabel;
    edtDebito: TEdit;
    Label28: TLabel;
    btnConsultar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure cbxMesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chbAnualClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanco: TfrmBalanco;

implementation

uses Enterprise_dm, ZDataset, Math;

{$R *.dfm}

function Ano(Data:TDateTime): String;
{Retorna uma data por extenso}
var
//  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := '01';
  Meses [2] := '02';
  Meses [3] := '03';
  Meses [4] := '04';
  Meses [5] := '05';
  Meses [6] := '06';
  Meses [7] := '07';
  Meses [8] := '08';
  Meses [9] := '09';
  Meses [10]:= '10';
  Meses [11]:= '11';
  Meses [12]:= '12';
  DecodeDate (Data, Ano, Mes, Dia);
//  NoDia := DayOfWeek (Data);
  Result := IntToStr(Ano);
end;

procedure TfrmBalanco.btnConsultarClick(Sender: TObject);
var vVenda, vServico, vCReceber, vEntrada, vCredito,
    vCPagar, vSaida, vDebito, vLucro : Double;
begin
    If chbAnual.Checked = False then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(iv_vltotal) from itens_venda, vendas where v_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and vendas.v_cod = itens_venda.v_cod');
          Active := True;
          edtTotalVendas.Text := FieldByName('sum(iv_vltotal)').AsString;
          If edtTotalVendas.Text = '' then begin
             edtTotalVendas.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(pg_vlpago) from pagamentos where pg_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+'');
          Active := True;
          edtVendasRecebidas.Text := FieldByName('sum(pg_vlpago)').AsString;
          edtVendaLiquido.Text := edtVendasRecebidas.Text;
          If edtVendasRecebidas.Text = ''then begin
             edtVendasRecebidas.Text := '0,00';
             edtVendaLiquido.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(os_vltotal) from ordem_servico where os_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+'');
          Active := True;
          edtTotalServico.Text := FieldByName('sum(os_vltotal)').AsString;
          If edtTotalServico.Text = '' then begin
             edtTotalServico.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(os_vltotal) from ordem_servico where os_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and os_status = ''SIM''');
          Active := True;
          edtServicoRecebido.Text := FieldByName('sum(os_vltotal)').AsString;
          edtServicoLiquido.Text := edtServicoRecebido.Text;
          If edtServicoRecebido.Text = '' then begin
             edtServicoRecebido.Text := '0,00';
             edtServicoLiquido.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(ct_vltotal) from contas where ct_periodo = '+QuotedStr(cbxMes.Text)+' and ct_tipo = ''P'' and ct_status = ''S''');
          Active := True;
          edtContaPagar.Text := FieldByName('sum(ct_vltotal)').AsString;
          edtContaPaga.Text := edtContaPagar.Text;
          If edtContaPagar.Text = '' then begin
             edtContaPagar.Text := '0,00';
             edtContaPaga.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(ct_vltotal) from contas where ct_periodo = '+QuotedStr(cbxMes.Text)+' and ct_tipo = ''R'' and ct_status = ''S''');
          Active := True;
          edtContaReceber.Text := FieldByName('sum(ct_vltotal)').AsString;
          edtContaRecebida.Text := edtContaReceber.Text;
          If edtContaReceber.Text = '' then begin
             edtContaReceber.Text := '0,00';
             edtContaRecebida.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(cx_valor) from caixa where cx_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and cx_situacao = ''ENTRADA'' and cx_operacao = ''M''');
          Active := True;
          edtCaixaEntrada.Text := FieldByName('sum(cx_valor)').AsString;
          edtEntrada.Text := edtCaixaEntrada.Text;
          If edtCaixaEntrada.Text = '' then begin
             edtCaixaEntrada.Text := '0,00';
             edtEntrada.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(cx_valor) from caixa where cx_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and cx_situacao = ''SAÍDA'' and cx_operacao = ''M''');
          Active := True;
          edtCaixaSaida.Text := FieldByName('sum(cx_valor)').AsString;
          edtSaida.Text := edtCaixaSaida.Text;
          If edtCaixaSaida.Text = '' then begin
             edtCaixaSaida.Text := '0,00';
             edtSaida.Text := '0,00';
          end;
          vVenda := StrToFloat(edtVendaLiquido.Text);
          vServico := StrToFloat(edtServicoLiquido.Text);
          vCReceber := StrToFloat(edtContaRecebida.Text);
          vEntrada := StrToFloat(edtEntrada.Text);
          edtCredito.Text := FloatToStr(vVenda+vServico+vCReceber+vEntrada);
          vCPagar := StrToFloat(edtContaPaga.Text);
          vSaida := StrToFloat(edtSaida.Text);
          edtDebito.Text := FloatToStr(vCPagar+vSaida);
          vCredito := StrToFloat(edtCredito.Text);
          vDebito := StrToFloat(edtDebito.Text);
          edtLucro.Text := FloatToStr(vCredito-vDebito);
          vLucro := StrToFloat(edtLucro.Text);
          If vLucro <> 0 then begin
             edtPorcentagem.Text := FloatToStr((vLucro/vCredito)*100);
          end
          else begin
             edtPorcentagem.Text := '0';
          end;
          If StrToFloat(edtPorcentagem.Text) >= 50 then begin
             edtPorcentagem.Font.Color := clGreen;
          end
          else begin
             edtPorcentagem.Font.Color := clRed;
          end;
       end;
    end
    else begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(iv_vltotal) from itens_venda, vendas where v_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and vendas.v_cod = itens_venda.v_cod');
          Active := True;
          edtTotalVendas.Text := FieldByName('sum(iv_vltotal)').AsString;
          If edtTotalVendas.Text = '' then begin
             edtTotalVendas.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(pg_vlpago) from pagamentos where pg_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+'');
          Active := True;
          edtVendasRecebidas.Text := FieldByName('sum(pg_vlpago)').AsString;
          edtVendaLiquido.Text := edtVendasRecebidas.Text;
          If edtVendasRecebidas.Text = ''then begin
             edtVendasRecebidas.Text := '0,00';
             edtVendaLiquido.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(os_vltotal) from ordem_servico where os_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+'');
          Active := True;
          edtTotalServico.Text := FieldByName('sum(os_vltotal)').AsString;
          If edtTotalServico.Text = '' then begin
             edtTotalServico.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(os_vltotal) from ordem_servico where os_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and os_status = ''SIM''');
          Active := True;
          edtServicoRecebido.Text := FieldByName('sum(os_vltotal)').AsString;
          edtServicoLiquido.Text := edtServicoRecebido.Text;
          If edtServicoRecebido.Text = '' then begin
             edtServicoRecebido.Text := '0,00';
             edtServicoLiquido.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(ct_vltotal) from contas where ct_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and ct_tipo = ''P'' and ct_status = ''S''');
          Active := True;
          edtContaPagar.Text := FieldByName('sum(ct_vltotal)').AsString;
          edtContaPaga.Text := edtContaPagar.Text;
          If edtContaPagar.Text = '' then begin
             edtContaPagar.Text := '0,00';
             edtContaPaga.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(ct_vltotal) from contas where ct_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and ct_tipo = ''R'' and ct_status = ''S''');
          Active := True;
          edtContaReceber.Text := FieldByName('sum(ct_vltotal)').AsString;
          edtContaRecebida.Text := edtContaReceber.Text;
          If edtContaReceber.Text = '' then begin
             edtContaReceber.Text := '0,00';
             edtContaRecebida.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(cx_valor) from caixa where cx_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and cx_situacao = ''ENTRADA'' and cx_operacao = ''M''');
          Active := True;
          edtCaixaEntrada.Text := FieldByName('sum(cx_valor)').AsString;
          edtEntrada.Text := edtCaixaEntrada.Text;
          If edtCaixaEntrada.Text = '' then begin
             edtCaixaEntrada.Text := '0,00';
             edtEntrada.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(cx_valor) from caixa where cx_data between '+QuotedStr(Edit1.Text)+' and '+QuotedStr(Edit2.Text)+' and cx_situacao = ''SAÍDA'' and cx_operacao = ''M''');
          Active := True;
          edtCaixaSaida.Text := FieldByName('sum(cx_valor)').AsString;
          edtSaida.Text := edtCaixaSaida.Text;
          If edtCaixaSaida.Text = '' then begin
             edtCaixaSaida.Text := '0,00';
             edtSaida.Text := '0,00';
          end;
          vVenda := StrToFloat(edtVendaLiquido.Text);
          vServico := StrToFloat(edtServicoLiquido.Text);
          vCReceber := StrToFloat(edtContaRecebida.Text);
          vEntrada := StrToFloat(edtEntrada.Text);
          edtCredito.Text := FloatToStr(vVenda+vServico+vCReceber+vEntrada);
          vCPagar := StrToFloat(edtContaPaga.Text);
          vSaida := StrToFloat(edtSaida.Text);
          edtDebito.Text := FloatToStr(vCPagar+vSaida);
          vCredito := StrToFloat(edtCredito.Text);
          vDebito := StrToFloat(edtDebito.Text);
          edtLucro.Text := FloatToStr(vCredito-vDebito);
          vLucro := StrToFloat(edtLucro.Text);
          If vLucro <> 0 then begin
             edtPorcentagem.Text := FloatToStr((vLucro/vCredito)*100);
          end
          else begin
             edtPorcentagem.Text := '0';
          end;
          If StrToFloat(edtPorcentagem.Text) >= 50 then begin
             edtPorcentagem.Font.Color := clGreen;
          end
          else begin
             edtPorcentagem.Font.Color := clRed;
          end;
       end;
    end;
    If edtTotalVendas.Text <> '' then begin
       edtTotalVendas.Text := FormatCurr(',0.00', StrToCurr(edtTotalVendas.Text));
    end
    else begin
       edtTotalVendas.Text := '0,00';
    end;
    If edtVendasRecebidas.Text <> '' then begin
       edtVendasRecebidas.Text := FormatCurr(',0.00', StrToCurr(edtVendasRecebidas.Text));
       edtVendaLiquido.Text := FormatCurr(',0.00', StrToCurr(edtVendaLiquido.Text));
    end
    else begin
       edtVendasRecebidas.Text := '0,00';
       edtVendaLiquido.Text := '0,00';
    end;
    If edtTotalServico.Text <> '' then begin
       edtTotalServico.Text := FormatCurr(',0.00', StrToCurr(edtTotalServico.Text));
    end
    else begin
       edtTotalServico.Text := '0,00';
    end;
    If edtServicoRecebido.Text <> '' then begin
       edtServicoRecebido.Text := FormatCurr(',0.00', StrToCurr(edtServicoRecebido.Text));
       edtServicoLiquido.Text := FormatCurr(',0.00', StrToCurr(edtServicoLiquido.Text));
    end
    else begin
       edtServicoRecebido.Text := '0,00';
       edtServicoLiquido.Text := '0,00';
    end;
    If edtContaPagar.Text <> '' then begin
       edtContaPagar.Text := FormatCurr(',0.00', StrToCurr(edtContaPagar.Text));
       edtContaPaga.Text := FormatCurr(',0.00', StrToCurr(edtContaPaga.Text));
    end
    else begin
       edtContaPagar.Text := '0,00';
       edtContaPaga.Text := '0,00';
    end;
    If edtContaReceber.Text <> '' then begin
       edtContaReceber.Text := FormatCurr(',0.00', StrToCurr(edtContaReceber.Text));
       edtContaRecebida.Text := FormatCurr(',0.00', StrToCurr(edtContaRecebida.Text));
    end
    else begin
       edtContaReceber.Text := '0,00';
       edtContaRecebida.Text := '0,00';
    end;
    If edtCaixaSaida.Text <> '' then begin
       edtCaixaSaida.Text := FormatCurr(',0.00', StrToCurr(edtCaixaSaida.Text));
       edtSaida.Text := FormatCurr(',0.00', StrToCurr(edtSaida.Text));
    end
    else begin
       edtCaixaSaida.Text := '0,00';
       edtSaida.Text := '0,00';
    end;
    If edtCaixaEntrada.Text <> '' then begin
       edtCaixaEntrada.Text := FormatCurr(',0.00', StrToCurr(edtCaixaEntrada.Text));
       edtEntrada.Text := FormatCurr(',0.00', StrToCurr(edtEntrada.Text));
    end
    else begin
       edtCaixaEntrada.Text := '0,00';
       edtEntrada.Text := '0,00';
    end;
    If edtLucro.Text <> '' then begin
       edtLucro.Text := FormatCurr(',0.00', StrToCurr(edtLucro.Text));
    end
    else begin
       edtLucro.Text := '0,00';
    end;
    If edtPorcentagem.Text <> '' then begin
       edtPorcentagem.Text := FormatFloat('0.##',(StrToFloat(edtPorcentagem.Text)));
    end
    else begin
       edtPorcentagem.Text := '0';
    end;
    If edtCredito.Text <> '' then begin
       edtCredito.Text := FormatCurr(',0.00', StrToCurr(edtCredito.Text));
    end
    else begin
       edtCredito.Text := '0,00';
    end;
    If edtDebito.Text <> '' then begin
       edtDebito.Text := FormatCurr(',0.00', StrToCurr(edtDebito.Text));
    end
    else begin
       edtDebito.Text := '0,00';
    end;
end;

procedure TfrmBalanco.cbxMesChange(Sender: TObject);
begin
    If cbxMes.Text = 'JANEIRO' then begin
       Edit1.Text := speAno.Text+'-01-01';
       Edit2.Text := speAno.Text+'-01-31';
    end;
    If cbxMes.Text = 'FEVEREIRO' then begin
       Edit1.Text := speAno.Text+'-02-01';
       Edit2.Text := speAno.Text+'-02-29';
    end;
    If cbxMes.Text = 'MARÇO' then begin
       Edit1.Text := speAno.Text+'-03-01';
       Edit2.Text := speAno.Text+'-03-31';
    end;
    If cbxMes.Text = 'ABRIL' then begin
       Edit1.Text := speAno.Text+'-04-01';
       Edit2.Text := speAno.Text+'-04-30';
    end;
    If cbxMes.Text = 'MAIO' then begin
       Edit1.Text := speAno.Text+'-05-01';
       Edit2.Text := speAno.Text+'-05-31';
    end;
    If cbxMes.Text = 'JUNHO' then begin
       Edit1.Text := speAno.Text+'-06-01';
       Edit2.Text := speAno.Text+'-06-30';
    end;
    If cbxMes.Text = 'JULHO' then begin
       Edit1.Text := speAno.Text+'-07-01';
       Edit2.Text := speAno.Text+'-07-31';
    end;
    If cbxMes.Text = 'AGOSTO' then begin
       Edit1.Text := speAno.Text+'-08-31';
       Edit2.Text := speAno.Text+'-08-31';
    end;
    If cbxMes.Text = 'SETEMBRO' then begin
       Edit1.Text := speAno.Text+'-09-01';
       Edit2.Text := speAno.Text+'-09-30';
    end;
    If cbxMes.Text = 'OUTUBRO' then begin
       Edit1.Text := speAno.Text+'-10-01';
       Edit2.Text := speAno.Text+'-10-31';
    end;
    If cbxMes.Text = 'NOVEMBRO' then begin
       Edit1.Text := speAno.Text+'-11-01';
       Edit2.Text := speAno.Text+'-11-30';
    end;
    If cbxMes.Text = 'DEZEMBRO' then begin
       Edit1.Text := speAno.Text+'-12-01';
       Edit2.Text := speAno.Text+'-12-31';
    end;
end;

procedure TfrmBalanco.FormActivate(Sender: TObject);
begin
    speAno.Text := Ano(Date);
    cbxMes.SetFocus;
end;

procedure TfrmBalanco.chbAnualClick(Sender: TObject);
begin
    If chbAnual.Checked = True then begin
       Edit1.Text := speAno.Text+'-01-01';
       Edit2.Text := speAno.Text+'-12-31';
    end
    else begin
       Edit1.Clear;
       Edit2.Clear;
       cbxMes.Text := '';
    end;
end;

procedure TfrmBalanco.btnLimparClick(Sender: TObject);
begin
    speAno.Text := Ano(Date);
    cbxMes.Text := '';
    chbAnual.Checked := False;
    Edit1.Clear; Edit2.Clear;
    edtTotalVendas.Text := '0,00'; edtVendasRecebidas.Text := '0,00'; edtVendaLiquido.Text := '0,00'; edtTotalServico.Text := '0,00'; edtServicoRecebido.Text := '0,00'; edtServicoLiquido.Text := '0,00';
    edtContaPagar.Text := '0,00'; edtCaixaSaida.Text := '0,00'; edtContaRecebida.Text := '0,00'; edtLucro.Text := '0,00'; edtPorcentagem.Text := '0'; edtEntrada.Text := '0,00'; edtCredito.Text := '0,00';
    edtContaPaga.Text := '0,00'; edtSaida.Text := '0,00'; edtDebito.Text := '0,00'; edtContaReceber.Text := '0,00'; edtCaixaEntrada.Text := '0,00';
end;

procedure TfrmBalanco.btnSairClick(Sender: TObject);
begin
    Close;
end;

end.
