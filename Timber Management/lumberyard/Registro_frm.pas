unit Registro_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DateUtils, ExtDlgs, Jpeg;

type
  TfrmRegistro = class(TForm)
    GroupBox1: TGroupBox;
    edtUser: TLabeledEdit;
    Shape2: TShape;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    btnAtual: TBitBtn;
    btnSair: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    mkeFone: TMaskEdit;
    lblFone: TLabel;
    btnInserir: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAtualClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistro: TfrmRegistro;

implementation

uses Carro_Comando_dm, ADODB, DB, Ativar_frm, Principal_frm;

{$R *.dfm}

function fConvertImagem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmRegistro.OpenPictureDialog1.FileName;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '\' then
       valor[i] := '/'
    else
       if valor[i] = '/' then
          valor[i] := '\';
    end;
    frmRegistro.OpenPictureDialog1.FileName := valor;
end;

procedure TfrmRegistro.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRegistro.FormShow(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from registro where codigo = 1');
       Active := True;
       edtUser.Text := FieldByName('usuario').AsString;
       mkeFone.Text := FieldByName('fone').AsString;
       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          Image1.Picture.Assign(Jpeg);
       end
       else begin
          Image1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       end;
       edtUser.SetFocus;
end;

procedure TfrmRegistro.btnAtualClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update registro set usuario = '+QuotedStr(edtUser.Text)+', fone = '+QuotedStr(mkeFone.Text)+' where codigo = 1');
       ExecSQL;
       Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Torass - Sucesso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmRegistro.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtUser.Text <> '' then begin
          If OpenPictureDialog1.Execute then begin
             Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
             fConvertImagem;
             iImagem := OpenPictureDialog1.FileName;
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update registro set foto = LOAD_FILE('+QuotedStr(iImagem)+') where codigo = 1');
                ExecSQL;
             end;
             fConvertImagem;
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','Controle de Toras - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Controle de Toras - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmRegistro.btnRemoverClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtUser.Text <> '' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update registro set foto = null where codigo = 1');
             ExecSQL;
             Image1.Picture.Assign(nil);
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','Controle de Toras - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Controle de Toras - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmRegistro.btnInserirClick(Sender: TObject);
begin
    If edtUser.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update registro set usuario = '+QuotedStr(edtUser.Text)+', fone = '+QuotedStr(mkeFone.Text)+' where codigo = 1');
          ExecSQL;
          Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
          frmPrincipal.FormActivate(Sender);
       end;
    end
    else begin
       Application.MessageBox('Os Campos não podem ser vazios! Preencha os campos e tente novamente.','Controle de Toras - Atenção',MB_OK+MB_ICONERROR);
       edtUser.SetFocus;
    end;
end;

end.
