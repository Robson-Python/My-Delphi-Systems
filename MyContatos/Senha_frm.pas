unit Senha_frm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, jpeg, ComCtrls, Vcl.Imaging.pngimage;

type
  TfrmSenha = class(TForm)
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    edtUsuario: TLabeledEdit;
    edtSenha: TLabeledEdit;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

uses Principal_frm, Contato_dm, Usuario_frm;

{$R *.dfm}

function fDataBase() : String;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from usuario');
       Active := True;
       If dmContato.fdqContato.RecordCount = 0 then begin
          Application.MessageBox('Cadastre um nome de usuário e uma senha por favor!','MyContatos',MB_OK+MB_ICONINFORMATION);
          Try
            Application.CreateForm(TfrmUsuario, frmUsuario);
            frmUsuario.ShowModal;
          Finally
               frmUsuario.Free;
          end;
       end;
    end;
end;

function fSenha() : String;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select u_senha from usuario where u_nome = '+QuotedStr(frmSenha.edtUsuario.Text)+'');
       Active := True;
       fSenha := FieldByName('u_senha').AsString;
    end;
end;

function fNivel() : String;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select u_nivel from usuario where u_nome = '+QuotedStr(frmSenha.edtUsuario.Text)+'');
       Active := True;
       fNivel := FieldByName('u_nivel').AsString;
    end;
end;

procedure TfrmSenha.btnOkClick(Sender: TObject);
var sSenha1, sSenha2, nNivel : String;
begin
    sSenha1 := fSenha;
    sSenha2 := edtSenha.Text;
    nNivel := fNivel;
    If sSenha1 <> sSenha2 then begin
       Application.MessageBox('Senha Invalida!','MyContatos',MB_OK+MB_ICONERROR);
       edtSenha.SetFocus;
    end
    else begin
       Close;
       Application.MessageBox('Bem-vindo ao Sistema MyContatos!','MyContatos',MB_OK+MB_ICONINFORMATION);
       frmPrincipal.StatusBar1.Panels[2].Text := 'Nível: '+nNivel+'';
       frmPrincipal.StatusBar1.Panels[1].Text := 'Usuário: '+edtUsuario.Text+'';
    end;
end;

procedure TfrmSenha.btnCancelarClick(Sender: TObject);
begin
    dmContato.fdcContato.Connected := False;
    Close;
    Application.Terminate;
end;

procedure TfrmSenha.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then
       edtSenha.SetFocus;
end;

procedure TfrmSenha.edtSenhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    btnOk.Enabled := True;
    If edtSenha.Text = '' then
       btnOk.Enabled := False;
end;

procedure TfrmSenha.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
//    If edtUsuario.SelStart = 0 then
//       Key := AnsiUpperCase(Key)[1]
//    else
//       Key := AnsiLowerCase(Key)[1];
end;

procedure TfrmSenha.FormShow(Sender: TObject);
begin
    fDataBase;
    edtUsuario.SetFocus;
end;

procedure TfrmSenha.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If edtSenha.Text <> '' then begin
       If Key = VK_RETURN then begin
          btnOkClick(Sender);
       end;
    end;
end;

end.

