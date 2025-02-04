unit Photobook_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, DBCtrls, StdCtrls, Buttons, ExtCtrls, Jpeg, DB,
  Spin;

type
  TfrmPhotobook = class(TForm)
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnFoto: TSpeedButton;
    speFoto: TSpinEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    Label2: TLabel;
    cbxNome: TComboBox;
    btnLimpar: TSpeedButton;
    Label3: TLabel;
    edtCod: TEdit;
    btnInserir: TSpeedButton;
    procedure btnFotoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure speFotoChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPhotobook: TfrmPhotobook;

implementation

uses ZDataset, Enterprise_dm;

{$R *.dfm}

function fBuscaCodAlbum() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ab_cod from album order by ab_cod desc');
       Active := True;
       fBuscaCodAlbum := FieldByName('ab_cod').AsInteger;
    end;
end;

procedure TfrmPhotobook.btnFotoClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Clique em Novo para incluir um novo álbum ou clique em Buscar para carregar um álbum já existente.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPhotobook.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Self);
    nNovo := fBuscaCodAlbum + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxNome.SetFocus;
end;

procedure TfrmPhotobook.btnInserirClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into album (AB_COD, AB_NOME, AB_FOTO1, AB_FOTO2, AB_FOTO3, AB_FOTO4, AB_FOTO5, AB_FOTO6, AB_FOTO7, AB_FOTO8, AB_FOTO9, AB_FOTO10) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxNome.Text)+', '''', '''', '''', '''', '''', '''', '''', '''', '''', '''')');
          ExecSQL;
          Edit1.Text := '0';
       end;
       Application.MessageBox('Registro cadastrado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo registro','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       cbxNome.SetFocus;
    end;
end;

procedure TfrmPhotobook.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    If cbxNome.Text <> '' then begin
       ActiveControl := nil;
       If Edit1.Text = '0' then begin
          speFoto.Text := '1';
       end;
       Edit1.Text := '1';
       Jpeg := nil;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select ab_cod, ab_foto'+speFoto.Text+' from album where ab_nome = '+QuotedStr(cbxNome.Text)+'');
          Active := True;
          edtCod.Text := FieldByName('ab_cod').AsString;
          fFoto := CreateBlobStream(FieldByName('ab_foto'+speFoto.Text+''),bmRead);
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
          speFoto.SetFocus;
       end;
    end
    else begin
       Application.MessageBox('Escolha um álbum para buscar!','MyShop - Aviso', MB_OK+MB_ICONINFORMATION);
       cbxNome.SetFocus;
    end;
end;

procedure TfrmPhotobook.btnAtualizarClick(Sender: TObject);
var iImagem : String;
    fFoto : Integer;
begin
    If edtCod.Text <> '' then begin
       fFoto := StrToInt(speFoto.Text);
       iImagem := OpenPictureDialog1.FileName;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select ab_cod, ab_foto'+speFoto.Text+' from album where ab_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          Edit;
          TBlobField(FieldByName('ab_foto'+speFoto.Text+'')).LoadFromFile(iImagem);
          Post;
       end;
       Application.MessageBox('A foto foi salva com sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       Image1.Picture.Assign(nil);
       If fFoto < 10 then begin
          speFoto.Text := IntToStr(fFoto+1);
       end
       else begin
          btnSelecionarClick(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Clique em Novo para incluir um novo álbum ou clique em Buscar para carregar um álbum já existente.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPhotobook.speFotoChange(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Edit1.Text = '1' then begin
          btnSelecionarClick(Sender);
       end;
    end;
end;

procedure TfrmPhotobook.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPhotobook.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from album where ab_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             Image1.Picture.Assign(nil);
             edtCod.Clear; 
             speFoto.Text := '1';
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPhotobook.FormCreate(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ab_nome from album order by ab_nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('ab_nome').AsString);
          Next;
       end;
       SQL.Clear;
       Active := False;
    end;
end;

procedure TfrmPhotobook.btnLimparClick(Sender: TObject);
begin
    Image1.Picture.Assign(nil);
    edtCod.Clear;
    cbxNome.Clear;
    FormCreate(Self);
    speFoto.Text := '1';
end;

procedure TfrmPhotobook.FormShow(Sender: TObject);
begin
    cbxNome.SetFocus;
end;

end.
