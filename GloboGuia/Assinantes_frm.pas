unit Assinantes_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Edit, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Objects;

type
  TfrmAssinantes = class(TForm)
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    btnEnviar: TButton;
    edtCidade: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtFace: TEdit;
    edtFone: TEdit;
    edtNome: TEdit;
    edtRamo: TEdit;
    edtSite: TEdit;
    Label3: TLabel;
    lblCidade: TLabel;
    lblDescricao: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblFace: TLabel;
    lblFone: TLabel;
    lblNome: TLabel;
    lblRamo: TLabel;
    lblSite: TLabel;
    mmoDescricao: TMemo;
    Label2: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssinantes: TfrmAssinantes;

implementation

{$R *.fmx}

uses
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
FMX.Platform,
System.Math;

procedure TfrmAssinantes.btnEnviarClick(Sender: TObject);
var comando, Destinatario, Assunto, Conteudo : string;
    intent : JIntent;
    Recipients: TJavaObjectArray<JString>;
begin
    Comando:= 'mailto://contatoglobopublicidades@gmail.com';
    Destinatario:= 'contato@globoguia.com.br';
    Assunto:= 'Quero ser um Assinante';
    Conteudo:= lblNome.Text+':'+' '+edtNome.Text+'; '+lblRamo.Text+':'+' '+edtRamo.Text+'; '+lblEndereco.Text+':'+' '+edtEndereco.Text+'; '+lblCidade.Text+':'+' '+edtCidade.Text+'; '
               +lblFone.Text+':'+' '+edtFone.Text+'; '+lblEmail.Text+':'+' '+edtEmail.Text+'; '+lblSite.Text+':'+' '+edtSite.Text+'; '+lblFace.Text+':'+' '+edtFace.Text+'; '+lblDescricao.Text+':'+' '+mmoDescricao.Text;
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

procedure TfrmAssinantes.btnPriorClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmAssinantes.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
    btnEnviar.Position.Y := 920;
end;

procedure TfrmAssinantes.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
    btnEnviar.Position.Y := 1200;
end;

end.
