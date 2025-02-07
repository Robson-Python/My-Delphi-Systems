unit Sobre_frm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Registry, comobj, jpeg;

type
  TfrmSobre = class(TForm)
    btnOk: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Comments: TLabel;
    Copyright: TLabel;
    Version: TLabel;
    ProductName: TLabel;
    ProgramIcon: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image1: TImage;
    Label9: TLabel;
    Label10: TLabel;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    edtRegistro: TLabeledEdit;
    edtLicenc: TLabeledEdit;
    edtSerialNumber: TLabeledEdit;
    btnRegist: TBitBtn;
    btnRenovar: TBitBtn;
    Label17: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);

    procedure Label5Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure btnRegistClick(Sender: TObject);
    procedure btnRenovarClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses Principal_frm, Carro_Comando_dm, ADODB, Ativar_frm;

{$R *.dfm}

function SysComputerName: string;
var
  I: DWord;
begin
    I := MAX_COMPUTERNAME_LENGTH + 1;
    SetLength(Result, I);
    Windows.GetComputerName(PChar(Result), I);
    Result := string(PChar(Result));
end;

function sysMemory : String;
var MemoryStatus: TMemoryStatus;
begin
    MemoryStatus.dwLength:= sizeof(MemoryStatus);
    GlobalMemoryStatus(MemoryStatus);
    sysMemory := 'Total de memória física : ' + IntToStr(MemoryStatus.dwTotalPhys);
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario, registro, licenca, serial_number from registro where codigo = 1');
       Active := True;
       Label16.Caption := FieldByName('usuario').AsString;
       edtRegistro.Text := FieldByName('registro').AsString;
       edtLicenc.Text := FieldByName('licenca').AsString;
       edtSerialNumber.Text := FieldByName('serial_number').AsString;
    end;
    Label24.Caption := SysComputerName;
    Label26.Caption := sysMemory;
end;


procedure TfrmSobre.Label5Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Skype\Phone\Skype',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Skype instalado!','Controle de Toras - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.Label25Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Windows Live\Messenger\msnmsgr',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Windows Live Messenger instalado!','Controle de Toras - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.Label20Click(Sender: TObject);
var ie : Variant;
begin
 IE := CreateOleObject('InternetExplorer.Application');
 IE.Visible := true;
 IE.Navigate('www.google.com.br');
end;

procedure TfrmSobre.btnRegistClick(Sender: TObject);
begin
    If edtRegistro.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update registro set registro = '+QuotedStr(edtRegistro.Text)+' where codigo = 1');
          ExecSQL;
          Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnRegist.Enabled := False;
          edtRegistro.Enabled := False;
          edtLicenc.Visible := True;
          frmPrincipal.FormActivate(Sender);
       end;
    end
    else begin
       Application.MessageBox('Os Campos não podem ser vazios! Preencha os campos e tente novamente.','Controle de Toras - Atenção',MB_OK+MB_ICONERROR);
       edtRegistro.SetFocus;
    end;
end;

procedure TfrmSobre.btnRenovarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmAtivar, frmAtivar);
      frmAtivar.ShowModal;
    Finally
         frmAtivar.Free;
    end;
end;

procedure TfrmSobre.TabSheet2Show(Sender: TObject);
begin
    If edtRegistro.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select usuario, registro, licenca, serial_number from registro where codigo = 1');
          Active := True;
          Label16.Caption := FieldByName('usuario').AsString;
          edtRegistro.Text := FieldByName('registro').AsString;
          edtLicenc.Text := FieldByName('licenca').AsString;
          edtSerialNumber.Text := FieldByName('serial_number').AsString;
       end;
       Label24.Caption := SysComputerName;
       Label26.Caption := sysMemory;
    end
    else begin
       edtRegistro.Enabled := True;
       btnRegist.Enabled := True;
    end;
end;

end.

