unit VendaProduto_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmVendaProduto = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cbxProd: TComboBox;
    edtCodProd: TLabeledEdit;
    edtVlProd: TLabeledEdit;
    dtpData: TDateTimePicker;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    edtQtd: TLabeledEdit;
    edtVlTotal: TLabeledEdit;
    DBGrid1: TDBGrid;
    Shape3: TShape;
    Panel4: TPanel;
    btnAtualizar: TSpeedButton;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtCod: TLabeledEdit;
    edtCodCli: TLabeledEdit;
    cbxCliente: TComboBox;
    edtSaldo: TLabeledEdit;
    edtCodIten: TLabeledEdit;
    btnAtualizarFilme: TBitBtn;
    btnIncluirProd: TBitBtn;
    btnExcluirFilme: TBitBtn;
    btnPagamento: TSpeedButton;
    btnCalc: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdExit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cbxProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BaixarEstoque;
    procedure EstornarEstoque;
    procedure btnAtualizarClick(Sender: TObject);
    procedure cbxClienteChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnIncluirProdClick(Sender: TObject);
    procedure SomaProdutos;
    procedure btnAtualizarFilmeClick(Sender: TObject);
    procedure btnExcluirFilmeClick(Sender: TObject);
    procedure SubtrairProdutos;
    procedure btnPagamentoClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaProduto: TfrmVendaProduto;

implementation

uses Locadora_dm, ZDataset, ZAbstractRODataset, DB, PagarProduto_frm;

{$R *.dfm}

function fPagamento() : String;
begin
    If frmVendaProduto.CheckBox1.Checked = True then
       fPagamento := 'SIM'
    else
       fPagamento := 'NÃO';
end;

function fConvertVlProd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlProd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlProd.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtQtd.Text := valor;
end;

function fConvertVlTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlTotal.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlTotal.Text := valor;
end;

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

function fBuscaCodVenda() : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select v_cod from vendas order by v_cod desc');
       Active := True;
       fBuscaCodVenda := FieldByName('v_cod').AsInteger;
    end;
end;

function fBuscaCodIVenda() : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select iv_cod from itens_venda order by iv_cod desc');
       Active := True;
       fBuscaCodIVenda := FieldByName('iv_cod').AsInteger;
    end;
end;

function Estoque () : String;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_qtd from produtos where p_cod = '+QuotedStr(frmVendaProduto.edtCodProd.Text)+'');
       Active := True;
       If FieldByName('p_qtd').AsFloat = 0 then begin
          Application.MessageBox('Não é possível incluir esse produto. Saldo em estoque = 0!','Rental - Inclusão Cancelada',MB_OK+MB_ICONSTOP);
          Estoque := 'Cancelado';
       end
       else begin
          If FieldByName('p_qtd').AsFloat < StrToFloat(frmVendaProduto.edtQtd.Text) then begin
             Application.MessageBox('Não é possível incluir esse produto. Saldo em estoque é menor que a quantidade informada!','Rental - Inclusão Cancelada',MB_OK+MB_ICONSTOP);
             Estoque := 'Cancelado';
          end
          else begin
             Estoque := 'Liberado';
          end;
       end;
    end;
end;

procedure TfrmVendaProduto.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmVendaProduto.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    edtCod.Clear; edtCodProd.Clear; edtVlProd.Text := '0,00'; edtVlTotal.Text := '0,00'; edtQtd.Text := '0'; edtSaldo.Text := '0,00';
    cbxProd.Text := ''; cbxCliente.Text := '';
    CheckBox1.Checked := False;
    FormShow(Self);
end;

procedure TfrmVendaProduto.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodVenda + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxCliente.SetFocus;
end;

procedure TfrmVendaProduto.FormShow(Sender: TObject);
begin
    dtpData.Date := Date;
    DBGrid1.DataSource.Enabled := False;
    cbxCliente.SetFocus;
end;

procedure TfrmVendaProduto.FormCreate(Sender: TObject);
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_nome from produtos order by p_nome');
       Active := True;
       while not Eof do begin
          cbxProd.Items.Add(FieldByName('p_nome').AsString);
          Next;
       end;
    end;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxCliente.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmVendaProduto.edtCodProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       If edtCod.Text <> '' then begin
          DBGrid1.DataSource.Enabled := False;
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select p_nome, p_valor from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
             Active := True;
             cbxProd.Text := FieldByName('p_nome').AsString;
             edtVlProd.Text := FieldByName('p_valor').AsString;
             If cbxProd.Text = '' then begin
                ShowMessage('Produto não cadastrado!');
             end;
          end;
       end;
       If edtVlProd.Text <> '' then begin
          edtVlProd.Text := FormatCurr('0.00', StrToFloat(edtVlProd.Text));
       end
       else begin
          edtVlProd.Text := '0,00';
       end;
       edtQtd.SetFocus;
    end;
end;

procedure TfrmVendaProduto.edtQtdExit(Sender: TObject);
var vValor, vQtd : Double;
begin
    If edtQtd.Text <> '0' then begin
       vValor := StrToFloat(edtVlProd.Text);
       vQtd := StrToFloat(edtQtd.Text);
       edtVlTotal.Text := FloatToStr(vValor*vQtd);
       edtVlTotal.Text := FormatCurr('0.00', StrToFloat(edtVlTotal.Text));
       btnIncluirProd.SetFocus;
    end;
end;

procedure TfrmVendaProduto.btnInserirClick(Sender: TObject);
var vPagamento : String;
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       vPagamento := fPagamento;
       fConvertSaldo;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into vendas (V_COD, C_COD, V_SALDO) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodCli.Text)+', '+QuotedStr(edtSaldo.Text)+')');
          ExecSQL;
       end;
       fConvertSaldo;
       ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro cadastrado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       cbxProd.SetFocus;
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo registro','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmVendaProduto.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','Rental - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from itens_venda where v_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from vendas where v_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Produto Excluido com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmVendaProduto.btnSelecionarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from vendas where c_cod = '+QuotedStr(edtCodCli.Text)+'');
       Active := True;
       edtCod.Text := FieldByName('v_cod').AsString;
       edtSaldo.Text := FieldByName('v_saldo').AsString;
       If edtSaldo.Text <> '' then begin
          edtSaldo.Text := FormatCurr(',0.00', StrToCurr(edtSaldo.Text));
       end
       else begin
          edtSaldo.Text := '0,00';
       end;
       If edtCod.Text = '' then begin
          Application.MessageBox('Não existe Venda aberta para esse Cliente. Inclua um Registro para ele clicando em Novo e depois em Inluir.','Rental - Atenção',MB_OK+MB_ICONINFORMATION);
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('select IV.iv_cod, IV.iv_data, P.p_nome, IV.iv_qtd, IV.iv_vltotal, IV.iv_pagamento from produtos P, itens_venda IV where P.p_cod = IV.p_cod and IV.v_cod = '+QuotedStr(edtCod.Text)+' order by iv_cod desc');
       Active := True;
       DBGrid1.DataSource.Enabled := True;
       Open;
       (FieldByName('iv_vltotal') as TNumericField).DisplayFormat := ',0.00';
       DBGrid1.Columns.Items[0].FieldName := FieldByName('iv_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('iv_data').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('iv_qtd').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('iv_vltotal').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('iv_pagamento').FieldName;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    cbxProd.SetFocus;
end;

procedure TfrmVendaProduto.cbxProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       If cbxProd.Text <> '' then begin
          DBGrid1.DataSource.Enabled := False;
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select p_cod, p_valor from produtos where p_nome = '+QuotedStr(cbxProd.Text)+'');
             Active := True;
             edtCodProd.Text := FieldByName('p_cod').AsString;
             edtVlProd.Text := FieldByName('p_valor').AsString;
             If edtCodProd.Text = '' then begin
                ShowMessage('Produto não cadastrado!');
             end;
          end;
       end;
       If edtVlProd.Text <> '' then begin
          edtVlProd.Text := FormatCurr(',0.00', StrToFloat(edtVlProd.Text));
       end
       else begin
          edtVlProd.Text := '0,00';
       end;
       edtQtd.SetFocus;
    end;
end;

procedure TfrmVendaProduto.BaixarEstoque;
var vQtdAtual, vQtdNovo : Double;
begin
    vQtdAtual := StrToFloat(edtQtd.Text);
    DecimalSeparator := '.';
    With dmLocadora.zqLocadora do begin
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

procedure TfrmVendaProduto.EstornarEstoque;
var vQtdAtual, vQtdNovo : Double;
begin
    vQtdAtual := StrToFloat(edtQtd.Text);
    DecimalSeparator := '.';
    With dmLocadora.zqLocadora do begin
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

procedure TfrmVendaProduto.btnAtualizarClick(Sender: TObject);
var vPagamento : String;
begin
    If cbxCliente.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       vPagamento := fPagamento;
       fConvertSaldo;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set C_COD = '+QuotedStr(edtCodCli.Text)+', V_SALDO = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertSaldo;
          Application.MessageBox('Registro Efetuado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select IV.iv_cod, IV.iv_data, P.p_nome, IV.iv_qtd, IV.iv_vltotal, IV.iv_pagamento from produtos P, itens_venda IV where P.p_cod = IV.p_cod and IV.v_cod = '+QuotedStr(edtCod.Text)+' order by iv_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('iv_vltotal') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('iv_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('iv_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('iv_qtd').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('iv_vltotal').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('iv_pagamento').FieldName;
       end;
    end
    else begin
       Application.MessageBox('O campo Cliente não pode estar vazio!','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmVendaProduto.cbxClienteChange(Sender: TObject);
begin
    If cbxCliente.Text <> '' then begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from clientes where c_nome = '+QuotedStr(cbxCliente.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
       end;
    end;
end;

procedure TfrmVendaProduto.DBGrid1DblClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    edtCodIten.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select itens_venda.*, produtos.p_nome from itens_venda, produtos where iv_cod = '+QuotedStr(edtCodIten.Text)+' and produtos.p_cod = itens_venda.p_cod');
       Active := True;
       dtpData.Date := FieldByName('iv_data').AsDateTime;
       edtCodProd.Text := FieldByName('p_cod').AsString;
       cbxProd.Text := FieldByName('p_nome').AsString;
       edtVlProd.Text := FieldByName('iv_valor').AsString;
       edtQtd.Text := FieldByName('iv_qtd').AsString;
       edtVlTotal.Text := FieldByName('iv_vltotal').AsString;
       If FieldByName('iv_pagamento').AsString = 'SIM' then begin
          CheckBox1.Checked := True;
       end
       else begin
          CheckBox1.Checked := False;
       end;
       edtVlProd.Text := FormatCurr('0.00', StrToCurr(edtVlProd.Text));
       edtVlTotal.Text := FormatCurr('0.00', StrToCurr(edtVlTotal.Text));
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    CheckBox1.SetFocus;
end;

procedure TfrmVendaProduto.btnIncluirProdClick(Sender: TObject);
var vPagamento : String;
    nNovo : Integer;
begin
    If edtCod.Text <> '' then begin
       If Estoque = 'Liberado' then begin
          If cbxProd.Text <> '' then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             nNovo := fBuscaCodIVenda + 1;
             edtCodIten.Text := IntToStr(nNovo);
             vPagamento := fPagamento;
             fConvertVlProd;
             fConvertQtd;
             fConvertVlTotal;
             With dmLocadora.zqLocadora do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Insert into itens_venda (IV_COD, V_COD, P_COD, IV_DATA, IV_QTD, IV_VALOR, IV_VLTOTAL, IV_PAGAMENTO) values ('+QuotedStr(edtCodIten.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodProd.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlProd.Text)+', '+QuotedStr(edtVlTotal.Text)+', '+QuotedStr(vPagamento)+')');
                ExecSQL;
                fConvertVlProd;
                fConvertQtd;
                fConvertVlTotal;
                If CheckBox1.Checked = False then begin
                   SomaProdutos;
                end
                else begin
                   edtSaldo.Text := '0,00'
                end;
                fConvertSaldo;
                Active := False;
                SQL.Clear;
                SQL.Add('Update vendas set V_SALDO = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
                fConvertSaldo;
                BaixarEstoque;
                Application.MessageBox('Produto Incluído com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
             ShortDateFormat := 'dd/mm/yyyy';
             With dmLocadora.zqLocadora do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select IV.iv_cod, IV.iv_data, P.p_nome, IV.iv_qtd, IV.iv_vltotal, IV.iv_pagamento from produtos P, itens_venda IV where P.p_cod = IV.p_cod and IV.v_cod = '+QuotedStr(edtCod.Text)+' order by iv_cod desc');
                Active := True;
                DBGrid1.DataSource.Enabled := True;
                Open;
                (FieldByName('iv_vltotal') as TNumericField).DisplayFormat := ',0.00';
                DBGrid1.Columns.Items[0].FieldName := FieldByName('iv_cod').FieldName;
                DBGrid1.Columns.Items[1].FieldName := FieldByName('iv_data').FieldName;
                DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
                DBGrid1.Columns.Items[3].FieldName := FieldByName('iv_qtd').FieldName;
                DBGrid1.Columns.Items[4].FieldName := FieldByName('iv_vltotal').FieldName;
                DBGrid1.Columns.Items[5].FieldName := FieldByName('iv_pagamento').FieldName;
             end;
             edtCodIten.Clear; edtCodProd.Clear; cbxProd.Text := ''; edtQtd.Text := '0'; edtVlTotal.Text := '0,00'; edtVlProd.Text := '0,00';
             CheckBox1.Checked := False;
             dtpData.Date := Date;
             cbxProd.SetFocus;
          end
          else begin
             Application.MessageBox('O campo Produto não pode estar vazio!','Rental - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end
       else begin
          cbxProd.SetFocus;
       end;
    end
    else begin
       Application.MessageBox('O campo Código da Venda não pode estar vazio. Clique em Novo, selecione um Cliente e depois clique em Incluir para registrar.','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmVendaProduto.SomaProdutos;
var vVlVenda, vSaldo : Double;
begin
    vVlVenda := StrToFloat(edtVlTotal.Text);
    vSaldo := StrToFloat(edtSaldo.Text);
    edtSaldo.Text :=  FloatToStr(vSaldo+vVlVenda);
    edtSaldo.Text := FormatCurr(',0.00', StrToFloat(edtSaldo.Text));
end;

procedure TfrmVendaProduto.btnAtualizarFilmeClick(Sender: TObject);
var vPagamento : String;
begin
    If cbxProd.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       vPagamento := fPagamento;
       fConvertVlProd;
       fConvertQtd;
       fConvertVlTotal;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update itens_venda set IV_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', P_COD = '+QuotedStr(edtCodProd.Text)+', IV_PAGAMENTO = '+QuotedStr(vPagamento)+' where iv_cod = '+QuotedStr(edtCodIten.Text)+'');
          ExecSQL;
          fConvertVlProd;
          fConvertQtd;
          fConvertVlTotal;
          If CheckBox1.Checked = False then begin
             SomaProdutos;
          end
          else begin
             SubtrairProdutos;
          end;
          fConvertSaldo;
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set V_SALDO = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertSaldo;
          Application.MessageBox('Produto Atualizado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select IV.iv_cod, IV.iv_data, P.p_nome, IV.iv_qtd, IV.iv_vltotal, IV.iv_pagamento from produtos P, itens_venda IV where P.p_cod = IV.p_cod and IV.v_cod = '+QuotedStr(edtCod.Text)+' order by iv_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('iv_vltotal') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('iv_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('iv_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('iv_qtd').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('iv_vltotal').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('iv_pagamento').FieldName;
       end;
       edtCodIten.Clear; edtCodProd.Clear; cbxProd.Text := ''; edtQtd.Text := '0'; edtVlTotal.Text := '0,00'; edtVlProd.Text := '0,00';
       dtpData.Date := Date;
       CheckBox1.Checked := False;
       cbxProd.SetFocus;
    end
    else begin
       Application.MessageBox('O campo Produto não pode estar vazio!','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmVendaProduto.btnExcluirFilmeClick(Sender: TObject);
begin
    If edtCodIten.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','Rental - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from itens_venda where iv_cod = '+ QuotedStr(edtCodIten.Text)+'');
             ExecSQL;
             If edtSaldo.Text <> '0,00' then begin
                SubtrairProdutos;
                fConvertSaldo;
                Active := False;
                SQL.Clear;
                SQL.Add('Update vendas set V_SALDO = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
                fConvertSaldo;
             end;
             EstornarEstoque;
             Application.MessageBox('Produto Excluido com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
       end;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select IV.iv_cod, IV.iv_data, P.p_nome, IV.iv_qtd, IV.iv_vltotal, IV.iv_pagamento from produtos P, itens_venda IV where P.p_cod = IV.p_cod and IV.v_cod = '+QuotedStr(edtCod.Text)+' order by iv_cod desc');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('iv_vltotal') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('iv_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('iv_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('iv_qtd').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('iv_vltotal').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('iv_pagamento').FieldName;
       end;
       edtCodIten.Clear; edtCodProd.Clear; cbxProd.Text := ''; edtQtd.Text := '0'; edtVlTotal.Text := '0,00'; edtVlProd.Text := '0,00';
       dtpData.Date := Date;
       CheckBox1.Checked := False;
       cbxProd.SetFocus;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmVendaProduto.SubtrairProdutos;
var vVlVenda, vSaldo : Double;
begin
    vVlVenda := StrToFloat(edtVlTotal.Text);
    vSaldo := StrToFloat(edtSaldo.Text);
    edtSaldo.Text :=  FloatToStr(vSaldo-vVlVenda);
    edtSaldo.Text := FormatCurr(',0.00', StrToFloat(edtSaldo.Text));
end;

procedure TfrmVendaProduto.btnPagamentoClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmPagarProduto, frmPagarProduto);
      frmPagarProduto.ShowModal;
    Finally
         frmPagarProduto.Free;
    end;
end;

procedure TfrmVendaProduto.btnCalcClick(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

end.
