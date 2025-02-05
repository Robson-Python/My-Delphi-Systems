unit QuemSomos_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.ImageList, FMX.ImgList, FMX.Objects, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmQuemSomos = class(TForm)
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    btnContato: TButton;
    btnFace: TButton;
    btnEmail: TButton;
    btnSite: TButton;
    Brush1: TBrushObject;
    Image1: TImage;
    ImageList1: TImageList;
    Label2: TLabel;
    Label3: TLabel;
    btnPolitica: TButton;
    procedure btnPriorClick(Sender: TObject);
    procedure btnContatoClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnFaceClick(Sender: TObject);
    procedure btnSiteClick(Sender: TObject);
    procedure btnPoliticaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuemSomos: TfrmQuemSomos;

implementation

{$R *.fmx}

uses IdURI,
Androidapi.JNI.JavaTypes,
Androidapi.JNIBridge,
Androidapi.JNI.GraphicsContentViewText,
Androidapi.JNI.Net,
Androidapi.JNI.Os,
Androidapi.IOUtils,
Androidapi.Jni.App,
FMX.Helpers.Android,
Androidapi.Helpers,
FMX.Platform, Principal_frm;

procedure TfrmQuemSomos.btnContatoClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'tel://069984063076';
    Try
      Intent:= TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_DIAL);
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

procedure TfrmQuemSomos.btnEmailClick(Sender: TObject);
var comando, Destinatario, Assunto, Conteudo : string;
    intent : JIntent;
    Recipients: TJavaObjectArray<JString>;
begin
    Comando:= 'mailto://contato@globoguia.com.br';
    Destinatario:= 'contato@globoguia.com.br';
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

procedure TfrmQuemSomos.btnFaceClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'http://www.facebook.com/globopublicidades';
    Try
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

procedure TfrmQuemSomos.btnPoliticaClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'http://www.globoguia.com.br/politica_privacidade.html';
    Try
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;

end;

procedure TfrmQuemSomos.btnPriorClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmQuemSomos.btnSiteClick(Sender: TObject);
var comando : string;
    intent : JIntent;
begin
    Comando:= 'http://www.globoguia.com.br';
    Try
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
      Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(Comando))));
      SharedActivity.startActivity(Intent);
    Except on E: Exception do
       ShowMessage(E.Message);
    end;
end;

end.
