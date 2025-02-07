unit CadFornec_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, Buttons;

type
  TfrmCadTerceiro = class(TForm)
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
    edtRgIe: TLabeledEdit;
    lblFone: TLabel;
    mkeFone: TMaskEdit;
    cbxForn: TComboBox;
    lblForn: TLabel;
    lblObs: TLabel;
    mmObs: TMemo;
    mkeCnpj: TMaskEdit;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    edtId: TLabeledEdit;
    edtMail: TLabeledEdit;
    mkeCep: TMaskEdit;
    lblCep: TLabel;
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
  frmCadTerceiro: TfrmCadTerceiro;

implementation

uses Carro_Comando_dm, Principal_frm;

{$R *.dfm}

function fBuscaIdTerceiro() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from terceiro');
       Active := True;
       fBuscaIdTerceiro := FieldByName('ultimo').AsInteger;
    end;
end;

function sStatus() : String;
begin
    If frmCadTerceiro.RadioGroup1.ItemIndex = 1 then
       sStatus := 'PJ'
    else
       sStatus := 'PF'
end;

procedure TfrmCadTerceiro.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadTerceiro.btnLimparClick(Sender: TObject);
begin
    mkeCnpj.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtRgIe.Clear; edtId.Clear; mkeCep.Clear; edtMail.Clear;
    cbxUf.Text := ''; mkeCnpj.EditMask := ''; cbxForn.Clear;
    mkeFone.Clear; mmObs.Clear;
    RadioGroup1.ItemIndex := -1;
    FormCreate(Sender);
    dmVendas.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadTerceiro.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from terceiro order by nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadTerceiro.FormShow(Sender: TObject);
begin
    mkeCnpj.SetFocus;
end;

procedure TfrmCadTerceiro.btnInserirClick(Sender: TObject);
var sTipo : String;
    nNovo : Integer;
begin
    sTipo := sStatus;
    nNovo := fBuscaIdTerceiro + 1;
    edtId.Text := IntToStr(nNovo);
//    If mkeCnpj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into terceiro (id, bairro, cep, cidade, cnpjCpf, email, endereco, ieRg, nome, observacao, telefone, uf) Values ('+QuotedStr(edtId.Text)+', '+ QuotedStr(edtBai.Text)+', '+QuotedStr(mkeCep.Text)+', '+ QuotedStr(edtCid.Text)+', '+QuotedStr(mkeCnpj.Text)+', '+QuotedStr(edtMail.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtRgIe.Text)+', '+QuotedStr(cbxForn.Text)+', '+QuotedStr(mmObs.Text)+', '+ QuotedStr(mkeFone.Text)+', '+ QuotedStr(cbxUf.Text)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
//       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Madeira Fácil - Atenção',MB_OK+MB_ICONSTOP);
//      end;
//    end
//    else begin
//       Application.MessageBox('O campo CPF/CNPJ não pode estar vazio!','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
//    end;
end;

procedure TfrmCadTerceiro.btnSelecionarClick(Sender: TObject);
begin
    If cbxForn.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from terceiro where nome = '+ QuotedStr(cbxForn.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Controle de Toras - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxForn.SetFocus;
          end
          else begin
             mkeCnpj.Text := FieldByName ('cnpjCpf').AsString;
             cbxForn.Text := FieldByName ('nome').AsString;
             edtRgIe.Text := FieldByName ('ieRg').AsString;
             edtEnd.Text := FieldByName ('endereco').AsString;
             edtBai.Text := FieldByName ('bairro').AsString;
             edtCid.Text := FieldByName ('cidade').AsString;
             cbxUf.Text := FieldByName ('uf').AsString;
             mkeFone.Text := FieldByName ('telefone').AsString;
             mmObs.Text := FieldByName ('observacao').AsString;
             edtId.Text := FieldByName('id').AsString;
             mkeCep.Text := FieldByName('cep').AsString;
             edtMail.Text := FieldByName('email').AsString;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o Fornecedor.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
    cbxForn.SetFocus;
end;

procedure TfrmCadTerceiro.btnAtualizarClick(Sender: TObject);
var sTipo : String;
begin
    sTipo := sStatus;
    If mkeCnpj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update terceiro set cnpjCpf = '+ QuotedStr(mkeCnpj.Text)+', nome = '+ QuotedStr(cbxForn.Text)+', ieRg = '+ QuotedStr(edtRgIe.Text)+', endereco = '+ QuotedStr(edtEnd.Text)+', bairro = '+ QuotedStr(edtBai.Text)+', cidade = '+ QuotedStr(edtCid.Text)+', uf = '+ QuotedStr(cbxUf.Text)+', telefone = '+ QuotedStr(mkeFone.Text)+', observacao = '+QuotedStr(mmObs.Text)+', email = '+QuotedStr(edtMail.Text)+', cep = '+QuotedStr(mkeCep.Text)+' where id = '+ QuotedStr(edtId.Text)+'');
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
       Application.MessageBox('O campo CPF/CNPJ não pode ser vazio! Selecione um Fornecedor para atualizar dados.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadTerceiro.btnDeletarClick(Sender: TObject);
begin
    If mkeCnpj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Controle de Toras - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from terceiro where id = '+ QuotedStr(edtId.Text)+'');
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
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione um Fornecedor para poder deletar.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadTerceiro.mmObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadTerceiro.RadioGroup1Click(Sender: TObject);
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
