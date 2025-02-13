unit CadProd_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Mask, DateUtils,
  ExtDlgs, Jpeg;

type
  TfrmCadProd = class(TForm)
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
    lblUnid: TLabel;
    lblDias: TLabel;
    Shape2: TShape;
    edtCod: TLabeledEdit;
    cbxNome: TComboBox;
    cbxUnid: TComboBox;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    edtQtd: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    edtNivel: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure edtVlUniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProd: TfrmCadProd;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

{$R *.dfm}

function fConvertImagem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.OpenPictureDialog1.FileName;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '\' then
       valor[i] := '/'
    else
       if valor[i] = '/' then
          valor[i] := '\';
    end;
    frmCadProd.OpenPictureDialog1.FileName := valor;
end;

function fConvertVlUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtVlUni.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtVlUni.Text := valor;
end;

function fConvertVlTot() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtVlTot.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtVlTot.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtQtd.Text := valor;
end;

function fConvertNivel() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtNivel.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtNivel.Text := valor;
end;

function fBuscaCodProd() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_cod from produtos order by p_cod desc');
       Active := True;
       fBuscaCodProd := FieldByName('p_cod').AsInteger;
    end;
end;


procedure TfrmCadProd.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadProd.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear;
    cbxNome.Clear; cbxUnid.Clear;
    Image1.Picture.Assign(nil);
    FormCreate(Sender);
    FormShow(Sender);
end;

procedure TfrmCadProd.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from produtos order by p_n_prod');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('p_n_prod').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from medidas order by med_simb');
       Active := True;
       while not Eof do begin
          cbxUnid.Items.Add(FieldByName('med_simb').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadProd.FormShow(Sender: TObject);
begin
    edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlTot.Text := '0,00'; edtNivel.Text := '0';
    cbxNome.SetFocus;
end;

procedure TfrmCadProd.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodProd + 1;
    edtCod.Text := IntToStr(nNovo);
    fConvertVlUni;
    fConvertVlTot;
    fConvertQtd;
    fConvertNivel;
    If cbxNome.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into produtos (P_COD, P_N_PROD, P_UNI_MED, P_FOTO, P_QTD, P_VL_UNI, P_VL_TOT, P_NIVEL) Values ('+QuotedStr(edtCod.Text)+','+ QuotedStr(cbxNome.Text)+','+ QuotedStr(cbxUnid.Text)+', null, '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlUni.Text)+', '+QuotedStr(edtVlTot.Text)+', '+QuotedStr(edtNivel.Text)+')');
             ExecSQL;
             fConvertVlUni;
             fConvertVlTot;
             fConvertQtd;
             fConvertNivel;
             Application.MessageBox('Registro Efetuado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
//       end
//       else begin
//          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Madeira F�cil - Aten��o',MB_OK+MB_ICONSTOP);
//       end;
    end
    else begin
       Application.MessageBox('O campo Nome do Produto n�o pode ser vazio!','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadProd.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If cbxNome.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from produtos where p_n_prod = '+ QuotedStr(cbxNome.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro n�o encontrado...','Sistema Almoxarifado - Informa��o',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.SetFocus;
          end
          else begin
             edtCod.Text := FieldByName ('p_cod').AsString;
             cbxNome.Text := FieldByName ('p_n_prod').AsString;
             cbxUnid.Text := FieldByName ('p_uni_med').AsString;
             edtQtd.Text := FieldByName ('p_qtd').AsString;
             edtNivel.Text := FieldByName('p_nivel').AsString;
             edtVlUni.Text := FieldByName ('p_vl_uni').AsString;
             edtVlTot.Text := FieldByName ('p_vl_tot').AsString;
             edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
             edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
             fFoto := CreateBlobStream(FieldByName('p_foto'),bmRead);
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
    end
    else begin
       Application.MessageBox('Selcione o produto.','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadProd.edtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    If (Key = VK_RETURN) then
       If edtCod.Text <> '' then begin
       Jpeg := nil;
       If edtCod.Text <> '' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from produtos where p_cod = '+ QuotedStr(edtCod.Text));
             Active := True;
             If RecordCount = 0 then begin
                Application.MessageBox('Registro n�o encontrado...','Sistema Almoxarifado - Informa��o',MB_OK+MB_ICONINFORMATION);
                edtCod.SetFocus;
             end
             else begin
                edtCod.Text := FieldByName ('p_cod').AsString;
                cbxNome.Text := FieldByName ('p_n_prod').AsString;
                cbxUnid.Text := FieldByName ('p_uni_med').AsString;
                fFoto := CreateBlobStream(FieldByName('p_foto'),bmRead);
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
       end;
    end
    else begin
       Application.MessageBox('Digite o C�digo.','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

        
procedure TfrmCadProd.cbxNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Sender);
end;

procedure TfrmCadProd.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          fConvertVlUni;
          fConvertVlTot;
          fConvertQtd;
          fConvertNivel;
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update produtos set p_cod = '+ QuotedStr(edtCod.Text)+', p_n_prod = '+ QuotedStr(cbxNome.Text)+', p_uni_med = '+ QuotedStr(cbxUnid.Text)+', p_qtd = '+QuotedStr(edtQtd.Text)+', p_vl_uni = '+QuotedStr(edtVlUni.Text)+', p_vl_tot = '+QuotedStr(edtVlTot.Text)+', p_nivel = '+QuotedStr(edtNivel.Text)+' where p_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             fConvertVlUni;
             fConvertVlTot;
             fConvertQtd;
             fConvertNivel;
             Application.MessageBox('Registro Atualizado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnSelecionarClick(Sender);
          end;
       end
//       else begin
//          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Madeira F�cil - Aten��o',MB_OK+MB_ICONSTOP);
//       end;
//    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode ser vazio! Selecione um produto para atualizar dados.','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadProd.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Sistema Almoxarifado - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from produtos where p_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                cbxNome.Clear;
                FormCreate(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode ser vazio! Selecione um produto para poder deletar.','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadProd.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       If edtCod.Text <> '' then begin
          If OpenPictureDialog1.Execute then begin
             Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
             fConvertImagem;
             iImagem := OpenPictureDialog1.FileName;
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update produtos set p_foto = LOAD_FILE('+QuotedStr(iImagem)+') where p_cod = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
             end;
             fConvertImagem;
          end;
       end
       else begin
          Application.MessageBox('Os campos n�o podem ser vazios! Selecione um registro para carregar a foto...','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCadProd.btnRemoverClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       If edtCod.Text <> '' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update produtos set p_foto = null where p_cod = '+QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Image1.Picture.Assign(nil);
          end;
       end
       else begin
          Application.MessageBox('Os campos n�o podem ser vazios! Selecione um registro para remover a foto...','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCadProd.edtVlUniExit(Sender: TObject);
var vQtd, vUnit : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vUnit := StrToFloat(edtVlUni.Text);
    edtVlTot.Text := FloatToStr(vQtd * vUnit);
    edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
    edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
    edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
end;

end.
