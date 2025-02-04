unit Sobre_frm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Registry, jpeg;

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
    Label8: TLabel;
    Label10: TLabel;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    edtSerialNumber: TLabeledEdit;
    edtRegistro: TLabeledEdit;
    btnRenovar: TBitBtn;
    lblDtImplant: TLabel;
    dtpDtImplant: TDateTimePicker;
    lblDtValid: TLabel;
    dtpValidade: TDateTimePicker;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtDias: TEdit;
    lblDias: TLabel;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure btnRenovarClick(Sender: TObject);
    procedure Label12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses Principal_frm, Carro_Comando_dm, ADODB, Ativar_frm, DateUtils;

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
var dias : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario from registro where codigo = 1');
       Active := True;
       Label16.Caption := FieldByName('usuario').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from sistema where codigo = 1');
       Active := True;
       edtRegistro.Text := FieldByName('registro').AsString;
       edtSerialNumber.Text := FieldByName('serial_number').AsString;
       dtpDtImplant.Date := FieldByName('dt_implant').AsDateTime;
       dtpValidade.Date := FieldByName('dt_valid').AsDateTime;
       edtDias.Text := FieldByName('dias').AsString;
    end;
    If edtRegistro.Text = '' then begin
       edtRegistro.Enabled := True;
       dtpDtImplant.Enabled := True;
       dtpDtImplant.Date := Date;
       dtpValidade.Date := Date;
       lblDtImplant.Enabled := True;
       edtDias.Enabled := True;
    end;
    dias := DaysBetween(Now,dtpValidade.Date);
    Label24.Caption := SysComputerName;
    If dias <> 0 then begin
       Label19.Caption := IntToStr(dias) +' dias';
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
       If StrToInt(edtDias.Text) <= 30 then begin
          lblDias.Caption := 'Demo';
          lblDias.Font.Color := clBlue;
       end;
    end;
    If StrToInt(edtDias.Text) > 30 then begin
       lblDias.Caption := 'Licenciado';
       lblDias.Font.Color := clGreen;
    end;
end;

procedure TfrmSobre.Label5Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Skype\Phone\Skype',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Skype instalado!','Omega - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.Label25Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Windows Live\Messenger\msnmsgr',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Windows Live Messenger instalado!','Omega - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.btnRenovarClick(Sender: TObject);
begin
    If lblDias.Caption = 'Demo' then begin
       edtDias.Text := '182'
    end;
    Try
      Application.CreateForm(TfrmAtivar, frmAtivar);
      frmAtivar.ShowModal;
    Finally
         frmAtivar.Free;
    end;
end;

procedure TfrmSobre.Label12Click(Sender: TObject);
begin
    Application.HelpFile := 'C:\Arquivos de Programas\Omega\Omega\CONTRATO OMEGA (EULA)';
    Application.HelpCommand(HELP_FORCEFILE, 0);
end;

end.

