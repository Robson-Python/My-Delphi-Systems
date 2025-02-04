program Backup;

uses
  Forms,
  Backup_frm in 'Backup_frm.pas' {frmBackup};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MyContatos - Backup/Restore';
  Application.CreateForm(TfrmBackup, frmBackup);
  Application.Run;
end.
