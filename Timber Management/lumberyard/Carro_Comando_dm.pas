unit Carro_Comando_dm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmVendas = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmVendas: TdmVendas;

implementation

{$R *.dfm}

end.
