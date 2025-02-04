unit Fornecedores_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, Buttons;

type
  TfrmFornecedores = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lblSetor: TLabel;
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
    edtVoip: TLabeledEdit;
    edtSite: TLabeledEdit;
    mkeCep: TMaskEdit;
    lblCep: TLabel;
    cbxForn: TComboBox;
    lblForn: TLabel;
    btnNovo: TSpeedButton;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    Label1: TLabel;
    mkeCnpj: TMaskEdit;
    mmoObs: TMemo;
    lblRest: TLabel;
    Label2: TLabel;
    edtCod: TEdit;
    edtSetor: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtVoipDblClick(Sender: TObject);
    procedure edtVoipMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnNovoClick(Sender: TObject);
    procedure cbxFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSiteDblClick(Sender: TObject);
    procedure edtMailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtMailDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedores: TfrmFornecedores;

implementation

uses Enterprise_dm;

{$R *.dfm}

function fBuscaCodForn() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select f_cod from fornecedores order by f_cod desc');
       Active := True;
       fBuscaCodForn := FieldByName('f_cod').AsInteger;
    end;
end;

procedure TfrmFornecedores.btnSairClick(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmFornecedores.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtContato.Clear; edtMail.Clear; edtSite.Clear; edtVoip.Clear; edtSetor.Clear;
    cbxUf.Text := ''; cbxForn.Text := '';
    mkeFone.Clear; mkeFax.Clear; mkeCep.Clear; mkeCnpj.Clear;
    mmoObs.Clear;
    cbxForn.SetFocus;
    dmEnterprise.zqEnterprise.SQL.Clear;
end;

procedure TfrmFornecedores.FormCreate(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from fornecedores order by f_nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('f_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmFornecedores.FormShow(Sender: TObject);
begin
    cbxForn.SetFocus;
end;

procedure TfrmFornecedores.btnInserirClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into fornecedores (F_COD, F_NOME, F_CNPJ, F_SETOR, F_END, F_BAIRRO, F_CID, F_UF, F_CEP, F_CONTATO, F_FONE, F_FAX, F_MAIL, F_SKYPE, F_SITE, F_OBS) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxForn.Text)+', '+QuotedStr(mkeCnpj.Text)+', '+ QuotedStr(edtSetor.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtBai.Text)+', '+ QuotedStr(edtCid.Text)+', '+ QuotedStr(cbxUf.Text)+', '+QuotedStr(mkeCep.Text)+', '+ QuotedStr(edtContato.Text)+', '+ QuotedStr(mkeFone.Text)+', '+ QuotedStr(mkeFax.Text)+','+ QuotedStr(edtMail.Text)+', '+ QuotedStr(edtVoip.Text)+', '+ QuotedStr(edtSite.Text)+', '+QuotedStr(mmoObs.Text)+')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxForn.Clear;
          FormCreate(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmFornecedores.btnSelecionarClick(Sender: TObject);
begin
    If cbxForn.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from fornecedores where f_nome = '+ QuotedStr(cbxForn.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','MyShop - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxForn.SetFocus;
          end
          else begin
             edtCod.Text := FieldByName ('f_cod').AsString;
             cbxForn.Text := FieldByName ('f_nome').AsString;
             mkeCnpj.Text := FieldByName ('f_cnpj').AsString;
             edtSetor.Text := FieldByName ('f_setor').AsString;
             edtEnd.Text := FieldByName ('f_end').AsString;
             edtBai.Text := FieldByName ('f_bairro').AsString;
             edtCid.Text := FieldByName ('f_cid').AsString;
             cbxUf.Text := FieldByName ('f_uf').AsString;
             mkeCep.Text := FieldByName ('f_cep').AsString;
             edtContato.Text := FieldByName ('f_contato').AsString;
             mkeFone.Text := FieldByName ('f_fone').AsString;
             mkeFax.Text := FieldByName ('f_fax').AsString;
             edtMail.Text := FieldByName ('f_mail').AsString;
             edtVoip.Text := FieldByName ('f_skype').AsString;
             edtSite.Text := FieldByName ('f_site').AsString;
             mmoObs.Text := FieldByName ('f_obs').AsString;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o Fornecedor.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmFornecedores.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update fornecedores set f_cnpj = '+ QuotedStr(mkeCnpj.Text)+', f_nome = '+ QuotedStr(cbxForn.Text)+', f_setor = '+ QuotedStr(edtSetor.Text)+', f_end = '+ QuotedStr(edtEnd.Text)+', f_bairro = '+ QuotedStr(edtBai.Text)+', f_cid = '+ QuotedStr(edtCid.Text)+', f_uf = '+ QuotedStr(cbxUf.Text)+', f_contato = '+ QuotedStr(edtContato.Text)+', f_fone = '+ QuotedStr(mkeFone.Text)+', f_fax = '+ QuotedStr(mkeFax.Text)+', f_mail = '+ QuotedStr(edtMail.Text)+', f_skype = '+ QuotedStr(edtVoip.Text)+', f_site = '+ QuotedStr(edtSite.Text)+', f_cep = '+ QuotedStr(mkeCep.Text)+', f_obs = '+QuotedStr(mmoObs.Text)+' where f_cod = '+ QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnSelecionarClick(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um Fornecedor para atualizar dados.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmFornecedores.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from fornecedores where f_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Self);
             cbxForn.Clear;
             FormCreate(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um Fornecedor para poder exluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmFornecedores.edtVoipDblClick(Sender: TObject);
begin
    If edtVoip.Text <> '' then begin
       Try
         WinExec('C:\Arquivos de programas\Skype\Phone\Skype',SW_SHOW);
       Except
           Application.MessageBox('Verifique se seu computador possui o Skype instalado!','MyShop - Aviso',MB_OK+MB_ICONINFORMATION);
       end;
    end;
end;

procedure TfrmFornecedores.edtVoipMouseMove(Sender: TObject;
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

procedure TfrmFornecedores.edtSiteMouseMove(Sender: TObject;
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

procedure TfrmFornecedores.btnNovoClick(Sender: TObject);
var nNovo: Integer;
begin
    btnLimparClick(Self);
    nNovo := fBuscaCodForn + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxForn.SetFocus;
end;

procedure TfrmFornecedores.cbxFornKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Self);
end;

procedure TfrmFornecedores.edtSiteDblClick(Sender: TObject);
begin
    If edtSite.Text <> '' then begin
       WinExec(PCHAR('C:\Arquivos de programas\Internet Explorer\iexplore.exe http://'+edtSite.Text),SW_SHOWMAXIMIZED);
    end;

end;

procedure TfrmFornecedores.edtMailMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If edtMail.Text <> '' then begin
       edtMail.Hint := 'Dê um duplo clique aqui para localizar o e-mail';
       edtMail.ShowHint := True;
    end
    else begin
       edtMail.Hint := '';
       edtMail.ShowHint := False;
    end;
end;

procedure TfrmFornecedores.edtMailDblClick(Sender: TObject);
begin
    If edtMail.Text <> '' then begin
       WinExec(PCHAR('C:\Arquivos de programas\Internet Explorer\iexplore.exe'),SW_SHOWMAXIMIZED);
    end;
end;

end.
