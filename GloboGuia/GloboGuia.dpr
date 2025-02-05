program GloboGuia;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal_frm in 'Principal_frm.pas' {frmPrincipal},
  Start_frm in 'Start_frm.pas' {frmStart},
  Categoria_frm in 'Categoria_frm.pas' {frmCategoria},
  Classificados_frm in 'Classificados_frm.pas' {frmClassificados},
  Empresas_frm in 'Empresas_frm.pas' {frmEmpresas},
  QuemSomos_frm in 'QuemSomos_frm.pas' {frmQuemSomos},
  Representantes_frm in 'Representantes_frm.pas' {frmRepresentantes},
  Assinantes_frm in 'Assinantes_frm.pas' {frmAssinantes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmStart, frmStart);
  Application.Run;
end.

