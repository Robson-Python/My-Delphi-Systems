unit Backup_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Gauges, FileCtrl, Shellapi;

type
  TfrmBackup = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DriveComboBox1: TDriveComboBox;
    dir_1: TDirectoryListBox;
    DriveComboBox2: TDriveComboBox;
    dir_2: TDirectoryListBox;
    btnDestino: TBitBtn;
    btnOrigem: TBitBtn;
    file_1: TFileListBox;
    btnFechar: TBitBtn;
    btnCopiar: TBitBtn;
    Panel1: TPanel;
    prog: TGauge;
    btnLimpar: TBitBtn;
    procedure btnCopiarClick(Sender: TObject);
    procedure btnOrigemClick(Sender: TObject);
    procedure btnDestinoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure DeleteDir( hHandle : THandle; Const sPath : String );
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}


procedure TfrmBackup.btnCopiarClick(Sender: TObject);
var dir,dir2:pchar;
    a:integer;
begin
    panel1.visible:=true;
    dir :=pchar(dir_1.directory);
    dir2 :=pchar(dir_2.directory);
    for a :=0 to file_1.Items.Count do begin
      file_1.itemindex :=a;
      prog.progress :=(a*100) div file_1.Items.Count;
      copyfile(pchar(dir+'\'+ExtractFilename(file_1.FileName)),pchar(dir2+'\'+ExtractFilename(file_1.FileName)),true);
    end;
    Application.MessageBox('Backup Realizado com Sucesso!', 'Sistema Almoxarifado', MB_OK + MB_ICONINFORMATION);
    panel1.visible :=false;
end;

procedure TfrmBackup.btnOrigemClick(Sender: TObject);
var dir : string;
begin
    dir :=InputBox('Criar diretório','Digite o nome do diretório','');
    createdir(pchar(dir_1.directory+'\'+dir));
    dir_1.Update;
end;

procedure TfrmBackup.btnDestinoClick(Sender: TObject);
var dir : string;
begin
    dir :=InputBox('Criar diretório','Digite o nome do diretório','');
    createdir(pchar(dir_2.directory+'\'+dir));
    dir_2.Update;
end;

procedure TfrmBackup.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmBackup.DeleteDir( hHandle : THandle; Const sPath : String );
var
  OpStruc: TSHFileOpStruct;
  FromBuffer, ToBuffer: Array[0..128] of Char;
begin
    fillChar( OpStruc, Sizeof(OpStruc), 0 );
    FillChar( FromBuffer, Sizeof(FromBuffer), 0 );
    FillChar( ToBuffer, Sizeof(ToBuffer), 0 );
    StrPCopy( FromBuffer, sPath);
    With OpStruc do begin
       Wnd:= hHandle;
       wFunc:=FO_DELETE;
       pFrom:= @FromBuffer;
       pTo:= @ToBuffer;
       fFlags:= FOF_NOCONFIRMATION;
       fAnyOperationsAborted:=False;
       hNameMappings:=nil;
//       lpszProgressTitle:=nil;
    end;
    ShFileOperation(OpStruc);
end;

procedure TfrmBackup.btnLimparClick(Sender: TObject);
begin
    DeleteDir( Self.Handle, dir_2.Directory);
end;

end.
