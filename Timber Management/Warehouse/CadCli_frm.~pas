unit CadCli_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Mask, ExtDlgs, Jpeg;

type
  TfrmCadCli = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtProp: TLabeledEdit;
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
    RadioGroup1: TRadioGroup;
    mkeFone: TMaskEdit;
    lblFone: TLabel;
    mkeCel: TMaskEdit;
    lblCel: TLabel;
    mkeFax: TMaskEdit;
    lblFax: TLabel;
    edtMail: TLabeledEdit;
    mmObs: TMemo;
    lblObs: TLabel;
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
    procedure RadioGroup1Click(Sender: TObject);
    procedure mmObsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCli: TfrmCadCli;

implementation

uses Carro_Comando_dm, ADODB, DB, DateUtils, Principal_frm;

{$R *.dfm}

function sStatus() : String;
begin
    If frmCadCli.RadioGroup1.ItemIndex = 1 then
       sStatus := 'PJ'
    else
       sStatus := 'PF'
end;

procedure TfrmCadCli.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadCli.btnLimparClick(Sender: TObject);
begin
    cbxNome.Clear; edtProp.Clear; edtEnd.Clear; edtBairro.Clear; edtCid.Clear; mkeCep.Clear; cbxUf.Text := '';
    mkeCpfj.Clear; mkeCpfj.EditMask := ''; mkeFone.Clear; mkeCel.Clear; mkeFax.Clear; edtMail.Clear; mmObs.Clear;
    RadioGroup1.ItemIndex := -1;
    FormCreate(Sender);
    mkeCpfj.SetFocus;
    dmVendas.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadCli.FormShow(Sender: TObject);
begin
    mkeCpfj.SetFocus;
end;

procedure TfrmCadCli.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadCli.btnInserirClick(Sender: TObject);
var sTipo : String;
begin
    sTipo := sStatus;
    If mkeCpfj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into clientes (C_CPFJ, C_NOME, C_RESP, C_END, C_BAIRRO, C_MUN, C_UF, C_CEP, C_FONE, C_CEL, C_FAX, C_MAIL, C_OBS, C_TIPO) Values ('+QuotedStr(mkeCpfj.Text)+','+QuotedStr(cbxNome.Text)+','+ QuotedStr(edtProp.Text)+', '+ QuotedStr(edtEnd.Text)+','+ QuotedStr(edtBairro.Text)+','+ QuotedStr(edtCid.Text)+','+ QuotedStr(cbxUf.Text)+','+ QuotedStr(mkeCep.Text)+', '+QuotedStr(mkeFone.Text)+', '+QuotedStr(mkeCel.Text)+', '+QuotedStr(mkeFax.Text)+', '+QuotedStr(edtMail.Text)+', '+QuotedStr(mmObs.Text)+', '+QuotedStr(sTipo)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
//      end;
//    end
    else begin
       Application.MessageBox('O campo CPF/CNPJ não pode estar vazio!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadCli.btnSelecionarClick(Sender: TObject);
begin
    If cbxNome.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from clientes where c_nome = '+ QuotedStr(cbxNome.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Sistema Almoxarifado - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.SetFocus;
          end
          else begin
             cbxNome.Text := FieldByName ('c_nome').AsString;
             edtProp.Text := FieldByName ('c_resp').AsString;
             edtEnd.Text := FieldByName ('c_end').AsString;
             edtBairro.Text := FieldByName ('c_bairro').AsString;
             edtCid.Text := FieldByName ('c_mun').AsString;
             cbxUf.Text := FieldByName ('c_uf').AsString;
             mkeCep.Text := FieldByName ('c_cep').AsString;
             mkeFone.Text := FieldByName ('c_fone').AsString;
             mkeCel.Text := FieldByName('c_cel').AsString;
             mkeFax.Text := FieldByName('c_fax').AsString;
             edtMail.Text := FieldByName('c_mail').AsString;
             mmObs.Text := FieldByName('c_obs').AsString;
             If FieldByName('c_tipo').AsString = 'PF' then begin
                RadioGroup1.ItemIndex := 0;
                mkeCpfj.Text := FieldByName ('c_cpfj').AsString;
             end
             else begin
                RadioGroup1.ItemIndex := 1;
                mkeCpfj.Text := FieldByName ('c_cpfj').AsString;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o nome do cliente.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
    cbxNome.SetFocus;
end;

procedure TfrmCadCli.edtPlacaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       If mkeCpfj.Text <> '' then begin
           With dmVendas.ADOQuery1 do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Select * from carros where placa = '+ QuotedStr(mkeCpfj.Text));
              Active := True;
              If RecordCount = 0 then begin
                 Application.MessageBox('Registro não encontrado...','Sistema Almoxarifado - Informação',MB_OK+MB_ICONINFORMATION);
                 cbxNome.SetFocus;
              end
              else begin
                 mkeCpfj.Text := FieldByName ('c_cpfj').AsString;
                 cbxNome.Text := FieldByName ('c_mome').AsString;
                 edtProp.Text := FieldByName ('c_resp').AsString;
                 edtEnd.Text := FieldByName ('c_end').AsString;
                 edtBairro.Text := FieldByName ('c_bairro').AsString;
                 edtCid.Text := FieldByName ('c_mun').AsString;
                 cbxUf.Text := FieldByName ('c_uf').AsString;
                 mkeCep.Text := FieldByName ('c_cep').AsString;
                 mkeFone.Text := FieldByName ('c_fone').AsString;
                 mkeCel.Text := FieldByName('c_cel').AsString;
                 mkeFax.Text := FieldByName('c_fax').AsString;
                 edtMail.Text := FieldByName('c_mail').AsString;
                 mmObs.Text := FieldByName('c_obs').AsString;
              end;
           end;
       end
       else begin
          Application.MessageBox('Digite o número da Placa.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end;
end;

procedure TfrmCadCli.cbxNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Sender);
end;

procedure TfrmCadCli.btnAtualizarClick(Sender: TObject);
var sTipo : String;
begin
    sTipo := sStatus;
    If mkeCpfj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update clientes set c_cpfj = '+ QuotedStr(mkeCpfj.Text)+', c_nome = '+ QuotedStr(cbxNome.Text)+', c_resp = '+ QuotedStr(edtProp.Text)+', c_end = '+ QuotedStr(edtEnd.Text)+', c_bairro = '+ QuotedStr(edtBairro.Text)+', c_mun = '+QuotedStr(edtCid.Text)+', c_uf = '+ QuotedStr(cbxUf.Text)+', c_cep = '+ QuotedStr(mkeCep.Text)+', c_fone = '+ QuotedStr(mkeFone.Text)+', c_cel = '+QuotedStr(mkeCel.Text)+', c_fax = '+QuotedStr(mkeFax.Text)+', c_mail = '+QuotedStr(edtMail.Text)+', c_obs = '+QuotedStr(mmObs.Text)+', c_tipo = '+QuotedStr(sTipo)+' where c_cpfj = '+ QuotedStr(mkeCpfj.Text)+'');
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
       Application.MessageBox('O campo CPF/CNPJ não pode ser vazio! Selecione um Cliente para atualizar dados.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadCli.btnDeletarClick(Sender: TObject);
begin
    If mkeCpfj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Sistema Almoxarifado - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from clientes where c_cpfj = '+ QuotedStr(mkeCpfj.Text)+'');
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
       Application.MessageBox('O campo CPF/CNPJ não pode ser vazio! Selecione um Cliente para poder deletar.','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadCli.RadioGroup1Click(Sender: TObject);
begin
    If RadioGroup1.ItemIndex = 0 then begin
       mkeCpfj.Clear;
       mkeCpfj.EditMask := '';
       mkeCpfj.EditMask := '000.000.000-00';
    end
    else begin
       mkeCpfj.Clear;
       mkeCpfj.EditMask := '';
       mkeCpfj.EditMask := '00.000.000/0000-00'
    end;
    mkeCpfj.SetFocus;
end;

procedure TfrmCadCli.mmObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

end.
