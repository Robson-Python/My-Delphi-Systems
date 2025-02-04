unit Alimentos_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Grids, DBGrids, DateUtils;

type
  TfrmAlimentos = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lblDtAquisi: TLabel;
    edtCod: TLabeledEdit;
    dtpData: TDateTimePicker;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    dtpDataFinal: TDateTimePicker;
    Label3: TLabel;
    edtQtdKilo: TLabeledEdit;
    edtVlTotal: TLabeledEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edtQtd: TLabeledEdit;
    edtCodProd: TLabeledEdit;
    cbxProduto: TComboBox;
    edtQtdUnit: TLabeledEdit;
    edtBatidas: TLabeledEdit;
    edtDias: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTotalAlimento: TLabeledEdit;
    dbgAlimentos: TDBGrid;
    btnNovo: TSpeedButton;
    rgpControle: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure BaixarEstoque;
    procedure EstornarEstoque;
    procedure btnConsultarClick(Sender: TObject);
    procedure edtDiasExit(Sender: TObject);
    procedure edtDiasEnter(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure edtVlTotalAlimentoEnter(Sender: TObject);
    procedure dbgAlimentosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgAlimentosDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbxProdutoChange(Sender: TObject);
    procedure cbxProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlimentos: TfrmAlimentos;

implementation

uses Carro_Comando_dm, Principal_frm, ConsultaDespesa_frm, ADODB, DB;

{$R *.dfm}

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmAlimentos.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmAlimentos.edtQtd.Text := valor;
end;

function fConvertEdit1() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmAlimentos.edtVlUni.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmAlimentos.edtVlUni.Text := valor;
end;

function fConvertEdit2() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmAlimentos.edtVlTotalAlimento.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmAlimentos.edtVlTotalAlimento.Text := valor;
end;

function fConvertQtdKilo() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmAlimentos.edtQtdKilo.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmAlimentos.edtQtdKilo.Text := valor;
end;

function fConvertVlTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmAlimentos.edtVlTotal.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmAlimentos.edtVlTotal.Text := valor;
end;

function fConvertQtdUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmAlimentos.edtQtdUnit.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmAlimentos.edtQtdUnit.Text := valor;
end;

function fConvertBatidas() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmAlimentos.edtBatidas.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmAlimentos.edtBatidas.Text := valor;
end;

function fBuscaCodigo() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select dt_cod from dieta order by dt_cod desc');
       Active := True;
       fBuscaCodigo := FieldByName('dt_cod').AsInteger;
    end;
end;

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
    If frmAlimentos.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C'
end;

function Estoque () : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_qtd from produtos where p_cod = '+QuotedStr(frmAlimentos.edtCodProd.Text)+'');
       Active := True;
       If FieldByName('p_qtd').AsFloat = 0 then begin
          Application.MessageBox('Não é possível incluir esse produto. Saldo em estoque = 0!','Omega - Inclusão Cancelada',MB_OK+MB_ICONSTOP);
          Estoque := 'Cancelado';
       end
       else begin
          If FieldByName('p_qtd').AsFloat < StrToFloat(frmAlimentos.edtQtd.Text) then begin
             Application.MessageBox('Não é possível incluir esse produto. Saldo em estoque é menor que a quantidade informada!','Omega - Inclusão Cancelada',MB_OK+MB_ICONSTOP);
             Estoque := 'Cancelado';
          end
          else begin
             Estoque := 'Liberado';
          end;
       end;
    end;
end;

function Soma () : Double;
var vQtd, vQtdTotal, vValor, vValorTotal : Double;
begin
    vQtd := StrToFloat(frmAlimentos.edtQtd.Text);
    vQtdTotal := StrToFloat(frmAlimentos.edtQtdKilo.Text);
    frmAlimentos.edtQtdKilo.Text := FloatToStr(vQtd+vQtdTotal);
    vValor := StrToFloat(frmAlimentos.edtVlTotalAlimento.Text);
    vValorTotal := StrToFloat(frmAlimentos.edtVlTotal.Text);
    frmAlimentos.edtVlTotal.Text := FloatToStr(vValor+vValorTotal);
    frmAlimentos.edtVlTotal.Text := FormatCurr('0.00', StrToCurr(frmAlimentos.edtVlTotal.Text));
    frmAlimentos.edtQtdKilo.Text := FormatFloat('0.##',(StrToFloat(frmAlimentos.edtQtdKilo.Text)));
end;

procedure TfrmAlimentos.FormShow(Sender: TObject);
begin
    dbgAlimentos.DataSource.Enabled := False;
    dtpData.Date := Date;
    dtpDataFinal.Date := Date;
    edtQtd.Text := '0'; edtVlTotal.Text := '0,00'; edtQtdKilo.Text := '0';
    edtQtdUnit.Text := '0'; edtVlUni.Text := '0,00'; edtVlTotalAlimento.Text := '0,00';
end;

procedure TfrmAlimentos.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from produtos order by p_nome');
       Active := True;
       while not Eof do begin
          cbxProduto.Items.Add(FieldByName('p_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmAlimentos.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    dmCarroComando.DataSource1.Enabled := True;
    Close;
end;

procedure TfrmAlimentos.btnLimparClick(Sender: TObject);
begin
    DecimalSeparator := ',';
    dbgAlimentos.DataSource.Enabled := False;
    edtCod.Clear; edtCodProd.Clear; edtQtdUnit.Clear; edtBatidas.Clear; edtDias.Clear; edtQtd.Text := '0';
    cbxProduto.Clear;
    edtQtd.Text := '0'; edtVlTotal.Text := '0,00'; edtQtdKilo.Text := '0';
    edtQtdUnit.Text := '0'; edtVlUni.Text := '0,00'; edtVlTotalAlimento.Text := '0,00';
    FormShow(Sender);
    FormCreate(Sender);
    edtQtdKilo.Enabled := False;
    edtVlTotal.Enabled := False;
    rgpControle.ItemIndex := -1;
    dtpData.SetFocus;
end;

procedure TfrmAlimentos.btnInserirClick(Sender: TObject);
var nNovo, vDias, cCount  : Integer;
    vQtd, vValorQtd, vValorTotal, vTotal : Double;
    dData, vData : TDate;
    vAno, vControle : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtCod.Text <> '' then begin
          If Estoque = 'Liberado' then begin
             Soma;
             fConvertQtdKilo;
             fConvertVlTotal;
             fConvertEdit1;
             fConvertQtdUni;
             fConvertBatidas;
             vDias := StrToInt(edtDias.Text);
             vAno := AnoConfinamento;
             vControle := Controle;
             cCount := 0;
             While cCount <> vDias do begin
                DateSeparator := '/';
                ShortDateFormat := 'yyyy-mm-dd';
                nNovo := fBuscaCodigo + 1;
                vQtd := StrToFloat(edtQtd.Text);
                vValorQtd := vQtd/vDias;
                vValorTotal := StrToFloat(edtVlTotalAlimento.Text);
                vTotal := vValorTotal/vDias;
                dData := dtpData.Date;
                vData := dData + cCount;
                cCount := cCount + 1;
                With dmCarroComando.ADOQuery1 do begin
                   DecimalSeparator := '.';
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Insert into dieta (DT_COD, DT_CODDT, DT_DATA, P_COD, DT_QTD, DT_BATIDAS, DT_QTDTOTAL, DT_VLUNI, DT_VLTOTAL, DT_ANO, DT_CONTROLE) values ('+IntToStr(nNovo)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(vData))+', '+QuotedStr(edtCodProd.Text)+', '+QuotedStr(edtQtdUnit.Text)+', '+QuotedStr(edtBatidas.Text)+', '+FloatToStr(vValorQtd)+', '+QuotedStr(edtVlUni.Text)+', '+FloatToStr(vTotal)+', '+QuotedStr(vAno)+', '+QuotedStr(vControle)+')');
                   ExecSQL;
                   DecimalSeparator := ',';
                end;
             end;
             Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             BaixarEstoque;
             fConvertEdit1;
             fConvertQtdKilo;
             fConvertVlTotal;
             fConvertQtdUni;
             fConvertBatidas;
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select DT.p_cod, P.p_nome, sum(dt_qtdtotal), DT.dt_vluni ''Valor'', sum(DT.dt_vltotal) ''Total'' from dieta DT, produtos P where dt_coddt = '+QuotedStr(edtCod.Text)+' and DT.p_cod = P.p_cod group by P.p_nome');
                Active := True;
                dbgAlimentos.DataSource.Enabled := True;
                dbgAlimentos.Columns.Items[0].FieldName := FieldByName('p_cod').FieldName;
                dbgAlimentos.Columns.Items[1].FieldName := FieldByName('p_nome').FieldName;
                dbgAlimentos.Columns.Items[2].FieldName := FieldByName('sum(dt_qtdtotal)').FieldName;
                dbgAlimentos.Columns.Items[3].FieldName := FieldByName('Valor').FieldName;
                dbgAlimentos.Columns.Items[4].FieldName := FieldByName('Total').FieldName;
             end;
             cbxProduto.Text := ''; edtCodProd.Clear; edtQtdUnit.Clear;
             edtBatidas.Clear; edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlTotalAlimento.Text := '0,00';
             cbxProduto.SetFocus;
          end;
       end
       else begin
          Application.MessageBox('O campo Código não pode ser vazio! Clique no botão Novo para criar um novo registro.','Omega - Atenção',MB_OK+MB_ICONEXCLAMATION);
       end;
    end
    else begin
        Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmAlimentos.btnAtualizarClick(Sender: TObject);
var vQtdTotal, vVlTotal : Double;
    vDias : Integer;
begin
    If edtCod.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          vDias := StrToInt(edtDias.Text);
          vQtdTotal := StrToFloat(edtQtd.Text);
          vVlTotal := StrToFloat(edtVlTotalAlimento.Text);
          edtQtd.Text := FloatToStr(vQtdTotal/vDias);
          edtVlTotalAlimento.Text := FloatToStr(vVlTotal/vDias);
          fConvertQtdKilo;
          fConvertVlTotal;
          fConvertQtd;
          fConvertEdit1;
          fConvertEdit2;
          fConvertQtdUni;
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update dieta set DT_QTD = '+QuotedStr(edtQtdUnit.Text)+', DT_BATIDAS = '+QuotedStr(edtBatidas.Text)+', DT_QTDTOTAL = '+QuotedStr(edtQtd.Text)+', DT_VLUNI = '+QuotedStr(edtVlUni.Text)+', DT_VLTOTAL = '+QuotedStr(edtVlTotalAlimento.Text)+' where DT_CODDT = '+ QuotedStr(edtCod.Text)+' and P_COD = '+QuotedStr(edtCodProd.Text)+'');
             ExecSQL;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertQtd;
          fConvertEdit1;
          fConvertEdit2;
          fConvertQtdKilo;
          fConvertVlTotal;
          fConvertQtdUni;
          Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('Selecione um registro para atualizar.','Omega - Atenção',MB_OK+MB_ICONEXCLAMATION);
    end;
end;

procedure TfrmAlimentos.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin
             If edtCodProd.Text = '' then begin
                Application.MessageBox('Selecione o alimento para Exclusão!','Omega - Atenção',MB_OK+MB_ICONWARNING);
             end
             else begin
                EstornarEstoque;
                With dmCarroComando.ADOQuery1 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from dieta where p_cod = '+QuotedStr(edtCodProd.Text)+' and dt_coddt = '+QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
                   btnLimparClick(Sender);
                   FormShow(Sender);
                end;
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('Selecione um registro para exclusão.','Omega - Atenção',MB_OK+MB_ICONEXCLAMATION);
    end;
end;

procedure TfrmAlimentos.BaixarEstoque;
var vQtdAtual, vQtdNovo : Double;
begin
    vQtdAtual := StrToFloat(edtQtd.Text);
    DecimalSeparator := '.';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_qtd from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       Active := True;
       vQtdNovo := FieldByName('p_qtd').AsFloat;
       Active := True;
       SQL.Clear;
       SQL.Add('Update produtos set p_qtd = '+FloatToStr(vQtdNovo - vQtdAtual)+' where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       ExecSQL;
       DecimalSeparator := ',';
    end;
end;

procedure TfrmAlimentos.EstornarEstoque;
var vQtdAtual, vQtdNovo : Double;
begin
    vQtdAtual := StrToFloat(edtQtd.Text);
    DecimalSeparator := '.';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_qtd from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       Active := True;
       vQtdNovo := FieldByName('p_qtd').AsFloat;
       Active := True;
       SQL.Clear;
       SQL.Add('Update produtos set p_qtd = '+FloatToStr(vQtdNovo + vQtdAtual)+' where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       ExecSQL;
       DecimalSeparator := ',';
    end;
end;

procedure TfrmAlimentos.btnConsultarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsltaDespesa, frmConsltaDespesa);
      frmConsltaDespesa.ShowModal;
    Finally
         frmConsltaDespesa.Free;
    end;
end;

procedure TfrmAlimentos.edtDiasExit(Sender: TObject);
var vQtd, vBatida, vDias : Double;
begin
    vQtd := StrToFloat(edtQtdUnit.Text);
    vBatida := StrToFloat(edtBatidas.Text);
    vDias := StrToFloat(edtDias.Text);
    edtQtd.Text := FloatToStr((vQtd*vBatida)*vDias);
end;

procedure TfrmAlimentos.edtDiasEnter(Sender: TObject);
var vDias : Integer;
    data1, data2 : String;
begin
    data1 := DateToStr(dtpData.date);
    data2 := DateToStr(dtpDataFinal.Date);
    If data1 <> data2  then begin
       vDias := DaysBetween(dtpData.Date, dtpDataFinal.Date);
       edtDias.Text := IntToStr((vDias)+2);
       edtQtd.SetFocus;
    end
    else begin
       vDias := DaysBetween(dtpData.Date, dtpDataFinal.Date);
       edtDias.Text := IntToStr(1);
       edtQtd.SetFocus;
    end;
end;

procedure TfrmAlimentos.edtQtdExit(Sender: TObject);
begin
    edtVlTotalAlimento.SetFocus;
end;

procedure TfrmAlimentos.edtVlTotalAlimentoEnter(Sender: TObject);
var vUnit, vTotal : Double;
begin
    vUnit := StrToFloat(edtVlUni.Text);
    vTotal := StrToFloat(edtQtd.Text);
    edtVlTotalAlimento.Text := FloatToStr(vUnit*vTotal);
    edtVlTotalAlimento.Text := FormatCurr('0.00', StrToCurr(edtVlTotalAlimento.Text));
end;

procedure TfrmAlimentos.dbgAlimentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//    If odd(dmCarroComando.ADOQuery1.RecNo) then begin
//       dbgAlimentos.Canvas.Font.Color:= clBlack;
//       dbgAlimentos.Canvas.Brush.Color:= $00D4D4D4;
//    end
//    else begin
//       dbgAlimentos.Canvas.Font.Color:= clBlack;
//       dbgAlimentos.Canvas.Brush.Color:= clWhite;
//    end;
//    dbgAlimentos.Canvas.FillRect(Rect);
//    dbgAlimentos.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

procedure TfrmAlimentos.dbgAlimentosDblClick(Sender: TObject);
begin
    edtCodProd.Text := dbgAlimentos.SelectedField.Text;
    dbgAlimentos.DataSource.Enabled := False;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select DT.p_cod, DT.dt_qtd, DT.dt_batidas, sum(DT.dt_qtdtotal), DT.dt_vluni, sum(DT.dt_vltotal), P.p_nome from dieta DT, produtos P where P.p_cod = '+QuotedStr(edtCodProd.Text)+' and DT.dt_coddt = '+QuotedStr(edtCod.Text)+' and DT.p_cod = P.p_cod group by P.p_nome');
       Active := True;
       cbxProduto.Text := FieldByName('p_nome').AsString;
       edtCodProd.Text := FieldByName('p_cod').AsString;
       edtQtdUnit.Text := FieldByName('dt_qtd').AsString;
       edtBatidas.Text := FieldByName('dt_batidas').AsString;
       edtQtd.Text := FieldByName('sum(DT.dt_qtdtotal)').AsString;
       edtVlUni.Text := FieldByName('dt_vluni').AsString;
       edtVlTotalAlimento.Text := FieldByName('sum(DT.dt_vltotal)').AsString;
       edtVlUni.Text := FormatCurr('0.000', StrToCurr(edtVlUni.Text));
       edtVlTotalAlimento.Text := FormatCurr('0.00', StrToCurr(edtVlTotalAlimento.Text));
       edtQtd.Text := FormatFloat('0.##',(StrToFloat(edtQtd.Text)));
    end;
    edtQtdUnit.SetFocus;
end;

procedure TfrmAlimentos.btnNovoClick(Sender: TObject);
var vCod : Integer;
begin
    btnLimparClick(Sender);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select dt_coddt from dieta order by dt_coddt desc');
       Active := True;
       vCod := FieldByName('dt_coddt').AsInteger;
       edtCod.Text := IntToStr(vCod+1);
    end;
end;

procedure TfrmAlimentos.cbxProdutoChange(Sender: TObject);
begin
    If cbxProduto.Text <> '' then begin
       dbgAlimentos.DataSource.Enabled := False;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select p_cod from produtos where p_nome = '+QuotedStr(cbxProduto.Text)+'');
          Active := True;
          edtCodProd.Text := FieldByName('p_cod').AsString;
       end;
    end;
end;

procedure TfrmAlimentos.cbxProdutoExit(Sender: TObject);
var vAno, vControle : String;
begin
    If cbxProduto.Text <> '' then begin
       vAno := AnoConfinamento;
       vControle := Controle;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select P.p_cod, sum(EP.ep_vltotal)/sum(EP.ep_qtd) from produtos P, entrada_produtos EP where p_nome = '+QuotedStr(cbxProduto.Text)+' and P.p_cod = EP.p_cod and EP.ep_ano = '+QuotedStr(vAno)+' and EP.ep_controle = '+QuotedStr(vControle)+' group by P.p_cod');
          Active := True;
          edtVlUni.Text := FieldByName('sum(EP.ep_vltotal)/sum(EP.ep_qtd)').AsString;
          edtVlUni.Text := FormatCurr('0.000', StrToCurr(edtVlUni.Text));
       end;
       edtQtdUnit.SetFocus;
    end;
end;

end.
