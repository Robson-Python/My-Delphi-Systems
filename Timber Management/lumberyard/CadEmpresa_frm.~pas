unit CadEmpresa_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Mask, ExtDlgs, Jpeg;

type
  TfrmCadEmpresa = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtIE: TLabeledEdit;
    edtEnd: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    lblUf: TLabel;
    cbxNome: TComboBox;
    lblNome: TLabel;
    mkeCep: TMaskEdit;
    lblCep: TLabel;
    Shape1: TShape;
    mkeCpfj: TMaskEdit;
    Label1: TLabel;
    mkeFone: TMaskEdit;
    lblFone: TLabel;
    edtMail: TLabeledEdit;
    edtIbama: TLabeledEdit;
    Label2: TLabel;
    edtId: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtPlacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure mmObsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses Carro_Comando_dm, ADODB, DB, DateUtils, Principal_frm;

{$R *.dfm}

function fBuscaCodEmpresa() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from empresa');
       Active := True;
       fBuscaCodEmpresa := FieldByName('ultimo').AsInteger;
    end;
end;

procedure TfrmCadEmpresa.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadEmpresa.btnLimparClick(Sender: TObject);
begin
    cbxNome.Clear; edtIE.Clear; edtEnd.Clear; edtBairro.Clear; edtCid.Clear; mkeCep.Clear; cbxUf.Text := ''; edtId.Clear;
    mkeCpfj.Clear; mkeCpfj.Clear; mkeFone.Clear; edtMail.Clear; edtIbama.Clear;
    FormCreate(Sender);
    mkeCpfj.SetFocus;
    dmVendas.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadEmpresa.FormShow(Sender: TObject);
begin
    mkeCpfj.SetFocus;
end;

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresa order by razaoSocial');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('razaoSocial').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadEmpresa.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodEmpresa + 1;
    If mkeCpfj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into empresa (id, bairro, cep, cidade, cnpj, email, endereco, inscricaoEstadual, razaoSocial, registroIbama, telefone, uf) Values ('+IntToStr(nNovo)+', '+ QuotedStr(edtBairro.Text)+', '+ QuotedStr(mkeCep.Text)+', '+ QuotedStr(edtCid.Text)+', '+QuotedStr(mkeCpfj.Text)+', '+QuotedStr(edtMail.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtIE.Text)+', '+QuotedStr(cbxNome.Text)+', '+QuotedStr(edtIbama.Text)+', '+QuotedStr(mkeFone.Text)+', '+ QuotedStr(cbxUf.Text)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
//      end;
//    end
    else begin
       Application.MessageBox('O campo CNPJ não pode estar vazio!','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadEmpresa.btnSelecionarClick(Sender: TObject);
begin
    If cbxNome.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from empresa where razaoSocial = '+ QuotedStr(cbxNome.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Controle de Toras - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.SetFocus;
          end
          else begin
             edtId.Text := FieldByName('id').AsString;
             mkeCpfj.Text := FieldByName('cnpj').AsString;
             cbxNome.Text := FieldByName ('razaoSocial').AsString;
             edtIE.Text := FieldByName ('inscricaoEstadual').AsString;
             edtEnd.Text := FieldByName ('endereco').AsString;
             edtBairro.Text := FieldByName ('bairro').AsString;
             edtCid.Text := FieldByName ('cidade').AsString;
             cbxUf.Text := FieldByName ('uf').AsString;
             mkeCep.Text := FieldByName ('cep').AsString;
             mkeFone.Text := FieldByName ('telefone').AsString;
             edtMail.Text := FieldByName('email').AsString;
             edtIbama.Text := FieldByName('registroIbama').AsString;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o nome da Empresa.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
    cbxNome.SetFocus;
end;

procedure TfrmCadEmpresa.edtPlacaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       If mkeCpfj.Text <> '' then begin
           With dmVendas.ADOQuery1 do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Select * from empresas where e_cnpj = '+ QuotedStr(mkeCpfj.Text));
              Active := True;
              If RecordCount = 0 then begin
                 Application.MessageBox('Registro não encontrado...','Controle de Toras - Informação',MB_OK+MB_ICONINFORMATION);
                 cbxNome.SetFocus;
              end
              else begin
                 mkeCpfj.Text := FieldByName('e_cnpj').AsString;
                 cbxNome.Text := FieldByName ('e_rsocial').AsString;
                 edtIE.Text := FieldByName ('e_iestadual').AsString;
                 edtEnd.Text := FieldByName ('e_endereco').AsString;
                 edtBairro.Text := FieldByName ('e_bairro').AsString;
                 edtCid.Text := FieldByName ('e_cidade').AsString;
                 cbxUf.Text := FieldByName ('e_uf').AsString;
                 mkeCep.Text := FieldByName ('e_cep').AsString;
                 mkeFone.Text := FieldByName ('e_fone').AsString;
                 edtMail.Text := FieldByName('e_email').AsString;
                 edtIbama.Text := FieldByName('e_reg_ibama').AsString;
              end;
           end;
       end
       else begin
          Application.MessageBox('Digite o número do CNPJ.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end;
end;

procedure TfrmCadEmpresa.cbxNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Sender);
end;

procedure TfrmCadEmpresa.btnAtualizarClick(Sender: TObject);
begin
    If mkeCpfj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update empresa set cnpj = '+ QuotedStr(mkeCpfj.Text)+', razaoSocial = '+ QuotedStr(cbxNome.Text)+', inscricaoEstadual = '+ QuotedStr(edtIE.Text)+', endereco = '+ QuotedStr(edtEnd.Text)+', bairro = '+ QuotedStr(edtBairro.Text)+', cidade = '+QuotedStr(edtCid.Text)+', uf = '+ QuotedStr(cbxUf.Text)+', cep = '+ QuotedStr(mkeCep.Text)+', telefone = '+ QuotedStr(mkeFone.Text)+', email = '+QuotedStr(edtMail.Text)+', registroIbama = '+QuotedStr(edtIbama.Text)+' where cnpj = '+ QuotedStr(mkeCpfj.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnSelecionarClick(Sender);
          end;
       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Madeira Fácil - Atenção',MB_OK+MB_ICONSTOP);
//       end;
//    end
    else begin
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione uma Empresa para atualizar dados.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadEmpresa.btnDeletarClick(Sender: TObject);
begin
    If mkeCpfj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Controle de Toras - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from empresa where cnpj = '+ QuotedStr(mkeCpfj.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Controle de Toras - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione uma Empresa para poder deletar.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadEmpresa.mmObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

end.
