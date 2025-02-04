unit Registro_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DateUtils, ExtDlgs, Jpeg;

type
  TfrmRegistro = class(TForm)
    GroupBox1: TGroupBox;
    Shape2: TShape;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    btnRegist: TBitBtn;
    btnAtual: TBitBtn;
    btnSair: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    lblCep: TLabel;
    lblCpf: TLabel;
    edtUser: TLabeledEdit;
    edtEnd: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCid: TLabeledEdit;
    edtUf: TLabeledEdit;
    mkeCpf: TMaskEdit;
    mkeCep: TMaskEdit;
    edtSobrenome: TLabeledEdit;
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

uses Principal_frm, Carro_Comando_dm, DB;

{$R *.dfm}

procedure TfrmRegistro.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRegistro.FormShow(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from registro');
       Active := True;
       edtUser.Text := FieldByName('r_nome').AsString;
       edtEnd.Text := FieldByName('r_endereco').AsString;
       edtBairro.Text := FieldByName('r_bairro').AsString;
       edtCid.Text := FieldByName('r_cidade').AsString;
       edtUf.Text := FieldByName('r_uf').AsString;
       mkeCep.Text := FieldByName('r_cep').AsString;
       mkeCpf.Text := FieldByName('r_cpf').AsString;
       edtSobrenome.Text := FieldByName('r_sobrenome').AsString;
       fFoto := CreateBlobStream(FieldByName('r_foto'), bmRead);
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
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into registro (R_NOME, R_SOBRENOME, R_ENDERECO, R_BAIRRO, R_CIDADE, R_UF, R_CEP, R_CPF, R_FOTO) values ('+QuotedStr(edtUser.Text)+', '+QuotedStr(edtSobrenome.Text)+', '+QuotedStr(edtEnd.Text)+', '+QuotedStr(edtBairro.Text)+', '+QuotedStr(edtCid.Text)+', '+QuotedStr(edtUf.Text)+', '+QuotedStr(mkeCep.Text)+', '+QuotedStr(mkeCpf.Text)+', '''')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('Os Campos n�o podem ser vazios! Preencha os campos e tente novamente.','MyCar - Aten��o',MB_OK+MB_ICONERROR);
       edtUser.SetFocus;
    end;
end;

procedure TfrmRegistro.btnAtualClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update registro set R_NOME = '+QuotedStr(edtUser.Text)+', R_ENDERECO = '+QuotedStr(edtEnd.Text)+', R_BAIRRO = '+QuotedStr(edtBairro.Text)+', R_CIDADE = '+QuotedStr(edtCid.Text)+', R_UF = '+QuotedStr(edtUf.Text)+', R_CEP = '+QuotedStr(mkeCep.Text)+', R_CPF = '+QuotedStr(mkeCpf.Text)+', R_sobrenome = '+QuotedStr(edtSobrenome.Text)+' where r_nome = '+QuotedStr(edtUser.Text)+'');
       ExecSQL;
       ShortDateFormat := 'yyyy-mm-dd';
       Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmRegistro.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If edtUser.Text <> '' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.Assign(nil);
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          iImagem := OpenPictureDialog1.FileName;
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select r_nome, r_foto from registro where r_nome = '+QuotedStr(edtUser.Text)+'');
             Active := True;
             Edit;
             TBlobField(FieldByName('r_foto')).LoadFromFile(iImagem);
             Post;
          end;
       end;
    end
    else begin
       Application.MessageBox('Os campos n�o podem ser vazios! Selecione um registro para carregar a foto...','MyCar - Aten��o',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmRegistro.btnRemoverClick(Sender: TObject);
begin
    If edtUser.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update registro set R_FOTO = null where r_nome = '+QuotedStr(edtUser.Text)+'');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Os campos n�o podem ser vazios! Selecione um registro para remover a foto...','MyCar - Aten��o',MB_OK+MB_ICONERROR);
    end;
end;

end.
