unit Carro_Comando_dm;

interface

uses
  SysUtils, Classes, DB, ADODB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection;

type
  TdmCarroComando = class(TDataModule)
    DataSource1: TDataSource;
    ZConnection1: TZConnection;
    ADOQuery1: TZQuery;
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
