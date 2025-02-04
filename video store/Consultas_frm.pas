unit Consultas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls;

type
  TfrmConsultas = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbxConsultar: TComboBox;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    btnConsultar: TBitBtn;
    btnFechar: TBitBtn;
    Shape3: TShape;
    Panel4: TPanel;
    Shape2: TShape;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    edtTotal: TLabeledEdit;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure cbxConsultarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses Locadora_dm, ZDataset, DB;

{$R *.dfm}

procedure TfrmConsultas.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    DateTimePicker1.Date := Date;
end;

procedure TfrmConsultas.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsultas.btnConsultarClick(Sender: TObject);
begin
    edtTotal.Text := '0,00';
    If cbxConsultar.Text = 'CLIENTES EM DÉBITO' then begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(l_saldo) from locacoes');
          Active := True;
          edtTotal.Text := FieldByName('sum(l_saldo)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select L.c_cod ''Código'', C.c_nome ''Cliente'', L.l_saldo ''Valor R$'' from clientes C, locacoes L where C.c_cod = L.c_cod and L.l_saldo <> 0 order by C.c_nome');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].Width := 50;
          DBGrid1.Columns.Items[1].Width := 500;
          DBGrid1.Columns.Items[2].Width := 65;
       end;
    end;
    If cbxConsultar.Text = 'FILMES NÃO DEVOLVIDOS' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select C.c_nome ''Cliente'', F.f_nome ''Filme'' from clientes C, filmes F, itens_locacao IL, locacoes L where C.c_cod = L.c_cod and L.L_COD = IL.l_cod and F.f_cod = IL.f_cod and IL.il_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and IL.il_devolucao = ''NÃO'' order by C.c_nome, F.f_nome');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          DBGrid1.Columns.Items[0].Width := 320;
          DBGrid1.Columns.Items[1].Width := 320;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If cbxConsultar.Text = 'LOCAÇÕES' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(il_valor) from itens_locacao where il_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+'');
          Active := True;
          edtTotal.Text := FieldByName('sum(il_valor)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select C.c_nome ''Cliente'', F.f_nome ''Filme'', IL.il_valor ''Valor R$'' from clientes C, filmes F, itens_locacao IL, locacoes L where C.c_cod = L.c_cod and L.L_COD = IL.l_cod and F.f_cod = IL.f_cod and IL.il_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' order by C.c_nome, F.f_nome');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].Width := 320;
          DBGrid1.Columns.Items[1].Width := 320;
          DBGrid1.Columns.Items[2].Width := 65;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If cbxConsultar.Text = 'LOCAÇÕES À PRAZO' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(il_valor) from itens_locacao where il_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and il_pagamento = ''NÃO''');
          Active := True;
          edtTotal.Text := FieldByName('sum(il_valor)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select C.c_nome ''Cliente'', F.f_nome ''Filme'', IL.il_valor ''Valor R$'' from clientes C, filmes F, itens_locacao IL, locacoes L where C.c_cod = L.c_cod and L.L_COD = IL.l_cod and F.f_cod = IL.f_cod and IL.il_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and IL.il_pagamento = ''NÃO'' order by C.c_nome, F.f_nome');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].Width := 320;
          DBGrid1.Columns.Items[1].Width := 320;
          DBGrid1.Columns.Items[2].Width := 65;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If cbxConsultar.Text = 'LOCAÇÕES À VISTA' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(il_valor) from itens_locacao where il_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and il_pagamento = ''SIM''');
          Active := True;
          edtTotal.Text := FieldByName('sum(il_valor)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select C.c_nome ''Cliente'', F.f_nome ''Filme'', IL.il_valor ''Valor R$'' from clientes C, filmes F, itens_locacao IL, locacoes L where C.c_cod = L.c_cod and L.L_COD = IL.l_cod and F.f_cod = IL.f_cod and IL.il_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and IL.il_pagamento = ''SIM'' order by C.c_nome, F.f_nome');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].Width := 320;
          DBGrid1.Columns.Items[1].Width := 320;
          DBGrid1.Columns.Items[2].Width := 65;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If cbxConsultar.Text = 'VENDAS PRODUTOS' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(iv_vltotal) from itens_venda where iv_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+'');
          Active := True;
          edtTotal.Text := FieldByName('sum(iv_vltotal)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select P.p_nome ''Produto'', sum(IV.iv_qtd) ''Quant.'', IV.iv_valor ''Valor R$'', sum(IV.iv_vltotal) ''Valor Total R$'' from produtos P, itens_venda IV where IV.iv_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and P.p_cod = IV.p_cod group by P.p_nome');
          Active := True;
          If dmLocadora.zqLocadora.RecordCount <> 0 then begin
             DBGrid1.DataSource.Enabled := True;
             Open;
             (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
             (FieldByName('Valor Total R$') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].Width := 450;
             DBGrid1.Columns.Items[1].Width := 50;
             DBGrid1.Columns.Items[2].Width := 60;
             DBGrid1.Columns.Items[3].Width := 95;
          end
          else begin
             DBGrid1.DataSource.Enabled := False;
          end;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If cbxConsultar.Text = 'VENDAS À PRAZO' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(iv_vltotal) from itens_venda where iv_pagamento = ''NÃO''');
          Active := True;
          edtTotal.Text := FieldByName('sum(iv_vltotal)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select IV.iv_data ''Data'', C.c_nome ''Cliente'', P.p_nome ''Produto'', IV.iv_qtd ''Quant.'', IV.iv_vltotal ''Valor R$'' '
          +'from clientes C, vendas V, produtos P, itens_venda IV where V.c_cod = C.c_cod and V.v_cod = IV.v_cod and P.p_cod = IV.p_cod and IV.iv_pagamento = ''NÃO'' order by IV.iv_data, C.c_nome, P.p_nome');
          Active := True;
          If dmLocadora.zqLocadora.RecordCount <> 0 then begin
             DBGrid1.DataSource.Enabled := True;
             Open;
             (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].Width := 70;
             DBGrid1.Columns.Items[1].Width := 270;
             DBGrid1.Columns.Items[2].Width := 270;
             DBGrid1.Columns.Items[3].Width := 50;
             DBGrid1.Columns.Items[4].Width := 60;
          end
          else begin
             DBGrid1.DataSource.Enabled := False;
          end;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If cbxConsultar.Text = 'LOCAÇÕES MENSAIS' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(il_valor) from itens_locacao where il_data  between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker1.Date+30))+'');
          Active := True;
          edtTotal.Text := FieldByName('sum(il_valor)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select il_data ''Data'', sum(il_valor) ''Valor R$'' from itens_locacao where il_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker1.Date+30))+' group by il_data');
          Active := True;
          If dmLocadora.zqLocadora.RecordCount <> 0 then begin
             DBGrid1.DataSource.Enabled := True;
             Open;
             (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].Width := 80;
             DBGrid1.Columns.Items[1].Width := 65;
          end
          else begin
             DBGrid1.DataSource.Enabled := False;
          end;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If cbxConsultar.Text = 'VENDAS MENSAIS' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(iv_vltotal) from itens_venda where iv_data  between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker1.Date+30))+'');
          Active := True;
          edtTotal.Text := FieldByName('sum(iv_vltotal)').AsString;
          If edtTotal.Text <> '' then begin
             edtTotal.Text := FormatCurr(',0.00', StrToCurr(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select iv_data ''Data'', sum(iv_vltotal) ''Valor R$'' from itens_venda where iv_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker1.Date+30))+' group by iv_data');
          Active := True;
          If dmLocadora.zqLocadora.RecordCount <> 0 then begin
             DBGrid1.DataSource.Enabled := True;
             Open;
             (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].Width := 80;
             DBGrid1.Columns.Items[1].Width := 65;
          end
          else begin
             DBGrid1.DataSource.Enabled := False;
          end;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmConsultas.cbxConsultarChange(Sender: TObject);
begin
    If cbxConsultar.Text = 'CLIENTES EM DÉBITO' then begin
       DateTimePicker1.Enabled := False;
    end
    else begin
        If cbxConsultar.Text = 'VENDAS À PRAZO' then begin
            DateTimePicker1.Enabled := False;
        end
        else begin
           DateTimePicker1.Enabled := True;
        end;
    end;
end;

end.
