unit Clientes_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Grids, DBGrids,
  DBCtrls, QuickRpt, QRCtrls;

type
  TfrmClientes = class(TForm)
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
    Label3: TLabel;
    dtpData: TDateTimePicker;
    Label4: TLabel;
    edtCod: TEdit;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    QRShape3: TQRShape;
    btnPessoa: TSpeedButton;
    Edit1: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses Enterprise_dm, Principal_frm, DB;

{$R *.dfm}

function fBuscaCodCli() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_cod from clientes order by c_cod desc');
       Active := True;
       fBuscaCodCli := FieldByName('c_cod').AsInteger;
    end;
end;

function CpfCnpj() : String;
var valor : String;
    tamanho, i, Count : Integer;
begin
    valor := frmClientes.Edit1.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    Count := i;
    end;
    If Count = 14 then begin
       frmClientes.mkeCpf.EditMask := '000.000.000-00;1;_';
       frmClientes.btnPessoa.Caption := 'F';
    end
    else begin
       frmClientes.mkeCpf.EditMask := '00.000.000/0000-00;1;_';
       frmClientes.btnPessoa.Caption := 'J';
    end;
end;

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmClientes.btnLimparClick(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    edtCod.Clear; edtEndereco.Clear; edtBairro.Clear; edtCidade.Clear;
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
    With dmEnterprise.zqEnterprise do begin
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
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       If edtCod.Text <> '' then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into clientes (C_COD, C_DATA, C_NOME, C_CPF, C_ENDERECO, C_BAIRRO, C_CIDADE, C_UF, C_FONE, C_CELULAR, C_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(cbxNome.Text)+', '+QuotedStr(mkeCpf.Text)+', '+QuotedStr(edtEndereco.Text)+', '+QuotedStr(edtBairro.Text)+', '+QuotedStr(edtCidade.Text)+', '+QuotedStr(cbxUf.Text)+', '+QuotedStr(mkeFone.Text)+', '+QuotedStr(mkeCelular.Text)+', '+QuotedStr(mmObs.Text)+')');
             ExecSQL;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          btnLimparClick(Self);
          cbxNome.Clear;
          FormCreate(Self);
          Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       end
       else begin
          Application.MessageBox('O campo Código não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmClientes.btnAtualizarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       If cbxNome.Text <> '' then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update clientes set C_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', C_NOME = '+QuotedStr(cbxNome.Text)+', C_CPF = '+QuotedStr(mkeCpf.Text)+', C_ENDERECO = '+QuotedStr(edtEndereco.Text)+', C_BAIRRO = '+QuotedStr(edtBairro.Text)+', C_CIDADE = '+QuotedStr(edtCidade.Text)+', C_UF = '+QuotedStr(cbxUf.Text)+', C_FONE = '+QuotedStr(mkeFone.Text)+', C_CELULAR = '+QuotedStr(mkeCelular.Text)+', C_OBS = '+QuotedStr(mmObs.Text)+' where C_COD = '+QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
       end
       else begin
          Application.MessageBox('O campo Nome não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmClientes.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtCod.Text <> '' then begin
          If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from clientes where c_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
             end;
             btnLimparClick(Self);
             cbxNome.Clear;
             FormCreate(Self);
             Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
       end
       else begin
          Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyOfficer - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmClientes.btnSelecionarClick(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_cod, c_nome, c_cpf from clientes order by c_nome');
       Active := True;
       dmEnterprise.dsEnterprise.Enabled := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('c_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('c_nome').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('c_cpf').FieldName;
    end;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    dtpData.Date := Date;
    cbxNome.SetFocus
end;

procedure TfrmClientes.cbxNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       If cbxNome.Text <> '' then begin
          dmEnterprise.dsEnterprise.Enabled := False;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from clientes where c_nome = '+QuotedStr(cbxNome.Text)+'');
             Active := True;
             If dmEnterprise.zqEnterprise.RecordCount = 0 then begin
                ShowMessage('Cliente não cadastrado.');
             end
             else begin
                edtCod.Text := FieldByName('c_cod').AsString;
                dtpData.Date := FieldByName('c_data').AsDateTime;
                cbxNome.Text := FieldByName('c_nome').AsString;
                Edit1.Text := FieldByName('c_cpf').AsString;
                edtEndereco.Text := FieldByName('c_endereco').AsString;
                edtBairro.Text := FieldByName('c_bairro').AsString;
                edtCidade.Text := FieldByName('c_cidade').AsString;
                cbxUf.Text := FieldByName('c_uf').AsString;
                mkeFone.Text := FieldByName('c_fone').AsString;
                mkeCelular.Text := FieldByName('c_celular').AsString;
                mmObs.Text := FieldByName('c_obs').AsString;
             end;
             CpfCnpj;
             mkeCpf.Text := Edit1.Text;
          end;
       end
       else begin
          Application.MessageBox('O campo Nome não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end;
end;

procedure TfrmClientes.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from clientes where c_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
       edtCod.Text := FieldByName('c_cod').AsString;
       dtpData.Date := FieldByName('c_data').AsDateTime;
       cbxNome.Text := FieldByName('c_nome').AsString;
       Edit1.Text := FieldByName('c_cpf').AsString;
       edtEndereco.Text := FieldByName('c_endereco').AsString;
       edtBairro.Text := FieldByName('c_bairro').AsString;
       edtCidade.Text := FieldByName('c_cidade').AsString;
       cbxUf.Text := FieldByName('c_uf').AsString;
       mkeFone.Text := FieldByName('c_fone').AsString;
       mkeCelular.Text := FieldByName('c_celular').AsString;
       mmObs.Text := FieldByName('c_obs').AsString;
    end;
    CpfCnpj;
    mkeCpf.Text := Edit1.Text;
    cbxNome.SetFocus;
end;

procedure TfrmClientes.btnPessoaClick(Sender: TObject);
begin
    If btnPessoa.Caption = 'F' then begin
       mkeCpf.EditMask := '00.000.000/0000-00;1;_';
       btnPessoa.Caption := 'J';
       btnPessoa.Hint := 'Pessoa Jurídica';
    end
    else begin
       mkeCpf.EditMask := '000.000.000-00;1;_';
       btnPessoa.Caption := 'F';
       btnPessoa.Hint := 'Pessoa Física';
    end;
end;

procedure TfrmClientes.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid1.DataSource.Enabled = True then begin
       DBGrid1.Hint := 'Para editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid1.Hint := '';
    end;
end;

end.
