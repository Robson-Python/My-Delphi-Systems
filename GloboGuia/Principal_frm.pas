unit Principal_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ListView, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FireDAC.Comp.UI,
  FMX.Edit;

type
  TfrmPrincipal = class(TForm)
    FDConnection1: TFDConnection;
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    FDQuery1: TFDQuery;
    ListView1: TListView;
    LinkFillControlToFieldCD_NOME: TLinkFillControlToField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    edtSituacao: TEdit;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure ListView1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}
uses  System.IOUtils, Categoria_frm, Representantes_frm;
{$R *.iPhone47in.fmx IOS}
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.Moto360.fmx ANDROID}
{$R *.Macintosh.fmx MACOS}
{$R *.iPad.fmx IOS}

procedure TfrmPrincipal.btnPriorClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPrincipal.FDConnection1BeforeConnect(Sender: TObject);
begin
    {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FDConnection1.Params.Values['Database'] :=
      TPath.Combine(TPath.GetDocumentsPath, 'GloboGuia.db3');
  {$ENDIF}
end;

procedure TfrmPrincipal.ListView1Change(Sender: TObject);
var Jpeg: FMX.Graphics.TBitmap;
    Strm: TMemoryStream;
begin
    if edtSituacao.Text = 'classificados' then begin
      Try
        Application.CreateForm(TfrmCategoria, frmCategoria);
        frmCategoria.Show;
        frmCategoria.Edit2.Text := Edit1.Text;
      Finally
           frmCategoria.Free;
      End;
    end;
    if edtSituacao.Text = 'lista' then begin
       Try
         Application.CreateForm(TfrmRepresentantes, frmRepresentantes);
         frmRepresentantes.Show;
         With frmRepresentantes.FDQuery3 do begin
            Active := False;
            SQL.Clear;
            SQL.Add('select c_nome from contatos C, cidades CD where CD.CD_NOME = '+QuotedStr(Edit1.Text)+' and C.CD_COD = CD.CD_COD order by C.c_nome');
            Active := True;
            frmRepresentantes.Edit2.Text := Edit1.Text;
         end;
       Finally
         frmRepresentantes.Free;
       End;
    end;
end;

end.
