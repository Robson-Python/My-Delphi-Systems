unit Backup_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, ExtCtrls, FileCtrl, StdCtrls, Buttons;

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
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    file_1: TFileListBox;
    btnFechar: TBitBtn;
    btncopiar: TBitBtn;
    Panel1: TPanel;
    prog: TGauge;
    procedure btncopiarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

procedure TfrmBackup.btncopiarClick(Sender: TObject);
var dir,dir2:pchar;
    a:integer;
begin
    panel1.visible:=true;
    dir:=pchar(dir_1.directory);
    dir2:=pchar(dir_2.directory);
    for a:=0 to file_1.Items.Count do begin
      file_1.itemindex:=a;
      DeleteFile(pchar(dir2+'\'+ExtractFilename(file_1.FileName)));
      prog.progress:=(a*100) div file_1.Items.Count;
      copyfile(pchar(dir+'\'+ExtractFilename(file_1.FileName)),pchar(dir2+'\'+ExtractFilename(file_1.FileName)),true);
    end;
    Application.MessageBox('Backup Realizado com Sucesso!', 'Omega - Backup', MB_OK + MB_ICONINFORMATION);
    panel1.visible:=false;
end;

procedure TfrmBackup.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmBackup.BitBtn5Click(Sender: TObject);
var dir:string;
begin
    dir:=InputBox('Criar diretório','Digite o nome do diretório','');
    createdir(pchar(dir_1.directory+'\'+dir));
    dir_1.Update;
end;

procedure TfrmBackup.BitBtn4Click(Sender: TObject);
var dir:string;
begin
    dir:=InputBox('Criar diretório','Digite o nome do diretório','');
    createdir(pchar(dir_2.directory+'\'+dir));
    dir_2.Update;
end;

end.
