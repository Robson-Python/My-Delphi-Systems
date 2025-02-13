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
var nProtocolo, dData, dDataValid, sProtocolo : String;
    I : integer;
begin
    dData := DateToStr(Now);
    dDataValid := DateToStr(frmRegistro.dtpValidade.Date);
    If btnRegist.Caption = 'Renovar' then begin
       If dData = dDataValid  then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select protocolo from registro where codigo = 1');
             Active := True;
             nProtocolo := FieldByName('protocolo').AsString;
             If Trim(nProtocolo) = Trim(edtLicenca.Text) then begin
                frmRegistro.dtpValidade.Date := Date + 31;
                Randomize;
                sProtocolo := '';
                for I := 1 to 10 do
                sProtocolo := sProtocolo + IntToStr(Random(10));
                Active := False;
                SQL.Clear;
                SQL.Add('Update registro set dt_valid = '+QuotedStr(DateToStr(frmRegistro.dtpValidade.Date))+', situacao = ''ATIVO'', licenca = '+QuotedStr(edtLicenca.Text)+', protocolo = '+QuotedStr(sProtocolo)+' where codigo = 1');
                ExecSQL;
                ShortDateFormat := 'dd/mm/yyyy';
                Application.MessageBox('Sua Licen�a foi renovada para mais 30 dias. Para efetivar a Licen�a feche o Programa e execute-o novamente','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
                ShowMessage('O N� do protocolo de ativa��o �: '+sProtocolo+'');
             end
             else begin
                Application.MessageBox('Licen�a Inv�lida! Entre em contato com o Programador para obter uma licen�a v�lida.','Carro Comando - Erro Fatal',MB_OK+MB_ICONERROR);
             end;
          end;
       end
       else begin
          Application.MessageBox('Voc� possui uma licen�a v�lida.','Carro Comando - Aviso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select protocolo from registro where codigo = 1');
          Active := True;
          nProtocolo := FieldByName('protocolo').AsString;
          If Trim(nProtocolo) = Trim(edtLicenca.Text) then begin
             frmRegistro.dtpValidade.Date := Date + 31;
             Randomize;
             sProtocolo := '';
             for I := 1 to 10 do
             sProtocolo := sProtocolo + IntToStr(Random(10));
             Active := False;
             SQL.Clear;
             SQL.Add('Update registro set dt_valid = '+QuotedStr(DateToStr(frmRegistro.dtpValidade.Date))+', situacao = ''ATIVO'', licenca = '+QuotedStr(edtLicenca.Text)+', protocolo = '+QuotedStr(sProtocolo)+' where codigo = 1');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Sua Licen�a foi renovada para mais 30 dias. Para efetivar a Licen�a feche o Programa e execute-o novamente','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
             ShowMessage('O N� do protocolo de ativa��o �: '+sProtocolo+'');
          end
          else begin
             Application.MessageBox('Licen�a Inv�lida! Entre em contato com o Programador para obter uma licen�a v�lida.','Carro Comando - Erro Fatal',MB_OK+MB_ICONERROR);
          end;
       end;
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
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select situacao from registro where codigo = 1');
       Active := True;
       sSituacao := FieldByName('situacao').AsString;
       If sSituacao = 'ATIVO' then begin
          btnRegist.Caption := 'Renovar';
       end
       else
          btnRegist.Caption := 'Ativar';
       end;
    end;

end.
