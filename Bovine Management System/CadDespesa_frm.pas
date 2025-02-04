unit CadDespesa_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Mask, DateUtils,
  ExtDlgs, Jpeg;

type
  TfrmCadDespesas = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    memoDescr: TMemo;
    Label3: TLabel;
    edtCod: TLabeledEdit;
    edtDespesa: TLabeledEdit;
    dtpData: TDateTimePicker;
    Label1: TLabel;
    edtValor: TLabeledEdit;
    rgpControle: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure memoDescrKeyPress(Sender: TObject; var Key: Char);
    procedure rgpControleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDespesas: TfrmCadDespesas;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm, ConsultaGastos_frm;

{$R *.dfm}

function fBuscaCodDespesa : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select d_cod from despesas order by d_cod desc');
       Active := True;
       fBuscaCodDespesa := FieldByName('d_cod').AsInteger;
    end;
end;

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadDespesas.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadDespesas.edtValor.Text := valor;
end;

function AnoConfinamento: String;
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
    If frmCadDespesas.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C'
end;

procedure TfrmCadDespesas.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadDespesas.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtDespesa.Clear;
    dtpData.Date := Date;
    edtValor.Text := '0,00';
    memoDescr.Clear;
    rgpControle.ItemIndex := -1;
    edtDespesa.SetFocus;
end;

procedure TfrmCadDespesas.FormShow(Sender: TObject);
begin
    edtValor.Text := '0,00';
    dtpData.Date := Date;
    edtDespesa.SetFocus;
end;

procedure TfrmCadDespesas.btnInserirClick(Sender: TObject);
var nNovo : Integer;
    vAno, vControle : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vAno := AnoConfinamento;
    vControle := Controle;
    nNovo := fBuscaCodDespesa + 1;
    edtCod.Text := IntToStr(nNovo);
    fConvertValor;
    If edtDespesa.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into despesas (D_COD, D_NOME, D_DATA, D_VALOR, D_DESCR, D_ANO, D_CONTROLE) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtDespesa.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(memoDescr.Text)+', '+QuotedStr(vAno)+', '+QuotedStr(vControle)+')');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode ser vazio!','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadDespesas.btnSelecionarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCosultaGastos, frmCosultaGastos);
      frmCosultaGastos.ShowModal;
    Finally
         frmCosultaGastos.Free;
    end;
end;

procedure TfrmCadDespesas.btnAtualizarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertValor;
    If edtDespesa.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update despesas set D_COD = '+QuotedStr(edtCod.Text)+', D_NOME = '+QuotedStr(edtDespesa.Text)+', D_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', D_VALOR = '+QuotedStr(edtValor.Text)+', D_DESCR = '+QuotedStr(memoDescr.Text)+' where d_cod = '+QuotedStr(edtCod.Text)+'');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             fConvertValor;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode ser vazio! Selecione uma Despesa para atualizar dados.','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadDespesas.btnDeletarClick(Sender: TObject);
begin
    If edtDespesa.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from despesas where d_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode ser vazio! Selecione uma despesa para poder deletar.','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadDespesas.edtValorExit(Sender: TObject);
begin
    edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
end;

procedure TfrmCadDespesas.memoDescrKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadDespesas.rgpControleClick(Sender: TObject);
begin
    edtDespesa.SetFocus;
end;

end.
