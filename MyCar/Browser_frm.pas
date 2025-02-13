unit Browser_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OleCtrls, SHDocVw, ExtCtrls, ComCtrls;

type
  TfrmBrowser = class(TForm)
    StatusBar1: TStatusBar;
    Web: TWebBrowser;
    Panel1: TPanel;
    btnVoltar: TSpeedButton;
    btnAvancar: TSpeedButton;
    btnParar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnIr: TSpeedButton;
    btnSair: TSpeedButton;
    edtEndereco: TEdit;
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnIrClick(Sender: TObject);
    procedure WebTitleChange(Sender: TObject; const Text: WideString);
    procedure WebStatusTextChange(Sender: TObject; const Text: WideString);
    procedure WebDownloadComplete(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowser: TfrmBrowser;

implementation

{$R *.dfm}

procedure TfrmBrowser.edtEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then
       Web.Navigate(edtEndereco.Text);
end;

procedure TfrmBrowser.btnVoltarClick(Sender: TObject);
begin
    Web.GoBack;
end;

procedure TfrmBrowser.btnAvancarClick(Sender: TObject);
begin
    Web.GoForward;
end;

procedure TfrmBrowser.btnPararClick(Sender: TObject);
begin
    Web.Stop;
end;

procedure TfrmBrowser.btnAtualizarClick(Sender: TObject);
begin
    Web.Refresh;
end;

procedure TfrmBrowser.btnIrClick(Sender: TObject);
begin
    Web.Navigate(edtEndereco.Text);
end;

procedure TfrmBrowser.WebTitleChange(Sender: TObject;
  const Text: WideString);
begin
    Caption := Text + ' - Carro Comando - Browser Internet';
end;

procedure TfrmBrowser.WebStatusTextChange(Sender: TObject;
  const Text: WideString);
begin
    StatusBar1.SimpleText := Text; 
end;

procedure TfrmBrowser.WebDownloadComplete(Sender: TObject);
begin
    edtEndereco.Text := Web.LocationURL;
end;

procedure TfrmBrowser.btnSairClick(Sender: TObject);
begin
    Close;
//    Free;
end;

procedure TfrmBrowser.FormShow(Sender: TObject);
begin
    edtEndereco.Text := 'http://robsonpereira1977.sites.uol.com.br';
    Web.Navigate(edtEndereco.Text);
end;

end.
