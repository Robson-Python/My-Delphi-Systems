unit Enterprise_dm;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TdmEnterprise = class(TDataModule)
    zcEnterprise: TZConnection;
    zqEnterprise: TZQuery;
    dsEnterprise: TDataSource;
    zqSystem: TZQuery;
    zcSystem: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEnterprise: TdmEnterprise;

implementation

{$R *.dfm}

end.
