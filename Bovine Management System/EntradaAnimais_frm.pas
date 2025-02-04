unit EntradaAnimais_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Grids, DBGrids, DateUtils;

type
  TfrmEntradaAnimais = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtQtdBoi: TLabeledEdit;
    edtPesoBoi: TLabeledEdit;
    edtPesoTotalBoi: TLabeledEdit;
    edtMediaBoi: TLabeledEdit;
    edtValorBoi: TLabeledEdit;
    edtValorTotalBoi: TLabeledEdit;
    GroupBox3: TGroupBox;
    edtQtdVaca: TLabeledEdit;
    edtPesoVaca: TLabeledEdit;
    edtPesoTotalVaca: TLabeledEdit;
    edtMediaVaca: TLabeledEdit;
    edtValorVaca: TLabeledEdit;
    edtValorTotalVaca: TLabeledEdit;
    GroupBox4: TGroupBox;
    edtQtdNovilha: TLabeledEdit;
    edtPesoNovilha: TLabeledEdit;
    edtPesoTotalNovilha: TLabeledEdit;
    edtMediaNovilha: TLabeledEdit;
    edtValorNovilha: TLabeledEdit;
    edtValorTotalNovilha: TLabeledEdit;
    edtValorGeralBoi: TLabeledEdit;
    edtValorGeralVaca: TLabeledEdit;
    edtValorGeralNovilha: TLabeledEdit;
    Label1: TLabel;
    edtCodEntrada: TLabeledEdit;
    dtpDtEntrada: TDateTimePicker;
    edtValorGeral: TLabeledEdit;
    edtValorFreteBoi: TLabeledEdit;
    edtValorFreteVaca: TLabeledEdit;
    edtValorFreteNovilha: TLabeledEdit;
    edtDespesaBoi: TLabeledEdit;
    edtDespesaVaca: TLabeledEdit;
    edtDespesaNovilha: TLabeledEdit;
    edtVlTotalBoi: TLabeledEdit;
    edtVlTotalVaca: TLabeledEdit;
    edtVlTotalNovilha: TLabeledEdit;
    edtVendedor: TLabeledEdit;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    edtLote: TLabeledEdit;
    rgpControle: TRadioGroup;
    btnCalcularBoi: TBitBtn;
    btnCalculaVaca: TBitBtn;
    btnCalculaNovilha: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtPesoBoiExit(Sender: TObject);
    procedure edtValorBoiExit(Sender: TObject);
    procedure edtPesoVacaExit(Sender: TObject);
    procedure edtValorVacaExit(Sender: TObject);
    procedure edtPesoNovilhaExit(Sender: TObject);
    procedure edtValorNovilhaExit(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure ValorGeral;
    procedure edtDespesaVacaExit(Sender: TObject);
    procedure edtDespesaNovilhaExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Busca;
    procedure edtLoteExit(Sender: TObject);
    procedure rgpControleClick(Sender: TObject);
    procedure PesoBoi;
    procedure ValorBoi;
    procedure TotalBoi;
    procedure btnCalcularBoiClick(Sender: TObject);
    procedure edtDespesaBoiExit(Sender: TObject);
    procedure PesoVaca;
    procedure ValorVaca;
    procedure TotalVaca;
    procedure btnCalculaVacaClick(Sender: TObject);
    procedure PesoNovilha;
    procedure ValorNovilha;
    procedure TotalNovilha;
    procedure btnCalculaNovilhaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaAnimais: TfrmEntradaAnimais;

implementation

uses Carro_Comando_dm, Principal_frm, DB, ADODB,
  ConsultaEntradaAnimais_frm, ImprimeEntradaAnimal_frm, StdConvs;

{$R *.dfm}

function fBuscaCodEntrada : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ea_cod from entrada_animais order by ea_cod desc');
       Active := True;
       fBuscaCodEntrada := FieldByName('ea_cod').AsInteger;
    end;
end;

function fBuscaCodLote : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select lt_cod from lotes order by lt_cod desc');
       Active := True;
       fBuscaCodLote := FieldByName('lt_cod').AsInteger;
    end;
end;

function fConvertQtdBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtQtdBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtQtdBoi.Text := valor;
end;

function fConvertPesoBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtPesoBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtPesoBoi.Text := valor;
end;

function fConvertBoiPesoTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtPesoTotalBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtPesoTotalBoi.Text := valor;
end;

function fConvertMediaBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtMediaBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtMediaBoi.Text := valor;
end;

function fConvertBoiValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorBoi.Text := valor;
end;

function fConvertValorTotalBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorTotalBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorTotalBoi.Text := valor;
end;

function fConvertQtdVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtQtdVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtQtdVaca.Text := valor;
end;

function fConvertPesoVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtPesoVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtPesoVaca.Text := valor;
end;

function fConvertVacaPesoTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtPesoTotalVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtPesoTotalVaca.Text := valor;
end;

function fConvertMediaVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtMediaVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtMediaVaca.Text := valor;
end;

function fConvertVacaValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorVaca.Text := valor;
end;

function fConvertValorTotalVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorTotalVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorTotalVaca.Text := valor;
end;

function fConvertQtdNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtQtdNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtQtdNovilha.Text := valor;
end;

function fConvertPesoNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtPesoNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtPesoNovilha.Text := valor;
end;

function fConvertNivilhaPesoTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtPesoTotalNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtPesoTotalNovilha.Text := valor;
end;

function fConvertMediaNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtMediaNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtMediaNovilha.Text := valor;
end;

function fConvertNivilhaValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorNovilha.Text := valor;
end;

function fConvertValorTotalNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorTotalNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorTotalNovilha.Text := valor;
end;

function fConvertValorFreteBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorFreteBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorFreteBoi.Text := valor;
end;

function fConvertValorFreteVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorFreteVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorFreteVaca.Text := valor;
end;

function fConvertValorFreteNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorFreteNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorFreteNovilha.Text := valor;
end;

function fConvertValorDespesaBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtDespesaBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtDespesaBoi.Text := valor;
end;

function fConvertValorDespesaVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtDespesaVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtDespesaVaca.Text := valor;
end;

function fConvertValorDespesaNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtDespesaNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtDespesaNovilha.Text := valor;
end;

function fConvertVlTotalBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtVlTotalBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtVlTotalBoi.Text := valor;
end;

function fConvertVlTotalVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtVlTotalVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtVlTotalVaca.Text := valor;
end;

function fConvertVlTotalNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtVlTotalNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtVlTotalNovilha.Text := valor;
end;

function fConvertVlGeralBoi() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorGeralBoi.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorGeralBoi.Text := valor;
end;

function fConvertVlGeralVaca() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorGeralVaca.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorGeralVaca.Text := valor;
end;

function fConvertVlGeralNovilha() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorGeralNovilha.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorGeralNovilha.Text := valor;
end;

function fConvertValorTotalGeral() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntradaAnimais.edtValorGeral.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntradaAnimais.edtValorGeral.Text := valor;
end;

function Converter() : String;
begin
    fConvertQtdBoi;
    fConvertPesoBoi;
    fConvertBoiPesoTotal;
    fConvertMediaBoi;
    fConvertBoiValor;
    fConvertValorTotalBoi;
    fConvertQtdVaca;
    fConvertPesoVaca;
    fConvertVacaPesoTotal;
    fConvertMediaVaca;
    fConvertVacaValor;
    fConvertValorTotalVaca;
    fConvertQtdNovilha;
    fConvertPesoNovilha;
    fConvertNivilhaPesoTotal;
    fConvertMediaNovilha;
    fConvertNivilhaValor;
    fConvertValorTotalNovilha;
    fConvertValorFreteBoi;
    fConvertValorFreteVaca;
    fConvertValorFreteNovilha;
    fConvertValorDespesaBoi;
    fConvertValorDespesaVaca;
    fConvertValorDespesaNovilha;
    fConvertVlTotalBoi;
    fConvertVlTotalVaca;
    fConvertVlTotalNovilha;
    fConvertVlGeralBoi;
    fConvertVlGeralVaca;
    fConvertVlGeralNovilha;
    fConvertValorTotalGeral;
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
    If frmEntradaAnimais.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C'
end;

procedure TfrmEntradaAnimais.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEntradaAnimais.btnLimparClick(Sender: TObject);
begin
    edtCodEntrada.Clear; edtVendedor.Clear; edtLote.Clear;
    rgpControle.ItemIndex := -1;
    FormShow(Sender);
end;

procedure TfrmEntradaAnimais.FormShow(Sender: TObject);
begin
    dtpDtEntrada.Date := Date;
    edtValorGeral.Text := '0,00';
    edtQtdBoi.Text := '0'; edtPesoBoi.Text := '0'; edtPesoTotalBoi.Text := '0'; edtMediaBoi.Text := '0'; edtValorBoi.Text := '0,00'; edtValorTotalBoi.Text := '0,00'; edtValorFreteBoi.Text := '0,00'; edtDespesaBoi.Text := '0,00'; edtVlTotalBoi.Text := '0,00'; edtValorGeralBoi.Text := '0,00';
    edtQtdVaca.Text := '0'; edtPesoVaca.Text := '0'; edtPesoTotalVaca.Text := '0'; edtMediaVaca.Text := '0'; edtValorVaca.Text := '0,00'; edtValorTotalVaca.Text := '0,00'; edtValorFreteVaca.Text := '0,00'; edtDespesaVaca.Text := '0,00'; edtVlTotalVaca.Text := '0,00'; edtValorGeralVaca.Text := '0,00';
    edtQtdNovilha.Text := '0'; edtPesoNovilha.Text := '0'; edtPesoTotalNovilha.Text := '0'; edtMediaNovilha.Text := '0'; edtValorNovilha.Text := '0,00'; edtValorTotalNovilha.Text := '0,00'; edtValorFreteNovilha.Text := '0,00'; edtDespesaNovilha.Text := '0,00'; edtVlTotalNovilha.Text := '0,00'; edtValorGeralNovilha.Text := '0,00';
    dtpDtEntrada.SetFocus;
end;

procedure TfrmEntradaAnimais.btnInserirClick(Sender: TObject);
var nNovo, nLote : Integer;
    vAnimais, vBoi, vVaca, vNovilha : Double;
    vAno, vControle : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    nNovo := fBuscaCodEntrada + 1;
    nLote := fBuscaCodLote + 1;
    edtCodEntrada.Text := IntToStr(nNovo);
    vAno := AnoConfinamento;
    vControle := Controle;
    If edtValorGeral.Text <> '0.00' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             vBoi := StrToFloat(edtQtdBoi.Text);
             vVaca := StrToFloat(edtQtdVaca.Text);
             vNovilha := StrToFloat(edtQtdNovilha.Text);
             vAnimais := vBoi+vVaca+vNovilha;
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into lotes (LT_COD, LT_DATA, LT_QTD, LT_LOTE, LT_ANO, LT_CONTROLE) values ('+IntToStr(nLote)+', '+QuotedStr(DateToStr(dtpDtEntrada.Date))+', '+FloatToStr(vAnimais)+', '+QuotedStr(edtLote.Text)+', '+QuotedStr(vAno)+', '+QuotedStr(vControle)+')');
             ExecSQL;
             Converter;
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into entrada_animais (EA_COD, EA_DATA, EA_QTDBOI, EA_PESOBOI, EA_PESOARROBABOI, EA_MEDIAARROBABOI, EA_VALORARROBABOI, EA_VLTOTALARROBABOI, EA_VLFRETEBOI, EA_VLDESPESABOI, EA_VLTOTALBOI, EA_VLGERALBOI, '+
             'EA_QTDVACA, EA_PESOVACA, EA_PESOARROBAVACA, EA_MEDIAARROBAVACA, EA_VALORARROBAVACA, EA_VLTOTALARROBAVACA, EA_VLFRETEVACA, EA_VLDESPESAVACA, EA_VLTOTALVACA, EA_VLGERALVACA, '+
             'EA_QTDNOVILHA, EA_PESONOVILHA, EA_PESOARROBANOVILHA, EA_MEDIAARROBANOVILHA, EA_VALORARROBANOVILHA, EA_VLTOTALARROBANOVILHA, EA_VLFRETENOVILHA, EA_VLDESPESANOVILHA, EA_VLTOTALNOVILHA, EA_VLGERALNOVILHA, EA_VALORGERAL, EA_VENDEDOR, EA_CONTROLE, EA_ANO) '+
             'values ('+QuotedStr(edtCodEntrada.Text)+', '+QuotedStr(DateToStr(dtpDtEntrada.Date))+', '+QuotedStr(edtQtdBoi.Text)+', '+QuotedStr(edtPesoBoi.Text)+', '+QuotedStr(edtPesoTotalBoi.Text)+', '+QuotedStr(edtMediaBoi.Text)+', '+QuotedStr(edtValorBoi.Text)+', '+QuotedStr(edtValorTotalBoi.Text)+', '+QuotedStr(edtValorFreteBoi.Text)+', '+QuotedStr(edtDespesaBoi.Text)+', '+QuotedStr(edtVlTotalBoi.Text)+', '+QuotedStr(edtValorGeralBoi.Text)+', '+
             ''+QuotedStr(edtQtdVaca.Text)+', '+QuotedStr(edtPesoVaca.Text)+', '+QuotedStr(edtPesoTotalVaca.Text)+', '+QuotedStr(edtMediaVaca.Text)+', '+QuotedStr(edtValorVaca.Text)+', '+QuotedStr(edtValorTotalVaca.Text)+', '+QuotedStr(edtValorFreteVaca.Text)+', '+QuotedStr(edtDespesaVaca.Text)+', '+QuotedStr(edtVlTotalVaca.Text)+', '+QuotedStr(edtValorGeralVaca.Text)+', '+
             ''+QuotedStr(edtQtdNovilha.Text)+', '+QuotedStr(edtPesoNovilha.Text)+', '+QuotedStr(edtPesoTotalNovilha.Text)+', '+QuotedStr(edtMediaNovilha.Text)+', '+QuotedStr(edtValorNovilha.Text)+', '+QuotedStr(edtValorTotalNovilha.Text)+', '+QuotedStr(edtValorFreteNovilha.Text)+', '+QuotedStr(edtDespesaNovilha.Text)+', '+QuotedStr(edtVlTotalNovilha.Text)+', '+QuotedStr(edtValorGeralNovilha.Text)+', '+QuotedStr(edtValorGeral.Text)+', '+QuotedStr(edtVendedor.Text)+', '+QuotedStr(vControle)+', '+QuotedStr(vAno)+')');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
             Busca;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
      end;
    end
    else begin
       Application.MessageBox('O campo Valor Total Geral não pode estar vazio!','Omega - Atenção',MB_OK+MB_ICONWARNING);
       btnLimparClick(Sender);
    end;
end;

procedure TfrmEntradaAnimais.btnAtualizarClick(Sender: TObject);
var vAnimais, vBoi, vVaca, vNovilha : Double;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    Converter;
    If edtCodEntrada.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update entrada_animais set EA_COD = '+QuotedStr(edtCodEntrada.Text)+', EA_DATA = '+QuotedStr(DateToStr(dtpDtEntrada.Date))+', EA_QTDBOI = '+QuotedStr(edtQtdBoi.Text)+', EA_PESOBOI = '+QuotedStr(edtPesoBoi.Text)+', EA_PESOARROBABOI = '+QuotedStr(edtPesoTotalBoi.Text)+', EA_MEDIAARROBABOI = '+QuotedStr(edtMediaBoi.Text)+', EA_VALORARROBABOI = '+QuotedStr(edtValorBoi.Text)+', EA_VLTOTALARROBABOI = '+QuotedStr(edtValorTotalBoi.Text)+', EA_VLFRETEBOI = '+QuotedStr(edtValorFreteBoi.Text)+', EA_VLDESPESABOI = '+QuotedStr(edtDespesaBoi.Text)+', EA_VLTOTALBOI = '+QuotedStr(edtVlTotalBoi.Text)+', EA_VLGERALBOI ='+QuotedStr(edtValorGeralBoi.Text)+', '+
             'EA_QTDVACA = '+QuotedStr(edtQtdVaca.Text)+', EA_PESOVACA = '+QuotedStr(edtPesoVaca.Text)+', EA_PESOARROBAVACA = '+QuotedStr(edtPesoTotalVaca.Text)+', EA_MEDIAARROBAVACA = '+QuotedStr(edtMediaVaca.Text)+', EA_VALORARROBAVACA = '+QuotedStr(edtValorVaca.Text)+', EA_VLTOTALARROBAVACA = '+QuotedStr(edtValorTotalVaca.Text)+', EA_VLFRETEVACA = '+QuotedStr(edtValorFreteVaca.Text)+', EA_VLDESPESAVACA = '+QuotedStr(edtDespesaVaca.Text)+', EA_VLTOTALVACA ='+QuotedStr(edtVlTotalVaca.Text)+', EA_VLGERALVACA ='+QuotedStr(edtValorGeralVaca.Text)+','+
             'EA_QTDNOVILHA = '+QuotedStr(edtQtdNovilha.Text)+', EA_PESONOVILHA = '+QuotedStr(edtPesoNovilha.Text)+', EA_PESOARROBANOVILHA = '+QuotedStr(edtPesoTotalNovilha.Text)+', EA_MEDIAARROBANOVILHA = '+QuotedStr(edtMediaNovilha.Text)+', EA_VALORARROBANOVILHA = '+QuotedStr(edtValorNovilha.Text)+', EA_VLTOTALARROBANOVILHA = '+QuotedStr(edtValorTotalNovilha.Text)+', EA_VLFRETENOVILHA = '+QuotedStr(edtValorFreteNovilha.Text)+', EA_VLDESPESANOVILHA = '+QuotedStr(edtDespesaNovilha.Text)+', EA_VLTOTALNOVILHA ='+QuotedStr(edtVlTotalNovilha.Text)+', EA_VLGERALNOVILHA ='+QuotedStr(edtValorGeralNovilha.Text)+', EA_VALORGERAL = '+QuotedStr(edtValorGeral.Text)+', EA_VENDEDOR = '+QuotedStr(edtVendedor.Text)+' where ea_cod = '+QuotedStr(edtCodEntrada.Text)+'');
             ExecSQL;
             vBoi := StrToFloat(edtQtdBoi.Text);
             vVaca := StrToFloat(edtQtdVaca.Text);
             vNovilha := StrToFloat(edtQtdNovilha.Text);
             vAnimais := vBoi+vVaca+vNovilha;
             Active := False;
             SQL.Clear;
             SQL.Add('Update lotes set lt_data = '+QuotedStr(DateToStr(dtpDtEntrada.date))+', lt_qtd = '+QuotedStr(FloatToStr(vAnimais))+' where lt_cod = '+QuotedStr(edtCodEntrada.Text)+'');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
//             btnSelecionarClick(Sender);
             Converter;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode ser vazio! Selecione um Código para atualizar dados.','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmEntradaAnimais.btnDeletarClick(Sender: TObject);
var vAnimais : Integer;
begin
    If edtCodEntrada.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from entrada_animais where ea_cod = '+ QuotedStr(edtCodEntrada.Text)+'');
                ExecSQL;
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from lotes where lt_cod = '+ QuotedStr(edtCodEntrada.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O código não pode ser vazio! Selecione um código para poder deletar.','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmEntradaAnimais.edtPesoBoiExit(Sender: TObject);
begin
    edtValorBoi.SetFocus;
end;

procedure TfrmEntradaAnimais.edtValorBoiExit(Sender: TObject);
begin
    edtValorFreteBoi.SetFocus;
end;

procedure TfrmEntradaAnimais.edtPesoVacaExit(Sender: TObject);
begin
    edtValorVaca.SetFocus;
end;

procedure TfrmEntradaAnimais.edtValorVacaExit(Sender: TObject);
begin
    edtValorFreteVaca.SetFocus;
end;

procedure TfrmEntradaAnimais.edtDespesaVacaExit(Sender: TObject);
begin
    btnCalculaVaca.SetFocus;
end;

procedure TfrmEntradaAnimais.edtPesoNovilhaExit(Sender: TObject);
begin
    edtValorNovilha.SetFocus;
end;

procedure TfrmEntradaAnimais.edtValorNovilhaExit(Sender: TObject);
begin
    edtValorFreteNovilha.SetFocus;
end;

procedure TfrmEntradaAnimais.edtDespesaNovilhaExit(Sender: TObject);
begin
    btnCalculaNovilha.SetFocus;
end;

procedure TfrmEntradaAnimais.ValorGeral;
var vBoi, vVaca, vNovilha : Double;
begin
    vBoi := StrToFloat(edtVlTotalBoi.Text);
    vVaca := StrToFloat(edtVlTotalVaca.Text);
    vNovilha := StrToFloat(edtVlTotalNovilha.Text);
    edtValorGeral.Text := FloatToStr(vBoi+vVaca+vNovilha);
end;

procedure TfrmEntradaAnimais.btnConsultarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsultaEntradaAnimais, frmConsultaEntradaAnimais);
      frmConsultaEntradaAnimais.ShowModal;
    Finally
         frmConsultaEntradaAnimais.Free;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select lt_lote from lotes where lt_cod = '+QuotedStr(edtCodEntrada.Text)+'');
       Active := True;
       edtLote.Text := FieldByName('lt_lote').AsString;
    end;
end;

procedure TfrmEntradaAnimais.btnImprimirClick(Sender: TObject);
begin
    Busca;
    Try
      Application.CreateForm(TqrpImprimeEntradaAnimal, qrpImprimeEntradaAnimal);
      If Controle = 'P' then begin
         qrpImprimeEntradaAnimal.QRLabel41.Caption := 'Pasto';
      end;
      If Controle = 'C' then begin
         qrpImprimeEntradaAnimal.QRLabel41.Caption := 'Confinamento';
      end;
      qrpImprimeEntradaAnimal.Preview;
    Finally
         qrpImprimeEntradaAnimal.Free;
    end;
end;

procedure TfrmEntradaAnimais.Busca;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from entrada_animais where ea_cod = '+QuotedStr(edtCodEntrada.Text)+'');
       Active := True;
       edtCodEntrada.Text := FieldByName('EA_COD').AsString;
       dtpDtEntrada.Date := FieldByName('EA_DATA').AsDateTime;
       edtQtdBoi.Text := FieldByName('EA_QTDBOI').AsString;
       edtPesoBoi.Text := FieldByName('EA_PESOBOI').AsString;
       edtPesoTotalBoi.Text := FieldByName('EA_PESOARROBABOI').AsString;
       edtMediaBoi.Text := FieldByName('EA_MEDIAARROBABOI').AsString;
       edtValorBoi.Text := FieldByName('EA_VALORARROBABOI').AsString;
       edtValorBoi.Text := FormatCurr('0.00', StrToCurr(edtValorBoi.Text));
       edtValorTotalBoi.Text := FieldByName('EA_VLTOTALARROBABOI').AsString;
       edtValorTotalBoi.Text := FormatCurr('0.00', StrToCurr(edtValorTotalBoi.Text));
       edtValorFreteBoi.Text := FieldByName('EA_VLFRETEBOI').AsString;
       edtValorFreteBoi.Text := FormatCurr('0.00', StrToCurr(edtValorFreteBoi.Text));
       edtDespesaBoi.Text := FieldByName('EA_VLDESPESABOI').AsString;
       edtDespesaBoi.Text := FormatCurr('0.00', StrToCurr(edtDespesaBoi.Text));
       edtVlTotalBoi.Text := FieldByName('EA_VLTOTALBOI').AsString;
       edtVlTotalBoi.Text := FormatCurr('0.00', StrToCurr(edtVlTotalBoi.Text));
       edtValorGeralBoi.Text := FieldByName('EA_VLGERALBOI').AsString;
       edtValorGeralBoi.Text := FormatCurr('0.00', StrToCurr(edtValorGeralBoi.Text));
       edtQtdVaca.Text := FieldByName('EA_QTDVACA').AsString;
       edtPesoVaca.Text := FieldByName('EA_PESOVACA').AsString;
       edtPesoTotalVaca.Text := FieldByName('EA_PESOARROBAVACA').AsString;
       edtMediaVaca.Text:= FieldByName('EA_MEDIAARROBAVACA').AsString;
       edtValorVaca.Text := FieldByName('EA_VALORARROBAVACA').AsString;
       edtValorVaca.Text := FormatCurr('0.00', StrToCurr(edtValorVaca.Text));
       edtValorTotalVaca.Text := FieldByName('EA_VLTOTALARROBAVACA').AsString;
       edtValorTotalVaca.Text := FormatCurr('0.00', StrToCurr(edtValorTotalVaca.Text));
       edtValorFreteVaca.Text := FieldByName('EA_VLFRETEVACA').AsString;
       edtValorFreteVaca.Text := FormatCurr('0.00', StrToCurr(edtValorFreteVaca.Text));
       edtDespesaVaca.Text := FieldByName('EA_VLDESPESAVACA').AsString;
       edtDespesaVaca.Text := FormatCurr('0.00', StrToCurr(edtDespesaVaca.Text));
       edtVlTotalVaca.Text := FieldByName('EA_VLTOTALVACA').AsString;
       edtVlTotalVaca.Text := FormatCurr('0.00', StrToCurr(edtVlTotalVaca.Text));
       edtValorGeralVaca.Text := FieldByName('EA_VLGERALVACA').AsString;
       edtValorGeralVaca.Text := FormatCurr('0.00', StrToCurr(edtValorGeralVaca.Text));
       edtQtdNovilha.Text := FieldByName('EA_QTDNOVILHA').AsString;
       edtPesoNovilha.Text := FieldByName('EA_PESONOVILHA').AsString;
       edtPesoTotalNovilha.Text := FieldByName('EA_PESOARROBANOVILHA').AsString;
       edtMediaNovilha.Text := FieldByName('EA_MEDIAARROBANOVILHA').AsString;
       edtValorNovilha.Text := FieldByName('EA_VALORARROBANOVILHA').AsString;
       edtValorNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorNovilha.Text));
       edtValorTotalNovilha.Text := FieldByName('EA_VLTOTALARROBANOVILHA').AsString;
       edtValorTotalNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorTotalNovilha.Text));
       edtValorFreteNovilha.Text := FieldByName('EA_VLFRETENOVILHA').AsString;
       edtValorFreteNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorFreteNovilha.Text));
       edtDespesaNovilha.Text := FieldByName('EA_VLDESPESANOVILHA').AsString;
       edtDespesaNovilha.Text := FormatCurr('0.00', StrToCurr(edtDespesaNovilha.Text));
       edtVlTotalNovilha.Text := FieldByName('EA_VLTOTALNOVILHA').AsString;
       edtVlTotalNovilha.Text := FormatCurr('0.00', StrToCurr(edtVlTotalNovilha.Text));
       edtValorGeralNovilha.Text := FieldByName('EA_VLGERALNOVILHA').AsString;
       edtValorGeralNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorGeralNovilha.Text));
       edtValorGeral.Text := FieldByName('EA_VALORGERAL').AsString;
       edtValorGeral.Text := FormatCurr('0.00', StrToCurr(edtValorGeral.Text));
       edtVendedor.Text := FieldByName('EA_VENDEDOR').AsString;
       frmEntradaAnimais.GroupBox1.SetFocus;
    end;
end;

procedure TfrmEntradaAnimais.edtLoteExit(Sender: TObject);
var vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select lt_lote from lotes where lt_lote = '+QuotedStr(edtLote.Text)+' and lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+'');
       Active := True;
       If dmCarroComando.ADOQuery1.RecordCount <> 0 then begin
          ShowMessage('Esse Lote já existe! Escolha outro nome para o novo Lote.');
          edtLote.Text := '';
          edtLote.SetFocus;
       end;
    end;
end;

procedure TfrmEntradaAnimais.rgpControleClick(Sender: TObject);
begin
    dtpDtEntrada.SetFocus;
end;

procedure TfrmEntradaAnimais.PesoBoi;
var pPeso, vQtd, pArroba : Double;
begin
    If edtPesoBoi.Text <> '0' then begin
       pPeso := StrToFloat(edtPesoBoi.Text);
       edtPesoTotalBoi.Text := FloatToStr(pPeso/30);
       pArroba := StrToFloat(edtPesoTotalBoi.Text);
       vQtd := StrToFloat(edtQtdBoi.Text);
       edtMediaBoi.Text := FloatToStr(pArroba/vQtd);
    end;
end;

procedure TfrmEntradaAnimais.ValorBoi;
var vValor, pPeso : Double;
begin
    vValor := StrToFloat(edtValorBoi.Text);
    pPeso := StrToFloat(edtPesoTotalBoi.Text);
    edtValorTotalBoi.Text := FloatToStr(vValor*pPeso);
end;

procedure TfrmEntradaAnimais.TotalBoi;
var vTotal, vFrete, vDespesa, pPeso : Double;
begin
    vTotal := StrToFloat(edtValorTotalBoi.Text);
    vFrete := StrToFloat(edtValorFreteBoi.Text);
    vDespesa := StrToFloat(edtDespesaBoi.Text);
    edtVlTotalBoi.Text := FloatToStr(vTotal+vFrete+vDespesa);
    pPeso := StrToFloat(edtPesoTotalBoi.Text);
    edtValorGeralBoi.Text := FloatToStr((vTotal+vFrete+vDespesa)/pPeso);
end;

procedure TfrmEntradaAnimais.btnCalcularBoiClick(Sender: TObject);
begin
    PesoBoi;
    ValorBoi;
    TotalBoi;
    ValorGeral;
    edtPesoTotalBoi.Text := FormatFloat('0.##',(StrToFloat(edtPesoTotalBoi.Text)));
    edtMediaBoi.Text := FormatFloat('0.##',(StrToFloat(edtMediaBoi.Text)));
    edtValorTotalBoi.Text := FormatCurr('0.00', StrToCurr(edtValorTotalBoi.Text));
    edtValorBoi.Text := FormatCurr('0.00', StrToCurr(edtValorBoi.Text));
    edtVlTotalBoi.Text := FormatCurr('0.00', StrToCurr(edtVlTotalBoi.Text));
    edtDespesaBoi.Text := FormatCurr('0.00', StrToCurr(edtDespesaBoi.Text));
    edtValorGeralBoi.Text := FormatCurr('0.00', StrToCurr(edtValorGeralBoi.Text));
    edtValorGeral.Text := FormatCurr('0.00', StrToCurr(edtValorGeral.Text));
    edtValorFreteBoi.Text := FormatCurr('0.00', StrToCurr(edtValorFreteBoi.Text));
    edtQtdVaca.SetFocus;
end;

procedure TfrmEntradaAnimais.edtDespesaBoiExit(Sender: TObject);
begin
    btnCalcularBoi.SetFocus;
end;

procedure TfrmEntradaAnimais.PesoVaca;
var pPeso, vQtd, pArroba  : Double;
begin
    If edtPesoVaca.Text <> '0' then begin
       pPeso := StrToFloat(edtPesoVaca.Text);
       edtPesoTotalVaca.Text := FloatToStr(pPeso/30);
       pArroba := StrToFloat(edtPesoTotalVaca.Text);
       vQtd := StrToFloat(edtQtdVaca.Text);
       edtMediaVaca.Text := FloatToStr(pArroba/vQtd);
    end;
end;

procedure TfrmEntradaAnimais.ValorVaca;
var vValor, pPeso : Double;
begin
    vValor := StrToFloat(edtValorVaca.Text);
    pPeso := StrToFloat(edtPesoTotalVaca.Text);
    edtValorTotalVaca.Text := FloatToStr(vValor*pPeso);
end;

procedure TfrmEntradaAnimais.TotalVaca;
var vTotal, vFrete, vDespesa, pPeso : Double;
begin
    vTotal := StrToFloat(edtValorTotalVaca.Text);
    vFrete := StrToFloat(edtValorFreteVaca.Text);
    vDespesa := StrToFloat(edtDespesaVaca.Text);
    edtVlTotalVaca.Text := FloatToStr(vTotal+vFrete+vDespesa);
    pPeso := StrToFloat(edtPesoTotalVaca.Text);
    edtValorGeralVaca.Text := FloatToStr((vTotal+vFrete+vDespesa)/pPeso);
end;

procedure TfrmEntradaAnimais.btnCalculaVacaClick(Sender: TObject);
begin
    PesoVaca;
    ValorVaca;
    TotalVaca;
    ValorGeral;
    edtPesoTotalVaca.Text := FormatFloat('0.##',(StrToFloat(edtPesoTotalVaca.Text)));
    edtMediaVaca.Text := FormatFloat('0.##',(StrToFloat(edtMediaVaca.Text)));
    edtValorTotalVaca.Text := FormatCurr('0.00', StrToCurr(edtValorTotalVaca.Text));
    edtValorVaca.Text := FormatCurr('0.00', StrToCurr(edtValorVaca.Text));
    edtVlTotalVaca.Text := FormatCurr('0.00', StrToCurr(edtVlTotalVaca.Text));
    edtDespesaVaca.Text := FormatCurr('0.00', StrToCurr(edtDespesaVaca.Text));
    edtValorGeralVaca.Text := FormatCurr('0.00', StrToCurr(edtValorGeralVaca.Text));
    edtValorGeral.Text := FormatCurr('0.00', StrToCurr(edtValorGeral.Text));
    edtValorFreteVaca.Text := FormatCurr('0.00', StrToCurr(edtValorFreteVaca.Text));
    edtQtdNovilha.SetFocus;
end;

procedure TfrmEntradaAnimais.PesoNovilha;
var pPeso, vQtd, pArroba : Double;
begin
    If edtPesoNovilha.Text <> '0' then begin
       pPeso := StrToFloat(edtPesoNovilha.Text);
       edtPesoTotalNovilha.Text := FloatToStr(pPeso/30);
       pArroba := StrToFloat(edtPesoTotalNovilha.Text);
       vQtd := StrToFloat(edtQtdNovilha.Text);
       edtMediaNovilha.Text := FloatToStr(pArroba/vQtd);
    end;
end;

procedure TfrmEntradaAnimais.ValorNovilha;
var vValor, pPeso : Double;
begin
    vValor := StrToFloat(edtValorNovilha.Text);
    pPeso := StrToFloat(edtPesoTotalNovilha.Text);
    edtValorTotalNovilha.Text := FloatToStr(vValor*pPeso);
end;

procedure TfrmEntradaAnimais.TotalNovilha;
var vTotal, vFrete, vDespesa, pPeso : Double;
begin
    vTotal := StrToFloat(edtValorTotalNovilha.Text);
    vFrete := StrToFloat(edtValorFreteNovilha.Text);
    vDespesa := StrToFloat(edtDespesaNovilha.Text);
    edtVlTotalNovilha.Text := FloatToStr(vTotal+vFrete+vDespesa);
    pPeso := StrToFloat(edtPesoTotalNovilha.Text);
    edtValorGeralNovilha.Text := FloatToStr((vTotal+vFrete+vDespesa)/pPeso);
end;

procedure TfrmEntradaAnimais.btnCalculaNovilhaClick(Sender: TObject);
begin
    PesoNovilha;
    ValorNovilha;
    TotalNovilha;
    ValorGeral;
    edtPesoTotalNovilha.Text := FormatFloat('0.##',(StrToFloat(edtPesoTotalNovilha.Text)));
    edtMediaNovilha.Text := FormatFloat('0.##',(StrToFloat(edtMediaNovilha.Text)));
    edtValorTotalNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorTotalNovilha.Text));
    edtValorNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorNovilha.Text));
    edtVlTotalNovilha.Text := FormatCurr('0.00', StrToCurr(edtVlTotalNovilha.Text));
    edtDespesaNovilha.Text := FormatCurr('0.00', StrToCurr(edtDespesaNovilha.Text));
    edtValorGeralNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorGeralNovilha.Text));
    edtValorGeral.Text := FormatCurr('0.00', StrToCurr(edtValorGeral.Text));
    edtValorFreteNovilha.Text := FormatCurr('0.00', StrToCurr(edtValorFreteNovilha.Text));
end;

procedure TfrmEntradaAnimais.BitBtn1Click(Sender: TObject);
begin
    Busca;
end;

end.
