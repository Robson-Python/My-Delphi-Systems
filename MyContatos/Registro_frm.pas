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

uses Principal_frm, DB, Contato_dm;

{$R *.dfm}

function Ano(Data:TDateTime): String;
{Retorna uma data por extenso}
var
//  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := '01';
  Meses [2] := '02';
  Meses [3] := '03';
  Meses [4] := '04';
  Meses [5] := '05';
  Meses [6] := '06';
  Meses [7] := '07';
  Meses [8] := '08';
  Meses [9] := '09';
  Meses [10]:= '10';
  Meses [11]:= '11';
  Meses [12]:= '12';
  DecodeDate (Data, Ano, Mes, Dia);
//  NoDia := DayOfWeek (Data);
  Result := IntToStr(Ano);
end;

procedure TfrmRegistro.btnSairClick(Sender: TObject);
begin
    frmPrincipal.Caption := 'MyContatos - Sistema Para Gerenciamento de Contatos e Auditoria de Pós Venda ['+edtUser.Text+']';
    Close;
end;

procedure TfrmRegistro.FormShow(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With dmContato.fdqContato do begin
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
var vAno : string;
begin
    If edtUser.Text <> '' then begin
       vAno := Ano(Date);
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into registro (R_COD, R_NOME, R_CPF, R_ENDERECO, R_BAIRRO, R_CIDADE, R_UF, R_CEP, R_FONE, R_FOTO, R_DATA, R_STATUS) values (''1'', '+QuotedStr(edtUser.Text)+', '+QuotedStr(edtCpf.Text)+', '+QuotedStr(edtEnd.Text)+', '+QuotedStr(edtBairro.Text)+', '+QuotedStr(edtCid.Text)+', '+QuotedStr(edtUf.Text)+', '+QuotedStr(mkeCep.Text)+', '+QuotedStr(mkeFone.Text)+', '''', '+QuotedStr(DateToStr(Date))+', ''NÃO'')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    end
    else begin
       Application.MessageBox('Os Campos não podem ser vazios! Preencha os campos e tente novamente.','MyShop - Atenção',MB_OK+MB_ICONERROR);
       edtUser.SetFocus;
    end;
end;

procedure TfrmRegistro.btnAtualClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update registro set R_NOME = '+QuotedStr(edtUser.Text)+', R_ENDERECO = '+QuotedStr(edtEnd.Text)+', R_BAIRRO = '+QuotedStr(edtBairro.Text)+', R_CIDADE = '+QuotedStr(edtCid.Text)+', R_UF = '+QuotedStr(edtUf.Text)+', R_CEP = '+QuotedStr(mkeCep.Text)+', R_CPF = '+QuotedStr(edtCpf.Text)+', R_FONE = '+QuotedStr(mkeFone.Text)+' where r_cod = '+IntToStr(1)+'');
       ExecSQL;
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       Application.MessageBox('Registro Atualizado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
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
          With dmContato.fdqContato do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select r_nome, r_foto from registro where r_nome = '+QuotedStr(edtUser.Text)+'');
             Active := True;
             Edit;
             TBlobField(FieldByName('r_foto')).LoadFromFile(iImagem);
             Post;
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','MyShop - Atenção',MB_OK+MB_ICONERROR);
       end;
    end;
end;

procedure TfrmRegistro.btnRemoverClick(Sender: TObject);
begin
    If edtUser.Text <> '' then begin
       With dmContato.fdqContato do begin
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
end;

end.
