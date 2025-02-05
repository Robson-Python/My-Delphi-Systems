unit Start_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Layouts, IdBaseComponent, IdComponent, IdCustomTCPServer, IdMappedPortTCP,
  IdMappedTelnet, IdMappedPOP3, System.Sensors, System.Sensors.Components,
  IPPeerClient, REST.Backend.PushTypes, System.JSON,
  REST.Backend.KinveyPushDevice, System.PushNotification, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.ScrollBox, FMX.Memo, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Backend.BindSource, REST.Backend.PushDevice,
  REST.Backend.KinveyProvider;

type
  TfrmStart = class(TForm)
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    ImageList1: TImageList;
    Brush1: TBrushObject;
    ScrollBox1: TScrollBox;
    BindingsList1: TBindingsList;
    btnNotificar: TButton;
    Image2: TImage;
    Image1: TImage;
    Panel1: TPanel;
    btnGlobo: TButton;
    btnRepresentar: TButton;
    btnClassificados: TButton;
    btnQuemSomos: TButton;
    btnAssinantes: TButton;
    btnAtualizar: TButton;
    Memo1: TMemo;
    KinveyProvider1: TKinveyProvider;
    PushEvents1: TPushEvents;
    procedure btnClassificadosClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnQuemSomosClick(Sender: TObject);
    procedure btnRepresentarClick(Sender: TObject);
    procedure btnAssinantesClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure PushEvents1DeviceTokenRequestFailed(Sender: TObject;
      const AErrorMessage: string);
    procedure btnNotificarClick(Sender: TObject);
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStart: TfrmStart;

implementation

{$R *.fmx}

uses Principal_frm, QuemSomos_frm, Representantes_frm,
  Assinantes_frm,
System.IOUtils,
IdURI,
Androidapi.JNI.JavaTypes,
Androidapi.JNIBridge,
Androidapi.JNI.GraphicsContentViewText,
Androidapi.JNI.Net,
Androidapi.JNI.Os,
Androidapi.IOUtils,
Androidapi.Jni.App,
FMX.Helpers.Android,
FMX.Platform,
Androidapi.Helpers;


procedure TfrmStart.btnAssinantesClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmAssinantes, frmAssinantes);
      frmAssinantes.Show;
    Finally
         frmAssinantes.Free;
    End;
end;

procedure TfrmStart.btnClassificadosClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
      frmPrincipal.Show;
      frmPrincipal.edtSituacao.Text := 'classificados';
    Finally
         frmPrincipal.Free;
    End;
end;

procedure TfrmStart.btnNotificarClick(Sender: TObject);
begin
    Memo1.Visible := False;
    btnNotificar.Visible := False;
end;

procedure TfrmStart.btnPriorClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmStart.btnQuemSomosClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmQuemSomos, frmQuemSomos);
      frmQuemSomos.Show;
    Finally
         frmQuemSomos.Free;
    End;
end;

procedure TfrmStart.btnRepresentarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
      frmPrincipal.Show;
      frmPrincipal.edtSituacao.Text := 'lista';
    Finally
         frmPrincipal.Free;
    End;
end;

procedure TfrmStart.FormCreate(Sender: TObject);
begin
    PushEvents1.Active := True;
end;

procedure TfrmStart.PushEvents1DeviceTokenRequestFailed(Sender: TObject;
  const AErrorMessage: string);
begin
    Memo1.Lines.Add('Device Token Request Failed');
    Memo1.Lines.Add(AErrorMessage);
    Memo1.Lines.Add('');
end;

procedure TfrmStart.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
begin
    Memo1.Visible := True;
    btnNotificar.Visible := True;
    Memo1.Lines.Add('GloboGuia Informa:');
    Memo1.Lines.Add(AData.Message);
    Memo1.Lines.Add('');
end;

procedure TfrmStart.btnAtualizarClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'https://play.google.com/store/apps/details?id=com.globopublicidades.GloboGuia';
    Try
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

end.
