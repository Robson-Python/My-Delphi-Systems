unit CadMotorista_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Mask, DateUtils,
  ExtDlgs, Jpeg;

type
  TfrmCadMotorista = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
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
    edtCpf: TLabeledEdit;
    cbxNome: TComboBox;
    dtpDtNasc: TDateTimePicker;
    edtEnd: TLabeledEdit;
    edtBai: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    cbxRelac: TComboBox;
    edtCnh: TLabeledEdit;
    cbxCateg: TComboBox;
    mmRest: TMemo;
    mkeCep: TMaskEdit;
    mkeCel: TMaskEdit;
    dtpVenc: TDateTimePicker;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure mmRestKeyPress(Sender: TObject; var Key: Char);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMotorista: TfrmCadMotorista;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

{$R *.dfm}

function fConvertImagem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadMotorista.OpenPictureDialog1.FileName;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '\' then
       valor[i] := '/'
    else
       if valor[i] = '/' then
          valor[i] := '\';
    end;
    frmCadMotorista.OpenPictureDialog1.FileName := valor;
end;


procedure TfrmCadMotorista.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadMotorista.btnLimparClick(Sender: TObject);
begin
    edtCpf.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; mkeCep.Clear; edtCnh.Clear; mkeCel.Clear;
    cbxNome.Clear; mmRest.Clear; dtpDtNasc.Date := Date; dtpVenc.Date := Date;
    cbxUf.Text := ''; cbxRelac.Text := ''; cbxCateg.Text := '';
    Image1.Picture.Assign(nil);
    If dtpVenc.Color = clRed then begin
       dtpVenc.Color := clWindow;
       lblDias.Visible := False;
    end;
    FormCreate(Sender);
end;

procedure TfrmCadMotorista.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from motoristas order by nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadMotorista.FormShow(Sender: TObject);
begin
    edtCpf.SetFocus;
    dtpDtNasc.Date := Date;
    dtpVenc.Date := Date;
end;

procedure TfrmCadMotorista.btnInserirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If edtCpf.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into motoristas(cpf, nome, nasc, ender, bai, cid, uf, cep, relac, cnh, catg, restr, cel, dt_venc, foto) Values ('+QuotedStr(edtCpf.Text)+','+ QuotedStr(cbxNome.Text)+','+ QuotedStr(DateToStr(dtpDtNasc.Date))+','+ QuotedStr(edtEnd.Text)+','+ QuotedStr(edtBai.Text)+','+ QuotedStr(edtCid.Text)+','+ QuotedStr(cbxUf.Text)+','+ QuotedStr(mkeCep.Text)+','+ QuotedStr(cbxRelac.Text)+','+ QuotedStr(edtCnh.Text)+','+ QuotedStr(cbxCateg.Text)+','+ QuotedStr(mmRest.Text)+','+ QuotedStr(mkeCel.Text)+', '+QuotedStr(DateToStr(dtpVenc.Date))+', null)');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Efetuado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.Clear;
             FormCreate(Sender);
             FormShow(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CPF não pode ser vazio!','CarroComando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If cbxNome.Text <> '' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from motoristas where nome = '+ QuotedStr(cbxNome.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.SetFocus;
          end
          else begin
             edtCpf.Text := FieldByName ('cpf').AsString;
             edtEnd.Text := FieldByName ('ender').AsString;
             edtBai.Text := FieldByName ('bai').AsString;
             edtCid.Text := FieldByName ('cid').AsString;
             mkeCep.Text := FieldByName ('cep').AsString;
             edtCnh.Text := FieldByName ('cnh').AsString;
             mkeCel.Text := FieldByName ('cel').AsString;
             cbxNome.Text := FieldByName ('nome').AsString;
             cbxUf.Text := FieldByName ('uf').AsString;
             cbxRelac.Text := FieldByName ('relac').AsString;
             cbxCateg.Text := FieldByName ('catg').AsString;
             dtpDtNasc.Date := FieldByName ('nasc').AsDateTime;
             dtpVenc.Date := FieldByName ('dt_venc').AsDateTime;
             mmRest.Text := FieldByName ('restr').AsString;
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
             If dtpVenc.Date < Now then begin
                dtpVenc.Color := clRed;
                Application.MessageBox('A C.N.H. deste Motorista está Vencida! Por favor providencie a renovação da C.N.H. o mais rápido possível! Lembre-se: Dirigir com C.N.H vencida perde 7 pontos na carteira e ainda pode ter a mesma suspença...','Carro Comando - Aviso',MB_OK+MB_ICONWARNING);
                lblDias.Caption := 'Vencida há '+IntToStr(DaysBetween(dtpVenc.Date,Now))+ 'dias';
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
       Application.MessageBox('Selcione o motorista.','Carro Comando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    If (Key = VK_RETURN) then
       If edtCpf.Text <> '' then begin
       Jpeg := nil;
       If edtCpf.Text <> '' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from motoristas where cpf = '+ QuotedStr(edtCpf.Text));
             Active := True;
             If RecordCount = 0 then begin
                Application.MessageBox('Registro não encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
                edtCpf.SetFocus;
             end
             else begin
                edtCpf.Text := FieldByName ('cpf').AsString;
                edtEnd.Text := FieldByName ('ender').AsString;
                edtBai.Text := FieldByName ('bai').AsString;
                edtCid.Text := FieldByName ('cid').AsString;
                mkeCep.Text := FieldByName ('cep').AsString;
                edtCnh.Text := FieldByName ('cnh').AsString;
                mkeCel.Text := FieldByName ('cel').AsString;
                cbxNome.Text := FieldByName ('nome').AsString;
                cbxUf.Text := FieldByName ('uf').AsString;
                cbxRelac.Text := FieldByName ('relac').AsString;
                cbxCateg.Text := FieldByName ('catg').AsString;
                dtpDtNasc.Date := FieldByName ('nasc').AsDateTime;
                dtpVenc.Date := FieldByName ('dt_venc').AsDateTime;
                mmRest.Text := FieldByName ('restr').AsString;
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
                If dtpVenc.Date < Now then begin
                   dtpVenc.Color := clRed;
                   Application.MessageBox('A C.N.H. deste Motorista está Vencida! Por favor providencie a renovação da C.N.H. o mais rápido possível! Lembre-se: Dirigir com C.N.H vencida perde 7 pontos na carteira e ainda pode ter a mesma suspença...','Carro Comando - Aviso',MB_OK+MB_ICONWARNING);
                   lblDias.Caption := 'Vencida há '+IntToStr(DaysBetween(dtpVenc.Date,Now))+ 'dias';
                   lblDias.Visible := True;
                end
                else begin
                   lblDias.Visible := False;
                   dtpVenc.Color := clWindow;
                end;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('Digite o número do CPF.','Carro Comando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

        
procedure TfrmCadMotorista.cbxNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Sender);
end;

procedure TfrmCadMotorista.btnAtualizarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If edtCpf.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update motoristas set cpf = '+ QuotedStr(edtCpf.Text)+', nome = '+ QuotedStr(cbxNome.Text)+', nasc = '+ QuotedStr(DateToStr(dtpDtNasc.Date))+', ender = '+ QuotedStr(edtEnd.Text)+', bai = '+ QuotedStr(edtBai.Text)+', cid = '+ QuotedStr(edtCid.Text)+', uf = '+ QuotedStr(cbxUf.Text)+', cep = '+ QuotedStr(mkeCep.Text)+', relac = '+ QuotedStr(cbxRelac.Text)+', cnh = '+ QuotedStr(edtCnh.Text)+', catg = '+ QuotedStr(cbxCateg.Text)+', restr = '+ QuotedStr(mmRest.Text)+', cel = '+ QuotedStr(mkeCel.Text)+', dt_venc = '+QuotedStr(DateToStr(dtpVenc.Date))+' where cpf = '+ QuotedStr(edtCpf.Text)+'');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
             If dtpVenc.Color = clRed then begin
                dtpVenc.Color := clWindow;
                lblDias.Visible := False;
             end;
             btnSelecionarClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CPF não pode ser vazio! Selecione um motorista para atualizar dados.','CarroComando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.btnDeletarClick(Sender: TObject);
begin
    If edtCpf.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Carro Comando - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from motoristas where cpf = '+ QuotedStr(edtCpf.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                cbxNome.Clear;
                FormCreate(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CPF não pode ser vazio! Selecione um motorista para poder deletar.','CarroComando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadMotorista.mmRestKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadMotorista.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtCpf.Text <> '' then begin
          If OpenPictureDialog1.Execute then begin
             Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
             fConvertImagem;
             iImagem := OpenPictureDialog1.FileName;
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update motoristas set foto = LOAD_FILE('+QuotedStr(iImagem)+') where cpf = '+QuotedStr(edtCpf.Text)+'');
                ExecSQL;
             end;
             fConvertImagem;
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','Carro Comando - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCadMotorista.btnRemoverClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtCpf.Text <> '' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update motoristas set foto = null where cpf = '+QuotedStr(edtCpf.Text)+'');
             ExecSQL;
             Image1.Picture.Assign(nil);
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','Carro Comando - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

end.
