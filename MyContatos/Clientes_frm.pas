unit Clientes_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ExtDlgs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Jpeg,
  Vcl.ComCtrls;

type
  TfrmClientes = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    mkeCpf: TMaskEdit;
    lblCpf: TLabel;
    btnPessoa: TSpeedButton;
    lblNascimento: TLabel;
    edtEndereco: TLabeledEdit;
    edtCidade: TLabeledEdit;
    lblUf: TLabel;
    cbxUf: TComboBox;
    mkeContato1: TMaskEdit;
    lblFone: TLabel;
    lblCelular: TLabel;
    mkeContato2: TMaskEdit;
    edtEmail: TLabeledEdit;
    lblObs: TLabel;
    mmoObs: TMemo;
    btnRemover: TBitBtn;
    btnFoto: TBitBtn;
    Panel2: TPanel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Edit1: TEdit;
    edtCodCli: TEdit;
    lblCodCli: TLabel;
    lblNome: TLabel;
    cbxNome: TComboBox;
    cbxDia: TComboBox;
    lblNiver: TLabel;
    cbxMes: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbxNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses Contato_dm;

function fBuscaCodCli() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_cod from clientes order by c_cod desc');
       Active := True;
       fBuscaCodCli := FieldByName('c_cod').AsInteger;
    end;
end;

function CpfCnpj() : String;
var valor : String;
    tamanho, i, Count : Integer;
begin
    valor := frmClientes.Edit1.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    Count := i;
    end;
    If Count = 14 then begin
       frmClientes.mkeCpf.EditMask := '000.000.000-00;1;_';
       frmClientes.btnPessoa.Caption := 'F';
    end
    else begin
       frmClientes.mkeCpf.EditMask := '00.000.000/0000-00;1;_';
       frmClientes.btnPessoa.Caption := 'J';
    end;
end;

function Ano(Data:TDateTime): String;
{Retorna uma data por extenso}
var
//  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  DiaDoMes : array [1..31] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias do Mês }
  DiaDoMes [1]:= '01';
  DiaDoMes [2]:= '02';
  DiaDoMes [3]:= '03';
  DiaDoMes [4]:= '04';
  DiaDoMes [5]:= '05';
  DiaDoMes [6]:= '06';
  DiaDoMes [7]:= '07';
  DiaDoMes [8]:= '08';
  DiaDoMes [9]:= '09';
  DiaDoMes [10]:= '10';
  DiaDoMes [11]:= '11';
  DiaDoMes [12]:= '12';
  DiaDoMes [13]:= '13';
  DiaDoMes [14]:= '14';
  DiaDoMes [15]:= '15';
  DiaDoMes [16]:= '16';
  DiaDoMes [17]:= '17';
  DiaDoMes [18]:= '18';
  DiaDoMes [19]:= '19';
  DiaDoMes [20]:= '20';
  DiaDoMes [21]:= '21';
  DiaDoMes [22]:= '22';
  DiaDoMes [23]:= '23';
  DiaDoMes [24]:= '24';
  DiaDoMes [25]:= '25';
  DiaDoMes [26]:= '26';
  DiaDoMes [27]:= '27';
  DiaDoMes [28]:= '28';
  DiaDoMes [29]:= '29';
  DiaDoMes [30]:= '30';
  DiaDoMes [31]:= '31';
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
  Result := DiaDoMes[Dia]+'/'+Meses[Mes];
end;

procedure TfrmClientes.btnAtualizarClick(Sender: TObject);
begin
    If cbxNome.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update clientes set C_NOME = '+QuotedStr(cbxNome.Text)+', C_CPF = '+QuotedStr(mkeCpf.Text)+', C_DIA_NASC = '+QuotedStr(cbxDia.Text)+', C_MES_NASC = '+QuotedStr(cbxMes.Text)+', C_ENDERECO = '+QuotedStr(edtEndereco.Text)+', C_CIDADE = '+QuotedStr(edtCidade.Text)+', C_UF = '+QuotedStr(cbxUf.Text)+', C_CONTATO1 = '+QuotedStr(mkeContato1.Text)+', C_CONTATO2 = '+QuotedStr(mkeContato2.Text)+', C_EMAIL = '+QuotedStr(edtEmail.Text)+', C_OBS = '+QuotedStr(mmoObs.Text)+' where C_COD = '+QuotedStr(edtCodCli.Text)+'');
          ExecSQL;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Atualizado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Nome não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmClientes.btnDeletarClick(Sender: TObject);
begin
     If edtCodCli.Text <> '' then begin
        If Application.MessageBox('Excluir Registro?','MyContatos - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
           With dmContato.fdqContato do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from clientes where c_cod = '+ QuotedStr(edtCodCli.Text)+'');
              ExecSQL;
           end;
           btnLimparClick(Self);
           cbxNome.Clear;
           FormCreate(Sender);
           Application.MessageBox('Registro Excluido com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
        end;
     end
     else begin
        Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
     end;
end;

procedure TfrmClientes.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If edtCodCli.Text <> '' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.Assign(nil);
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          iImagem := OpenPictureDialog1.FileName;
          With dmContato.fdqContato do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select c_cod, c_foto from clientes where c_cod = '+QuotedStr(edtCodCli.Text)+'');
             Active := True;
             Edit;
             TBlobField(FieldByName('c_foto')).LoadFromFile(iImagem);
             Post;
          end;
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','MyContatos - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmClientes.btnInserirClick(Sender: TObject);
begin
    If edtCodCli.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into clientes (C_COD, C_CPF, C_NOME, C_DIA_NASC, C_MES_NASC, C_ENDERECO, C_CIDADE, C_UF, C_CONTATO1, C_CONTATO2, C_EMAIL, C_OBS, C_FOTO) values ('+QuotedStr(edtCodCli.Text)+', '+QuotedStr(mkeCpf.Text)+', '+QuotedStr(cbxNome.Text)+', '+QuotedStr(cbxDia.Text)+', '+QuotedStr(cbxMes.Text)+', '+QuotedStr(edtEndereco.Text)+', '+QuotedStr(edtCidade.Text)+', '+QuotedStr(cbxUf.Text)+', '+QuotedStr(mkeContato1.Text)+', '+QuotedStr(mkeContato2.Text)+', '+QuotedStr(edtEmail.Text)+', '+QuotedStr(mmoObs.Text)+', '''')');
          ExecSQL;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       btnLimparClick(Self);
       cbxNome.Clear;
       FormCreate(Sender);
       Application.MessageBox('Registro Efetuado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmClientes.btnLimparClick(Sender: TObject);
begin
    edtCodCli.Clear; edtEndereco.Clear; edtCidade.Clear; edtEmail.Clear;
    mkeCpf.Clear; mkeContato1.Clear; mkeContato2.Clear;
    cbxNome.Text := ''; cbxUf.Text := ''; cbxMes.Text := ''; cbxDia.Text := '';
    mmoObs.Clear;
    Image1.Picture.Assign(nil);
    lblNascimento.Caption := 'Aniversário';
    lblNascimento.Font.Color := clBlack;
    cbxNome.SetFocus;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodCli + 1;
    edtCodCli.Text := IntToStr(nNovo);
    cbxNome.SetFocus;
end;

procedure TfrmClientes.btnPessoaClick(Sender: TObject);
begin
    If btnPessoa.Caption = 'F' then begin
       mkeCpf.EditMask := '00.000.000/0000-00;1;_';
       btnPessoa.Caption := 'J';
       btnPessoa.Hint := 'Pessoa Jurídica';
    end
    else begin
       mkeCpf.EditMask := '000.000.000-00;1;_';
       btnPessoa.Caption := 'F';
       btnPessoa.Hint := 'Pessoa Física';
    end;
end;

procedure TfrmClientes.btnRemoverClick(Sender: TObject);
begin
    If edtCodCli.Text <> '' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update clientes set c_foto = null where c_cod = '+QuotedStr(edtCodCli.Text)+'');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','MyContatos - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
    dmContato.fdqContato.SQL.Clear;
    Close;
end;

procedure TfrmClientes.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    if cbxNome.Text <> '' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from clientes where c_nome = '+QuotedStr(cbxNome.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
          cbxDia.Text := FieldByName('c_dia_nasc').AsString;
          cbxMes.Text := FieldByName('c_mes_nasc').AsString;
          cbxNome.Text := FieldByName('c_nome').AsString;
          Edit1.Text := FieldByName('c_cpf').AsString;
          edtEndereco.Text := FieldByName('c_endereco').AsString;
          edtCidade.Text := FieldByName('c_cidade').AsString;
          cbxUf.Text := FieldByName('c_uf').AsString;
          mkeContato1.Text := FieldByName('c_contato1').AsString;
          mkeContato2.Text := FieldByName('c_contato2').AsString;
          edtEmail.Text := FieldByName('c_email').AsString;
          mmoObs.Text := FieldByName('c_obs').AsString;
          fFoto := CreateBlobStream(FieldByName('c_foto'),bmRead);
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
       CpfCnpj;
       mkeCpf.Text := Edit1.Text;
       cbxNome.SetFocus;
    end
    else begin
        Application.MessageBox('Selecione o nome do Cliente para consultar!','MyContatos - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmClientes.cbxNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then begin
       btnSelecionarClick(Sender);
    end;
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    btnSairClick(Self);
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
     With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
end;

end.
