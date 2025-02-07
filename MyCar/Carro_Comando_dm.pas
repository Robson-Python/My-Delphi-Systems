unit Carro_Comando_dm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmCarroComando = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCarroComando: TdmCarroComando;

implementation

{$R *.dfm}

end.
