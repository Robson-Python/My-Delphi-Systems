program MyContatos;

uses
  Vcl.Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  Clientes_frm in 'Clientes_frm.pas' {frmClientes},
  Usuario_frm in 'Usuario_frm.pas' {frmUsuario},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  PosVenda_frm in 'PosVenda_frm.pas' {frmPosVenda},
  Auditoria_frm in 'Auditoria_frm.pas' {frmAuditoria},
  ClientesPosVenda_frm in 'ClientesPosVenda_frm.pas' {frmClientePosVenda},
  Contato_dm in 'Contato_dm.pas' {dmContato: TDataModule},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Motos_frm in 'Motos_frm.pas' {frmMotos},
  Senha_frm in 'Senha_frm.pas' {frmSenha},
  Relatorios_frm in 'Relatorios_frm.pas' {frmRelatorios};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'MyContatos';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmContato, dmContato);
  Application.CreateForm(TfrmSenha, frmSenha);
  frmSplash.Free;
  Application.Run;
end.
