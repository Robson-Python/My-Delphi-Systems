unit CadFornec_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, Buttons;

type
  TfrmCadFornec = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtEnd: TLabeledEdit;
    edtBai: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    lblUf: TLabel;
    edtContato: TLabeledEdit;
    lblFone: TLabel;
    mkeFone: TMaskEdit;
    lblFax: TLabel;
    mkeFax: TMaskEdit;
    edtMail: TLabeledEdit;
    mkeCep: TMaskEdit;
    lblCep: TLabel;
    cbxForn: TComboBox;
    lblForn: TLabel;
    lblObs: TLabel;
    mmObs: TMemo;
    mkeCnpj: TMaskEdit;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    lblSetor: TLabel;
    cbxSetor: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure mmObsKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornec: TfrmCadFornec;

implementation

uses Carro_Comando_dm, Principal_frm;

{$R *.dfm}

function sStatus() : String;
begin
    If frmCadFornec.RadioGroup1.ItemIndex = 1 then
       sStatus := 'PJ'
    else
       sStatus := 'PF'
end;

procedure TfrmCadFornec.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadFornec.btnLimparClick(Sender: TObject);
begin
    mkeCnpj.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtContato.Clear; edtMail.Clear;
    cbxUf.Text := ''; mkeCnpj.EditMask := ''; cbxForn.Clear; cbxSetor.Clear;
    mkeFone.Clear; mkeFax.Clear; mkeCep.Clear; mmObs.Clear;
    RadioGroup1.ItemIndex := -1;
    FormCreate(Sender);
    dmVendas.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadFornec.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from fornecedores order by f_nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('f_nome').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from categoria order by t_ramo');
       Active := True;
       while not Eof do begin
          cbxSetor.Items.Add(FieldByName('t_ramo').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadFornec.FormShow(Sender: TObject);
begin
    mkeCnpj.SetFocus;
end;

procedure TfrmCadFornec.btnInserirClick(Sender: TObject);
var sTipo : String;
begin
    sTipo := sStatus;
    If mkeCnpj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into fornecedores (F_CNPJ, F_NOME, F_CONTATO, F_END, F_BAIRRO, F_MUN, F_UF, F_CEP, F_FONE, F_FAX, F_MAIL, F_OBS, F_TIPO, F_SETOR) Values ('+QuotedStr(mkeCnpj.Text)+', '+QuotedStr(cbxForn.Text)+', '+ QuotedStr(edtContato.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtBai.Text)+', '+ QuotedStr(edtCid.Text)+', '+ QuotedStr(cbxUf.Text)+', '+ QuotedStr(mkeCep.Text)+', '+ QuotedStr(mkeFone.Text)+', '+ QuotedStr(mkeFax.Text)+', '+ QuotedStr(edtMail.Text)+', '+QuotedStr(mmObs.Text)+', '+QuotedStr(sTipo)+', '+QuotedStr(cbxSetor.Text)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
//       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Madeira Fácil - Atenção',MB_OK+MB_ICONSTOP);
//      end;
    end
    else begin
       Application.MessageBox('O campo CNPJ não pode estar vazio!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFornec.btnSelecionarClick(Sender: TObject);
begin
    If cbxForn.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from fornecedores where f_nome = '+ QuotedStr(cbxForn.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Sistema Almoxarifado - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxForn.SetFocus;
          end
          else begin
             mkeCnpj.Text := FieldByName ('f_cnpj').AsString;
             cbxForn.Text := FieldByName ('f_nome').AsString;
             edtContato.Text := FieldByName ('f_contato').AsString;
             edtEnd.Text := FieldByName ('f_end').AsString;
             edtBai.Text := FieldByName ('f_bairro').AsString;
             edtCid.Text := FieldByName ('f_mun').AsString;
             cbxUf.Text := FieldByName ('f_uf').AsString;
             mkeCep.Text := FieldByName ('f_cep').AsString;
             mkeFone.Text := FieldByName ('f_fone').AsString;
             mkeFax.Text := FieldByName ('f_fax').AsString;
             edtMail.Text := FieldByName ('f_mail').AsString;
             cbxSetor.Text := FieldByName('f_setor').AsString;
             mmObs.Text := FieldByName ('f_obs').AsString;
             If FieldByName('f_tipo').AsString = 'PF' then begin
                RadioGroup1.ItemIndex := 0;
                mkeCnpj.Text := FieldByName ('f_cnpj').AsString;
             end
             else begin
                RadioGroup1.ItemIndex := 1;
                mkeCnpj.Text := FieldByName ('f_cnpj').AsString;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o Fornecedor.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
    cbxForn.SetFocus;
end;

procedure TfrmCadFornec.btnAtualizarClick(Sender: TObject);
var sTipo : String;
begin
    If mkeCnpj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update fornecedores set f_cnpj = '+ QuotedStr(mkeCnpj.Text)+', f_nome = '+ QuotedStr(cbxForn.Text)+', f_contato = '+ QuotedStr(edtContato.Text)+', f_end = '+ QuotedStr(edtEnd.Text)+', f_bairro = '+ QuotedStr(edtBai.Text)+', f_mun = '+ QuotedStr(edtCid.Text)+', f_uf = '+ QuotedStr(cbxUf.Text)+', f_cep = '+ QuotedStr(mkeCep.Text)+', f_fone = '+ QuotedStr(mkeFone.Text)+', f_fax = '+ QuotedStr(mkeFax.Text)+', f_mail = '+ QuotedStr(edtMail.Text)+', f_obs = '+QuotedStr(mmObs.Text)+', f_tipo = '+QuotedStr(sTipo)+', f_setor = '+QuotedStr(cbxSetor.Text)+' where f_cnpj = '+ QuotedStr(mkeCnpj.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Atualizado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnSelecionarClick(Sender);
          end;
       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Madeira Fácil - Atenção',MB_OK+MB_ICONSTOP);
//       end;
//    end
    else begin
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione um Fornecedor para atualizar dados.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFornec.btnDeletarClick(Sender: TObject);
begin
    If mkeCnpj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Madeira Fácil - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from fornecedores where f_cnpj = '+ QuotedStr(mkeCnpj.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione um Fornecedor para poder deletar.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFornec.mmObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadFornec.RadioGroup1Click(Sender: TObject);
begin
    If RadioGroup1.ItemIndex = 0 then begin
       mkeCnpj.Clear;
       mkeCnpj.EditMask := '';
       mkeCnpj.EditMask := '000.000.000-00';
    end
    else begin
       mkeCnpj.Clear;
       mkeCnpj.EditMask := '';
       mkeCnpj.EditMask := '00.000.000/0000-00'
    end;
    mkeCnpj.SetFocus;
end;

end.
