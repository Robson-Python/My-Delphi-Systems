unit Produtos_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmProdutos = class(TForm)
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
    Label1: TLabel;
    edtCod: TLabeledEdit;
    edtEntrada: TLabeledEdit;
    edtEstoque: TLabeledEdit;
    edtCusto: TLabeledEdit;
    cbxProduto: TComboBox;
    mmObs: TMemo;
    edtMargem: TLabeledEdit;
    edtValor: TLabeledEdit;
    edtTotal: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtEntradaExit(Sender: TObject);
    procedure edtMargemExit(Sender: TObject);
    procedure edtCustoExit(Sender: TObject);
    procedure edtTotalExit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

uses Locadora_dm;

{$R *.dfm}

function fBuscaCodProd() : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_cod from produtos order by p_cod desc');
       Active := True;
       fBuscaCodProd := FieldByName('p_cod').AsInteger;
    end;
end;

function fConvertTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmProdutos.edtTotal.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmProdutos.edtTotal.Text := valor;
end;

function fConvertCusto() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmProdutos.edtCusto.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmProdutos.edtCusto.Text := valor;
end;

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmProdutos.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmProdutos.edtValor.Text := valor;
end;

procedure TfrmProdutos.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmProdutos.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtEntrada.Text := '0'; edtEstoque.Text := '0'; edtCusto.Text := '0,00'; edtMargem.Text := '0'; edtValor.Text := '0,00'; edtTotal.Text := '0,00';
    cbxProduto.Text := '';
    mmObs.Clear;
    cbxProduto.SetFocus;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_nome from produtos order by p_nome');
       Active := True;
       while not Eof do begin
          cbxProduto.Items.Add(FieldByName('p_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodProd + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxProduto.SetFocus;
end;

procedure TfrmProdutos.edtEntradaExit(Sender: TObject);
var vEntrada, vEstoque : Double;
begin
    If edtEntrada.Text <> '0' then begin
       vEntrada := StrToFloat(edtEntrada.Text);
       vEstoque := StrToFloat(edtEstoque.Text);
       edtEstoque.Text := FloatToStr(vEntrada+vEstoque);
       edtTotal.SetFocus;
    end;
end;

procedure TfrmProdutos.edtMargemExit(Sender: TObject);
var vCusto, vLucro : Double;
begin
    If edtMargem.Text <> '0' then begin
       vCusto := StrToFloat(edtCusto.Text);
       vLucro := StrToFloat(edtMargem.Text);
       edtValor.Text := FloatToStr(((vCusto*vLucro)/100)+vCusto);
       mmObs.SetFocus;
       If edtValor.Text <> '0,00' then begin
       edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
       end
       else begin
          edtValor.Text := '0,00';
       end;
    end;
end;

procedure TfrmProdutos.edtCustoExit(Sender: TObject);
begin
    If edtCusto.Text <> '0,00' then begin
       edtCusto.Text := FormatCurr('0.00', StrToFloat(edtCusto.Text));
    end
    else begin
       edtCusto.Text := '0,00';
    end;
end;

procedure TfrmProdutos.edtTotalExit(Sender: TObject);
var vEntrada, vTotal : Double;
begin
    If edtTotal.Text <> '0,00' then begin
       vEntrada := StrToFloat(edtEntrada.Text);
       vTotal := StrToFloat(edtTotal.Text);
       edtCusto.Text := FloatToStr(vTotal/vEntrada);
       edtTotal.Text := FormatCurr('0.00', StrToFloat(edtTotal.Text));
       If edtCusto.Text <> '0,00' then begin
          edtCusto.Text := FormatCurr('0.00', StrToFloat(edtCusto.Text));
       end
       else begin
          edtCusto.Text := '0,00';
       end;
       edtMargem.SetFocus;
    end;
end;

procedure TfrmProdutos.btnInserirClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       fConvertValor;
       fConvertTotal;
       fConvertCusto;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into produtos (P_COD, P_NOME, P_ENTRADA, P_QTD, P_VTOTAL, P_CUSTO, P_MARGEM, P_VALOR, P_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxProduto.Text)+', '+QuotedStr(edtEntrada.Text)+', '+QuotedStr(edtEstoque.Text)+', '+QuotedStr(edtTotal.Text)+', '+QuotedStr(edtCusto.Text)+', '+QuotedStr(edtMargem.Text)+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(mmObs.Text)+')');
          ExecSQL;
       end;
       fConvertValor;
       fConvertTotal;
       fConvertCusto;
       btnLimparClick(Self);
       cbxProduto.Clear;
       FormCreate(Self);
       Application.MessageBox('Registro Efetuado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo código.','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmProdutos.btnSelecionarClick(Sender: TObject);
begin
    If cbxProduto.Text <> '' then begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from produtos where p_nome = '+QuotedStr(cbxProduto.Text)+'');
          Active := True;
          If dmLocadora.zqLocadora.RecordCount = 0 then begin
             ShowMessage('Produto não cadastrado.');
          end
          else begin
             edtCod.Text := FieldByName('p_cod').AsString;
             cbxProduto.Text := FieldByName('p_nome').AsString;
             edtEntrada.Text := FieldByName('p_entrada').AsString;
             edtEstoque.Text := FieldByName('p_qtd').AsString;
             edtTotal.Text := FieldByName('p_vtotal').AsString;
             edtCusto.Text := FieldByName('p_custo').AsString;
             edtMargem.Text := FieldByName('p_margem').AsString;
             edtValor.Text := FieldByName('p_valor').AsString;
             mmObs.Text := FieldByName('p_obs').AsString;
          end;
       end;
       edtTotal.Text := FormatCurr('0.00', StrToFloat(edtTotal.Text));
       edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
       edtCusto.Text := FormatCurr('0.00', StrToFloat(edtCusto.Text));
    end
    else begin
       Application.MessageBox('O campo Nome não pode estar vazio!','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
    cbxProduto.SetFocus;
end;

procedure TfrmProdutos.btnAtualizarClick(Sender: TObject);
begin
    If cbxProduto.Text <> '' then begin
       fConvertValor;
       fConvertTotal;
       fConvertCusto;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update produtos set P_NOME = '+QuotedStr(cbxProduto.Text)+', P_ENTRADA = '+QuotedStr(edtEntrada.Text)+', P_QTD = '+QuotedStr(edtEstoque.Text)+', P_VTOTAL = '+QuotedStr(edtTotal.Text)+', P_CUSTO = '+QuotedStr(edtCusto.Text)+', P_MARGEM = '+QuotedStr(edtMargem.Text)+', P_VALOR = '+QuotedStr(edtValor.Text)+', P_OBS = '+QuotedStr(mmObs.Text)+' where P_COD = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertValor;
          fConvertTotal;
          fConvertCusto;
          Application.MessageBox('Registro Atualizado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('O campo Nome não pode estar vazio!','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmProdutos.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','Rental - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from produtos where p_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
          end;
          btnLimparClick(Self);
          cbxProduto.Clear;
          FormCreate(Self);
          Application.MessageBox('Registro Excluido com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

end.
