program Carro_Comando;



uses
  Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  Cad_Veiculo_frm in 'Cad_Veiculo_frm.pas' {frmCadVeiculo},
  Carro_Comando_dm in 'Carro_Comando_dm.pas' {dmCarroComando: TDataModule},
  CadMotorista_frm in 'CadMotorista_frm.pas' {frmCadMotorista},
  CadCategoria_frm in 'CadCategoria_frm.pas' {frmCadCategoria},
  GerPecas_frm in 'GerPecas_frm.pas' {frmGerPecas},
  PecFin_frm in 'PecFin_frm.pas' {frmPecFin},
  GerViagem_frm in 'GerViagem_frm.pas' {frmGerViagem},
  TdasViag_frm in 'TdasViag_frm.pas' {frmTdasViag},
  GerComb_frm in 'GerComb_frm.pas' {frmGerComb},
  AbastFinal_frm in 'AbastFinal_frm.pas' {frmAbastFinal},
  Consultas_frm in 'Consultas_frm.pas' {frmConsultas},
  Usuario_frm in 'Usuario_frm.pas' {frmUsuario},
  Senha_frm in 'Senha_frm.pas' {frmSenha},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Ativar_frm in 'Ativar_frm.pas' {frmAtivar},
  Impressao_frm in 'Impressao_frm.pas' {frmImpressao},
  ImprimeViagem_frm in 'ImprimeViagem_frm.pas' {frmImprimeViag},
  ImprimeAbast_frm in 'ImprimeAbast_frm.pas' {frmImprAbast},
  ImprimePeca_frm in 'ImprimePeca_frm.pas' {frmImprimePeca},
  RelatViag_frm in 'RelatViag_frm.pas' {frmRelatViag},
  RelatAbast_frm in 'RelatAbast_frm.pas' {frmRelatAbast},
  Browser_frm in 'Browser_frm.pas' {frmBrowser},
  Manutencao_frm in 'Manutencao_frm.pas' {frmManutencao},
  TodasManut_frm in 'TodasManut_frm.pas' {frmTodasManut},
  Lembrete_frm in 'Lembrete_frm.pas' {frmLembrete},
  CadFornec_frm in 'CadFornec_frm.pas' {frmCadFornec},
  Contas_frm in 'Contas_frm.pas' {frmContas},
  ContPagas_frm in 'ContPagas_frm.pas' {frmConPagas},
  LembreteConta_frm in 'LembreteConta_frm.pas' {frmLembreteConta},
  Flex_frm in 'Flex_frm.pas' {frmFlex};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'Carro Comando';
  Application.HelpFile := '';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmCarroComando, dmCarroComando);
  frmSplash.Free;
  Application.Run;
end.
