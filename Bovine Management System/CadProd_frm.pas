unit CadProd_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Mask, DateUtils,
  ExtDlgs, Jpeg;

type
  TfrmCadProd = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    lblNome: TLabel;
    edtCod: TLabeledEdit;
    cbxNome: TComboBox;
    edtQtd: TLabeledEdit;
    GroupBox2: TGroupBox;
    memoObs: TMemo;
    Label2: TLabel;
    Edit1: TEdit;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    edtEntrada: TLabeledEdit;
    edtCodEntrada: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    dtpDtEntrada: TDateTimePicker;
    edtFrete: TLabeledEdit;
    edtDespesa: TLabeledEdit;
    edtVlCompra: TLabeledEdit;
    btnCadastrar: TBitBtn;
    btnConsultar: TBitBtn;
    btnExcluir: TBitBtn;
    rgpControle: TRadioGroup;
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
    procedure btnCadastrarClick(Sender: TObject);
    procedure edtEntradaExit(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtDespesaExit(Sender: TObject);
    procedure edtFreteExit(Sender: TObject);
    procedure edtVlUniEnter(Sender: TObject);
    procedure edtVlCompraExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure rgpControleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProd: TfrmCadProd;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm, ConsultaEntProd_frm;

{$R *.dfm}

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

function fConvertQtdEntrada() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtEntrada.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtEntrada.Text := valor;
end;

function fConvertFrete() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtFrete.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtFrete.Text := valor;
end;

function fConvertDespesa() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtDespesa.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtDespesa.Text := valor;
end;

function fConvertCompra() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadProd.edtVlCompra.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadProd.edtVlCompra.Text := valor;
end;

function fBuscaCodProd() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_cod from produtos order by p_cod desc');
       Active := True;
       fBuscaCodProd := FieldByName('p_cod').AsInteger;
    end;
end;

function fBuscaCodEntrada() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ep_cod from entrada_produtos order by ep_cod desc');
       Active := True;
       fBuscaCodEntrada := FieldByName('ep_cod').AsInteger;
    end;
end;

function AnoConfinamento() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select c_ano from confinamento where c_status = ''ATIVO''');
       Active := True;
       AnoConfinamento := FieldByName('c_ano').AsString;
    end;
end;

function Controle() : String;
begin
    If frmCadProd.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C'
end;

//function AtualizaEntrada () : String;
//begin
//    With dmCarroComando.ADOQuery1 do begin
//       Active := False;
//       SQL.Clear;
//       SQL.Add('Update entrada_produtos set ep_controle = ''INATIVO'' where p_cod = '+QuotedStr(frmCadProd.edtCod.Text)+'');
//       ExecSQL;
//    end;
//end;

procedure TfrmCadProd.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadProd.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtCodEntrada.Clear; Edit1.Clear;
    cbxNome.Clear;
    btnCadastrar.Enabled := False;
    btnExcluir.Enabled := False;
    rgpControle.ItemIndex := -1;
    FormCreate(Sender);
    FormShow(Sender);
end;

procedure TfrmCadProd.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from produtos order by p_nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('p_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadProd.FormShow(Sender: TObject);
begin
    edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlTot.Text := '0,00'; edtEntrada.Text := '0';
    edtFrete.Text := '0,00'; edtDespesa.Text := '0,00'; edtVlCompra.Text := '0,00';
    dtpDtEntrada.Date := Date;
    GroupBox4.Enabled := False;
    cbxNome.SetFocus;
end;

procedure TfrmCadProd.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodProd + 1;
    edtCod.Text := IntToStr(nNovo);
    fConvertQtd;
    If cbxNome.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into produtos (P_COD, P_NOME, P_QTD, P_OBS) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxNome.Text)+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(memoObs.Text)+')');
             ExecSQL;
             fConvertQtd;
             Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.Clear;
             FormCreate(Sender);
             FormShow(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Omega - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo Nome do Produto n�o pode ser vazio!','Omega - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadProd.btnSelecionarClick(Sender: TObject);
begin
    If cbxNome.Text <> '' then begin
       With  dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from produtos where p_nome = '+ QuotedStr(cbxNome.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro n�o encontrado...','Omega - Informa��o',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxNome.SetFocus;
          end
          else begin
             edtCod.Text := FieldByName ('p_cod').AsString;
             cbxNome.Text := FieldByName ('p_nome').AsString;
             edtQtd.Text := FieldByName ('p_qtd').AsString;
//             edtQtd.Text := FormatFloat('0.##',(StrToFloat(edtQtd.Text)));
             memoObs.Text := FieldByName ('p_obs').AsString;
          end;
       end;
       GroupBox4.Enabled := True;
       btnCadastrar.Enabled := True;
    end
    else begin
       Application.MessageBox('Selcione o produto.','Omega - Aten��o',MB_OK+MB_ICONWARNING);
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
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          fConvertQtd;
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update produtos set p_cod = '+ QuotedStr(edtCod.Text)+', p_nome = '+ QuotedStr(cbxNome.Text)+', p_qtd = '+QuotedStr(edtQtd.Text)+', p_obs = '+QuotedStr(memoObs.Text)+' where p_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             fConvertQtd;
             Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnSelecionarClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Omega - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode ser vazio! Selecione um produto para atualizar dados.','Omega - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadProd.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Omega - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from entrada_produtos where p_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from produtos where p_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                cbxNome.Clear;
                FormCreate(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Omega - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode ser vazio! Selecione um produto para poder deletar.','Sys Point - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadProd.btnCadastrarClick(Sender: TObject);
var nNovo : Integer;
    vAno, vControle : String;
begin
//    AtualizaEntrada;
    vAno := AnoConfinamento;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vControle := Controle;
    nNovo := fBuscaCodEntrada + 1;
    edtCodEntrada.Text := IntToStr(nNovo);
    fConvertVlUni;
    fConvertVlTot;
    fConvertQtdEntrada;
    fConvertFrete;
    fConvertDespesa;
    fConvertCompra;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into entrada_produtos (EP_COD, P_COD, EP_DTENTRADA, EP_QTD, EP_VLUNIT, EP_VLTOTAL, EP_VLFRETE, EP_VLDESPESA, EP_VLCOMPRA, EP_ANO, EP_CONTROLE) Values ('+QuotedStr(edtCodEntrada.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(dtpDtEntrada.Date))+', '+QuotedStr(edtEntrada.Text)+', '+QuotedStr(edtVlUni.Text)+', '+QuotedStr(edtVlTot.Text)+', '+QuotedStr(edtFrete.Text)+', '+QuotedStr(edtDespesa.Text)+', '+QuotedStr(edtVlCompra.Text)+', '+QuotedStr(vAno)+', '+QuotedStr(vControle)+')');
       ExecSQL;
       fConvertVlUni;
       fConvertVlTot;
       fConvertQtdEntrada;
       fConvertFrete;
       fConvertDespesa;
       fConvertCompra;
       ShortDateFormat := 'dd/mm/yyyy';
//       Application.MessageBox('Registro Efetuado com Sucesso!','Info Gado - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnAtualizarClick(Sender);
       btnLimparClick(Sender);
    end;
end;

procedure TfrmCadProd.edtEntradaExit(Sender: TObject);
var eQTD, qQTD : Double;
begin
    If Edit1.Text = '' then begin
       eQTD := StrToFloat(edtEntrada.Text);
       qQTD := StrToFloat(edtQtd.Text);
       edtQtd.Text := FloatToStr(qQTD+eQTD);
       Edit1.Text := '1';
    end;
end;

procedure TfrmCadProd.btnConsultarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsultaEntProd, frmConsultaEntProd);
      frmConsultaEntProd.ShowModal;
    Finally
         frmConsultaEntProd.Free;
    end;
end;

procedure TfrmCadProd.edtDespesaExit(Sender: TObject);
var vQtd, vUnit, vFrete, vDespesa, vCompra, vTotal : Double;
begin
    vQtd := StrToFloat(edtEntrada.Text);
    vUnit := StrToFloat(edtVlUni.Text);
    vFrete := StrToFloat(edtFrete.Text);
    vDespesa := StrToFloat(edtDespesa.Text);
    vCompra := StrToFloat(edtVlCompra.Text);
    vTotal := StrToFloat(edtVlTot.Text);
    edtVlTot.Text := FloatToStr(vCompra+vFrete+vDespesa);
    edtDespesa.Text := FormatCurr('0.00', StrToCurr(edtDespesa.Text));
    edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
    edtVlUni.SetFocus;
end;

procedure TfrmCadProd.edtFreteExit(Sender: TObject);
begin
    edtFrete.Text := FormatCurr('0.00', StrToCurr(edtFrete.Text));
end;

procedure TfrmCadProd.edtVlUniEnter(Sender: TObject);
var vTotal, vQtd : Double;
begin
    vQtd := StrToFloat(edtEntrada.Text);
    vTotal := StrToFloat(edtVlTot.Text);
    edtVlUni.Text := FloatToStr(vTotal/vQtd);
    edtVlUni.Text := FormatCurr('0.000', StrToCurr(edtVlUni.Text));
end;

procedure TfrmCadProd.edtVlCompraExit(Sender: TObject);
begin
    edtVlCompra.Text := FormatCurr('0.00', StrToCurr(edtVlCompra.Text));
end;

procedure TfrmCadProd.btnExcluirClick(Sender: TObject);
var vQtd, vEntrada : Double;
begin
    If Application.MessageBox('Excluir Registro?','Omega - Confirma��o de Exclus�o',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin
       vQtd := StrToFloat(edtQtd.Text);
       vEntrada := StrToFloat(edtEntrada.Text);
       edtQtd.Text := FloatToStr(vQtd-vEntrada);
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update produtos set p_qtd = '+QuotedStr(edtQtd.Text)+' where p_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Active := False;
          SQL.Clear;
          SQL.Add('Delete from entrada_produtos where ep_cod = '+QuotedStr(edtCodEntrada.Text)+'');
          ExecSQL;
          Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       btnLimparClick(Sender);
    end;
end;

procedure TfrmCadProd.rgpControleClick(Sender: TObject);
begin
    dtpDtEntrada.SetFocus;
end;

end.
