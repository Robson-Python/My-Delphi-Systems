unit Usuario_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls;

type
  TfrmUsuario = class(TForm)
    GroupBox1: TGroupBox;
    cbxUsuario: TComboBox;
    Label1: TLabel;
    edtSenha: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure cbxUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure cbxUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses Enterprise_dm, DB;

{$R *.dfm}

function fNivel() : String;
begin
    If frmUsuario.RadioGroup1.ItemIndex = 0 then begin
       fNivel := 'Administrador';
    end;
    If frmUsuario.RadioGroup1.ItemIndex = 1 then begin
       fNivel := 'Usu�rio'
    end;
end;

procedure TfrmUsuario.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmUsuario.btnLimparClick(Sender: TObject);
begin
    cbxUsuario.Clear;
    edtSenha.Clear;
    RadioGroup1.ItemIndex := -1;
    FormCreate(Sender);
end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from senha order by user_name');
       Active := True;
       while not Eof do begin
          cbxUsuario.Items.Add(FieldByName('user_name').AsString);
          Next;
       end;
    end;
end;

procedure TfrmUsuario.btnInserirClick(Sender: TObject);
var nNivel : String;
begin
    nNivel := fNivel;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into senha (user_name, senha, nivel) values ('+QuotedStr(cbxUsuario.Text)+', '+QuotedStr(edtSenha.Text)+', '+QuotedStr(nNivel)+')');
       ExecSQL;
       Application.MessageBox('Usu�rio e Senha cadastrados com sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnLimparClick(Sender);
    end;
end;

procedure TfrmUsuario.btnSelecionarClick(Sender: TObject);
var sSenha : String;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select senha, nivel from senha where user_name = '+QuotedStr(cbxUsuario.Text)+'');
       Active := True;
       sSenha := FieldByName('senha').AsString;
       If sSenha = edtSenha.Text then begin
         If FieldByName('nivel').AsString = 'Administrador' then begin
            RadioGroup1.ItemIndex := 0;
         end
         else begin
            RadioGroup1.ItemIndex := 1;
         end;
       end
       else begin
          Application.MessageBox('Usuario e Senha incorretos!','MyShop - Informa��o',MB_OK+MB_ICONERROR);
       end;
    end;
end;

procedure TfrmUsuario.btnAtualizarClick(Sender: TObject);
var nNivel : String;
begin
    nNivel := fNivel;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update senha set user_name = '+QuotedStr(cbxUsuario.Text)+', senha = '+QuotedStr(edtSenha.Text)+', nivel = '+QuotedStr(nNivel)+' where user_name = '+QuotedStr(cbxUsuario.Text)+'');
       ExecSQL;
       Application.MessageBox('Usu�rio e Senha atualizados com sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnSelecionarClick(Sender);
    end;
end;

procedure TfrmUsuario.btnDeletarClick(Sender: TObject);
begin
    If Application.MessageBox('Tem certeza que deseja deletar esse Usu�rio?','MyShop - Confirma��o de Exclus�o',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Delete from senha where user_name = '+QuotedStr(cbxUsuario.Text)+'');
          ExecSQL;
          Application.MessageBox('Usu�rio e Senha Deletados com sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
       end;
    end;
end;

procedure TfrmUsuario.cbxUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
    If cbxUsuario.SelStart = 0 then
       Key := AnsiUpperCase(Key)[1]
    else
       Key := AnsiLowerCase(Key)[1];
end;

procedure TfrmUsuario.cbxUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then
       edtSenha.SetFocus;
end;

end.
