program MyCar;



uses
  Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  Cad_Veiculo_frm in 'Cad_Veiculo_frm.pas' {frmCadVeiculo},
  Carro_Comando_dm in 'Carro_Comando_dm.pas' {dmCarroComando: TDataModule},
  CadMotorista_frm in 'CadMotorista_frm.pas' {frmCadMotorista},
  Pecas_frm in 'Pecas_frm.pas' {frmPecas},
  Consultas_frm in 'Consultas_frm.pas' {frmConsultas},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Ativar_frm in 'Ativar_frm.pas' {frmAtivar},
  Manutencao_frm in 'Manutencao_frm.pas' {frmManutencao},
  CadFornec_frm in 'CadFornec_frm.pas' {frmCadFornec},
  Flex_frm in 'Flex_frm.pas' {frmFlex},
  Photobook_frm in 'Photobook_frm.pas' {frmPhotobook},
  CompraVenda_frm in 'CompraVenda_frm.pas' {frmCompraVenda},
  Contas_frm in 'Contas_frm.pas' {frmContas},
  Agenda_frm in 'Agenda_frm.pas' {frmAgenda},
  Alerta_frm in 'Alerta_frm.pas' {frmAlerta},
  Agenda_qrp in 'Agenda_qrp.pas' {qrpAgenda: TQuickRep},
  Contas_qrp in 'Contas_qrp.pas' {qrpContas: TQuickRep},
  Pecas_qrp in 'Pecas_qrp.pas' {qrpPecas: TQuickRep},
  Manutencao_qrp in 'Manutencao_qrp.pas' {qrpManutencao: TQuickRep},
  CompraVenda_qrp in 'CompraVenda_qrp.pas' {qrpCompraVenda: TQuickRep},
  Revisoes_frm in 'Revisoes_frm.pas' {frmRevisoes},
  Revisoes_qrp in 'Revisoes_qrp.pas' {qrpRevisao: TQuickRep};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'MyCar';
  Application.HelpFile := '';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmCarroComando, dmCarroComando);
  frmSplash.Free;
  Application.Run;
end.
