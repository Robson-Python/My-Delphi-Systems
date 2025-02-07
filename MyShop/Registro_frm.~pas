unit Registro_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DateUtils, ExtDlgs, Jpeg;

type
  TfrmRegistro = class(TForm)
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    lblCep: TLabel;
    lblCpf: TLabel;
    edtUser: TLabeledEdit;
    edtEnd: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCid: TLabeledEdit;
    edtUf: TLabeledEdit;
    mkeCep: TMaskEdit;
    edtCpf: TEdit;
    mkeFone: TMaskEdit;
    Label1: TLabel;
    btnRegist: TSpeedButton;
    btnAtual: TSpeedButton;
    btnSair: TSpeedButton;
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

uses Principal_frm, DB, Enterprise_dm;

{$R *.dfm}

procedure TfrmRegistro.btnSairClick(Sender: TObject);
begin
    frmPrincipal.Caption := 'MyShop - Sistema Para Controle e Gerenciamento de Empresas e Prestação de Serviços ['+edtUser.Text+']';
    Close;
end;

procedure TfrmRegistro.FormShow(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With dmEnterprise.zqEnterprise do begin
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
       edtCpf.Text := FieldByName('r_cpf').AsString;
       mkeFone.Text := FieldByName('r_fone').AsString;
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
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtUser.Text <> '' then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into registro (R_COD, R_NOME, R_CPF, R_ENDERECO, R_BAIRRO, R_CIDADE, R_UF, R_CEP, R_FONE, R_FOTO) values (''1'', '+QuotedStr(edtUser.Text)+', '+QuotedStr(edtCpf.Text)+', '+QuotedStr(edtEnd.Text)+', '+QuotedStr(edtBairro.Text)+', '+QuotedStr(edtCid.Text)+', '+QuotedStr(edtUf.Text)+', '+QuotedStr(mkeCep.Text)+', '+QuotedStr(mkeFone.Text)+', '''')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
       end
       else begin
          Application.MessageBox('Os Campos não podem ser vazios! Preencha os campos e tente novamente.','MyShop - Atenção',MB_OK+MB_ICONERROR);
          edtUser.SetFocus;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmRegistro.btnAtualClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update registro set R_NOME = '+QuotedStr(edtUser.Text)+', R_ENDERECO = '+QuotedStr(edtEnd.Text)+', R_BAIRRO = '+QuotedStr(edtBairro.Text)+', R_CIDADE = '+QuotedStr(edtCid.Text)+', R_UF = '+QuotedStr(edtUf.Text)+', R_CEP = '+QuotedStr(mkeCep.Text)+', R_CPF = '+QuotedStr(edtCpf.Text)+', R_FONE = '+QuotedStr(mkeFone.Text)+' where r_cod = '+IntToStr(1)+'');
          ExecSQL;
          ShortDateFormat := 'yyyy-mm-dd';
          Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmRegistro.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtUser.Text <> '' then begin
          If OpenPictureDialog1.Execute then begin
             Image1.Picture.Assign(nil);
             Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
             iImagem := OpenPictureDialog1.FileName;
             With dmEnterprise.zqEnterprise do begin
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
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','MyShop - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmRegistro.btnRemoverClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtUser.Text <> '' then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update registro set R_FOTO = null where r_nome = '+QuotedStr(edtUser.Text)+'');
             ExecSQL;
             Image1.Picture.Assign(nil);
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','MyShop - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

end.
