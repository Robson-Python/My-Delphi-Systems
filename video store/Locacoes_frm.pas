unit Locacoes_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TfrmLocacoes = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edtCod: TLabeledEdit;
    cbxNome: TComboBox;
    edtCodCli: TLabeledEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    cbxFilme: TComboBox;
    btnIncluirFilme: TBitBtn;
    edtCodItem: TLabeledEdit;
    edtCodFilme: TLabeledEdit;
    edtVlFilme: TLabeledEdit;
    CheckBox1: TCheckBox;
    Shape2: TShape;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    edtVlTotal: TLabeledEdit;
    btnAtualizarFilme: TBitBtn;
    btnExcluirFilme: TBitBtn;
    btnPagamento: TSpeedButton;
    dtpData: TDateTimePicker;
    Label4: TLabel;
    CheckBox2: TCheckBox;
    btnImprimeRecibo: TSpeedButton;
    DBGrid1: TDBGrid;
    Shape3: TShape;
    Panel4: TPanel;
    edtVlLocacao: TLabeledEdit;
    btnCalc: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxNomeChange(Sender: TObject);
    procedure edtCodFilmeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxFilmeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnIncluirFilmeClick(Sender: TObject);
    procedure SomaFilmes;
    procedure SubtrairFilmes;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAtualizarFilmeClick(Sender: TObject);
    procedure btnExcluirFilmeClick(Sender: TObject);
    procedure btnPagamentoClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure Recibo;
    procedure btnImprimeReciboClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure cbxNomeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocacoes: TfrmLocacoes;

implementation

uses Locadora_dm, DB, Pagamentos_frm, ZDataset, MaskUtils;

{$R *.dfm}

function fBuscaCodLoc() : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select l_cod from locacoes order by l_cod desc');
       Active := True;
       fBuscaCodLoc := FieldByName('l_cod').AsInteger;
    end;
end;

function fBuscaCodIten() : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select il_cod from itens_locacao order by il_cod desc');
       Active := True;
       fBuscaCodIten := FieldByName('il_cod').AsInteger;
    end;
end;

function fPagamento() : String;
begin
    If frmLocacoes.CheckBox2.Checked = True then
       fPagamento := 'SIM'
    else
       fPagamento := 'N�O';
end;

function fDevolucao() : String;
begin
    If frmLocacoes.CheckBox1.Checked = True then
       fDevolucao := 'SIM'
    else
       fDevolucao := 'N�O';
end;

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

function fConvertVlFilme() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLocacoes.edtVlFilme.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLocacoes.edtVlFilme.Text := valor;
end;

procedure TfrmLocacoes.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmLocacoes.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    edtCod.Clear; edtCodCli.Clear; edtCodItem.Clear; edtCodFilme.Clear; edtVlFilme.Text := '0,00'; edtVlTotal.Text := '0,00'; edtVlLocacao.Text := '0,00';
    cbxNome.Text := ''; cbxFilme.Text := '';
    CheckBox2.Checked := False; CheckBox1.Checked := False;
    cbxNome.SetFocus;
end;

procedure TfrmLocacoes.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodLoc + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxNome.SetFocus;
end;

procedure TfrmLocacoes.FormShow(Sender: TObject);
begin
    dtpData.Date := Date;
    DBGrid1.DataSource.Enabled := False;
    cbxNome.SetFocus;
end;

procedure TfrmLocacoes.FormCreate(Sender: TObject);
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select f_nome from filmes order by f_nome');
       Active := True;
       while not Eof do begin
          cbxFilme.Items.Add(FieldByName('f_nome').AsString);
          Next;
       end;
    end;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmLocacoes.cbxNomeChange(Sender: TObject);
begin
    If cbxNome.Text <> '' then begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from clientes where c_nome = '+QuotedStr(cbxNome.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
       end;
    end;
end;

procedure TfrmLocacoes.edtCodFilmeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vStatus, vFilme : String;
begin
    If Key = VK_RETURN then begin
       If edtCodItem.Text = '' then begin
          DBGrid1.DataSource.Enabled := False;
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select f_nome, f_valor, f_status from filmes where f_cod = '+QuotedStr(edtCodFilme.Text)+'');
             Active := True;
             cbxFilme.Text := FieldByName('f_nome').AsString;
             edtVlFilme.Text := FieldByName('f_valor').AsString;
             vStatus := FieldByName('f_status').AsString;
             If cbxFilme.Text = '' then begin
                ShowMessage('Filme n�o cadastrado!');
             end;
          end;
       end;
       If edtVlFilme.Text <> '' then begin
          edtVlFilme.Text := FormatCurr('0.00', StrToFloat(edtVlFilme.Text));
       end
       else begin
          edtVlFilme.Text := '0,00';
       end;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select f_cod from itens_locacao where f_cod = '+QuotedStr(edtCodFilme.Text)+' and l_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          vFilme := FieldByName('f_cod').AsString;
          If vFilme = edtCodFilme.Text then begin
             Application.MessageBox('Esse Filme j� foi Locado por este Cliente.','Rental - Aten��o',MB_OK+MB_ICONSTOP);
             edtCodFilme.SetFocus;
          end
          else begin
             btnIncluirFilme.SetFocus;
          end;
       end;
       If vStatus = 'LOCADO' then begin
          Application.MessageBox('Esse Filme est� Locado.','Rental - Aten��o',MB_OK+MB_ICONSTOP);
          edtCodItem.Clear; edtCodFilme.Clear; cbxFilme.Text := ''; edtVlFilme.Text := '0,00';
          CheckBox1.Checked := False; CheckBox2.Checked := False;
          edtCodFilme.SetFocus;
       end
       else begin
          btnIncluirFilme.SetFocus;
       end;
    end;
end;

procedure TfrmLocacoes.cbxFilmeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vStatus, vFilme  : String;
begin
    If Key = VK_RETURN then begin
       If edtCodItem.Text = '' then begin
          DBGrid1.DataSource.Enabled := False;
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select f_cod, f_valor, f_status from filmes where f_nome = '+QuotedStr(cbxFilme.Text)+'');
             Active := True;
             edtCodFilme.Text := FieldByName('f_cod').AsString;
             edtVlFilme.Text := FieldByName('f_valor').AsString;
             vStatus := FieldByName('f_status').AsString;
             If cbxFilme.Text = '' then begin
                ShowMessage('Filme n�o cadastrado!');
             end;
          end;
       end;
       If edtVlFilme.Text <> '' then begin
          edtVlFilme.Text := FormatCurr('0.00', StrToFloat(edtVlFilme.Text));
       end
       else begin
          edtVlFilme.Text := '0,00';
       end;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select f_cod from itens_locacao where f_cod = '+QuotedStr(edtCodFilme.Text)+' and l_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          vFilme := FieldByName('f_cod').AsString;
          If vFilme <> '' then begin
             Application.MessageBox('Esse Filme j� foi Locado por este Cliente.','Rental - Aten��o',MB_OK+MB_ICONSTOP);
             cbxFilme.SetFocus;
          end
          else begin
             btnIncluirFilme.SetFocus;
          end;
       end;
       If vStatus = 'LOCADO' then begin
          Application.MessageBox('Esse Filme est� Locado.','Rental - Aten��o',MB_OK+MB_ICONSTOP);
          edtCodItem.Clear; edtCodFilme.Clear; cbxFilme.Text := ''; edtVlFilme.Text := '0,00';
          CheckBox1.Checked := False; CheckBox2.Checked := False;
          cbxFilme.SetFocus;
       end
       else begin
          btnIncluirFilme.SetFocus;
       end;
    end;
end;

procedure TfrmLocacoes.btnInserirClick(Sender: TObject);
var vCod : String;
begin
    ActiveControl := nil;
    If edtCod.Text <> '' then begin
       fConvertVlLocacao;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select c_cod from locacoes where c_cod = '+QuotedStr(edtCodCli.Text)+'');
          Active := True;
          vCod := FieldByName('c_cod').AsString;
          If vCod = '' then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into locacoes (L_COD, C_COD, L_SALDO) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodCli.Text)+', '+QuotedStr(edtVlTotal.Text)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
             edtCodFilme.SetFocus;
          end
          else begin
             Application.MessageBox('J� existe uma loca�ao aberta para esse cliente!','Rental - Aviso',MB_OK+MB_ICONINFORMATION);
          end;
          fConvertVlLocacao;
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode estar vazio! Clique em Novo para incluir um novo Registro.','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLocacoes.btnAtualizarClick(Sender: TObject);
begin
    If cbxNome.Text <> '' then begin
       fConvertVlLocacao;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update locacoes set C_COD = '+QuotedStr(edtCodCli.Text)+', L_SALDO = '+QuotedStr(edtVlTotal.Text)+' where l_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertVlLocacao;
          Application.MessageBox('Registro Efetuado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(edtCod.Text)+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('il_valor') as TNumericField).DisplayFormat := '0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('il_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('il_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('f_cod').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('f_nome').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('il_valor').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('il_devolucao').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('il_pagamento').FieldName;
       end;
    end
    else begin
       Application.MessageBox('O campo Cliente n�o pode estar vazio!','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLocacoes.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','Rental - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from itens_locacao where l_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from locacoes where l_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Excluido com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
          btnLimparClick(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode ser vazio! Selecione um registro para poder excluir.','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLocacoes.btnIncluirFilmeClick(Sender: TObject);
var vDevolucao, vPagamento : String;
    nNovo : Integer;
begin
    If edtCod.Text <> '' then begin
       If cbxFilme.Text <> '' then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          nNovo := fBuscaCodIten + 1;
          edtCodItem.Text := IntToStr(nNovo);
          vDevolucao := fDevolucao;
          vPagamento := fPagamento;
          fConvertVlFilme;
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into itens_locacao (IL_COD, L_COD, F_COD, IL_DATA, IL_VALOR, IL_DEVOLUCAO, IL_PAGAMENTO) values ('+QuotedStr(edtCodItem.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodFilme.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtVlFilme.Text)+', '+QuotedStr(vDevolucao)+', '+QuotedStr(vPagamento)+')');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Update filmes set f_status = ''LOCADO'' where f_cod = '+QuotedStr(edtCodFilme.Text)+'');
             ExecSQL;
             fConvertVlFilme;
             If CheckBox2.Checked = False then begin
                SomaFilmes;
                fConvertVlLocacao;
                Active := False;
                SQL.Clear;
                SQL.Add('Update locacoes set L_SALDO = '+QuotedStr(edtVlTotal.Text)+' where l_cod = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
                fConvertVlLocacao;
             end;
             Application.MessageBox('Filme Inclu�do com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          With dmLocadora.zqLocadora do begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(il_valor) from itens_locacao where l_cod = '+QuotedStr(edtCod.Text)+' and il_data = '+QuotedStr(DateToStr(dtpData.Date))+'');
             Active := True;
             edtVlLocacao.Text := FieldByName('sum(il_valor)').AsString;
             If edtVlLocacao.Text <> '' then begin
             edtVlLocacao.Text := FormatCurr(',0.00', StrToCurr(edtVlLocacao.Text));
             end
             else begin
                edtVlLocacao.Text := '0,00';
             end;
             ShortDateFormat := 'dd/mm/yyyy';
             Active := False;
             SQL.Clear;
             SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(edtCod.Text)+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             Open;
             (FieldByName('il_valor') as TNumericField).DisplayFormat := '0.00';
             DBGrid1.Columns.Items[0].FieldName := FieldByName('il_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('il_data').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('f_cod').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('f_nome').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('il_valor').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('il_devolucao').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('il_pagamento').FieldName;
          end;
          edtCodItem.Clear; edtCodFilme.Clear; cbxFilme.Text := ''; edtVlFilme.Text := '0,00';
          dtpData.Date := Date;
          edtCodFilme.SetFocus;
       end
       else begin
          Application.MessageBox('O campo Filme n�o pode estar vazio!','Rental - Aten��o',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo da Loca��o n�o pode estar vazio. Clique em Novo, selecione um Cliente e depois clique em Incluir para registrar.','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLocacoes.SomaFilmes;
var vVlFilme, vVlLocacao : Double;
begin
    vVlFilme := StrToFloat(edtVlFilme.Text);
    vVlLocacao := StrToFloat(edtVlTotal.Text);
    edtVlTotal.Text :=  FloatToStr(vVlFilme+vVlLocacao);
    edtVlTotal.Text := FormatCurr('0.00', StrToFloat(edtVlTotal.Text));
end;

procedure TfrmLocacoes.SubtrairFilmes;
var vVlFilme, vVlLocacao : Double;
begin
    vVlFilme := StrToFloat(edtVlFilme.Text);
    vVlLocacao := StrToFloat(edtVlTotal.Text);
    edtVlTotal.Text :=  FloatToStr(vVlLocacao-vVlFilme);
    edtVlTotal.Text := FormatCurr('0.00', StrToFloat(edtVlTotal.Text));
end;

procedure TfrmLocacoes.DBGrid1DblClick(Sender: TObject);
begin
    edtCodItem.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where il_cod = '+QuotedStr(edtCodItem.Text)+' and itens_locacao.f_cod = filmes.f_cod');
       Active := True;
       dtpData.Date := FieldByName('il_data').AsDateTime;
       edtCodFilme.Text := FieldByName('f_cod').AsString;
       cbxFilme.Text := FieldByName('f_nome').AsString;
       edtVlFilme.Text := FieldByName('il_valor').AsString;
       If FieldByName('il_devolucao').AsString = 'SIM' then begin
          CheckBox1.Checked := True;
       end
       else begin
          CheckBox1.Checked := False;
       end;
       If FieldByName('il_pagamento').AsString = 'SIM' then begin
          CheckBox2.Checked := True;
       end
       else begin
          CheckBox2.Checked := False;
       end;
       edtVlFilme.Text := FormatCurr('0.00', StrToCurr(edtVlFilme.Text));
    end;
    edtCodFilme.SetFocus;
end;

procedure TfrmLocacoes.btnAtualizarFilmeClick(Sender: TObject);
var vDevolucao, vPagamento : String;
begin
    If cbxFilme.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       vDevolucao := fDevolucao;
       vPagamento := fPagamento;
       fConvertVlFilme;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update itens_locacao set IL_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', F_COD = '+QuotedStr(edtCodFilme.Text)+', IL_VALOR = '+QuotedStr(edtVlFilme.Text)+', IL_DEVOLUCAO = '+QuotedStr(vDevolucao)+', IL_PAGAMENTO = '+QuotedStr(vPagamento)+' where il_cod = '+QuotedStr(edtCodItem.Text)+'');
          ExecSQL;
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update filmes set f_status = ''DISPON�VEL'' where f_cod = '+QuotedStr(edtCodFilme.Text)+'');
             ExecSQL;
          end;
          fConvertVlFilme;
          If CheckBox1.Checked = False then begin
             If CheckBox2.Checked = True then begin
                SubtrairFilmes;
             end
             else begin
                SomaFilmes;
             end;
             fConvertVlLocacao;
             Active := False;
             SQL.Clear;
             SQL.Add('Update locacoes set L_SALDO = '+QuotedStr(edtVlTotal.Text)+' where l_cod = '+QuotedStr(edtCod.Text)+'');
             ExecSQL;
             fConvertVlLocacao;
          end;
          Application.MessageBox('Filme Atualizado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(edtCod.Text)+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('il_valor') as TNumericField).DisplayFormat := '0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('il_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('il_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('f_cod').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('f_nome').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('il_valor').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('il_devolucao').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('il_pagamento').FieldName;
       end;
       edtCodItem.Clear; edtCodFilme.Clear; cbxFilme.Text := ''; edtVlFilme.Text := '0,00';
       CheckBox1.Checked := False; CheckBox2.Checked := False;
       dtpData.Date := Date;
       edtCodFilme.SetFocus;
    end
    else begin
       Application.MessageBox('O campo Filme n�o pode estar vazio!','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLocacoes.btnExcluirFilmeClick(Sender: TObject);
begin
    If edtCodItem.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','Rental - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from itens_locacao where il_cod = '+ QuotedStr(edtCodItem.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Update filmes set f_status = ''DISPON�VEL'' where f_cod = '+QuotedStr(edtCodFilme.Text)+'');
             ExecSQL;
             If edtVlTotal.Text <> '0,00' then begin
                SubtrairFilmes;
                fConvertVlLocacao;
                Active := False;
                SQL.Clear;
                SQL.Add('Update locacoes set L_SALDO = '+QuotedStr(edtVlTotal.Text)+' where l_cod = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
                fConvertVlLocacao;
             end;
             Application.MessageBox('Filme Excluido com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
       end;
       With dmLocadora.zqLocadora do begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(il_valor) from itens_locacao where l_cod = '+QuotedStr(edtCod.Text)+' and il_data = '+QuotedStr(DateToStr(dtpData.Date))+'');
          Active := True;
          edtVlLocacao.Text := FieldByName('sum(il_valor)').AsString;
          If edtVlLocacao.Text <> '' then begin
          edtVlLocacao.Text := FormatCurr(',0.00', StrToCurr(edtVlLocacao.Text));
          end
          else begin
             edtVlLocacao.Text := '0,00';
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Active := False;
          SQL.Clear;
          SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(edtCod.Text)+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('il_valor') as TNumericField).DisplayFormat := '0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('il_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('il_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('f_cod').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('f_nome').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('il_valor').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('il_devolucao').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('il_pagamento').FieldName;
       end;
       edtCodItem.Clear; edtCodFilme.Clear; cbxFilme.Text := ''; edtVlFilme.Text := '0,00';
       CheckBox1.Checked := False; CheckBox2.Checked := False;
       dtpData.Date := Date;
       edtCodFilme.SetFocus;
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode ser vazio! Selecione um registro para poder excluir.','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLocacoes.btnPagamentoClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmPagamentos, frmPagamentos);
      frmPagamentos.ShowModal;
    Finally
         frmPagamentos.Free;
    end;
end;

procedure TfrmLocacoes.btnSelecionarClick(Sender: TObject);
begin
    ActiveControl := nil;
    If edtCodCli.Text <> '' then begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from locacoes where c_cod = '+QuotedStr(edtCodCli.Text)+'');
          Active := True;
          edtCod.Text := FieldByName('l_cod').AsString;
          edtVlTotal.Text := FieldByName('l_saldo').AsString;
          If edtVlTotal.Text <> '' then begin
             edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
          end
          else begin
             edtVlTotal.Text := '0,00';
          end;
          If edtCod.Text = '' then begin
             Application.MessageBox('N�o existe Loca��o aberta para esse Cliente. Inclua um Registro para ele clicando em Novo e depois em Inluir.','Rental - Aten��o',MB_OK+MB_ICONINFORMATION);
          end;
       end;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(edtCod.Text)+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('il_valor') as TNumericField).DisplayFormat := '0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('il_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('il_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('f_cod').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('f_nome').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('il_valor').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('il_devolucao').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('il_pagamento').FieldName;
       end;
       edtCodFilme.SetFocus;
       edtVlLocacao.Text := '0,00';
       dtpData.Date := Date;
    end
    else begin
       Application.MessageBox('O campo C�digo do Cliente n�o pode ser vazio! Selecione um registro para poder consultar.','Rental - Aten��o',MB_OK+MB_ICONWARNING);
       cbxNome.SetFocus;
    end;
end;

procedure TfrmLocacoes.Recibo;
var VarTotal : Real;
    I : Integer;
    Cod, Filme, Valor, Total : String;
    Arq : TextFile;
    Codigo, Cliente, Data, CPF, Endereco, Status, Saldo : String;
begin
   With dmLocadora.zqLocadora do begin
      Active := False;
      SQL.Clear;
      SQL.Add('select c_cpf, c_endereco from clientes where c_cod = '+QuotedStr(edtCodCli.Text)+'');
      Active := True;
      CPF := FieldByName('c_cpf').AsString;
      Endereco := FieldByName('c_endereco').AsString;
      DateSeparator := '/';
      ShortDateFormat := 'yyyy-mm-dd';
      Active := False;
      SQL.Clear;
      SQL.Add('select sum(il_valor) from itens_locacao where il_pagamento = ''N�O'' and il_data = '+QuotedStr(DateToStr(dtpData.Date))+' and l_cod = '+QuotedStr(edtCod.Text)+'');
      Active := True;
      Saldo := FieldByName('sum(il_valor)').AsString;
      If Saldo = '' then begin
         Status := 'PAGO';
      end
      else begin
         Status := 'A PAGAR';
      end;
      ShortDateFormat := 'dd/mm/yyyy';
   end;
   Codigo := Trim(edtCod.Text);
   Data := DateToStr(dtpData.Date);
   Cliente:= Trim(cbxNome.Text);
   AssignFile(Arq,'LPT1');
   ReWrite(Arq);
   Writeln(Arq,'--------------------------------------');
   Writeln(Arq,'         Hobby Video Locadora         ');
   Writeln(Arq,'      Av. Tapajos 4475 - Centro       ');
   Writeln(Arq,'        Colorado do Oeste - RO        ');
   Writeln(Arq,'      Fones: 8482-5552/8125-5991       ');
   Writeln(Arq,'--------------------------------------');
   Writeln(Arq,'Codigo: '+Codigo                       );
   Writeln(Arq,'Cliente: '+Cliente                     );
   Writeln(Arq,'CPF: '+CPF                             );
   Writeln(Arq,'Endereco: '+Endereco                   );
   Writeln(Arq,'Data: '+Data                           );
   Writeln(Arq,'Situacao Pagamento: '+Status           );
   Writeln(Arq,'--------------------------------------');
   Writeln(Arq,'Codigo         Filme          Valor R$');
   Writeln(Arq,'--------------------------------------');
DateSeparator := '/';
ShortDateFormat := 'yyyy-mm-dd';
With dmLocadora.zqLocadora do begin
   Active := False;
   SQL.Clear;
   SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(edtCod.Text)+' and il_data = '+QuotedStr(DateToStr(dtpData.Date))+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
   Active := True;
   While not Eof do begin
      Cod :=  FieldByName('f_cod').AsString;
      Filme := Trim(FieldByName('f_nome').AsString);
      Valor := FieldByName('il_valor').AsString;
      Valor := FormatCurr('0.00', StrToCurr(Valor));
      For I:=Length(Cod) to 6 do
      Cod:=Cod+' ';
      For I:=Length(Filme) to 20 do
      Filme:=Filme+' ';
      For I:=Length(Valor) to 8 do
      Valor:=' '+Valor;
   Writeln(Arq,''+Cod  +Filme                    +Valor);
   Next;
   end;
   ShortDateFormat := 'dd/mm/yyyy';
   Writeln(Arq,'--------------------------------------');
   DateSeparator := '/';
   ShortDateFormat := 'yyyy-mm-dd';
   Active := False;
   SQL.Clear;
   SQL.Add('select sum(il_valor) from itens_locacao where il_pagamento = ''N�O'' and il_data = '+QuotedStr(DateToStr(dtpData.Date))+' and l_cod = '+QuotedStr(edtCod.Text)+'');
   Active := True;
   Total := FieldByName('sum(il_valor)').AsString;
   If Total <> '' then begin
      Total := FormatCurr(',0.00', StrToCurr(Total));
   end
   else begin
      Total := '0,00';
   end;
shortDateFormat := 'dd/mm/yyyy';
   Writeln(Arq,'               Valor Total R$: '+Total );
   Writeln(Arq,'--------------------------------------');
   Writeln(Arq,'                                      ');
   Writeln(Arq,'    -------------------------------   ');
   Writeln(Arq,'           Ass. do Cliente            ');
   Writeln(Arq,'      Obrigado pela preferencia       ');
   Writeln(Arq,'--------------------------------------');
   Writeln(Arq,'');
   For I:=dmLocadora.zqLocadora.RecordCount to 6 do begin
   Writeln(Arq,'');
   end;
   CloseFile(arq);
end;
end;

procedure TfrmLocacoes.btnImprimeReciboClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       Recibo;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select itens_locacao.*, filmes.f_nome from itens_locacao, filmes where l_cod = '+QuotedStr(edtCod.Text)+' and itens_locacao.f_cod = filmes.f_cod order by itens_locacao.il_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('il_valor') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('il_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('il_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('f_cod').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('f_nome').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('il_valor').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('il_devolucao').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('il_pagamento').FieldName;
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode estar vazio!','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLocacoes.btnCalcClick(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmLocacoes.cbxNomeExit(Sender: TObject);
begin
    If edtCodCli.Text = '' then begin
        With dmLocadora.zqLocadora do begin
           Active := False;
           SQL.Clear;
           SQL.Add('Select c_cod from clientes where c_nome = '+QuotedStr(cbxNome.Text)+'');
           Active := True;
           edtCodCli.Text := FieldByName('c_cod').AsString;
        end;
        edtCodFilme.SetFocus;
    end;
end;

end.
