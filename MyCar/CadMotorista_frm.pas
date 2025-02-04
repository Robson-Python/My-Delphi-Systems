unit CadMotorista_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Mask, DateUtils,
  ExtDlgs, Jpeg;

type
  TfrmCadMotorista = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    OpenPictureDialog1: TOpenPictureDialog;
    GroupBox1: TGroupBox;
    lblNome: TLabel;
    lblDtNasc: TLabel;
    lblUf: TLabel;
    lblRelac: TLabel;
    lblCateg: TLabel;
    lblRest: TLabel;
    lblCep: TLabel;
    lblCel: TLabel;
    Label1: TLabel;
    lblDias: TLabel;
    Shape2: TShape;
    edtCod: TLabeledEdit;
    cbxNome: TComboBox;
    dtpDtNasc: TDateTimePicker;
    edtEnd: TLabeledEdit;
    edtBai: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    cbxRelac: TComboBox;
    edtCnh: TLabeledEdit;
    cbxCateg: TComboBox;
    mmoObs: TMemo;
    mkeCep: TMaskEdit;
    mkeCel: TMaskEdit;
    dtpVenc: TDateTimePicker;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    btnNovo: TSpeedButton;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    mkeCpf: TMaskEdit;
    Label2: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cbxNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMotorista: TfrmCadMotorista;

implementation

uses DB, Carro_Comando_dm, ZDataset;

{$R *.dfm}

function fBuscaCodMotorista() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select m_cod from motoristas order by m_cod desc');
       Active := True;
       fBuscaCodMotorista := FieldByName('m_cod').AsInteger;
    end;
end;

procedure TfrmCadMotorista.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmCadMotorista.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtCnh.Clear;
    mkeCpf.Clear; mkeCep.Clear; mkeCel.Clear;
    cbxNome.Text := ''; cbxUf.Text := ''; cbxRelac.Text := ''; cbxCateg.Text := '';
    dtpDtNasc.Date := Date; dtpVenc.Date := Date;
    mmoObs.Clear;
    Image1.Picture.Assign(nil);
    If dtpVenc.Color = clRed then begin
       dtpVenc.Color := clWindow;
       lblDias.Visible := False;
    end;
    cbxNome.SetFocus;
    dmCarroComando.zqCarro.SQL.Clear;
end;

procedure TfrmCadMotorista.FormCreate(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from motoristas order by m_nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('m_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadMotorista.FormShow(Sender: TObject);
begin
    cbxNome.SetFocus;
    dtpDtNasc.Date := Date;
    dtpVenc.Date := Date;
end;

procedure TfrmCadMotorista.btnInserirClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into motoristas(M_COD, M_NOME, M_CPF, M_NASC, M_RELAC, M_ENDERECO, M_BAI, M_CIDADE, M_UF, M_CEP, M_CELULAR, M_CNH, M_CATEGORIA, M_VENCIMENTO, M_FOTO, M_OBS) Values ('+QuotedStr(edtCod.Text)+', '+ QuotedStr(cbxNome.Text)+', '+ QuotedStr(mkeCpf.Text)+', '+ QuotedStr(DateToStr(dtpDtNasc.Date))+', '+ QuotedStr(cbxRelac.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtBai.Text)+', '+ QuotedStr(edtCid.Text)+', '+ QuotedStr(cbxUf.Text)+', '+ QuotedStr(mkeCep.Text)+', '+ QuotedStr(mkeCel.Text)+', '+ QuotedStr(edtCnh.Text)+', '+ QuotedStr(cbxCateg.Text)+', '+QuotedStr(DateToStr(dtpVenc.Date))+', '''', '+QuotedStr(mmoObs.Text)+')');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Self);
          cbxNome.Clear;
          FormCreate(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio!','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If cbxNome.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from motoristas where m_nome = '+QuotedStr(cbxNome.Text)+'');
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','MyCar - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.SetFocus;
          end
          else begin
             edtCod.Text := FieldByName ('m_cod').AsString;
             cbxNome.Text := FieldByName ('m_nome').AsString;
             mkeCpf.Text := FieldByName ('m_cpf').AsString;
             edtEnd.Text := FieldByName ('m_endereco').AsString;
             edtBai.Text := FieldByName ('m_bai').AsString;
             edtCid.Text := FieldByName ('m_cidade').AsString;
             mkeCep.Text := FieldByName ('m_cep').AsString;
             edtCnh.Text := FieldByName ('m_cnh').AsString;
             mkeCel.Text := FieldByName ('m_celular').AsString;
             cbxUf.Text := FieldByName ('m_uf').AsString;
             cbxRelac.Text := FieldByName ('m_relac').AsString;
             cbxCateg.Text := FieldByName ('m_categoria').AsString;
             dtpDtNasc.Date := FieldByName ('m_nasc').AsDateTime;
             dtpVenc.Date := FieldByName ('m_vencimento').AsDateTime;
             mmoObs.Text := FieldByName ('m_obs').AsString;
             fFoto := CreateBlobStream(FieldByName('m_foto'),bmRead);
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
             If dtpVenc.Date < Now then begin
                dtpVenc.Color := clRed;
                Application.MessageBox('A C.N.H. deste Motorista está Vencida! Por favor providencie a renovação da C.N.H. o mais rápido possível! Lembre-se: Dirigir com C.N.H vencida perde 7 pontos na carteira e ainda pode ter a mesma suspença...','MyCar - Aviso',MB_OK+MB_ICONWARNING);
                lblDias.Caption := 'Carteira Vencida há '+IntToStr(DaysBetween(dtpVenc.Date,Now))+ ' dias';
                lblDias.Visible := True;
             end
             else begin
                lblDias.Visible := False;
                dtpVenc.Color := clWindow;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o motorista.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.cbxNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Self);
end;

procedure TfrmCadMotorista.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update motoristas set m_cpf = '+QuotedStr(mkeCpf.Text)+', m_nome = '+QuotedStr(cbxNome.Text)+', m_nasc = '+QuotedStr(DateToStr(dtpDtNasc.Date))+', m_endereco = '+QuotedStr(edtEnd.Text)+', m_bai = '+QuotedStr(edtBai.Text)+', m_cidade = '+QuotedStr(edtCid.Text)+', m_uf = '+QuotedStr(cbxUf.Text)+', m_cep = '+QuotedStr(mkeCep.Text)+', m_relac = '+QuotedStr(cbxRelac.Text)+', m_cnh = '+QuotedStr(edtCnh.Text)+', m_categoria = '+QuotedStr(cbxCateg.Text)+', m_obs = '+QuotedStr(mmoObs.Text)+', m_celular = '+QuotedStr(mkeCel.Text)+', m_vencimento = '+QuotedStr(DateToStr(dtpVenc.Date))+' where m_cod = '+ QuotedStr(edtCod.Text)+'');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
          If dtpVenc.Color = clRed then begin
             dtpVenc.Color := clWindow;
             lblDias.Visible := False;
          end;
          btnSelecionarClick(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um Motorista para atualizar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from motoristas where m_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Self);
             cbxNome.Clear;
             FormCreate(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um motorista para poder excluir.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadMotorista.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If edtCod.Text <> '' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          iImagem := OpenPictureDialog1.FileName;
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select m_cod, m_foto from motoristas where m_cod = '+QuotedStr(edtCod.Text)+'');
             Active := True;
             Edit;
             TBlobField(FieldByName('m_foto')).LoadFromFile(iImagem);
             Post;
          end;
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','MyCar - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmCadMotorista.btnRemoverClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update motoristas set m_foto = '''' where m_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','MyCar - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmCadMotorista.btnNovoClick(Sender: TObject);
var nNovo: Integer;
begin
    btnLimparClick(Self);
    nNovo := fBuscaCodMotorista + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxNome.SetFocus;
end;

end.
