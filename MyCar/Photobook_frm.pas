unit Photobook_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, DBCtrls, StdCtrls, Buttons, ExtCtrls, Jpeg, DB,
  Spin;

type
  TfrmPhotobook = class(TForm)
    GroupBox1: TGroupBox;
    Shape2: TShape;
    Panel2: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    Shape1: TShape;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnFoto: TSpeedButton;
    edtCod: TLabeledEdit;
    speFoto: TSpinEdit;
    edtCodCarro: TLabeledEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    edtAlbum: TLabeledEdit;
    procedure btnFotoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure speFotoChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPhotobook: TfrmPhotobook;

implementation

uses ZDataset, Cad_Veiculo_frm, Carro_Comando_dm;

{$R *.dfm}

function fBuscaCodAlbum() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ab_cod from album order by ab_cod desc');
       Active := True;
       fBuscaCodAlbum := FieldByName('ab_cod').AsInteger;
    end;
end;

function fBuscaCodCarro() : String;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select album.c_cod from album, carros where album.c_cod = '+QuotedStr(frmCadVeiculo.edtCod.Text)+' and album.c_cod = carros.c_cod');
       Active := True;
       fBuscaCodCarro := FieldByName('c_cod').AsString;
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
       Application.MessageBox('O campo código não pode ser vazio! Clique em Novo para incluir um novo álbum ou clique em Buscar para carregar um álbum já existente.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPhotobook.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    edtCodCarro.Text := fBuscaCodCarro;
    If edtCodCarro.Text = '' then begin
       nNovo := fBuscaCodAlbum + 1;
       edtCod.Text := IntToStr(nNovo);
       edtCodCarro.Text := frmCadVeiculo.edtCod.Text;
       edtAlbum.Text := frmCadVeiculo.cbxModel.Text;
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into album (AB_COD, C_COD, AB_FOTO1, AB_FOTO2, AB_FOTO3, AB_FOTO4, AB_FOTO5, AB_FOTO6, AB_FOTO7, AB_FOTO8, AB_FOTO9, AB_FOTO10) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodCarro.Text)+', '''', '''', '''', '''', '''', '''', '''', '''', '''', '''')');
          ExecSQL;
       end;
       Edit1.Text := '0';
    end
    else begin
       Application.MessageBox('Já existe um álbum criado para esse Veículo!','MyCar - Erro',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmPhotobook.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    If Edit1.Text = '0' then begin
       speFoto.Text := '1';
    end;
    Edit1.Text := '1';
    Jpeg := nil;
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select ab_cod from album where c_cod = '+QuotedStr(frmCadVeiculo.edtCod.Text)+'');
       Active := True;
       If dmCarroComando.zqCarro.RecordCount = 0 then begin
          ShowMessage('O álbum desse Veículo ainda não existe! Clique em Novo para criar um álbum');
       end
       else begin
          edtCod.Text := FieldByName('ab_cod').AsString;
          edtCodCarro.Text := frmCadVeiculo.edtCod.Text;
          edtAlbum.Text := frmCadVeiculo.cbxModel.Text;
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('Select ab_foto'+speFoto.Text+' from album where c_cod = '+QuotedStr(edtCodCarro.Text)+'');
       Active := True;
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
    end;
    speFoto.SetFocus;
end;

procedure TfrmPhotobook.btnAtualizarClick(Sender: TObject);
var iImagem : String;
    fFoto : Integer;
begin
    If edtCod.Text <> '' then begin
       fFoto := StrToInt(speFoto.Text);
       iImagem := OpenPictureDialog1.FileName;
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select ab_cod, ab_foto'+speFoto.Text+' from album where ab_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          Edit;
          TBlobField(FieldByName('ab_foto'+speFoto.Text+'')).LoadFromFile(iImagem);
          Post;
       end;
       Application.MessageBox('A foto foi salva com sucesso!','MyCar - Atenção',MB_OK+MB_ICONWARNING);
       Image1.Picture.Assign(nil);
       If fFoto < 10 then begin
          speFoto.Text := IntToStr(fFoto+1);
       end
       else begin
          btnSelecionarClick(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Clique em Novo para incluir um novo álbum ou clique em Buscar para carregar um álbum já existente.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
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
    dmCarroComando.zqCarro.SQL.Clear;
    dmCarroComando.zqCarro.Active := False;
    Close;
end;

procedure TfrmPhotobook.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from album where c_cod = '+ QuotedStr(edtCodCarro.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Excluido com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             Image1.Picture.Assign(nil);
             edtCod.Clear; edtCodCarro.Clear;
             speFoto.Text := '1';
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo códogo não pode ser vazio! Selecione um registro para poder excluir.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

end.
