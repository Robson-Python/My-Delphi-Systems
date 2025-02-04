program Omega;



uses
  Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  Carro_Comando_dm in 'Carro_Comando_dm.pas' {dmCarroComando: TDataModule},
  CadDespesa_frm in 'CadDespesa_frm.pas' {frmCadDespesas},
  Consultas_frm in 'Consultas_frm.pas' {frmConsultas},
  Usuario_frm in 'Usuario_frm.pas' {frmUsuario},
  Senha_frm in 'Senha_frm.pas' {frmSenha},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Ativar_frm in 'Ativar_frm.pas' {frmAtivar},
  Impressao_frm in 'Impressao_frm.pas' {frmImpressao},
  CadFunc_frm in 'CadFunc_frm.pas' {frmCadFunc},
  CadProd_frm in 'CadProd_frm.pas' {frmCadProd},
  CadFornec_frm in 'CadFornec_frm.pas' {frmCadFornec},
  EntradaAnimais_frm in 'EntradaAnimais_frm.pas' {frmEntradaAnimais},
  Alimentos_frm in 'Alimentos_frm.pas' {frmAlimentos},
  ConsultaDespesa_frm in 'ConsultaDespesa_frm.pas' {frmConsltaDespesa},
  ConsultaEntProd_frm in 'ConsultaEntProd_frm.pas' {frmConsultaEntProd},
  SaidaAnimais_frm in 'SaidaAnimais_frm.pas' {frmSaidaAnimais},
  ConsultaEntradaAnimais_frm in 'ConsultaEntradaAnimais_frm.pas' {frmConsultaEntradaAnimais},
  ConsultaSaidaAnimais_frm in 'ConsultaSaidaAnimais_frm.pas' {frmConsultaSaidaAnimais},
  ImprimeResumoConf_frm in 'ImprimeResumoConf_frm.pas' {frmImprimeResumoConf},
  ImprimeEstoque_frm in 'ImprimeEstoque_frm.pas' {frmImprimeEstoque},
  ImprimeDespesa_frm in 'ImprimeDespesa_frm.pas' {frmImprimeDespesa},
  ConsultaGastos_frm in 'ConsultaGastos_frm.pas' {frmCosultaGastos},
  ImprimeEntradaAnimal_frm in 'ImprimeEntradaAnimal_frm.pas' {qrpImprimeEntradaAnimal: TQuickRep},
  ImprimeSaidaAnimal_frm in 'ImprimeSaidaAnimal_frm.pas' {qrpImprimeSaidaAnimais: TQuickRep},
  ImprimeConsultaAlimentos_frm in 'ImprimeConsultaAlimentos_frm.pas' {qrpConsultaAlimentos: TQuickRep},
  ImprimeConsultaGasto_frm in 'ImprimeConsultaGasto_frm.pas' {qrpConsultaGasto: TQuickRep},
  ImprimeConsultaEntradaAlimento_frm in 'ImprimeConsultaEntradaAlimento_frm.pas' {qrpConsultaEntradaAlimentos: TQuickRep},
  ImprimeResumoAlimento_frm in 'ImprimeResumoAlimento_frm.pas' {qrpImprimeResumoAlimento: TQuickRep},
  RelatorioGeral_frm in 'RelatorioGeral_frm.pas' {qrpRelatorioGeral: TQuickRep},
  Lavoura_frm in 'Lavoura_frm.pas' {frmLavoura},
  ConsultaLavoura_frm in 'ConsultaLavoura_frm.pas' {frmConsultaLavoura},
  ImprimeLavoura_frm in 'ImprimeLavoura_frm.pas' {qrpLavoura: TQuickRep},
  Backup_frm in 'Backup_frm.pas' {frmBackup},
  PasswordDialog_frm in 'PasswordDialog_frm.pas' {PasswordDlg},
  ControleDiario_frm in 'ControleDiario_frm.pas' {frmControleDiario},
  EntradaResumo_qrp in 'EntradaResumo_qrp.pas' {qrpEntradaResumo: TQuickRep},
  SaidaResumo_qrp in 'SaidaResumo_qrp.pas' {qrpSaidaResumo: TQuickRep};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'Omega';
  Application.HelpFile := '';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmCarroComando, dmCarroComando);
  frmSplash.Free;
  Application.Run;
end.
