unit Sobre_frm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Registry;

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
    Label7: TLabel;
    Image1: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label29Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses Principal_frm, Carro_Comando_dm, ADODB, Browser_frm;

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
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario, registro, dt_valid from registro where codigo = 1');
       Active := True;
       Label16.Caption := FieldByName('usuario').AsString;
       Label18.Caption := FieldByName('registro').AsString;
       Label19.Caption := FieldByName('dt_valid').AsString;
    end;
    Label24.Caption := SysComputerName;
    Label26.Caption := sysMemory;
end;

procedure TfrmSobre.Label20Click(Sender: TObject);
begin
    Close;
    frmPrincipal.Browser1Click(Sender);
end;

procedure TfrmSobre.Label5Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Skype\Phone\Skype',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Skype instalado!','Carro Comando - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.Label25Click(Sender: TObject);
begin
    Try
      WinExec('C:\Arquivos de programas\Windows Live\Messenger\msnmsgr',SW_SHOW);
    Except
      Application.MessageBox('Verifique se seu computador possui o Windows Live Messenger instalado!','Carro Comando - Aviso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmSobre.Label29Click(Sender: TObject);
begin
    Close;
    frmPrincipal.Browser1Click(Sender);
    frmBrowser.edtEndereco.Text := 'http://robsonpereira1977.blog.uol.com.br';
    frmBrowser.Web.Navigate(frmBrowser.edtEndereco.Text);
end;

end.

