unit Senha_frm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, jpeg;

type
  TfrmSenha = class(TForm)
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    edtUsuario: TLabeledEdit;
    edtSenha: TLabeledEdit;
    Shape1: TShape;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
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

uses Carro_Comando_dm, ADODB, Principal_frm;

{$R *.dfm}

function fSenha() : String;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select senha from senha where user_name = '+QuotedStr(frmSenha.edtUsuario.Text)+'');
       Active := True;
       fSenha := FieldByName('senha').AsString;
    end;
end;

function fNivel() : String;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select nivel from senha where user_name = '+QuotedStr(frmSenha.edtUsuario.Text)+'');
       Active := True;
       fNivel := FieldByName('nivel').AsString;
    end;
end;


procedure TfrmSenha.btnOkClick(Sender: TObject);
var sSenha1, sSenha2, nNivel : String;
begin
    sSenha1 := fSenha;
    sSenha2 := edtSenha.Text;
    nNivel := fNivel;
    If sSenha1 <> sSenha2 then begin
       Application.MessageBox('Senha Inv�lida!','Controle de Toras',MB_OK+MB_ICONERROR);
        edtSenha.SetFocus;
    end
    else begin
       Close;
       Application.MessageBox('Bem-vindo ao Sistema Controle de Toras!','Controle de Toras',MB_OK+MB_ICONINFORMATION);
       frmPrincipal.StatusBar1.Panels[2].Text := 'N�vel:'+nNivel+'';
       frmPrincipal.StatusBar1.Panels[1].Text := 'Usu�rio:'+edtUsuario.Text+'';
    end;
end;

procedure TfrmSenha.btnCancelarClick(Sender: TObject);
begin
    dmVendas.ADOConnection1.Connected := False;
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
    If edtUsuario.SelStart = 0 then
       Key := AnsiUpperCase(Key)[1]
    else
       Key := AnsiLowerCase(Key)[1];
end;

procedure TfrmSenha.FormShow(Sender: TObject);
begin
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

