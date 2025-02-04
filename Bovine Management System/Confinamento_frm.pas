unit Confinamento_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmConfinamento = class(TForm)
    GroupBox1: TGroupBox;
    edtCod: TLabeledEdit;
    Label1: TLabel;
    dtpData: TDateTimePicker;
    Shape1: TShape;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    edtQtdEntrada: TLabeledEdit;
    edtQtdSaida: TLabeledEdit;
    edtQtdEstoque: TLabeledEdit;
    Label2: TLabel;
    mmoObs: TMemo;
    rdgStatus: TRadioGroup;
    edtBoi: TLabeledEdit;
    edtVaca: TLabeledEdit;
    edtNovilha: TLabeledEdit;
    rdgLancamento: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdEntradaExit(Sender: TObject);
    procedure edtQtdSaidaExit(Sender: TObject);
    procedure rdgLancamentoClick(Sender: TObject);
    procedure edtQtdEntradaEnter(Sender: TObject);
    procedure edtQtdSaidaEnter(Sender: TObject);
    procedure edtBoiEnter(Sender: TObject);
    procedure edtVacaEnter(Sender: TObject);
    procedure edtNovilhaEnter(Sender: TObject);
    procedure edtBoiExit(Sender: TObject);
    procedure edtVacaExit(Sender: TObject);
    procedure edtNovilhaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfinamento: TfrmConfinamento;

implementation

uses Carro_Comando_dm, ADODB, DB;

{$R *.dfm}

function fBuscaCodConfinamento() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from confinamento');
       Active := True;
       fBuscaCodConfinamento := FieldByName('ultimo').AsInteger;
    end;
end;

function sStatus () : String;
begin
    If frmConfinamento.rdgStatus.ItemIndex = 0 then
       sStatus := 'ATIVO'
    else
       sStatus := 'ENCERRADO';
end;

procedure TfrmConfinamento.FormShow(Sender: TObject);
begin
    dtpData.Date := Date;
    edtQtdEntrada.Text := '0'; edtQtdSaida.Text := '0'; edtQtdEstoque.Text := '0';
    edtBoi.Text := '0'; edtVaca.Text := '0'; edtNovilha.Text := '0';
    rdgStatus.ItemIndex := -1; rdgLancamento.ItemIndex := -1;
    dtpData.SetFocus;
end;

procedure TfrmConfinamento.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConfinamento.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear;
    mmoObs.Clear;
    edtQtdEntrada.Enabled := False;
    edtQtdSaida.Enabled := False;
    FormShow(Sender);
end;

procedure TfrmConfinamento.btnInserirClick(Sender: TObject);
var nNovo : Integer;
    vStatus : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    nNovo := fBuscaCodConfinamento + 1;
    edtCod.Text := IntToStr(nNovo);
    vStatus := sStatus;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into confinamento (CF_COD, CF_DATA, CF_ENTRADA, CF_SAIDA, CF_QTD, CF_STATUS, CF_OBS, CF_BOI, CF_VACA, CF_NOVILHA) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtQtdEntrada.Text)+', '+QuotedStr(edtQtdSaida.Text)+', '+QuotedStr(edtQtdEstoque.Text)+', '+QuotedStr(vStatus)+', '+QuotedStr(mmoObs.Text)+', '+QuotedStr(edtBoi.Text)+', '+QuotedStr(edtVaca.Text)+', '+QuotedStr(edtNovilha.Text)+')');
       ExecSQL;
       Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnLimparClick(Sender);
    end;
end;

procedure TfrmConfinamento.btnAtualizarClick(Sender: TObject);
var vStatus : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vStatus := sStatus;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update confinamento set CF_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', CF_ENTRADA = '+QuotedStr(edtQtdEntrada.Text)+', CF_SAIDA = '+QuotedStr(edtQtdSaida.Text)+', CF_QTD = '+QuotedStr(edtQtdEstoque.Text)+', CF_STATUS = '+QuotedStr(vStatus)+', CF_OBS = '+QuotedStr(mmoObs.Text)+', CF_BOI = '+QuotedStr(edtBoi.Text)+', CF_VACA = '+QuotedStr(edtVaca.Text)+', CF_NOVILHA = '+QuotedStr(edtNovilha.Text)+'  where CF_COD = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
    end;
    If rdgStatus.ItemIndex = 1 then begin
       edtCod.Clear; edtQtdEntrada.Text := '0'; edtQtdSaida.Text := '0'; mmoObs.Clear; rdgStatus.ItemIndex := -1;
    end;
    dtpData.SetFocus;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmConfinamento.btnDeletarClick(Sender: TObject);
begin
    If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Delete from confinamento where cf_cod = '+ QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
       end;
    end;
end;

procedure TfrmConfinamento.btnSelecionarClick(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from confinamento where cf_status = ''ATIVO''');
       Active := True;
       edtCod.Text := FieldByName('cf_cod').AsString;
       dtpData.Date := FieldByName('cf_data').AsDateTime;
       edtQtdEntrada.Text := FieldByName('cf_entrada').AsString;
       edtQtdSaida.Text := FieldByName('cf_saida').AsString;
       edtQtdEstoque.Text := FieldByName('cf_qtd').AsString;
       mmoObs.Text := FieldByName('cf_obs').AsString;
       edtBoi.Text := FieldByName('cf_boi').AsString;
       edtVaca.Text := FieldByName('cf_vaca').AsString;
       edtNovilha.Text := FieldByName('cf_novilha').AsString;
       If FieldByName('cf_status').AsString = 'ATIVO' then
          rdgStatus.ItemIndex := 0
       else
          rdgStatus.ItemIndex := 1;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmConfinamento.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmConfinamento.edtQtdEntradaExit(Sender: TObject);
var vEntrada, vEstoque : Integer;
begin
    If edtQtdEntrada.Text <> '0' then begin
       vEntrada := StrToInt(edtQtdEntrada.Text);
       vEstoque := StrToInt(edtQtdEstoque.Text);
       edtQtdEstoque.Text := IntToStr(vEntrada+vEstoque);
    end;
end;

procedure TfrmConfinamento.edtQtdSaidaExit(Sender: TObject);
var vSaida, vEstoque : Integer;
begin
    If edtQtdSaida.Text <> '0' then begin
       vSaida := StrToInt(edtQtdSaida.Text);
       vEstoque := StrToInt(edtQtdEstoque.Text);
       edtQtdEstoque.Text := IntToStr(vEstoque-vSaida);
    end;
end;

procedure TfrmConfinamento.rdgLancamentoClick(Sender: TObject);
begin
    If rdgLancamento.ItemIndex = 0 then begin
       edtQtdEntrada.Enabled := True;
       edtQtdSaida.Enabled := False;
    end;
    If rdgLancamento.ItemIndex = 1 then begin
       edtQtdSaida.Enabled := True;
       edtQtdEntrada.Enabled := False;
    end;
    edtBoi.SetFocus;
end;

procedure TfrmConfinamento.edtQtdEntradaEnter(Sender: TObject);
var vBoi, vVaca, vNovilha : Integer;
begin
    If rdgLancamento.ItemIndex = 0 then begin
       vBoi := StrToInt(Edit4.Text);
       vVaca := StrToInt(Edit5.Text);
       vNovilha := StrToInt(Edit6.Text);
       edtQtdEntrada.Text := IntToStr(vBoi+vVaca+vNovilha);
    end;
end;

procedure TfrmConfinamento.edtQtdSaidaEnter(Sender: TObject);
var vBoi, vVaca, vNovilha : Integer;
begin
    If rdgLancamento.ItemIndex = 1 then begin
       vBoi := StrToInt(Edit4.Text);
       vVaca := StrToInt(Edit5.Text);
       vNovilha := StrToInt(Edit6.Text);
       edtQtdSaida.Text := IntToStr(vBoi+vVaca+vNovilha);
    end;
end;

procedure TfrmConfinamento.edtBoiEnter(Sender: TObject);
begin
    Edit1.Text := edtBoi.Text;
end;

procedure TfrmConfinamento.edtVacaEnter(Sender: TObject);
begin
    Edit2.Text := edtVaca.Text;
end;

procedure TfrmConfinamento.edtNovilhaEnter(Sender: TObject);
begin
    Edit3.Text := edtNovilha.Text;
end;

procedure TfrmConfinamento.edtBoiExit(Sender: TObject);
var vBoi, vValor : Integer;
begin
    If rdgLancamento.ItemIndex = 0 then begin
       Edit4.Text := edtBoi.Text;
       vBoi := StrToInt(edtBoi.Text);
       vValor := StrToInt(Edit1.Text);
       edtBoi.Text := IntToStr(vBoi+vValor);
    end;
    If rdgLancamento.ItemIndex = 1 then begin
       Edit4.Text := edtBoi.Text;
       vBoi := StrToInt(edtBoi.Text);
       vValor := StrToInt(Edit1.Text);
       edtBoi.Text := IntToStr(vValor-vBoi);
    end;
end;

procedure TfrmConfinamento.edtVacaExit(Sender: TObject);
var vVaca, vValor : Integer;
begin
    If rdgLancamento.ItemIndex = 0 then begin
       Edit5.Text := edtVaca.Text;
       vVaca := StrToInt(edtVaca.Text);
       vValor := StrToInt(Edit2.Text);
       edtVaca.Text := IntToStr(vVaca+vValor);
    end;
    If rdgLancamento.ItemIndex = 1 then begin
       Edit5.Text := edtVaca.Text;
       vVaca := StrToInt(edtVaca.Text);
       vValor := StrToInt(Edit2.Text);
       edtVaca.Text := IntToStr(vValor-vVaca);
    end;

end;

procedure TfrmConfinamento.edtNovilhaExit(Sender: TObject);
var vNovilha, vValor : Integer;
begin
    If rdgLancamento.ItemIndex = 0 then begin
       Edit6.Text := edtNovilha.Text;
       vNovilha := StrToInt(edtNovilha.Text);
       vValor := StrToInt(Edit3.Text);
       edtNovilha.Text := IntToStr(vNovilha+vValor);
    end;
    If rdgLancamento.ItemIndex = 1 then begin
       Edit6.Text := edtNovilha.Text;
       vNovilha := StrToInt(edtNovilha.Text);
       vValor := StrToInt(Edit3.Text);
       edtNovilha.Text := IntToStr(vValor-vNovilha);
    end;

end;

end.
