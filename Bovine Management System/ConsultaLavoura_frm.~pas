unit ConsultaLavoura_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls;

type
  TfrmConsultaLavoura = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    Panel4: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    edtValorTotal: TLabeledEdit;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    procedure btnExecutarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaLavoura: TfrmConsultaLavoura;

implementation

uses Carro_Comando_dm, Lavoura_frm;

{$R *.dfm}

procedure TfrmConsultaLavoura.btnExecutarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioGroup1.ItemIndex = 1 then begin
       If CheckBox1.Checked = False then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(l_valor) ''Valor'' from lavoura where l_status = ''ENCERRADO''');
             Active := True;
             If FieldByName('Valor').AsFloat <> 0 then begin
                edtValorTotal.Text := FieldByName('Valor').AsString;
                edtValorTotal.Text := FormatCurr(',0.00', StrToCurr(edtValorTotal.Text));
              end
              else begin
                 edtValorTotal.Text := '0,00';
              end;
             Active := False;
             SQL.Clear;
             SQL.Add('Select l_cod ''Código'', l_plantacao ''Produto Plantado'', l_dtinicio ''Data Inicio'', l_dtfim ''Data Final'', l_qtd ''Qtd. Utilizada'', replace(format(l_valor,2), ".", ",") '+
             '''Valor Gasto'', l_finalidade ''Finalidade'', l_qtdfinalidade ''Qtd. Produzida'', replace(format(l_custokilo,3), ".", ",") ''Valor Custo'', l_status ''Situação'' from lavoura where l_status = ''ENCERRADO'' order by l_dtinicio, l_plantacao');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('Código').FieldName;
             DBGrid1.Columns.Items[0].Width := 50;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto Plantado').FieldName;
             DBGrid1.Columns.Items[1].Width := 200;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('Data Inicio').FieldName;
             DBGrid1.Columns.Items[2].Width := 70;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('Data Final').FieldName;
             DBGrid1.Columns.Items[3].Width := 70;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('Qtd. Utilizada').FieldName;
             DBGrid1.Columns.Items[4].Width := 95;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('Valor Gasto').FieldName;
             DBGrid1.Columns.Items[5].Width := 80;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('Finalidade').FieldName;
             DBGrid1.Columns.Items[6].Width := 200;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('Qtd. Produzida').FieldName;
             DBGrid1.Columns.Items[7].Width := 100;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('Valor Custo').FieldName;
             DBGrid1.Columns.Items[8].Width := 80;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('Situação').FieldName;
             DBGrid1.Columns.Items[9].Width := 100;
          end;
       end;
    end;
    If CheckBox1.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select sum(l_valor) ''Valor'' from lavoura where l_status = ''ENCERRADO'' and l_dtinicio between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
          Active := True;
          If FieldByName('Valor').AsFloat <> 0 then begin
             edtValorTotal.Text := FieldByName('Valor').AsString;
             edtValorTotal.Text := FormatCurr(',0.00', StrToCurr(edtValorTotal.Text));
          end
          else begin
             edtValorTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('Select l_cod ''Código'', l_plantacao ''Produto Plantado'', l_dtinicio ''Data Inicio'', l_dtfim ''Data Final'', l_qtd ''Qtd. Utilizada'', replace(format(l_valor,2), ".", ",") ''Valor Gasto'', l_finalidade ''Finalidade'', l_qtdfinalidade ''Qtd. Produzida'', '+
          'replace(format(l_custokilo,3), ".", ",") ''Valor Custo'', l_status ''Situação'' from lavoura where l_status = ''ENCERRADO'' and l_dtinicio between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by l_dtinicio, l_plantacao');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('Código').FieldName;
          DBGrid1.Columns.Items[0].Width := 50;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto Plantado').FieldName;
          DBGrid1.Columns.Items[1].Width := 200;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('Data Inicio').FieldName;
          DBGrid1.Columns.Items[2].Width := 70;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('Data Final').FieldName;
          DBGrid1.Columns.Items[3].Width := 70;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('Qtd. Utilizada').FieldName;
          DBGrid1.Columns.Items[4].Width := 95;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('Valor Gasto').FieldName;
          DBGrid1.Columns.Items[5].Width := 80;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('Finalidade').FieldName;
          DBGrid1.Columns.Items[6].Width := 200;
          DBGrid1.Columns.Items[7].FieldName := FieldByName('Qtd. Produzida').FieldName;
          DBGrid1.Columns.Items[7].Width := 100;
          DBGrid1.Columns.Items[8].FieldName := FieldByName('Valor Custo').FieldName;
          DBGrid1.Columns.Items[8].Width := 80;
          DBGrid1.Columns.Items[9].FieldName := FieldByName('Situação').FieldName;
          DBGrid1.Columns.Items[9].Width := 100;
       end;
    end;
    If RadioGroup1.ItemIndex = 0 then begin
       If CheckBox1.Checked = False then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(l_valor) ''Valor'' from lavoura where l_status = ''ATIVO''');
             Active := True;
             If FieldByName('Valor').AsFloat <> 0 then begin
                edtValorTotal.Text := FieldByName('Valor').AsString;
                edtValorTotal.Text := FormatCurr(',0.00', StrToCurr(edtValorTotal.Text));
              end
              else begin
                 edtValorTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('Select l_cod ''Código'', l_plantacao ''Produto Plantado'', l_dtinicio ''Data Inicio'', l_dtfim ''Data Final'', l_qtd ''Qtd. Utilizada'', replace(format(l_valor,2), ".", ",") '+
             '''Valor Gasto'', l_finalidade ''Finalidade'', l_qtdfinalidade ''Qtd. Produzida'', replace(format(l_custokilo,3), ".", ",") ''Valor Custo'', l_status ''Situação'' from lavoura where l_status = ''ATIVO'' order by l_dtinicio, l_plantacao');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('Código').FieldName;
             DBGrid1.Columns.Items[0].Width := 50;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto Plantado').FieldName;
             DBGrid1.Columns.Items[1].Width := 200;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('Data Inicio').FieldName;
             DBGrid1.Columns.Items[2].Width := 70;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('Data Final').FieldName;
             DBGrid1.Columns.Items[3].Width := 70;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('Qtd. Utilizada').FieldName;
             DBGrid1.Columns.Items[4].Width := 95;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('Valor Gasto').FieldName;
             DBGrid1.Columns.Items[5].Width := 80;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('Finalidade').FieldName;
             DBGrid1.Columns.Items[6].Width := 200;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('Qtd. Produzida').FieldName;
             DBGrid1.Columns.Items[7].Width := 100;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('Valor Custo').FieldName;
             DBGrid1.Columns.Items[8].Width := 80;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('Situação').FieldName;
             DBGrid1.Columns.Items[9].Width := 100;
          end;
       end;
       If CheckBox1.Checked = True then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(l_valor) ''Valor'' from lavoura where l_status = ''ATIVO'' and l_dtinicio between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
             Active := True;
             If FieldByName('Valor').AsFloat <> 0 then begin
                edtValorTotal.Text := FieldByName('Valor').AsString;
                edtValorTotal.Text := FormatCurr(',0.00', StrToCurr(edtValorTotal.Text));
              end
              else begin
                 edtValorTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('Select l_cod ''Código'', l_plantacao ''Produto Plantado'', l_dtinicio ''Data Inicio'', l_dtfim ''Data Final'', l_qtd ''Qtd. Utilizada'', replace(format(l_valor,2), ".", ",") ''Valor Gasto'', l_finalidade ''Finalidade'', l_qtdfinalidade ''Qtd. Produzida'', '+
             'replace(format(l_custokilo,3), ".", ",") ''Valor Custo'', l_status ''Situação'' from lavoura where l_status = ''ATIVO'' and l_dtinicio between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by l_dtinicio, l_plantacao');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('Código').FieldName;
             DBGrid1.Columns.Items[0].Width := 50;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto Plantado').FieldName;
             DBGrid1.Columns.Items[1].Width := 200;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('Data Inicio').FieldName;
             DBGrid1.Columns.Items[2].Width := 70;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('Data Final').FieldName;
             DBGrid1.Columns.Items[3].Width := 70;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('Qtd. Utilizada').FieldName;
             DBGrid1.Columns.Items[4].Width := 95;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('Valor Gasto').FieldName;
             DBGrid1.Columns.Items[5].Width := 80;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('Finalidade').FieldName;
             DBGrid1.Columns.Items[6].Width := 200;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('Qtd. Produzida').FieldName;
             DBGrid1.Columns.Items[7].Width := 100;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('Valor Custo').FieldName;
             DBGrid1.Columns.Items[8].Width := 80;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('Situação').FieldName;
             DBGrid1.Columns.Items[9].Width := 100;
          end;
       end;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmConsultaLavoura.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmConsultaLavoura.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If odd(dmCarroComando.ADOQuery1.RecNo) then begin
       DBGrid1.Canvas.Font.Color:= clBlack;
       DBGrid1.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid1.Canvas.Font.Color:= clBlack;
       DBGrid1.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

procedure TfrmConsultaLavoura.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    edtValorTotal.Text := '0,00';
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmConsultaLavoura.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from lavoura where l_cod = '+QuotedStr(Edit1.Text)+'');
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
       frmLavoura.GroupBox2.Enabled := True;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select il_cod ''Código Item'', il_produto ''Produto'', replace(format(il_vlunit,3), ".", ",") ''Valor Unitário'', il_qtd ''Quantidade'', replace(format(il_vltotal,2), ".", ",") ''Valor Total'' from itens_lavoura '+
          'where l_cod = '+QuotedStr(Edit1.Text)+' order by il_produto');
          Active := True;
          frmLavoura.DBGrid1.DataSource.Enabled := True;
          frmLavoura.DBGrid1.Columns.Items[0].FieldName := FieldByName('Código Item').FieldName;
          frmLavoura.DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto').FieldName;
          frmLavoura.DBGrid1.Columns.Items[1].Width := 150;
          frmLavoura.DBGrid1.Columns.Items[2].FieldName := FieldByName('Valor Unitário').FieldName;
          frmLavoura.DBGrid1.Columns.Items[2].Width := 90;
          frmLavoura.DBGrid1.Columns.Items[3].FieldName := FieldByName('Quantidade').FieldName;
          frmLavoura.DBGrid1.Columns.Items[3].Width := 80;
          frmLavoura.DBGrid1.Columns.Items[4].FieldName := FieldByName('Valor Total').FieldName;
          frmLavoura.DBGrid1.Columns.Items[4].Width := 75;
      end;
      Close;
end;

end.
