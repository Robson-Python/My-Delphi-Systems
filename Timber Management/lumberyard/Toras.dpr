program Toras;



uses
  Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  Carro_Comando_dm in 'Carro_Comando_dm.pas' {dmVendas: TDataModule},
  Usuario_frm in 'Usuario_frm.pas' {frmUsuario},
  Senha_frm in 'Senha_frm.pas' {frmSenha},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Ativar_frm in 'Ativar_frm.pas' {frmAtivar},
  CadFornec_frm in 'CadFornec_frm.pas' {frmCadTerceiro},
  Entrada_frm in 'Entrada_frm.pas' {frmEntrada},
  Backup_frm in 'Backup_frm.pas' {frmBackup},
  CadEmpresa_frm in 'CadEmpresa_frm.pas' {frmCadEmpresa},
  CadSubEsp_frm in 'CadSubEsp_frm.pas' {frmCadEspecie},
  MateriaPrima_frm in 'MateriaPrima_frm.pas' {frmClassificacao},
  Deposito_frm in 'Deposito_frm.pas' {frmDeposito},
  CadFreteiro_frm in 'CadFreteiro_frm.pas' {frmCadFreteiro},
  ImprimeCompra_frm in 'ImprimeCompra_frm.pas' {frmReltCompra},
  Saida_frm in 'Saida_frm.pas' {frmSaida},
  ImprimeSaidaTora_frm in 'ImprimeSaidaTora_frm.pas' {frmImprimeSaidaTora},
  ImprimeEntrada_frm in 'ImprimeEntrada_frm.pas' {frmImprimeEntrada},
  ImprimeResFornFret_frm in 'ImprimeResFornFret_frm.pas' {frmImpResFornFret},
  ImprimFret_frm in 'ImprimFret_frm.pas' {frmImprFret},
  ImprimeEstoque_frm in 'ImprimeEstoque_frm.pas' {frmImprimeEstoq},
  ImprEstoqUtil_frm in 'ImprEstoqUtil_frm.pas' {frmImprEstqUtil},
  PlanilhaForn_frm in 'PlanilhaForn_frm.pas' {frmPlanilhaForn},
  PlanilhaFrete_frm in 'PlanilhaFrete_frm.pas' {frmPlanilhaFrete},
  ImprimeSaida_frm in 'ImprimeSaida_frm.pas' {frmImprimeSaida},
  ConsTora_frm in 'ConsTora_frm.pas' {frmConsTora},
  ImpEmpresa_frm in 'ImpEmpresa_frm.pas' {frmImpEmpresa},
  ImpTerceiro_frm in 'ImpTerceiro_frm.pas' {frmImpTerceiro},
  ImpDeposito_frm in 'ImpDeposito_frm.pas' {frmImpDeposito},
  ImpClassificacao in 'ImpClassificacao.pas' {frmImpClassificacao},
  ImpEspecie_frm in 'ImpEspecie_frm.pas' {frmImpEspecie},
  EmisRelEntrada_frm in 'EmisRelEntrada_frm.pas' {frmEmisRelEntrada},
  ImprimeTerceiro_frm in 'ImprimeTerceiro_frm.pas' {frmImprimeTerceiro},
  EmissEstoq_frm in 'EmissEstoq_frm.pas' {frmEmisEstoq},
  EmisRelSaida_frm in 'EmisRelSaida_frm.pas' {frmEmisRelSaida},
  EmissaoRelAcumulativo_frm in 'EmissaoRelAcumulativo_frm.pas' {frmEmissaoRelAcumulativo};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'Controle de Toras';
  Application.HelpFile := '';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmVendas, dmVendas);
  frmSplash.Free;
  Application.Run;
end.
