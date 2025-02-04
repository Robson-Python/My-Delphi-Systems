unit CadFornec_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, Buttons;

type
  TfrmCadFornec = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtCnpj: TLabeledEdit;
    lblSetor: TLabel;
    cbxSetor: TComboBox;
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
    edtSite: TLabeledEdit;
    mkeCep: TMaskEdit;
    lblCep: TLabel;
    cbxForn: TComboBox;
    lblForn: TLabel;
    edtMsn: TLabeledEdit;
    edtVoip: TLabeledEdit;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtVoipDblClick(Sender: TObject);
    procedure edtMsnDblClick(Sender: TObject);
    procedure edtSiteDblClick(Sender: TObject);
    procedure edtMsnMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtVoipMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornec: TfrmCadFornec;

implementation

uses Carro_Comando_dm, Principal_frm, comobj;

{$R *.dfm}

procedure TfrmCadFornec.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadFornec.btnLimparClick(Sender: TObject);
begin
    edtCnpj.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtContato.Clear; edtMail.Clear; edtSite.Clear; edtVoip.Clear; edtMsn.Clear;
    cbxSetor.Text := ''; cbxUf.Text := ''; cbxForn.Clear;
    mkeFone.Clear; mkeFax.Clear; mkeCep.Clear;
    FormCreate(Sender);
    cbxForn.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadFornec.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from fornecedores order by fn_nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('fn_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadFornec.FormShow(Sender: TObject);
begin
    edtCnpj.SetFocus;
end;

procedure TfrmCadFornec.btnInserirClick(Sender: TObject);
begin
    If edtCnpj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into fornecedores (CNPJ, FN_NOME, FN_SETOR, FN_END, FN_BAI, FN_CID, FN_UF, FN_CONTATO, FN_FONE, FN_FAX, FN_MAIL, FN_VOIP, FN_SITE, FN_CEP, FN_MSN) Values ('+QuotedStr(edtCnpj.Text)+','+QuotedStr(cbxForn.Text)+','+ QuotedStr(cbxSetor.Text)+','+ QuotedStr(edtEnd.Text)+','+ QuotedStr(edtBai.Text)+','+ QuotedStr(edtCid.Text)+','+ QuotedStr(cbxUf.Text)+','+ QuotedStr(edtContato.Text)+','+ QuotedStr(mkeFone.Text)+','+ QuotedStr(mkeFax.Text)+','+ QuotedStr(edtMail.Text)+','+ QuotedStr(edtVoip.Text)+','+ QuotedStr(edtSite.Text)+','+ QuotedStr(mkeCep.Text)+', '+QuotedStr(edtMsn.Text)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CNPJ não pode estar vazio!','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFornec.btnSelecionarClick(Sender: TObject);
begin
    If cbxForn.Text <> '' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from fornecedores where fn_nome = '+ QuotedStr(cbxForn.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Omega - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxForn.SetFocus;
          end
          else begin
             edtCnpj.Text := FieldByName ('cnpj').AsString;
             cbxForn.Text := FieldByName ('fn_nome').AsString;
             cbxSetor.Text := FieldByName ('fn_setor').AsString;
             edtEnd.Text := FieldByName ('fn_end').AsString;
             edtBai.Text := FieldByName ('fn_bai').AsString;
             edtCid.Text := FieldByName ('fn_cid').AsString;
             cbxUf.Text := FieldByName ('fn_uf').AsString;
             mkeCep.Text := FieldByName ('fn_cep').AsString;
             edtContato.Text := FieldByName ('fn_contato').AsString;
             mkeFone.Text := FieldByName ('fn_fone').AsString;
             mkeFax.Text := FieldByName ('fn_fax').AsString;
             edtMail.Text := FieldByName ('fn_mail').AsString;
             edtVoip.Text := FieldByName ('fn_voip').AsString;
             edtSite.Text := FieldByName ('fn_site').AsString;
             edtMsn.Text := FieldByName ('fn_msn').AsString;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o Fornecedor.','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFornec.btnAtualizarClick(Sender: TObject);
begin
    If edtCnpj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update fornecedores set cnpj = '+ QuotedStr(edtCnpj.Text)+', fn_nome = '+ QuotedStr(cbxForn.Text)+', fn_setor = '+ QuotedStr(cbxSetor.Text)+', fn_end = '+ QuotedStr(edtEnd.Text)+', fn_bai = '+ QuotedStr(edtBai.Text)+', fn_cid = '+ QuotedStr(edtCid.Text)+', fn_uf = '+ QuotedStr(cbxUf.Text)+', fn_contato = '+ QuotedStr(edtContato.Text)+', fn_fone = '+ QuotedStr(mkeFone.Text)+', fn_fax = '+ QuotedStr(mkeFax.Text)+', fn_mail = '+ QuotedStr(edtMail.Text)+', fn_voip = '+ QuotedStr(edtVoip.Text)+', fn_site = '+ QuotedStr(edtSite.Text)+', fn_cep = '+ QuotedStr(mkeCep.Text)+', fn_msn = '+QuotedStr(edtMsn.Text)+' where cnpj = '+ QuotedStr(edtCnpj.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnSelecionarClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione um Fornecedor para atualizar dados.','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFornec.btnDeletarClick(Sender: TObject);
begin
    If edtCnpj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from fornecedores where cnpj = '+ QuotedStr(edtCnpj.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione um Fornecedor para poder deletar.','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFornec.edtVoipDblClick(Sender: TObject);
begin
    If edtVoip.Text <> '' then begin
       Try
         WinExec('C:\Arquivos de programas\Skype\Phone\Skype',SW_SHOW);
       Except
           Application.MessageBox('Verifique se seu computador possui o Skype instalado!','Omega - Aviso',MB_OK+MB_ICONINFORMATION);
       end;
    end;
end;

procedure TfrmCadFornec.edtMsnDblClick(Sender: TObject);
begin
    If edtMsn.Text <> '' then begin
       Try
         WinExec('C:\Arquivos de programas\Windows Live\Messenger\msnmsgr',SW_SHOW);
       Except
           Application.MessageBox('Verifique se seu computador possui o Windows Live Messenger instalado!','Omega - Aviso',MB_OK+MB_ICONINFORMATION);
      end;
    end;
end;

procedure TfrmCadFornec.edtSiteDblClick(Sender: TObject);
var ie : Variant;
begin
    If edtSite.Text <> '' then begin
       IE := CreateOleObject('InternetExplorer.Application');
       IE.Visible := true;
       IE.Navigate(edtSite.Text);
    end;
end;

procedure TfrmCadFornec.edtMsnMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If edtMsn.Text <> '' then begin
       edtMsn.Hint := 'Dê um duplo clique aqui para abrir o MSN';
       edtMsn.ShowHint := True;
    end
    else begin
       edtMsn.Hint := '';
       edtMsn.ShowHint := False;
    end;
end;

procedure TfrmCadFornec.edtVoipMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If edtVoip.Text <> '' then begin
       edtVoip.Hint := 'Dê um duplo clique aqui para abrir o Skype';
       edtVoip.ShowHint := True;
    end
    else begin
       edtVoip.Hint := '';
       edtVoip.ShowHint := False;
    end;
end;

procedure TfrmCadFornec.edtSiteMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If edtSite.Text <> '' then begin
       edtSite.Hint := 'Dê um duplo clique aqui para localizar o site';
       edtSite.ShowHint := True;
    end
    else begin
       edtSite.Hint := '';
       edtSite.ShowHint := False;
    end;
end;

end.
