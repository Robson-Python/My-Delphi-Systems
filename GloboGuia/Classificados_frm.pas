unit Classificados_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.FMXUI.Wait, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListView, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Edit, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmClassificados = class(TForm)
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    ListView3: TListView;
    FDConnection3: TFDConnection;
    BindingsList3: TBindingsList;
    BindSourceDB3: TBindSourceDB;
    FDQuery3: TFDQuery;
    FDGUIxWaitCursor3: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink3: TFDPhysSQLiteDriverLink;
    LinkFillControlToFieldC_NOME: TLinkFillControlToField;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    Edit2: TEdit;
    IdHTTP1: TIdHTTP;
    edtBrowse: TEdit;
    procedure FDConnection3BeforeConnect(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure ListView3ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClassificados: TfrmClassificados;

implementation

{$R *.fmx}
uses  System.IOUtils, Categoria_frm, Empresas_frm, Principal_frm;

procedure TfrmClassificados.btnPriorClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmClassificados.FDConnection3BeforeConnect(Sender: TObject);
begin
    {$IF DEFINED(iOS) or DEFINED(ANDROID)}
    FDConnection3.Params.Values['Database'] :=
      TPath.Combine(TPath.GetDocumentsPath, 'GloboGuia.db3');
  {$ENDIF}
end;

procedure TfrmClassificados.ListView3ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var Jpeg: FMX.Graphics.TBitmap;
    Strm: TMemoryStream;
begin
    Try
      Application.CreateForm(TfrmEmpresas, frmEmpresas);
      frmEmpresas.Show;
       With frmEmpresas.FDQuery5 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select contatos.* from contatos, cidades where contatos.c_nome = '+QuotedStr(Edit1.Text)+' and cidades.cd_nome = '+QuotedStr(Edit2.Text)+' and contatos.cd_cod = cidades.cd_cod');
          Active := True;
          frmEmpresas.edtNome.Text := FieldByName('c_nome').AsString;
          frmEmpresas.edtEndereco.Text := FieldByName('c_endereco').AsString;
          frmEmpresas.edtFone.Text := FieldByName('c_fone').AsString;
          frmEmpresas.edtCelular.Text := FieldByName('c_celular').AsString;
          frmEmpresas.edtEmail.Text := FieldByName('c_email').AsString;
          frmEmpresas.edtSite.Text := FieldByName('c_site').AsString;
          frmEmpresas.edtFace.Text := FieldByName('c_facebook').AsString;
          frmEmpresas.Memo1.Text := FieldByName('c_sobre').AsString;
          edtBrowse.Text := FieldByName('c_foto').AsString;
       end;
//     Screen.Cursor := crHourGlass;
       Jpeg := FMX.Graphics.TBitmap.Create;
       Strm := TMemoryStream.Create;
       try
         IdHTTP1.Get(edtBrowse.Text, Strm);
         if (Strm.Size > 0) then begin
           Strm.Position := 0;
           Jpeg.LoadFromStream(Strm);
           frmEmpresas.Image1.Bitmap.Assign(Jpeg);
         end;
       finally
            Strm.Free;
            Jpeg.Free;
//          Screen.Cursor := crDefault;
       end;
       frmEmpresas.Edit1.Text := Edit2.Text;
    Finally
         frmEmpresas.Free;
    End;
end;

end.
