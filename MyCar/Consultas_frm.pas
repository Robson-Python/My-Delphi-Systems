unit Consultas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ComCtrls;

type
  TfrmConsultas = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dtpInic: TDateTimePicker;
    dtpFin: TDateTimePicker;
    lblInicio: TLabel;
    lblFinal: TLabel;
    lblConsulta: TLabel;
    cbxConsulta: TComboBox;
    Shape1: TShape;
    Panel4: TPanel;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    CheckBox1: TCheckBox;
    Shape2: TShape;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses Carro_Comando_dm, Principal_frm;

{$R *.dfm}

procedure TfrmConsultas.btnSairClick(Sender: TObject);
begin
    dmCarroComando.zqCarro.SQL.Clear;
    Close;
end;

procedure TfrmConsultas.FormShow(Sender: TObject);
begin
    dmCarroComando.zqCarro.SQL.Clear;
    dtpInic.Date := Date - 15;
    dtpFin.Date := Date + 15;
end;

procedure TfrmConsultas.btnExecutarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If cbxConsulta.ItemIndex = 0 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros. placa, carros.modelo, AVG(combustivel.comb_med) from carros, combustivel, gerencial where carros.placa = gerencial.placa and gerencial.ger_cod = combustivel.ger_cod and gerencial.dt_reg between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' group by carros.modelo');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].Title.Caption := 'MConsumo Médio Geral';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros.placa, carros.modelo, AVG(combustivel.comb_med) from carros, combustivel, gerencial where carros.placa = gerencial.placa and gerencial.ger_cod = combustivel.ger_cod group by carros.modelo');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].Title.Caption := 'Consumo Médio Geral';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 1 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros.placa, carros.modelo, SUM(combustivel.comb_qtd) from carros, combustivel, gerencial where carros.placa = gerencial.placa and gerencial.ger_cod = combustivel.ger_cod and gerencial.dt_reg between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' group by carros.modelo');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].Title.Caption := 'Consumo Total (litros)';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros.placa, carros.modelo, SUM(combustivel.comb_qtd) from carros, combustivel, gerencial where carros.placa = gerencial.placa and gerencial.ger_cod = combustivel.ger_cod group by carros.modelo');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].Title.Caption := 'Consumo Total (litros)';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 2 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros.placa, carros.modelo, motoristas.nome, SUM(combustivel.comb_qtd) from carros, combustivel, motoristas, gerencial where gerencial.dt_reg between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and gerencial.ger_cod = combustivel.ger_cod group by carros.modelo, motoristas.nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].Title.Caption := 'Consumo Total (litros)';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('select ca.placa, ca.modelo, mt.nome, SUM(comb.comb_qtd) from carros ca, combustivel comb, motoristas mt, gerencial ge where ca.placa = ge.placa and mt.cpf = ge.cpf and ge.ger_cod = comb.ger_cod group by ca.modelo, mt.nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].Title.Caption := 'Consumo Total (litros)';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 3 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select t.ct_cod, c.modelo, c.placa, t.ct_nf, f.fn_nome, t.ct_ref, t.ct_valor, t.ct_venc, t.ct_sit from carros c, fornecedores f, contas t where t.ct_venc <= '+QuotedStr(DateToStr(Date))+' and t.ct_sit = ''NÃO PAGO'' and c.placa = t.placa and f.cnpj = t.cnpj order by c.modelo, f.fn_nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('ct_cod').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Código';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[3].FieldName := FieldByName('ct_nf').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Nº Nota Fiscal';
             DBGrid1.Columns.Items[4].FieldName := FieldByName('fn_nome').FieldName;
             DBGrid1.Columns.Items[4].Title.Caption := 'Fornecedor';
             DBGrid1.Columns.Items[5].FieldName := FieldByName('ct_ref').FieldName;
             DBGrid1.Columns.Items[5].Title.Caption := 'Referência';
             DBGrid1.Columns.Items[6].FieldName := FieldByName('ct_valor').FieldName;
             DBGrid1.Columns.Items[6].Title.Caption := 'Valor';
             DBGrid1.Columns.Items[7].FieldName := FieldByName('ct_venc').FieldName;
             DBGrid1.Columns.Items[7].Title.Caption := 'Vencimento';
             DBGrid1.Columns.Items[8].FieldName := FieldByName('ct_sit').FieldName;
             DBGrid1.Columns.Items[8].Title.Caption := 'Situação';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select t.ct_cod, c.modelo, c.placa, t.ct_nf, f.fn_nome, t.ct_ref, t.ct_valor, t.ct_venc, t.ct_sit from carros c, fornecedores f, contas t where t.ct_venc <= '+QuotedStr(DateToStr(Date))+' and t.ct_sit = ''NÃO PAGO'' and c.placa = t.placa and f.cnpj = t.cnpj and t.ct_venc between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' order by c.modelo, f.fn_nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('ct_cod').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Código';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Placa          ';
             DBGrid1.Columns.Items[3].FieldName := FieldByName('ct_nf').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Nº Nota Fiscal';
             DBGrid1.Columns.Items[4].FieldName := FieldByName('fn_nome').FieldName;
             DBGrid1.Columns.Items[4].Title.Caption := 'Fornecedor';
             DBGrid1.Columns.Items[5].FieldName := FieldByName('ct_ref').FieldName;
             DBGrid1.Columns.Items[5].Title.Caption := 'Referência';
             DBGrid1.Columns.Items[6].FieldName := FieldByName('ct_valor').FieldName;
             DBGrid1.Columns.Items[6].Title.Caption := 'Valor';
             DBGrid1.Columns.Items[7].FieldName := FieldByName('ct_venc').FieldName;
             DBGrid1.Columns.Items[7].Title.Caption := 'Vencimento';
             DBGrid1.Columns.Items[8].FieldName := FieldByName('ct_sit').FieldName;
             DBGrid1.Columns.Items[8].Title.Caption := 'Situação';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 4 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select carros.placa, carros.modelo, motoristas.nome, sum(viagens.viag_km_perc) from carros, motoristas, viagens WHERE carros.placa = viagens.placa and motoristas.cpf = viagens.cpf GROUP BY carros. modelo, motoristas.nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].Title.Caption := 'Km Percorrida';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select carros.placa, carros.modelo, motoristas.nome, sum(viagens.viag_km_perc) from carros, motoristas, viagens where carros.placa = viagens.placa and motoristas.cpf = viagens.cpf and viagens.dt_viag between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' GROUP BY carros. modelo, motoristas.nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].Title.Caption := 'Km Percorrida';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 5 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select carros.placa, carros.modelo, motoristas.nome,COUNT(*) FROM carros, motoristas, viagens where carros.placa = viagens.placa and motoristas.cpf = viagens.cpf GROUP BY carros.modelo, motoristas.nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].Title.Caption := 'Utilização do veículo';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select carros.placa, carros.modelo, motoristas.nome,COUNT(*) FROM carros, motoristas, viagens WHERE carros.placa = viagens.placa and motoristas.cpf = viagens.cpf and viagens.dt_viag between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' GROUP BY carros.modelo, motoristas.nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].Title.Caption := 'Utilização do veículo';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 6 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select c.placa, c.modelo, m.nome, t.nome_categ, p.dt_compr, p.pec_model, p.stats from carros c, motoristas m, categoria t, gerencial g, pecas_servicos p where c.placa = g.placa and m.cpf = g.cpf and t.cod_categ = g.cod_categ and g.ger_cod = p.ger_cod');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa         ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].FieldName := FieldByName('nome_categ').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Categoria';
             DBGrid1.Columns.Items[4].FieldName := FieldByName('dt_compr').FieldName;
             DBGrid1.Columns.Items[4].Title.Caption := 'Data da Compra';
             DBGrid1.Columns.Items[5].FieldName := FieldByName('pec_model').FieldName;
             DBGrid1.Columns.Items[5].Title.Caption := 'Modelo da Peça';
             DBGrid1.Columns.Items[6].FieldName := FieldByName('stats').FieldName;
             DBGrid1.Columns.Items[6].Title.Caption := 'Status';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('select c.placa, c.modelo, m.nome, t.nome_categ, p.dt_compr, p.pec_model, p.stats from carros c, motoristas m, categoria t, gerencial g, pecas_servicos p where p.dt_compr between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' and c.placa = g.placa and m.cpf = g.cpf and t.cod_categ = g.cod_categ and g.ger_cod = p.ger_cod');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa         ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].FieldName := FieldByName('nome_categ').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Categoria';
             DBGrid1.Columns.Items[4].FieldName := FieldByName('dt_compr').FieldName;
             DBGrid1.Columns.Items[4].Title.Caption := 'Data da Compra';
             DBGrid1.Columns.Items[5].FieldName := FieldByName('pec_model').FieldName;
             DBGrid1.Columns.Items[5].Title.Caption := 'Modelo da Peça';
             DBGrid1.Columns.Items[6].FieldName := FieldByName('stats').FieldName;
             DBGrid1.Columns.Items[6].Title.Caption := 'Status';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 7 then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c.modelo, SUM(u.vl_tot) from carros c, motoristas m, categoria t, gerencial g, pecas_servicos p, custos u where c.placa = g.placa and m.cpf = g.cpf and t.cod_categ = g.cod_categ and g.ger_cod = p.ger_cod and p.pec_cod = u.pec_cod group by c.modelo');
          Active := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('modelo').FieldName;
          DBGrid1.Columns.Items[0].Title.Caption := 'Veículo';
          DBGrid1.Columns.Items[1].Title.Caption := 'Valor Total de Gastos com Peças';
          ShortDateFormat := 'dd/mm/yyyy';
       end;
    end;
    If cbxConsulta.ItemIndex = 8 then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c.modelo, t.nome_categ, SUM(u.vl_tot) FROM carros c, categoria t, gerencial g, pecas_servicos p, custos u where c.placa = g.placa and t.cod_categ = g.cod_categ and g.ger_cod = p.ger_cod and p.pec_cod = u.pec_cod group by c.modelo, t.nome_categ');
          Active := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('modelo').FieldName;
          DBGrid1.Columns.Items[0].Title.Caption := 'Veículo';
          DBGrid1.Columns.Items[1].FieldName := FieldByName('nome_categ').FieldName;
          DBGrid1.Columns.Items[1].Title.Caption := 'Categoria (Peças e Serviços)';
          DBGrid1.Columns.Items[2].Title.Caption := 'Valor Total Gasto por Peça ou Serviço';
          ShortDateFormat := 'dd/mm/yyyy';
       end;
    end;
    If cbxConsulta.ItemIndex = 9 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros.placa, carros.modelo, SUM(combustivel.comb_vl_tot) from carros, combustivel, gerencial where carros.placa = gerencial.placa and gerencial.ger_cod = combustivel.ger_cod and gerencial.dt_reg between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' group by carros.modelo');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].Title.Caption := 'Valor Gasto com Combustivel';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros.placa, carros.modelo, SUM(combustivel.comb_vl_tot) from carros, combustivel, gerencial where carros.placa = gerencial.placa and gerencial.ger_cod = combustivel.ger_cod group by carros.modelo');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo';
             DBGrid1.Columns.Items[2].Title.Caption := 'Valor Gasto com Combustivel';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 10 then begin
       With dmCarroComando.zqCarro do begin
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select carros .placa, carros.modelo, motoristas.nome, gerencial.dt_reg, SUM(combustivel.comb_vl_tot) from carros, combustivel,motoristas, gerencial where gerencial.dt_reg between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' and carros.placa = gerencial.placa and gerencial.ger_cod = combustivel.ger_cod and motoristas.cpf = gerencial.cpf group by combustivel.comb_vl_tot');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo            ';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].FieldName := FieldByName('dt_reg').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Data do Abastacimento';
             DBGrid1.Columns.Items[4].Title.Caption := 'Valor Gasto por Abastecimento';
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('select c.placa, c.modelo, m.nome, g.dt_reg, SUM(b.comb_vl_tot) from carros c, combustivel b, motoristas m, gerencial g where c.placa = g.placa and m.cpf = g.cpf and g.ger_cod = b.ger_cod group by b.comb_vl_tot');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Placa        ';
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Veículo            ';
             DBGrid1.Columns.Items[2].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Motorista';
             DBGrid1.Columns.Items[3].FieldName := FieldByName('dt_reg').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Data do Abastacimento';
             DBGrid1.Columns.Items[4].Title.Caption := 'Valor Gasto por Abastecimento';
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

end.
