unit Sobre_frm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Registry,Dialogs, jpeg;

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
    Label10: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label20: TLabel;
    Label26: TLabel;
    Label22: TLabel;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    lblDtImplant: TLabel;
    lblDtValid: TLabel;
    lblDias: TLabel;
    edtRegistro: TLabeledEdit;
    edtSerialNumber: TLabeledEdit;
    dtpDtImplant: TDateTimePicker;
    dtpValidade: TDateTimePicker;
    edtDias: TEdit;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    btnRenovar: TBitBtn;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    procedure Label5Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRenovarClick(Sender: TObject);
    procedure ExecFile(F: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses Principal_frm, DateUtils, Locadora_dm, SHELLAPI, Ativar_frm;

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

procedure TfrmSobre.Label5Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Skype\Phone\Skype',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Skype instalado!','MyBook - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.Label25Click(Sender: TObject);
begin
    WinExec(PCHAR('C:\Arquivos de programas\Internet Explorer\iexplore.exe http://accounts.google.com'),SW_SHOWMAXIMIZED);
end;

procedure TfrmSobre.Label12Click(Sender: TObject);
begin
    ExecFile('C:\Rental\Contrato Rental (EULA).pdf');
end;

procedure TfrmSobre.Label8Click(Sender: TObject);
begin
    WinExec(PCHAR('C:\Arquivos de programas\Internet Explorer\iexplore.exe http://sites.google.com/site/mybookagendaeletronica'),SW_SHOWMAXIMIZED);
end;

procedure TfrmSobre.Label26Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Skype\Phone\Skype',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Skype instalado!','MyBook - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
var dias : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_nome from registro');
       Active := True;
       Label11.Caption := FieldByName('r_nome').AsString;
    end;
    Label17.Caption := SysComputerName;
    With dmLocadora.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from enterprise where codigo = 1');
       Active := True;
       edtRegistro.Text := FieldByName('registro').AsString;
       edtSerialNumber.Text := FieldByName('BGJK11SNNB029181').AsString;
       dtpDtImplant.Date := FieldByName('DTIP945C').AsDateTime;
       dtpValidade.Date := FieldByName('CD987VKXL').AsDateTime;
       edtDias.Text := FieldByName('BGU2762NDS1620').AsString;
    end;
    If edtRegistro.Text = '' then begin
       edtRegistro.Enabled := True;
    end;
    dias := DaysBetween(Now,dtpValidade.Date);
    If dias <> 0 then begin
       Label19.Caption := IntToStr(dias)+' dias';
    end;
    If dias = 0 then begin
       Label19.Caption := 'Licença expira hoje';
       Label19.Font.Color := clYellow;
    end;
    If Now > dtpValidade.Date then begin
       Label19.Caption := 'Programa Bloqueado';
       Label19.Font.Color := clRed;
    end;
    If StrToInt(edtDias.Text) = 0 then begin
       lblDias.Caption := 'Não Licenciado';
       lblDias.Font.Color := clRed;
    end
    else begin
       If StrToInt(edtDias.Text) <= 15 then begin
          lblDias.Caption := 'Demo';
          lblDias.Font.Color := clBlue;
       end;
    end;
    If StrToInt(edtDias.Text) > 15 then begin
       lblDias.Caption := 'Licenciado';
       lblDias.Font.Color := clGreen;
    end;
end;

procedure TfrmSobre.btnRenovarClick(Sender: TObject);
begin
    If lblDias.Caption = 'Demo' then begin
       edtDias.Text := '15'
    end;
    Try
      Application.CreateForm(TfrmAtivar, frmAtivar);
      frmAtivar.ShowModal;
    Finally
         frmAtivar.Free;
    end;
end;

procedure TfrmSobre.ExecFile(F: String);
var r: String;
begin
    case ShellExecute(Handle, nil, PChar(F), nil, nil, SW_SHOWNORMAL) of
       ERROR_FILE_NOT_FOUND: r := 'The specified file was not found.';
       ERROR_PATH_NOT_FOUND: r := 'The specified path was not found.';
       ERROR_BAD_FORMAT: r := 'The .EXE file is invalid (non-Win32 .EXE or error in .EXE image).';
       SE_ERR_ACCESSDENIED: r := 'Windows 95 only: The operating system denied access to the specified file.';
       SE_ERR_ASSOCINCOMPLETE: r := 'The filename association is incomplete or invalid.';
       SE_ERR_DDEBUSY: r := 'The DDE transaction could not be completed because other DDE transactions were being processed.';
       SE_ERR_DDEFAIL: r := 'The DDE transaction failed.';
       SE_ERR_DDETIMEOUT: r := 'The DDE transaction could not be completed because the request timed out.';
       SE_ERR_DLLNOTFOUND: r := 'Windows 95 only: The specified dynamic-link library was not found.';
       SE_ERR_NOASSOC: r := 'There is no application associated with the given filename extension.';
       SE_ERR_OOM: r := 'Windows 95 only: There was not enough memory to complete the operation.';
       SE_ERR_SHARE: r := 'A sharing violation occurred.';
    else
       Exit;
    end;
    ShowMessage(r);
end;

end.

