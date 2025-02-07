program Almoxarifado;



uses
  Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  CadCli_frm in 'CadCli_frm.pas' {frmCadVeiculo},
  Carro_Comando_dm in 'Carro_Comando_dm.pas' {dmVendas: TDataModule},
  Usuario_frm in 'Usuario_frm.pas' {frmUsuario},
  Senha_frm in 'Senha_frm.pas' {frmSenha},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Ativar_frm in 'Ativar_frm.pas' {frmAtivar},
  Impressao_frm in 'Impressao_frm.pas' {frmImpressao},
  CadFornec_frm in 'CadFornec_frm.pas' {frmCadFornec},
  CadProd_frm in 'CadProd_frm.pas' {frmCadProd},
  Entrada_frm in 'Entrada_frm.pas' {frmEntrada},
  SelEntrada_frm in 'SelEntrada_frm.pas' {frmSelEntrada},
  ConsProd_frm in 'ConsProd_frm.pas' {frmConsProd},
  Saida_frm in 'Saida_frm.pas' {frmSaida},
  SelSaida_frm in 'SelSaida_frm.pas' {frmSelSaida},
  ConsProdSaida_frm in 'ConsProdSaida_frm.pas' {frmConsProdSaida},
  ImprimeEstoque_frm in 'ImprimeEstoque_frm.pas' {frmImprimeEstoq},
  ImprimeEntrada_frm in 'ImprimeEntrada_frm.pas' {frmImprimeEntrada},
  ImprimeVenda_frm in 'ImprimeVenda_frm.pas' {frmImprimeVenda},
  ImprimeResEntrada_frm in 'ImprimeResEntrada_frm.pas' {frmImprResEntrada},
  ImprimeSaida_frm in 'ImprimeSaida_frm.pas' {frmImprimSaida},
  ImprimResSaida_frm in 'ImprimResSaida_frm.pas' {frmImprimResSaida},
  Backup_frm in 'Backup_frm.pas' {frmBackup},
  ImprimeCompra_frm in 'ImprimeCompra_frm.pas' {frmReltCompra},
  ImprimeAvista_frm in 'ImprimeAvista_frm.pas' {frmImprimAvista},
  ImprimeAprazo_frm in 'ImprimeAprazo_frm.pas' {frmImprimAprazo},
  CadMedida_frm in 'CadMedida_frm.pas' {frmCadMed},
  CadCateg_frm in 'CadCateg_frm.pas' {frmCadCateg};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'Sistema Almoxarifado';
  Application.HelpFile := '';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmVendas, dmVendas);
  frmSplash.Free;
  Application.Run;
end.
