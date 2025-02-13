program MyShop;

uses
  Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  VendaProduto_frm in 'VendaProduto_frm.pas' {frmVendaProduto},
  Clientes_frm in 'Clientes_frm.pas' {frmClientes},
  Produtos_frm in 'Produtos_frm.pas' {frmProdutos},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  Enterprise_dm in 'Enterprise_dm.pas' {dmEnterprise: TDataModule},
  Servicos_frm in 'Servicos_frm.pas' {frmServicos},
  OrdemServico_qrp in 'OrdemServico_qrp.pas' {qrpOrdemServico: TQuickRep},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Contas_frm in 'Contas_frm.pas' {frmContas},
  Contas_qrp in 'Contas_qrp.pas' {qrpContas: TQuickRep},
  Usuario_frm in 'Usuario_frm.pas' {frmUsuario},
  Senha_frm in 'Senha_frm.pas' {frmSenha},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Ativar_frm in 'Ativar_frm.pas' {frmAtivar},
  Fornecedores_frm in 'Fornecedores_frm.pas' {frmFornecedores},
  Nota_qrp in 'Nota_qrp.pas' {qrpNota: TQuickRep},
  Duplicata_qrp in 'Duplicata_qrp.pas' {qrpDuplicata: TQuickRep},
  Caixa_frm in 'Caixa_frm.pas' {frmCaixa},
  Photobook_frm in 'Photobook_frm.pas' {frmPhotobook},
  Balanco_frm in 'Balanco_frm.pas' {frmBalanco},
  Alerta_frm in 'Alerta_frm.pas' {frmAlerta},
  Agenda_frm in 'Agenda_frm.pas' {frmAgenda},
  Agenda_qrp in 'Agenda_qrp.pas' {qrpAgenda: TQuickRep};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'MyShop';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmEnterprise, dmEnterprise);
  frmSplash.Free;
  Application.Run;
end.
