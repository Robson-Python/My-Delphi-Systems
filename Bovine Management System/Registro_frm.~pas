unit Registro_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DateUtils, ExtDlgs, Jpeg;

type
  TfrmRegistro = class(TForm)
    GroupBox1: TGroupBox;
    edtUser: TLabeledEdit;
    edtEnd: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCid: TLabeledEdit;
    edtUf: TLabeledEdit;
    lblCep: TLabel;
    lblCpf: TLabel;
    mkeCpf: TMaskEdit;
    edtRg: TLabeledEdit;
    Shape2: TShape;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    btnRegist: TBitBtn;
    btnAtual: TBitBtn;
    btnSair: TBitBtn;
    mkeCep: TMaskEdit;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRegistClick(Sender: TObject);
    procedure btnAtualClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistro: TfrmRegistro;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

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
    frmPrincipal.FormActivate(Sender);
    Close;
end;

procedure TfrmRegistro.FormShow(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from registro where codigo = 1');
       Active := True;
       edtUser.Text := FieldByName('usuario').AsString;
       edtEnd.Text := FieldByName('end_registro').AsString;
       edtBairro.Text := FieldByName('bairro').AsString;
       edtCid.Text := FieldByName('cidade').AsString;
       edtUf.Text := FieldByName('uf_registro').AsString;
       mkeCep.Text := FieldByName('cep').AsString;
       mkeCpf.Text := FieldByName('cpf_user').AsString;
       edtRg.Text := FieldByName('rg').AsString;
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
end;

procedure TfrmRegistro.btnRegistClick(Sender: TObject);
begin
    If edtUser.Text <> '' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into registro (CODIGO, USUARIO, END_REGISTRO, BAIRRO, CIDADE, UF_REGISTRO, CEP, CPF_USER, RG, FOTO) values (1, '+QuotedStr(edtUser.Text)+', '+QuotedStr(edtEnd.Text)+', '+QuotedStr(edtBairro.Text)+', '+QuotedStr(edtCid.Text)+', '+QuotedStr(edtUf.Text)+', '+QuotedStr(mkeCep.Text)+', '+QuotedStr(mkeCpf.Text)+', '+QuotedStr(edtRg.Text)+', '''')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
          frmPrincipal.FormActivate(Sender);
       end;
    end
    else begin
       Application.MessageBox('Os Campos não podem ser vazios! Preencha os campos e tente novamente.','Omega - Atenção',MB_OK+MB_ICONERROR);
       edtUser.SetFocus;
    end;
end;

procedure TfrmRegistro.btnAtualClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update registro set usuario = '+QuotedStr(edtUser.Text)+', end_registro = '+QuotedStr(edtEnd.Text)+', bairro = '+QuotedStr(edtBairro.Text)+', cidade = '+QuotedStr(edtCid.Text)+', uf_registro = '+QuotedStr(edtUf.Text)+', cep = '+QuotedStr(mkeCep.Text)+', cpf_user = '+QuotedStr(mkeCpf.Text)+', rg = '+QuotedStr(edtRg.Text)+' where codigo = 1');
       ExecSQL;
       ShortDateFormat := 'yyyy-mm-dd';
       Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
       frmPrincipal.FormActivate(Sender);
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
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update registro set foto = LOAD_FILE('+QuotedStr(iImagem)+') where codigo = 1');
                ExecSQL;
             end;
             fConvertImagem;
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','Omega - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmRegistro.btnRemoverClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtUser.Text <> '' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update registro set foto = null where codigo = 1');
             ExecSQL;
             Image1.Picture.Assign(nil);
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','Omega - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

end.
