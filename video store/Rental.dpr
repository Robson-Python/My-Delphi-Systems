program Rental;

uses
  Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  Clientes_frm in 'Clientes_frm.pas' {frmClientes},
  Filmes_frm in 'Filmes_frm.pas' {frmFilmes},
  Reservas_frm in 'Reservas_frm.pas' {frmReservas},
  Locadora_dm in 'Locadora_dm.pas' {dmLocadora: TDataModule},
  Locacoes_frm in 'Locacoes_frm.pas' {frmLocacoes},
  Pagamentos_frm in 'Pagamentos_frm.pas' {frmPagamentos},
  Splash_frm in 'Splash_frm.pas' {frmSplash},
  Registro_frm in 'Registro_frm.pas' {frmRegistro},
  Sobre_frm in 'Sobre_frm.pas' {frmSobre},
  Produtos_frm in 'Produtos_frm.pas' {frmProdutos},
  VendaProduto_frm in 'VendaProduto_frm.pas' {frmVendaProduto},
  Consultas_frm in 'Consultas_frm.pas' {frmConsultas},
  PagarProduto_frm in 'PagarProduto_frm.pas' {frmPagarProduto},
  Ativar_frm in 'Ativar_frm.pas' {frmAtivar};

{$R *.res}

begin
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.Initialize;
  Application.Title := 'Rental';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmLocadora, dmLocadora);
  frmSplash.Free;
  Application.Run;
end.
