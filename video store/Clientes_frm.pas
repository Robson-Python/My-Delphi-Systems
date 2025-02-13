unit Clientes_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Grids, DBGrids;

type
  TfrmClientes = class(TForm)
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
    lblUf: TLabel;
    Label2: TLabel;
    edtCod: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    cbxUf: TComboBox;
    cbxNome: TComboBox;
    mkeCpf: TMaskEdit;
    lblFax: TLabel;
    mkeFone: TMaskEdit;
    mkeCelular: TMaskEdit;
    lblFone: TLabel;
    lblCelular: TLabel;
    mmObs: TMemo;
    Label1: TLabel;
    edtSaldo: TLabeledEdit;
    Label3: TLabel;
    dtpData: TDateTimePicker;
    DBGrid1: TDBGrid;
    Shape3: TShape;
    Panel2: TPanel;
    Panel4: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses Locadora_dm;

{$R *.dfm}

function fBuscaCodCli() : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_cod from clientes order by c_cod desc');
       Active := True;
       fBuscaCodCli := FieldByName('c_cod').AsInteger;
    end;
end;

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmClientes.edtSaldo.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmClientes.edtSaldo.Text := valor;
end;

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmClientes.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtEndereco.Clear; edtBairro.Clear; edtCidade.Clear; edtSaldo.Text := '0,00';
    cbxNome.Text := ''; cbxUf.Text := '';
    mkeCpf.Clear; mkeFone.Clear; mkeCelular.Clear;
    mmObs.Clear;
    FormShow(Self);
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodCli + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxNome.SetFocus;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
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

procedure TfrmClientes.btnInserirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If edtCod.Text <> '' then begin
       fConvertValor;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into clientes (C_COD, C_DATA, C_NOME, C_CPF, C_ENDERECO, C_BAIRRO, C_CIDADE, C_UF, C_FONE, C_CELULAR, C_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(cbxNome.Text)+', '+QuotedStr(mkeCpf.Text)+', '+QuotedStr(edtEndereco.Text)+', '+QuotedStr(edtBairro.Text)+', '+QuotedStr(edtCidade.Text)+', '+QuotedStr(cbxUf.Text)+', '+QuotedStr(mkeFone.Text)+', '+QuotedStr(mkeCelular.Text)+', '+QuotedStr(mmObs.Text)+')');
          ExecSQL;
       end;
       fConvertValor;
       ShortDateFormat := 'dd/mm/yyyy';
       btnLimparClick(Self);
       cbxNome.Clear;
       FormCreate(Self);
       Application.MessageBox('Registro Efetuado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode estar vazio!','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmClientes.btnAtualizarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If cbxNome.Text <> '' then begin
       fConvertValor;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update clientes set C_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', C_NOME = '+QuotedStr(cbxNome.Text)+', C_CPF = '+QuotedStr(mkeCpf.Text)+', C_ENDERECO = '+QuotedStr(edtEndereco.Text)+', C_BAIRRO = '+QuotedStr(edtBairro.Text)+', C_CIDADE = '+QuotedStr(edtCidade.Text)+', C_UF = '+QuotedStr(cbxUf.Text)+', C_FONE = '+QuotedStr(mkeFone.Text)+', C_CELULAR = '+QuotedStr(mkeCelular.Text)+', C_OBS = '+QuotedStr(mmObs.Text)+' where C_COD = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertValor;
          Application.MessageBox('Registro Atualizado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('O campo Nome n�o pode estar vazio!','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmClientes.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','Rental - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from clientes where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
          end;
          btnLimparClick(Self);
          cbxNome.Clear;
          FormCreate(Self);
          Application.MessageBox('Registro Excluido com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode ser vazio! Selecione um registro para poder excluir.','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmClientes.btnSelecionarClick(Sender: TObject);
begin
    If cbxNome.Text <> '' then begin
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from clientes where c_nome = '+QuotedStr(cbxNome.Text)+'');
          Active := True;
          If dmLocadora.zqLocadora.RecordCount = 0 then begin
             ShowMessage('Cliente n�o cadastrado.');
          end
          else begin
             edtCod.Text := FieldByName('c_cod').AsString;
             dtpData.Date := FieldByName('c_data').AsDateTime;
             cbxNome.Text := FieldByName('c_nome').AsString;
             mkeCpf.Text := FieldByName('c_cpf').AsString;
             edtEndereco.Text := FieldByName('c_endereco').AsString;
             edtBairro.Text := FieldByName('c_bairro').AsString;
             edtCidade.Text := FieldByName('c_cidade').AsString;
             cbxUf.Text := FieldByName('c_uf').AsString;
             mkeFone.Text := FieldByName('c_fone').AsString;
             mkeCelular.Text := FieldByName('c_celular').AsString;
             mmObs.Text := FieldByName('c_obs').AsString;
          end;
       end;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select l_saldo from locacoes where c_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          edtSaldo.Text := FieldByName('l_saldo').AsString;
          If edtSaldo.Text <> '' then begin
             edtSaldo.Text := FormatCurr(',0.00', StrToFloat(edtSaldo.Text));
          end
          else begin
             edtSaldo.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select L.c_cod, IL.f_cod, F.f_nome, IL.il_data, IL.il_devolucao, IL.il_pagamento from itens_locacao IL, filmes F, locacoes L where L.c_cod = '+QuotedStr(edtCod.Text)+' and IL.f_cod = F.f_cod and L.l_cod = IL.l_cod and IL.il_devolucao = ''N�O'' order by F.f_nome');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('f_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('f_nome').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('il_data').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('il_devolucao').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('il_pagamento').FieldName;
       end;
    end
    else begin
       Application.MessageBox('O campo Nome n�o pode estar vazio!','Rental - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    dtpData.Date := Date;
    edtSaldo.Text := '0,00';
    cbxNome.SetFocus
end;

end.
