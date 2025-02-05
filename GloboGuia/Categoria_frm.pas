unit Categoria_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.DBScope, FMX.ListView,
  FMX.Edit;

type
  TfrmCategoria = class(TForm)
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    ListView1: TListView;
    FDConnection1: TFDConnection;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    FDQuery2: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    LinkFillControlToFieldCT_NOME: TLinkFillControlToField;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    Edit2: TEdit;
    procedure btnPriorClick(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoria: TfrmCategoria;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.iPhone55in.fmx IOS}
{$R *.Macintosh.fmx MACOS}

uses  System.IOUtils, Classificados_frm;

procedure TfrmCategoria.btnPriorClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCategoria.FDConnection1BeforeConnect(Sender: TObject);
begin
    {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FDConnection1.Params.Values['Database'] :=
      TPath.Combine(TPath.GetDocumentsPath, 'GloboGuia.db3');
  {$ENDIF}
end;

procedure TfrmCategoria.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    Try
      Application.CreateForm(TfrmClassificados, frmClassificados);
      frmClassificados.Show;
      With frmClassificados.FDQuery3 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select c_nome from contatos C, cidades CD, categorias CT where CT.CT_NOME = '+QuotedStr(Edit1.Text)+' and CD.CD_NOME = '+QuotedStr(Edit2.Text)+' and C.CD_COD = CD.CD_COD and C.CT_COD = CT.CT_COD order by C.c_nome');
       Active := True;
       frmClassificados.Edit2.Text := Edit2.Text;
    end;
    Finally
         frmClassificados.Free;
    End;
end;

end.
