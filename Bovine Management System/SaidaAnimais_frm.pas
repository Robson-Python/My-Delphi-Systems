unit SaidaAnimais_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DateUtils;

type
  TfrmSaidaAnimais = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtValorGeral: TLabeledEdit;
    GroupBox3: TGroupBox;
    edtQtdVaca: TLabeledEdit;
    edtPesoVaca: TLabeledEdit;
    edtValorVaca: TLabeledEdit;
    edtPesoFrigoVaca: TLabeledEdit;
    GroupBox4: TGroupBox;
    edtQtdNovilha: TLabeledEdit;
    edtPesoNovilha: TLabeledEdit;
    edtValorNovilha: TLabeledEdit;
    edtPesoFrigoNovilha: TLabeledEdit;
    edtRendimentoVaca: TLabeledEdit;
    edtPesoFrigoArrobaVaca: TLabeledEdit;
    edtRendimentoNovilha: TLabeledEdit;
    edtPesoFrigoArrobaNovilha: TLabeledEdit;
    GroupBox2: TGroupBox;
    edtQtdBoi: TLabeledEdit;
    edtPesoBoi: TLabeledEdit;
    edtValorBoi: TLabeledEdit;
    edtPesoFrigoBoi: TLabeledEdit;
    edtRendimentoBoi: TLabeledEdit;
    edtValorFrigoBoi: TLabeledEdit;
    edtCodSaida: TLabeledEdit;
    dtpDtSaida: TDateTimePicker;
    Label1: TLabel;
    edtPesoFrigoArrobaBoi: TLabeledEdit;
    edtValorFrigoVaca: TLabeledEdit;
    edtValorFrigoNovilha: TLabeledEdit;
    edtValorFreteBoi: TLabeledEdit;
    edtDespesaBoi: TLabeledEdit;
    edtValorFreteVaca: TLabeledEdit;
    edtDespesaVaca: TLabeledEdit;
    edtValorFreteNovilha: TLabeledEdit;
    edtDespesaNovilha: TLabeledEdit;
    edtMediaBoi: TLabeledEdit;
    edtMediaVaca: TLabeledEdit;
    edtMediaNovilha: TLabeledEdit;
    btnConsultar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    edtFrete: TLabeledEdit;
    edtDespesa: TLabeledEdit;
    GroupBox5: TGroupBox;
    edtArroba: TLabeledEdit;
    edtAlimento: TLabeledEdit;
    edtCusto: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    cbxLote: TComboBox;
    Label3: TLabel;
    btnCalcular: TBitBtn;
    rgpControle: TRadioGroup;
    btnCalcularBoi: TBitBtn;
    btnCalculaVaca: TBitBtn;
    btnCalculaNovilha: TBitBtn;
    BitBtn1: TBitBtn;
    edtDespesaArroba: TLabeledEdit;
    edtCodLote: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
//    procedure edtPesoBoiExit(Sender: TObject);
//    procedure edtValorBoiExit(Sender: TObject);
//    procedure edtPesoVacaExit(Sender: TObject);
//    procedure edtValorVacaExit(Sender: TObject);
//    procedure edtPesoNovilhaExit(Sender: TObject);
//    procedure edtValorNovilhaExit(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtPesoFrigoBoiExit(Sender: TObject);
    procedure edtPesoFrigoVacaExit(Sender: TObject);
    procedure edtPesoFrigoNovilhaExit(Sender: TObject);
    procedure ValorGeral;
    procedure edtDespesaBoiExit(Sender: TObject);
    procedure edtDespesaVacaExit(Sender: TObject);
    procedure edtDespesaNovilhaExit(Sender: TObject);
    procedure edtValorFreteBoiExit(Sender: TObject);
    procedure edtValorFreteVacaExit(Sender: TObject);
    procedure edtValorFreteNovilhaExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Busca;
    procedure Data;
    procedure Arroba;
    procedure Gastos;
    procedure Custos;
    procedure btnCalcularClick(Sender: TObject);
    procedure rgpControleClick(Sender: TObject);
    procedure PesoBoi;
    procedure btnCalcularBoiClick(Sender: TObject);
    procedure PesoVaca;
    procedure btnCalculaVacaClick(Sender: TObject);
    procedure PesoNovilha;
    procedure btnCalculaNovilhaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CodLote;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaidaAnimais: TfrmSaidaAnimais;

implementation

uses Carro_Comando_dm, Principal_frm, ConsultaSaidaAnimais_frm,
  ImprimeSaidaAnimal_frm, ADODB, DB;

{$R *.dfm}

function fBuscaCodSaida : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select sa_cod from saida_animais order by sa_cod desc');
       Active := True;
       fBuscaCodSaida := FieldByName('sa_cod').AsInteger;
    end;
end;

function fBuscaCodLote : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select sl_cod from saida_lotes order by sl_cod desc');
       Active := True;
       fBuscaCodLote := FieldByName('sl_cod').AsInteger;
    end;
end;

function fConvertQtdBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtQtdBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtQtdBoi.Text := valor;
end;

function fConvertPesoBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoBoi.Text := valor;
end;

function fConvertBoiValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorBoi.Text := valor;
end;

function fConvertQtdVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtQtdVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtQtdVaca.Text := valor;
end;

function fConvertPesoVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoVaca.Text := valor;
end;

function fConvertVacaValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorVaca.Text := valor;
end;

function fConvertQtdNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtQtdNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtQtdNovilha.Text := valor;
end;

function fConvertPesoNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoNovilha.Text := valor;
end;

function fConvertNivilhaValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorNovilha.Text := valor;
end;

function fConvertValorTotalGeral() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorGeral.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorGeral.Text := valor;
end;

function fConvertPesoFrigoBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoFrigoBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoFrigoBoi.Text := valor;
end;

function fConvertArrobaFrigoBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoFrigoArrobaBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoFrigoArrobaBoi.Text := valor;
end;

function fConvertRendimentoBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtRendimentoBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtRendimentoBoi.Text := valor;
end;

function fConvertValorFrigoBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorFrigoBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorFrigoBoi.Text := valor;
end;

function fConvertFreteBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorFreteBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorFreteBoi.Text := valor;
end;

function fConvertDespesaBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtDespesaBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtDespesaBoi.Text := valor;
end;

function fConvertPesoFrigoVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoFrigoVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoFrigoVaca.Text := valor;
end;

function fConvertArrobaFrigoVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoFrigoArrobaVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoFrigoArrobaVaca.Text := valor;
end;

function fConvertRendimentoVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtRendimentoVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtRendimentoVaca.Text := valor;
end;

function fConvertValorFrigoVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorFrigoVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorFrigoVaca.Text := valor;
end;

function fConvertFreteVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorFreteVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorFreteVaca.Text := valor;
end;

function fConvertDespesaVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtDespesaVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtDespesaVaca.Text := valor;
end;

function fConvertPesoFrigoNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoFrigoNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoFrigoNovilha.Text := valor;
end;

function fConvertArrobaFrigoNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtPesoFrigoArrobaNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtPesoFrigoArrobaNovilha.Text := valor;
end;

function fConvertRendimentoNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtRendimentoNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtRendimentoNovilha.Text := valor;
end;

function fConvertValorFrigoNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorFrigoNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorFrigoNovilha.Text := valor;
end;

function fConvertFreteNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtValorFreteNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtValorFreteNovilha.Text := valor;
end;

function fConvertDespesaNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtDespesaNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtDespesaNovilha.Text := valor;
end;

function fConvertMediaNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtMediaNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtMediaNovilha.Text := valor;
end;

function fConvertMediaBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtMediaBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtMediaBoi.Text := valor;
end;

function fConvertMediaVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaidaAnimais.edtMediaVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaidaAnimais.edtMediaVaca.Text := valor;
end;

function Despesa() : Double;
var vBoi, vVaca, vNovilha : Double;
begin
    vBoi := StrToFloat(frmSaidaAnimais.edtDespesaBoi.Text);
    vVaca := StrToFloat(frmSaidaAnimais.edtDespesaVaca.Text);
    vNovilha := StrToFloat(frmSaidaAnimais.edtDespesaNovilha.Text);
    frmSaidaAnimais.edtDespesa.Text := FloatToStr(vBoi+vVaca+vNovilha);
    frmSaidaAnimais.edtDespesa.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtDespesa.Text));
end;

function Frete() : Double;
var vBoi, vVaca, vNovilha : Double;
begin
    vBoi := StrToFloat(frmSaidaAnimais.edtValorFreteBoi.Text);
    vVaca := StrToFloat(frmSaidaAnimais.edtValorFreteVaca.Text);
    vNovilha := StrToFloat(frmSaidaAnimais.edtValorFreteNovilha.Text);
    frmSaidaAnimais.edtFrete.Text := FloatToStr(vBoi+vVaca+vNovilha);
    frmSaidaAnimais.edtFrete.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtFrete.Text));
end;

function Lote() : Double;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(lt_qtd) from lotes where lt_data <= '+QuotedStr(DateToStr(frmSaidaAnimais.DateTimePicker1.Date))+'');
       Active := True;
       Lote := FieldByName('sum(lt_qtd)').AsFloat;
    end;
end;

function Converter() : String;
begin
    fConvertQtdBoi;
    fConvertPesoBoi;
    fConvertBoiValor;
    fConvertQtdVaca;
    fConvertPesoVaca;
    fConvertVacaValor;
    fConvertQtdNovilha;
    fConvertPesoNovilha;
    fConvertNivilhaValor;
    fConvertValorTotalGeral;
    fConvertPesoFrigoBoi;
    fConvertArrobaFrigoBoi;
    fConvertRendimentoBoi;
    fConvertValorFrigoBoi;
    fConvertFreteBoi;
    fConvertDespesaBoi;
    fConvertPesoFrigoVaca;
    fConvertArrobaFrigoVaca;
    fConvertRendimentoVaca;
    fConvertValorFrigoVaca;
    fConvertFreteVaca;
    fConvertDespesaVaca;
    fConvertPesoFrigoNovilha;
    fConvertArrobaFrigoNovilha;
    fConvertRendimentoNovilha;
    fConvertValorFrigoNovilha;
    fConvertFreteNovilha;
    fConvertDespesaNovilha;
    fConvertMediaNovilha;
    fConvertMediaBoi;
    fConvertMediaVaca;
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
    If frmSaidaAnimais.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C'
end;

procedure TfrmSaidaAnimais.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSaidaAnimais.btnLimparClick(Sender: TObject);
begin
    edtCodSaida.Clear;
    GroupBox5.Enabled := False;
    rgpControle.ItemIndex := -1;
    cbxLote.Clear;
    FormShow(Sender);
end;

procedure TfrmSaidaAnimais.FormShow(Sender: TObject);
begin
    dtpDtSaida.Date := Date;
    DateTimePicker1.Date := Date;
    edtValorGeral.Text := '0,00';
    edtQtdBoi.Text := '0'; edtPesoBoi.Text := '0'; edtValorBoi.Text := '0,00'; edtValorFrigoBoi.Text := '0,00'; edtPesoFrigoBoi.Text := '0'; edtRendimentoBoi.Text := '0'; edtPesoFrigoArrobaBoi.Text := '0';
    edtQtdVaca.Text := '0'; edtPesoVaca.Text := '0';  edtValorVaca.Text := '0,00'; edtValorFrigoVaca.Text := '0,00'; edtPesoFrigoVaca.Text := '0'; edtRendimentoVaca.Text := '0'; edtPesoFrigoArrobaVaca.Text := '0';
    edtQtdNovilha.Text := '0'; edtPesoNovilha.Text := '0'; edtValorNovilha.Text := '0,00'; edtPesoFrigoArrobaNovilha.Text := '0,00'; edtPesoFrigoNovilha.Text := '0'; edtRendimentoNovilha.Text := '0'; edtPesoFrigoArrobaNovilha.Text := '0'; edtValorFrigoNovilha.Text := '0,00';
    edtValorFreteBoi.Text := '0,00'; edtDespesaBoi.Text := '0,00'; edtValorFreteVaca.Text := '0,00'; edtDespesaVaca.Text := '0,00'; edtValorFreteNovilha.Text := '0,00'; edtDespesaNovilha.Text := '0,00';
    edtMediaBoi.Text := '0'; edtMediaVaca.Text := '0'; edtMediaNovilha.Text := '0';
    edtFrete.Text := '0,00'; edtDespesa.Text := '0,00';
    edtArroba.Text := '0'; edtAlimento.Text := '0,00'; edtCusto.Text := '0,00'; edtDespesaArroba.Text := '0,00';
    cbxLote.Text := '';
    dtpDtSaida.SetFocus;
end;

procedure TfrmSaidaAnimais.btnInserirClick(Sender: TObject);
var nNovo, nLote, cCodLote : Integer;
    vAnimais, vBoi, vVaca, vNovilha, vLote, vSaida, vTotal : Double;
    vSaldo, vAno, vControle : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vAno := AnoConfinamento;
    vControle := Controle;
    nNovo := fBuscaCodSaida + 1;
    nLote := fBuscaCodLote + 1;
    edtCodSaida.Text := IntToStr(nNovo);
    If edtValorGeral.Text <> '0.00' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
            vBoi := StrToFloat(edtQtdBoi.Text);
            vVaca := StrToFloat(edtQtdVaca.Text);
            vNovilha := StrToFloat(edtQtdNovilha.Text);
            vAnimais := vBoi+vVaca+vNovilha;
            Active := False;
            SQL.Clear;
            SQL.Add('select lt_cod, lt_qtd from lotes where lt_lote = '+QuotedStr(cbxLote.Text)+' and lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+'');
            Active := True;
            cCodLote := FieldByName('lt_cod').AsInteger;
            vLote := FieldByName('lt_qtd').AsFloat;
            Active := False;
            SQL.Clear;
            SQL.Add('select sum(sl_qtd) from saida_lotes where lt_cod = '+IntToStr(cCodLote)+'');
            Active := True;
            vSaida := FieldByName('sum(sl_qtd)').AsFloat;
            vTotal := vSaida+vAnimais;
            If vTotal > vLote then begin
               vSaldo := FloatToStr(vLote-vSaida);
               If StrToInt(vSaldo) = 0 then begin
                  ShowMessage('Esse lote j� foi encerrado. Escolha o pr�ximo lote.');
               end
               else begin
                  ShowMessage('A quantidade de animais da sa�da � maior que o saldo do lote selecionado! Voc� s� pode vender '+vSaldo+' animais desse lote.');
               end;
            end
            else begin
               Active := False;
               SQL.Clear;
               SQL.Add('Insert into saida_lotes (SL_COD, SL_DATA, SL_QTD, LT_COD) values ('+IntToStr(nLote)+', '+QuotedStr(DateToStr(dtpDtSaida.Date))+', '+FloatToStr(vAnimais)+', '+IntToStr(cCodLote)+')');
               ExecSQL;
               Converter;
               Active := False;
               SQL.Clear;
               SQL.Add('Insert into saida_animais (SA_COD, SA_DATA, SA_QTDBOI, SA_PESOBOI, SA_VALORARROBABOI, '+
               'SA_QTDVACA, SA_PESOVACA, SA_VALORARROBAVACA, SA_QTDNOVILHA, SA_PESONOVILHA, SA_VALORARROBANOVILHA, '+
               'SA_TOTALGERALARROBA, SA_PESOFRIGOBOI, SA_ARROBAFRIGOBOI, SA_RENDIMBOI, SA_PESOTOTALBOI, SA_FRETEBOI, SA_DESPESABOI, '+
               'SA_PESOFRIGOVACA, SA_ARROBAFRIGOVACA, SA_RENDIMVACA, SA_PESOTOTALVACA, SA_FRETEVACA, SA_DESPESAVACA, SA_PESOFRIGONOVILHA, SA_ARROBAFRIGONOVILHA, SA_RENDIMNOVILHA, SA_PESOTOTALNOVILHA, SA_FRETENOVILHA, SA_DESPESANOVILHA, '+
               'SA_MEDIABOI, SA_MEDIAVACA, SA_MEDIANOVILHA, SA_CONTROLE, SA_ANO) '+
               'values ('+QuotedStr(edtCodSaida.Text)+', '+QuotedStr(DateToStr(dtpDtSaida.Date))+', '+QuotedStr(edtQtdBoi.Text)+', '+QuotedStr(edtPesoBoi.Text)+', '+QuotedStr(edtValorBoi.Text)+', '+QuotedStr(edtQtdVaca.Text)+', '+QuotedStr(edtPesoVaca.Text)+', '+QuotedStr(edtValorVaca.Text)+', '+QuotedStr(edtQtdNovilha.Text)+', '+QuotedStr(edtPesoNovilha.Text)+', '+QuotedStr(edtValorNovilha.Text)+', '+QuotedStr(edtValorGeral.Text)+', '+
               ''+QuotedStr(edtPesoFrigoBoi.Text)+', '+QuotedStr(edtPesoFrigoArrobaBoi.Text)+', '+QuotedStr(edtRendimentoBoi.Text)+', '+QuotedStr(edtValorFrigoBoi.Text)+', '+QuotedStr(edtValorFreteBoi.Text)+', '+QuotedStr(edtDespesaBoi.Text)+', '+QuotedStr(edtPesoFrigoVaca.Text)+', '+QuotedStr(edtPesoFrigoArrobaVaca.Text)+', '+QuotedStr(edtRendimentoVaca.Text)+', '+QuotedStr(edtValorFrigoVaca.Text)+', '+QuotedStr(edtValorFreteVaca.Text)+', '+QuotedStr(edtDespesaVaca.Text)+', '+QuotedStr(edtPesoFrigoNovilha.Text)+', '+QuotedStr(edtPesoFrigoArrobaNovilha.Text)+', '+QuotedStr(edtRendimentoNovilha.Text)+', '+QuotedStr(edtValorFrigoNovilha.Text)+', '+QuotedStr(edtValorFreteNovilha.Text)+', '+QuotedStr(edtDespesaNovilha.Text)+', '+QuotedStr(edtMediaBoi.Text)+', '+QuotedStr(edtMediaVaca.Text)+', '+QuotedStr(edtMediaNovilha.Text)+', '+QuotedStr(vControle)+', '+vAno+')');
               ExecSQL;
               ShortDateFormat := 'dd/mm/yyyy';
               Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
               Busca;
            end;
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Omega - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo Valor Total Geral n�o pode estar vazio!','Omega - Aten��o',MB_OK+MB_ICONWARNING);
       btnLimparClick(Sender);
    end;
end;

procedure TfrmSaidaAnimais.btnAtualizarClick(Sender: TObject);
var vAnimais, vBoi, vVaca, vNovilha : Double;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    Converter;
    If edtCodSaida.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update saida_animais set SA_COD = '+QuotedStr(edtCodSaida.Text)+', SA_DATA = '+QuotedStr(DateToStr(dtpDtSaida.Date))+', SA_QTDBOI = '+QuotedStr(edtQtdBoi.Text)+', SA_PESOBOI = '+QuotedStr(edtPesoBoi.Text)+', SA_VALORARROBABOI = '+QuotedStr(edtValorBoi.Text)+', '+
             'SA_QTDVACA = '+QuotedStr(edtQtdVaca.Text)+', SA_PESOVACA = '+QuotedStr(edtPesoVaca.Text)+', SA_VALORARROBAVACA = '+QuotedStr(edtValorVaca.Text)+', SA_QTDNOVILHA = '+QuotedStr(edtQtdNovilha.Text)+', SA_PESONOVILHA = '+QuotedStr(edtPesoNovilha.Text)+', '+
             'SA_VALORARROBANOVILHA = '+QuotedStr(edtValorNovilha.Text)+', SA_TOTALGERALARROBA = '+QuotedStr(edtValorGeral.Text)+', SA_PESOFRIGOBOI = '+QuotedStr(edtPesoFrigoBoi.Text)+', SA_ARROBAFRIGOBOI = '+QuotedStr(edtPesoFrigoArrobaBoi.Text)+', SA_RENDIMBOI = '+QuotedStr(edtRendimentoBoi.Text)+', SA_PESOTOTALBOI = '+QuotedStr(edtValorFrigoBoi.Text)+', SA_FRETEBOI = '+QuotedStr(edtValorFreteBoi.Text)+', SA_DESPESABOI = '+QuotedStr(edtDespesaBoi.Text)+', '+
             'SA_PESOFRIGOVACA = '+QuotedStr(edtPesoFrigoVaca.Text)+', SA_ARROBAFRIGOVACA = '+QuotedStr(edtPesoFrigoArrobaVaca.Text)+', SA_RENDIMVACA = '+QuotedStr(edtRendimentoVaca.Text)+', SA_PESOTOTALVACA = '+QuotedStr(edtValorFrigoVaca.Text)+', SA_FRETEVACA = '+QuotedStr(edtValorFreteVaca.Text)+', SA_DESPESAVACA = '+QuotedStr(edtDespesaVaca.Text)+', SA_PESOFRIGONOVILHA = '+QuotedStr(edtPesoFrigoNovilha.Text)+', SA_ARROBAFRIGONOVILHA = '+QuotedStr(edtPesoFrigoArrobaNovilha.Text)+', SA_RENDIMNOVILHA = '+QuotedStr(edtRendimentoNovilha.Text)+', SA_PESOTOTALNOVILHA = '+QuotedStr(edtValorFrigoNovilha.Text)+', SA_FRETENOVILHA = '+QuotedStr(edtValorFreteNovilha.Text)+', SA_DESPESANOVILHA = '+QuotedStr(edtDespesaNovilha.Text)+', SA_MEDIABOI = '+QuotedStr(edtMediaBoi.Text)+', SA_MEDIAVACA = '+QuotedStr(edtMediaVaca.Text)+', SA_MEDIANOVILHA = '+QuotedStr(edtMediaNovilha.Text)+' where sa_cod = '+QuotedStr(edtCodSaida.Text)+'');
             ExecSQL;
             vBoi := StrToFloat(edtQtdBoi.Text);
             vVaca := StrToFloat(edtQtdVaca.Text);
             vNovilha := StrToFloat(edtQtdNovilha.Text);
             vAnimais := vBoi+vVaca+vNovilha;
             Active := False;
             SQL.Clear;
             SQL.Add('Update saida_lotes set sl_data = '+QuotedStr(DateToStr(dtpDtSaida.date))+', sl_qtd = '+QuotedStr(FloatToStr(vAnimais))+' where sl_cod = '+QuotedStr(edtCodSaida.Text)+'');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
//             btnSelecionarClick(Sender);
             Converter;
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Omega - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode ser vazio! Selecione um C�digo para atualizar dados.','Omega - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmSaidaAnimais.btnDeletarClick(Sender: TObject);
var vAnimais : Integer;
begin
    If edtCodSaida.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Omega - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from saida_animais where sa_cod = '+ QuotedStr(edtCodSaida.Text)+'');
                ExecSQL;
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from saida_lotes where sl_cod = '+ QuotedStr(edtCodSaida.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Omega - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O c�digo n�o pode ser vazio! Selecione um c�digo para poder deletar.','Omega - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

//procedure TfrmSaidaAnimais.edtPesoBoiExit(Sender: TObject);
//var pPeso, vQtd, pArroba : Double;
//begin
//    If edtPesoBoi.Text <> '0' then begin
//       pPeso := StrToFloat(edtPesoBoi.Text);
//       edtPesoTotalBoi.Text := FloatToStr(pPeso/30);
//       edtPesoTotalBoi.Text := FormatFloat('0.##',(StrToFloat(edtPesoTotalBoi.Text)));
//       pArroba := StrToFloat(edtPesoTotalBoi.Text);
//       vQtd := StrToFloat(edtQtdBoi.Text);
//       edtMediaBoi.Text := FloatToStr(pArroba/vQtd);
//       edtMediaBoi.Text := FormatFloat('0.##',(StrToFloat(edtMediaBoi.Text)));
//       edtValorBoi.SetFocus;
//    end;
//end;

//procedure TfrmSaidaAnimais.edtValorBoiExit(Sender: TObject);
//var vValor, pPeso : Double;
//begin
//    vValor := StrToFloat(edtValorBoi.Text);
//    pPeso := StrToFloat(edtPesoTotalBoi.Text);
//    edtValorTotalBoi.Text := FloatToStr(vValor*pPeso);
//    edtValorTotalBoi.Text := FormatCurr('0.00', StrToCurr(edtValorTotalBoi.Text));
//    edtValorBoi.Text := FormatCurr('0.00', StrToCurr(edtValorBoi.Text));
//end;

procedure TfrmSaidaAnimais.edtPesoFrigoBoiExit(Sender: TObject);
begin
    edtValorFreteBoi.SetFocus;
end;

//procedure TfrmSaidaAnimais.edtPesoVacaExit(Sender: TObject);
//var pPeso, vQtd, pArroba  : Double;
//begin
//    If edtPesoVaca.Text <> '0' then begin
//       pPeso := StrToFloat(edtPesoVaca.Text);
//       edtPesoTotalVaca.Text := FloatToStr(pPeso/30);
//       edtPesoTotalVaca.Text := FormatFloat('0.##',(StrToFloat(edtPesoTotalVaca.Text)));
//       pArroba := StrToFloat(edtPesoTotalVaca.Text);
//       vQtd := StrToFloat(edtQtdVaca.Text);
//       edtMediaVaca.Text := FloatToStr(pArroba/vQtd);
//       edtMediaVaca.Text := FormatFloat('0.##',(StrToFloat(edtMediaVaca.Text)));
//       edtValorVaca.SetFocus;
//    end;
//end;

//procedure TfrmSaidaAnimais.edtValorVacaExit(Sender: TObject);
//var vValor, pPeso : Double;
//begin
//    vValor := StrToFloat(edtValorVaca.Text);
//    pPeso := StrToFloat(edtPesoTotalVaca.Text);
//    edtValorTotalVaca.Text := FloatToStr(vValor*pPeso);
//    edtValorTotalVaca.Text := FormatCurr('0.00', StrToCurr(edtValorTotalVaca.Text));
//    edtValorVaca.Text := FormatCurr('0.00', StrToCurr(edtValorVaca.Text));
//end;

procedure TfrmSaidaAnimais.edtPesoFrigoVacaExit(Sender: TObject);
begin
    edtValorFreteVaca.SetFocus;
end;

//procedure TfrmSaidaAnimais.edtPesoNovilhaExit(Sender: TObject);
//var pPeso, vQtd, pArroba : Double;
//begin
//    If edtPesoNovilha.Text <> '0' then begin
//       pPeso := StrToFloat(edtPesoNovilha.Text);
//       edtPesoTotalNovilha.Text := FloatToStr(pPeso/30);
//       edtPesoTotalNovilha.Text := FormatFloat('0.##',(StrToFloat(edtPesoTotalNovilha.Text)));
//       pArroba := StrToFloat(edtPesoTotalNovilha.Text);
//       vQtd := StrToFloat(edtQtdNovilha.Text);
//       edtMediaNovilha.Text := FloatToStr(pArroba/vQtd);
//       edtMediaNovilha.Text := FormatFloat('0.##',(StrToFloat(edtMediaNovilha.Text)));
//       edtValorNovilha.SetFocus;
//    end;
//end;

//procedure TfrmSaidaAnimais.edtValorNovilhaExit(Sender: TObject);
//var vValor, pPeso : Double;
//begin
//    vValor := StrToFloat(edtValorNovilha.Text);
//    pPeso := StrToFloat(edtPesoTotalNovilha.Text);
//    edtValorTotalNovilha.Text := FloatToStr(vValor*pPeso);
//    edtValorTotalNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorTotalNovilha.Text));
//    edtValorNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorNovilha.Text));
//end;

procedure TfrmSaidaAnimais.edtPesoFrigoNovilhaExit(Sender: TObject);
begin
    edtValorFreteNovilha.SetFocus;
end;

procedure TfrmSaidaAnimais.btnConsultarClick(Sender: TObject);
var vBoi, vVaca, vNovilha, vAnimais : Double;
begin
    Try
      Application.CreateForm(TfrmConsultaSaidaAnimais, frmConsultaSaidaAnimais);
      frmConsultaSaidaAnimais.ShowModal;
    Finally
         frmConsultaSaidaAnimais.Free;
    end;
    vBoi := StrToFloat(edtQtdBoi.Text);
    vVaca := StrToFloat(edtQtdVaca.Text);
    vNovilha := StrToFloat(edtQtdNovilha.Text);
    vAnimais := vBoi+vVaca+vNovilha;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select lt_lote from lotes, saida_lotes where sl_data = '+QuotedStr(DateToStr(dtpDtSaida.Date))+' and sl_qtd = '+FloatToStr(vAnimais)+' and lotes.lt_cod = saida_lotes.lt_cod');
       Active := True;
       cbxLote.Text := FieldByName('lt_lote').AsString;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmSaidaAnimais.ValorGeral;
var vBoi, vVaca, vNovilha : Double;
begin
    vBoi := StrToFloat(edtValorFrigoBoi.Text);
    vVaca := StrToFloat(edtValorFrigoVaca.Text);
    vNovilha := StrToFloat(edtValorFrigoNovilha.Text);
    edtValorGeral.Text := FloatToStr(vBoi+vVaca+vNovilha);
    edtValorGeral.Text := FormatCurr('0.00', StrToCurr(edtValorGeral.Text));
end;

procedure TfrmSaidaAnimais.edtDespesaBoiExit(Sender: TObject);
begin
    edtDespesaBoi.Text := FormatCurr('0.00', StrToCurr(edtDespesaBoi.Text));
    Despesa;
    btnCalcularBoi.SetFocus;
end;

procedure TfrmSaidaAnimais.edtDespesaVacaExit(Sender: TObject);
begin
    edtDespesaVaca.Text := FormatCurr('0.00', StrToCurr(edtDespesaVaca.Text));
    Despesa;
    btnCalculaVaca.SetFocus;
end;

procedure TfrmSaidaAnimais.edtDespesaNovilhaExit(Sender: TObject);
begin
    edtDespesaNovilha.Text := FormatCurr('0.00', StrToCurr(edtDespesaNovilha.Text));
    Despesa;
    btnCalculaNovilha.SetFocus;
end;

procedure TfrmSaidaAnimais.edtValorFreteBoiExit(Sender: TObject);
begin
    edtValorFreteBoi.Text := FormatCurr('0.00', StrToCurr(edtValorFreteBoi.Text));
    Frete;
end;

procedure TfrmSaidaAnimais.edtValorFreteVacaExit(Sender: TObject);
begin
    edtValorFreteVaca.Text := FormatCurr('0.00', StrToCurr(edtValorFreteVaca.Text));
    Frete;
end;

procedure TfrmSaidaAnimais.edtValorFreteNovilhaExit(Sender: TObject);
begin
    edtValorFreteNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorFreteNovilha.Text));
    Frete;
end;

procedure TfrmSaidaAnimais.btnImprimirClick(Sender: TObject);
begin
    Busca;
    Try
      Application.CreateForm(TqrpImprimeSaidaAnimais, qrpImprimeSaidaAnimais);
      If Controle = 'P' then begin
         qrpImprimeSaidaAnimais.QRLabel43.Caption := 'Pasto';
      end;
      If Controle = 'C' then begin
         qrpImprimeSaidaAnimais.QRLabel43.Caption := 'Confinamento';
      end;
      qrpImprimeSaidaAnimais.Preview;
    Finally
         qrpImprimeSaidaAnimais.Free;
    end;
end;

procedure TfrmSaidaAnimais.Busca;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from saida_animais where sa_cod = '+QuotedStr(edtCodSaida.Text)+'');
       Active := True;
       edtCodSaida.Text := FieldByName('SA_COD').AsString;
       dtpDtSaida.Date := FieldByName('SA_DATA').AsDateTime;
       edtQtdBoi.Text := FieldByName('SA_QTDBOI').AsString;
       edtPesoBoi.Text := FieldByName('SA_PESOBOI').AsString;
       edtValorBoi.Text := FieldByName('SA_VALORARROBABOI').AsString;
       edtValorBoi.Text := FormatCurr(',0.00', StrToCurr(edtValorBoi.Text));
       edtQtdVaca.Text := FieldByName('SA_QTDVACA').AsString;
       edtPesoVaca.Text := FieldByName('SA_PESOVACA').AsString;
       edtValorVaca.Text := FieldByName('SA_VALORARROBAVACA').AsString;
       edtValorVaca.Text := FormatCurr('0.00', StrToCurr(edtValorVaca.Text));
       edtQtdNovilha.Text := FieldByName('SA_QTDNOVILHA').AsString;
       edtPesoNovilha.Text := FieldByName('SA_PESONOVILHA').AsString;
       edtValorNovilha.Text := FieldByName('SA_VALORARROBANOVILHA').AsString;
       edtValorNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorNovilha.Text));
       edtValorGeral.Text := FieldByName('SA_TOTALGERALARROBA').AsString;
       edtValorGeral.Text := FormatCurr('0.00', StrToCurr(edtValorGeral.Text));
       edtPesoFrigoBoi.Text := FieldByName('SA_PESOFRIGOBOI').AsString;
       edtPesoFrigoArrobaBoi.Text := FieldByName('SA_ARROBAFRIGOBOI').AsString;
       edtRendimentoBoi.Text := FieldByName('SA_RENDIMBOI').AsString;
       edtValorFrigoBoi.Text := FieldByName('SA_PESOTOTALBOI').AsString;
       edtValorFrigoBoi.Text := FormatCurr('0.00', StrToCurr(edtValorFrigoBoi.Text));
       edtValorFreteBoi.Text := FieldByName('SA_FRETEBOI').AsString;
       edtValorFreteBoi.Text := FormatCurr(',0.00', StrToCurr(edtValorFreteBoi.Text));
       edtDespesaBoi.Text := FieldByName('SA_DESPESABOI').AsString;
       edtDespesaBoi.Text := FormatCurr('0.00', StrToCurr(edtDespesaBoi.Text));
       edtPesoFrigoVaca.Text := FieldByName('SA_PESOFRIGOVACA').AsString;
       edtPesoFrigoArrobaVaca.Text := FieldByName('SA_ARROBAFRIGOVACA').AsString;
       edtRendimentoVaca.Text := FieldByName('SA_RENDIMVACA').AsString;
       edtValorFrigoVaca.Text := FieldByName('SA_PESOTOTALVACA').AsString;
       edtValorFrigoVaca.Text := FormatCurr('0.00', StrToCurr(edtValorFrigoVaca.Text));
       edtValorFreteVaca.Text := FieldByName('SA_FRETEVACA').AsString;
       edtValorFreteVaca.Text := FormatCurr('0.00', StrToCurr(edtValorFreteVaca.Text));
       edtDespesaVaca.Text := FieldByName('SA_DESPESAVACA').AsString;
       edtDespesaVaca.Text := FormatCurr('0.00', StrToCurr(edtDespesaVaca.Text));
       edtPesoFrigoNovilha.Text := FieldByName('SA_PESOFRIGONOVILHA').AsString;
       edtPesoFrigoArrobaNovilha.Text := FieldByName('SA_ARROBAFRIGONOVILHA').AsString;
       edtRendimentoNovilha.Text := FieldByName('SA_RENDIMNOVILHA').AsString;
       edtValorFrigoNovilha.Text := FieldByName('SA_PESOTOTALNOVILHA').AsString;
       edtValorFrigoNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorFrigoNovilha.Text));
       edtValorFreteNovilha.Text := FieldByName('SA_FRETENOVILHA').AsString;
       edtValorFreteNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorFreteNovilha.Text));
       edtDespesaNovilha.Text := FieldByName('SA_DESPESANOVILHA').AsString;
       edtDespesaNovilha.Text := FormatCurr('0.00', StrToCurr(edtDespesaNovilha.Text));
       edtMediaBoi.Text := FieldByName('SA_MEDIABOI').AsString;
       edtMediaVaca.Text := FieldByName('SA_MEDIAVACA').AsString;
       edtMediaNovilha.Text := FieldByName('SA_MEDIANOVILHA').AsString;
       GroupBox1.SetFocus;
    end;
end;

procedure TfrmSaidaAnimais.Data;
var vLote : Integer;
    vAno, vControle : String;
begin
    vControle := Controle;
    vAno := AnoConfinamento;
    With dmCarroComando.ADOQuery1 do begin
//       Active := False;
//       SQL.Clear;
//       SQL.Add('select L.lt_qtd, sum(S.sl_qtd), L.lt_qtd-sum(S.sl_qtd) from lotes L, saida_lotes S where L.lt_lote = '+QuotedStr(cbxLote.Text)+' and L.lt_controle = '+QuotedStr(vControle)+' and L.lt_ano = '+QuotedStr(vAno)+' and L.lt_cod = S.lt_cod group by L.lt_lote');
//       Active := True;
//       vLote := FieldByName('L.lt_qtd-sum(S.sl_qtd)').AsInteger;
//       If vLote = 0 then begin
//          Application.MessageBox('Esse lote n�o possui sa�das.','Omega - Aviso',MB_OK+MB_ICONINFORMATION);
//       end
//       else begin
          Active := False;
          SQL.Clear;
          SQL.Add('select lt_data from lotes where lt_lote = '+QuotedStr(cbxLote.Text)+' and lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+'');
          Active := True;
          DateTimePicker1.Date := FieldByName('lt_data').AsDateTime;
       end;
//    end;
end;

procedure TfrmSaidaAnimais.Arroba;
var nCabeca, nBoi, nVaca, nNovilha, nMedia, nArroba, aBoi, aVaca, aNovilha : Double;
    vAno, vControle : String;
begin
    vControle := Controle;
    vAno := AnoConfinamento;
    nBoi := StrToFloat(edtQtdBoi.Text);
    nVaca := StrToFloat(edtQtdVaca.Text);
    nNovilha := StrToFloat(edtQtdNovilha.Text);
    nCabeca := nBoi+nVaca+nNovilha;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha)/sum(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha)*'+FloatToStr(nCabeca)+' ''media'' from entrada_animais where ea_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(dtpDtSaida.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       nMedia := FieldByName('media').AsFloat;
       aBoi := StrToFloat(edtPesoFrigoArrobaBoi.Text);
       aVaca := StrToFloat(edtPesoFrigoArrobaVaca.Text);
       aNovilha := StrToFloat(edtPesoFrigoArrobaNovilha.Text);
       nArroba := aBoi+aVaca+aNovilha;
       edtArroba.Text := FloatToStr(nArroba-nMedia);
    end;
end;

procedure TfrmSaidaAnimais.Gastos;
var vSaida, vAnimais, vDias, vBoi, vVaca, vNovilha, vCabeca, vAnimaisTotais, vAnimaisSaida : Integer;
    vAlimento, vAlimentoTotal, vValorAlimento, vVlAlimentoTotal,
    vDespesa, vDespesaTotal, vConsmoBoi, vLote, vLote2, vVlConsumoBoi, vComida : Double;
    vAno, vControle, Result : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vAno := AnoConfinamento;
    vControle := Controle;
    vAlimentoTotal := 0;
    vVlAlimentoTotal := 0;
    vDespesaTotal := 0;
    vBoi := StrToInt(edtQtdBoi.Text);
    vVaca := StrToInt(edtQtdVaca.Text);
    vNovilha := StrToInt(edtQtdNovilha.Text);
    vCabeca := vBoi+vVaca+vNovilha;
    vDias := DaysBetween(DateTimePicker1.Date,dtpDtSaida.Date)+1;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select lt_qtd from lotes where lt_lote = '+QuotedStr(cbxLote.Text)+' and lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+'');
       Active := True;
       vAnimais := FieldByName('lt_qtd').AsInteger;
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(SL.sl_qtd), L.lt_lote from saida_lotes SL, lotes L where SL.lt_cod = '+QuotedStr(edtCodLote.Text)+' and L.lt_ano = '+QuotedStr(vAno)+' and L.lt_controle = '+QuotedStr(vControle)+' and L.lt_cod = SL.lt_cod and SL.sl_data = '+QuotedStr(DateToStr(dtpDtSaida.Date))+' group by L.lt_lote');
       Active := True;
       vAnimaisSaida := FieldByName('sum(SL.sl_qtd)').AsInteger;
       vAnimaisTotais := vAnimaisSaida;
    end;
    While DateTimePicker1.Date < dtpDtSaida.Date do begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(dt_qtdtotal) ''consumo'', sum(dt_vltotal) ''valor'' from dieta where dt_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+' group by dt_data');
          Active := True;
          vAlimento := FieldByName('consumo').AsFloat;
          vValorAlimento := FieldByName('valor').AsFloat;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(d_valor) ''despesa'' from despesas where d_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and d_ano = '+QuotedStr(vAno)+' and d_controle = '+QuotedStr(vControle)+'');
          Active := True;
          Result := FieldByName('despesa').AsString;
          If Result <> '' then begin
             vDespesa := FieldByName('despesa').AsFloat;
          end
          else begin
             vDespesa := 0;
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(SL.sl_qtd), L.lt_lote from saida_lotes SL, lotes L where L.lt_lote = '+QuotedStr(cbxLote.Text)+' and L.lt_ano = '+QuotedStr(vAno)+' and L.lt_controle = '+QuotedStr(vControle)+' and L.lt_cod = SL.lt_cod and SL.sl_data <= '+QuotedStr(DateToStr(DateTimePicker1.Date))+' group by L.lt_lote');
          Active := True;
          Result := FieldByName('sum(SL.sl_qtd)').AsString;
          If Result <> '' then begin
             vSaida := FieldByName('sum(SL.sl_qtd)').AsInteger;
          end
          else begin
             vSaida := 0;
          end;
          vLote := (vAlimento/(vAnimais-vSaida))*vAnimaisTotais;
          vAlimentoTotal := vAlimentoTotal+vLote;
          vLote2 := (vValorAlimento/(vAnimais-vSaida))*vAnimaisTotais;
          vVlAlimentoTotal := vVlAlimentoTotal+vLote2;
          vConsmoBoi := vConsmoBoi+(vLote/vAnimaisTotais);
          vVlConsumoBoi := vVlConsumoBoi+(vLote2/vAnimaisTotais);
          vDespesaTotal := vDespesaTotal+vDespesa;
          DateTimePicker1.Date := DateTimePicker1.Date+1;
       end;
    end;
    edtDespesaArroba.Text := FloatToStr(vDespesaTotal);
    edtAlimento.Text := FloatToStr((vVlConsumoBoi/vDias)*vCabeca*vDias);
    ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TfrmSaidaAnimais.Custos;
var vAlimento, vDespesa,vArroba : Double;
begin
    vAlimento := StrToFloat(edtAlimento.Text);
    vArroba := StrToFloat(edtArroba.Text);
    vDespesa := StrToFloat(edtDespesaArroba.Text);
    edtCusto.Text := FloatToStr((vAlimento+vDespesa)/vArroba);
    edtCusto.Text := FormatCurr(',0.00', StrToCurr(edtCusto.Text));
    edtAlimento.Text := FormatCurr(',0.00', StrToCurr(edtAlimento.Text));
    edtArroba.Text := FormatCurr(',0.00', StrToCurr(edtArroba.Text));
    edtDespesaArroba.Text := FormatCurr(',0.00', StrToCurr(edtDespesaArroba.Text));
end;

procedure TfrmSaidaAnimais.btnCalcularClick(Sender: TObject);
begin
    btnCalcular.Cursor := crSQLWait;
    CodLote;
    Data;
    Arroba;
    Gastos;
    Custos;
    Data;
    btnCalcular.Cursor := crHandPoint;
end;

procedure TfrmSaidaAnimais.rgpControleClick(Sender: TObject);
var vAno, vControle : String;
begin
    cbxLote.Clear;
    vAno := AnoConfinamento;
    vControle := Controle;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from lotes where lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+' order by lt_cod');
       Active := True;
       while not Eof do begin
          cbxLote.Items.Add(FieldByName('lt_lote').AsString);
          Next;
       end;
    end;
    dtpDtSaida.SetFocus;
end;

procedure TfrmSaidaAnimais.PesoBoi;
var vFrigo, vArroba, vPeso, vArrobaFrigo, vQtd : Double;
begin
    If edtPesoFrigoBoi.Text <> '0' then begin
       vFrigo := StrToFloat(edtPesoFrigoBoi.Text);
       vArroba := StrToFloat(edtValorBoi.Text);
       vPeso := StrToFloat(edtPesoBoi.Text);
       vQtd := StrToFloat(edtQtdBoi.Text);
       edtPesoFrigoArrobaBoi.Text := FloatToStr(vFrigo/15);
       vArrobaFrigo := StrToFloat(edtPesoFrigoArrobaBoi.Text);
       edtValorFrigoBoi.Text := FloatToStr(vArrobaFrigo*vArroba);
       edtRendimentoBoi.Text := FloatToStr((vFrigo/vPeso)*100);
       edtMediaBoi.Text := FloatToStr(vArrobaFrigo/vQtd);
    end;
end;

procedure TfrmSaidaAnimais.btnCalcularBoiClick(Sender: TObject);
begin
    PesoBoi;
    edtPesoFrigoArrobaBoi.Text := FormatFloat('0.##',(StrToFloat(edtPesoFrigoArrobaBoi.Text)));
    edtRendimentoBoi.Text := FormatFloat('0.##',(StrToFloat(edtRendimentoBoi.Text)));
    edtMediaBoi.Text := FormatFloat('0.##',(StrToFloat(edtMediaBoi.Text)));
    edtValorBoi.Text := FormatCurr('0.00', StrToCurr(edtValorBoi.Text));
    edtValorFrigoBoi.Text := FormatCurr('0.00', StrToCurr(edtValorFrigoBoi.Text));
    ValorGeral;
    edtQtdVaca.SetFocus;
end;

procedure TfrmSaidaAnimais.PesoVaca;
var vFrigo, vArroba, vPeso, vArrobaFrigo, vQtd: Double;
begin
    If edtPesoFrigoVaca.Text <> '0' then begin
       vFrigo := StrToFloat(edtPesoFrigoVaca.Text);
       vArroba := StrToFloat(edtValorVaca.Text);
       vPeso := StrToFloat(edtPesoVaca.Text);
       vQtd := StrToFloat(edtQtdVaca.Text);
       edtPesoFrigoArrobaVaca.Text := FloatToStr(vFrigo/15);
       vArrobaFrigo := StrToFloat(edtPesoFrigoArrobaVaca.Text);
       edtValorFrigoVaca.Text := FloatToStr(vArrobaFrigo*vArroba);
       edtRendimentoVaca.Text := FloatToStr((vFrigo/vPeso)*100);
       edtMediaVaca.Text := FloatToStr(vArrobaFrigo/vQtd);
    end;
end;

procedure TfrmSaidaAnimais.btnCalculaVacaClick(Sender: TObject);
begin
    PesoVaca;
    edtPesoFrigoArrobaVaca.Text := FormatFloat('0.##',(StrToFloat(edtPesoFrigoArrobaVaca.Text)));
    edtValorFrigoVaca.Text := FormatCurr('0.00', StrToCurr(edtValorFrigoVaca.Text));
    edtRendimentoVaca.Text := FormatFloat('0.##',(StrToFloat(edtRendimentoVaca.Text)));
    edtMediaVaca.Text := FormatFloat('0.##',(StrToFloat(edtMediaVaca.Text)));
    edtValorVaca.Text := FormatCurr('0.00', StrToCurr(edtValorVaca.Text));
    ValorGeral;
    edtQtdNovilha.SetFocus;
end;

procedure TfrmSaidaAnimais.PesoNovilha;
var vFrigo, vArroba, vPeso, vArrobaFrigo, vQtd : Double;
begin
    If edtPesoFrigoNovilha.Text <> '0' then begin
       vFrigo := StrToFloat(edtPesoFrigoNovilha.Text);
       vArroba := StrToFloat(edtValorNovilha.Text);
       vPeso := StrToFloat(edtPesoNovilha.Text);
       vQtd := StrToFloat(edtQtdNovilha.Text);
       edtPesoFrigoArrobaNovilha.Text := FloatToStr(vFrigo/15);
       vArrobaFrigo := StrToFloat(edtPesoFrigoArrobaNovilha.Text);
       edtValorFrigoNovilha.Text := FloatToStr(vArrobaFrigo*vArroba);
       edtRendimentoNovilha.Text := FloatToStr((vFrigo/vPeso)*100);
       edtMediaNovilha.Text := FloatToStr(vArrobaFrigo/vQtd);
    end;
end;

procedure TfrmSaidaAnimais.btnCalculaNovilhaClick(Sender: TObject);
begin
    PesoNovilha;
    edtPesoFrigoArrobaNovilha.Text := FormatFloat('0.##',(StrToFloat(edtPesoFrigoArrobaNovilha.Text)));
    edtValorFrigoNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorFrigoNovilha.Text));
    edtRendimentoNovilha.Text := FormatFloat('0.##',(StrToFloat(edtRendimentoNovilha.Text)));
    edtMediaNovilha.Text := FormatFloat('0.##',(StrToFloat(edtMediaNovilha.Text)));
    edtValorNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorNovilha.Text));
    ValorGeral;
end;

procedure TfrmSaidaAnimais.BitBtn1Click(Sender: TObject);
begin
    Busca;
end;

procedure TfrmSaidaAnimais.CodLote;
var vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select lt_cod from lotes where lt_lote = '+QuotedStr(cbxLote.Text)+' and lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+'');
       Active := True;
       edtCodLote.Text := FieldByName('lt_cod').AsString;
    end;
end;

end.
