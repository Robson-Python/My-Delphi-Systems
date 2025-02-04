unit Ativar_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfrmAtivar = class(TForm)
    GroupBox1: TGroupBox;
    edtLicenca: TEdit;
    btnRegist: TBitBtn;
    procedure btnRegistClick(Sender: TObject);
    procedure edtLicencaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtivar: TfrmAtivar;

implementation

uses Carro_Comando_dm, ADODB, Registro_frm, DB, Principal_frm;

{$R *.dfm}

procedure TfrmAtivar.btnRegistClick(Sender: TObject);
var nProtocolo, sProtocolo : String;
    I : integer;
begin
    If btnRegist.Caption = 'Ativar' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select protocolo from registro where codigo = 1');
          Active := True;
          nProtocolo := FieldByName('protocolo').AsString;
          If Trim(nProtocolo) = Trim(edtLicenca.Text) then begin
             Randomize;
             sProtocolo := '';
             for I := 1 to 10 do
             sProtocolo := sProtocolo + IntToStr(Random(10));
             Active := False;
             SQL.Clear;
             SQL.Add('Update registro set situacao = ''ATIVO'', licenca = '+QuotedStr(edtLicenca.Text)+', protocolo = '+QuotedStr(sProtocolo)+' where codigo = 1');
             ExecSQL;
             Application.MessageBox('Sua Licença foi Ativada Para efetivar a Licença feche o Programa e execute-o novamente','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             ShowMessage('O Nº do protocolo de ativação é: '+sProtocolo+'');
          end
          else begin
             Application.MessageBox('Licença Inválida! Entre em contato com o Programador para obter uma licença válida.','Controle de Toras - Erro Fatal',MB_OK+MB_ICONERROR);
          end;
       end;
    end
    else begin
       Application.MessageBox('Você possui uma licença válida.','Controle de Toras - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
    Close;
end;

procedure TfrmAtivar.edtLicencaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    btnRegist.Enabled := True;
    If edtLicenca.Text = '' then
       btnRegist.Enabled := False;
end;

procedure TfrmAtivar.FormShow(Sender: TObject);
var sSituacao : String;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select situacao from registro where codigo = 1');
       Active := True;
       sSituacao := FieldByName('situacao').AsString;
       If sSituacao = 'INATIVO' then
          btnRegist.Caption := 'Ativar';
       end;
    end;

end.
