unit PasswordDialog_frm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

{$R *.dfm}

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
begin
    If Password.Text = 'sysdba' then begin
       Try
         WinExec('C:\Arquivos de programas\MySQL\MySQL Administrator 1.1\MySQLAdministrator',SW_SHOW);
       Except
           Application.MessageBox('Verifique se seu computador possui o Skype instalado!','Carro Comando - Aviso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('Senha Inválida! Você precisa ter privilégios de Administrador para ter acesso. Consulte o Administrador do Sistema.','Omega - Atenção',MB_OK+MB_ICONSTOP);
       Close;
    end;
end;

end.
 
