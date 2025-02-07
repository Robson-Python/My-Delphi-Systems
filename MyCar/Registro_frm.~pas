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
    edtRegistro: TLabeledEdit;
    dtpDtImplant: TDateTimePicker;
    lblDtImplant: TLabel;
    dtpValidade: TDateTimePicker;
    lblValid: TLabel;
    Shape2: TShape;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    btnRegist: TBitBtn;
    btnAtual: TBitBtn;
    btnRenovar: TBitBtn;
    btnSair: TBitBtn;
    mkeCep: TMaskEdit;
    edtLicenc: TLabeledEdit;
    OpenPictureDialog1: TOpenPictureDialog;
    edtSerialNumber: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRegistClick(Sender: TObject);
    procedure btnAtualClick(Sender: TObject);
    procedure btnRenovarClick(Sender: TObject);
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
       edtLicenc.Text := FieldByName('licenca').AsString;
       edtRegistro.Text := FieldByName('registro').AsString;
       dtpDtImplant.Date := FieldByName('dt_implant').AsDateTime;
       dtpValidade.Date := FieldByName('dt_valid').AsDateTime;
       edtSerialNumber.Text := FieldByName('serial_number').AsString;
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
       If edtRegistro.Text = '' then begin
          edtRegistro.Enabled := True;
          edtLicenc.Visible:= True;
          dtpDtImplant.Enabled := True;
          dtpDtImplant.Date := Date;
          dtpValidade.Date := Date;
          lblDtImplant.Enabled := True;
          btnRegist.Enabled := True;
          edtUser.SetFocus;
       end;
       If edtLicenc.Text = '' then begin
          btnRenovar.Caption := 'Ativar Licença';
       end;
end;

procedure TfrmRegistro.btnRegistClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If edtRegistro.Text <> '' then begin
       dtpValidade.Date := Date + 30;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update registro set usuario = '+QuotedStr(edtUser.Text)+', end_registro = '+QuotedStr(edtEnd.Text)+', bairro = '+QuotedStr(edtBairro.Text)+', cidade = '+QuotedStr(edtCid.Text)+', uf_registro = '+QuotedStr(edtUf.Text)+', cep = '+QuotedStr(mkeCep.Text)+', cpf_user = '+QuotedStr(mkeCpf.Text)+', rg = '+QuotedStr(edtRg.Text)+', registro = '+QuotedStr(edtRegistro.Text)+', dt_implant = '+QuotedStr(DateToStr(dtpDtImplant.Date))+', licenca = '+QuotedStr(edtLicenc.Text)+', dt_valid = '+QuotedStr(DateToStr(dtpValidade.Date))+' where codigo = 1');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnRegist.Enabled := False;
          dtpDtImplant.Enabled := False;
          edtRegistro.Enabled := False;
          edtLicenc.Visible := True;
          lblDtImplant.Enabled := False;
          lblValid.Enabled := False;
          frmPrincipal.FormActivate(Sender);
       end;
    end
    else begin
       Application.MessageBox('Os Campos não podem ser vazios! Preencha os campos e tente novamente.','Carro Comando - Atenção',MB_OK+MB_ICONERROR);
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
       Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TfrmRegistro.btnRenovarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmAtivar, frmAtivar);
      frmAtivar.ShowModal;
    Finally
         frmAtivar.Free;
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
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','Carro Comando - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
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
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','Carro Comando - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

end.
