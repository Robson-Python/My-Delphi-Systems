unit Empresas_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Advertising,
  FMX.Analytics, FMX.Analytics.AppAnalytics, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.FMXUI.Wait, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.StdCtrls, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  FMX.Layouts, FMX.Objects, Fmx.Bind.Editors, System.ImageList, FMX.ImgList,
  FMX.Ani, FMX.Edit, FMX.WebBrowser, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmEmpresas = class(TForm)
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    FDConnection5: TFDConnection;
    BindingsList5: TBindingsList;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    BindSourceDB5: TBindSourceDB;
    FDQuery5: TFDQuery;
    ImageList1: TImageList;
    Button1: TButton;
    ScrollBox1: TScrollBox;
    lblEndereco: TLabel;
    lblEmail: TLabel;
    lblFace: TLabel;
    lblCelular: TLabel;
    Label2: TLabel;
    lblNome: TLabel;
    Panel1: TPanel;
    btnFace: TButton;
    btnSite: TButton;
    btnEmail: TButton;
    btnCelular: TButton;
    btnFone: TButton;
    btnMapa: TButton;
    Edit1: TEdit;
    lblFone: TLabel;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtFone: TEdit;
    edtCelular: TEdit;
    edtEmail: TEdit;
    Memo1: TMemo;
    edtSite: TEdit;
    edtFace: TEdit;
    Image1: TImage;
    procedure FDConnection5BeforeConnect(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFoneClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnSiteClick(Sender: TObject);
    procedure btnFaceClick(Sender: TObject);
    procedure btnCelularClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnMapaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresas: TfrmEmpresas;

implementation

{$R *.fmx}


uses System.IOUtils,
IdURI,
Androidapi.JNI.JavaTypes,
Androidapi.JNIBridge,
Androidapi.JNI.GraphicsContentViewText,
Androidapi.JNI.Net,
Androidapi.JNI.Os,
Androidapi.IOUtils,
Androidapi.Jni.App,
FMX.Helpers.Android,
Androidapi.Helpers,
FMX.Platform, Principal_frm, Categoria_frm, Classificados_frm;


procedure TfrmEmpresas.btnPriorClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEmpresas.btnSiteClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'http://'+edtSite.Text;
    Try
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

procedure TfrmEmpresas.btnCelularClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'tel://'+edtCelular.Text;
    Try
      Intent:= TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_DIAL);  //ACTION_DIAL Irá chamar o Discador já com o Número
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

procedure TfrmEmpresas.Button1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmEmpresas.btnMapaClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'geo://0,0?q='+edtEndereco.Text+', '+Edit1.Text+'';
  Try
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
    Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
    SharedActivity.startActivity(Intent);
  Except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TfrmEmpresas.FDConnection5BeforeConnect(Sender: TObject);
begin
    {$IF DEFINED(iOS) or DEFINED(ANDROID)}
    FDConnection5.Params.Values['Database'] :=
      TPath.Combine(TPath.GetDocumentsPath, 'GloboGuia.db3');
  {$ENDIF}
end;

procedure TfrmEmpresas.btnEmailClick(Sender: TObject);
var comando, Destinatario, Assunto, Conteudo : string;
    intent : JIntent;
    Recipients: TJavaObjectArray<JString>;
begin
    Comando:= 'mailto://'+edtEmail.Text;
    Destinatario:= edtEmail.Text;
    Try
      Intent:= TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
      Recipients:= TJavaObjectArray<JString>.Create(1);
      Recipients.Items[0] := StringToJString(Destinatario);
      Intent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, Recipients);
      Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString(Assunto));
      Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(Conteudo));
      Intent.setType(StringToJString(Comando));
      SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent,StrToJCharSequence('Selecione um App. de E-mail.')));
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

procedure TfrmEmpresas.btnFaceClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'http://'+edtFace.Text;
    Try
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

procedure TfrmEmpresas.btnFoneClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'tel://'+edtFone.Text;
    Try
      Intent:= TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_DIAL);  //ACTION_DIAL Irá chamar o Discador já com o Número
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

end.

