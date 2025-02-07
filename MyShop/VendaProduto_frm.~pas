unit VendaProduto_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Jpeg,
  Mask;

type
  TfrmVendaProduto = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnCalc: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cbxCliente: TComboBox;
    dtpData: TDateTimePicker;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    cbxProd: TComboBox;
    Label2: TLabel;
    edtCod: TEdit;
    Label5: TLabel;
    edtSaldo: TEdit;
    Label6: TLabel;
    edtCodCli: TEdit;
    Label7: TLabel;
    mmoObs: TMemo;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    DBNavigator2: TDBNavigator;
    Label8: TLabel;
    edtCodIten: TEdit;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    edtCodParc: TEdit;
    Label10: TLabel;
    dtpDataParc: TDateTimePicker;
    rdgForma: TRadioGroup;
    TabSheet4: TTabSheet;
    rdgStatus: TRadioGroup;
    mmoObsParcela: TMemo;
    Label12: TLabel;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    Panel7: TPanel;
    DBNavigator3: TDBNavigator;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    cbxEspecie: TComboBox;
    Label13: TLabel;
    edtCodPag: TEdit;
    Label14: TLabel;
    dtpDataPag: TDateTimePicker;
    mmoObsPag: TMemo;
    Label15: TLabel;
    Panel8: TPanel;
    DBGrid4: TDBGrid;
    Panel9: TPanel;
    DBNavigator4: TDBNavigator;
    btnImprimeRecibo: TSpeedButton;
    edtVlProd: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    edtVlUniParc: TEdit;
    lblParcela: TLabel;
    mkeParcela: TMaskEdit;
    Label18: TLabel;
    edtVlPag: TEdit;
    chbStatus: TCheckBox;
    edtParcelaExt: TEdit;
    edtDataExt: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label19: TLabel;
    edtQtdParc: TEdit;
    Label20: TLabel;
    edtDias: TEdit;
    Label21: TLabel;
    edtAcrescimo: TEdit;
    lblVlParcela: TLabel;
    edtVlParcela: TEdit;
    Label22: TLabel;
    edtMulta: TEdit;
    edtVlPago: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    edtQtd: TEdit;
    Label25: TLabel;
    edtDesconto: TEdit;
    Label26: TLabel;
    edtVlTotal: TEdit;
    Label27: TLabel;
    edtCodProd: TEdit;
    CheckBox1: TCheckBox;
    Label28: TLabel;
    edtTotal: TEdit;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    dtpIni: TDateTimePicker;
    dtpFim: TDateTimePicker;
    rdgConsultar: TRadioGroup;
    Panel10: TPanel;
    DBGrid5: TDBGrid;
    Panel11: TPanel;
    Label32: TLabel;
    DBNavigator5: TDBNavigator;
    edtTotal2: TEdit;
    CheckBox2: TCheckBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cbxClienteChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure cbxProdChange(Sender: TObject);
    procedure edtVlTotalEnter(Sender: TObject);
    procedure rdgFormaClick(Sender: TObject);
    procedure edtVlParcelaEnter(Sender: TObject);
    procedure edtVlPagoEnter(Sender: TObject);
    procedure cbxClienteExit(Sender: TObject);
    procedure cbxClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SomarSaldo;
    procedure SubtrairSaldo;
    procedure BaixarEstoque;
    procedure EstornarEstoque;
    procedure btnImprimeReciboClick(Sender: TObject);
    procedure Foto;
    procedure cbxProdExit(Sender: TObject);
    procedure edtCodProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Caixa;
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaProduto: TfrmVendaProduto;

implementation

uses Enterprise_dm, ZDataset, ZAbstractRODataset, DB, Principal_frm,
  Nota_qrp, Duplicata_qrp;

{$R *.dfm}

function fConvertSaldo() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtSaldo.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtSaldo.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtQtd.Text := valor;
end;

function fConvertVlProd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlProd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlProd.Text := valor;
end;

function fConvertDesconto() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtDesconto.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtDesconto.Text := valor;
end;

function fConvertVlTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlTotal.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlTotal.Text := valor;
end;

function fConvertVlParcUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlUniParc.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlUniParc.Text := valor;
end;

function fConvertVlParcela() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlParcela.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlParcela.Text := valor;
end;

function fConvertAcrescimo() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtAcrescimo.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtAcrescimo.Text := valor;
end;

function fConvertVlPagamento() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlPag.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlPag.Text := valor;
end;

function fConvertMulta() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtMulta.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtMulta.Text := valor;
end;

function fConvertVlPago() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmVendaProduto.edtVlPago.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmVendaProduto.edtVlPago.Text := valor;
end;

function fBuscaCodVenda() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select v_cod from vendas order by v_cod desc');
       Active := True;
       fBuscaCodVenda := FieldByName('v_cod').AsInteger;
    end;
end;

function fBuscaCodIVenda() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select iv_cod from itens_venda order by iv_cod desc');
       Active := True;
       fBuscaCodIVenda := FieldByName('iv_cod').AsInteger;
    end;
end;

function fBuscaCodParcela() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select pr_cod from parcelas order by pr_cod desc');
       Active := True;
       fBuscaCodParcela := FieldByName('pr_cod').AsInteger;
    end;
end;

function fBuscaCodPagamento() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select pg_cod from pagamentos order by pg_cod desc');
       Active := True;
       fBuscaCodPagamento := FieldByName('pg_cod').AsInteger;
    end;
end;

function fBuscaCodCaixa() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cx_cod from caixa order by cx_cod desc');
       Active := True;
       fBuscaCodCaixa := FieldByName('cx_cod').AsInteger;
    end;
end;

function FormaPagamento () : String;
begin
    If frmVendaProduto.rdgForma.ItemIndex = 0 then begin
       FormaPagamento := 'À VISTA';
    end
    else begin
       FormaPagamento := 'À PRAZO';
    end;
end;

function StatusPagamento () : String;
begin
    If frmVendaProduto.rdgStatus.ItemIndex = 0 then begin
       StatusPagamento := 'SIM';
    end
    else begin
       StatusPagamento := 'NÃO';
    end;
end;

function StatusQuitacao () : String;
begin
    If frmVendaProduto.chbStatus.Checked = True then begin
       StatusQuitacao := 'SIM';
    end
    else begin
       StatusQuitacao := 'NÃO';
    end;
end;

function Estoque () : String;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_estoque from produtos where p_cod = '+QuotedStr(frmVendaProduto.edtCodProd.Text)+'');
       Active := True;
       If FieldByName('p_estoque').AsFloat = 0.00 then begin
          Application.MessageBox('Não é possível incluir esse produto. Saldo em estoque = 0!','MyShop - Inclusão Cancelada',MB_OK+MB_ICONSTOP);
          Estoque := 'Cancelado';
       end
       else begin
          If FieldByName('p_estoque').AsFloat < StrToFloat(frmVendaProduto.edtQtd.Text) then begin
             Application.MessageBox('Não é possível incluir esse produto. Saldo em estoque é menor que a quantidade informada!','MyShop - Inclusão Cancelada',MB_OK+MB_ICONSTOP);
             Estoque := 'Cancelado';
          end
          else begin
             Estoque := 'Liberado';
          end;
       end;
    end;
end;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  DiaDoMes : array [1..31] of String;
  AnoExt : array [2010..2020] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias do Mês }
  DiaDoMes [1]:= 'Um';
  DiaDoMes [2]:= 'Dois';
  DiaDoMes [3]:= 'Três';
  DiaDoMes [4]:= 'Quatro';
  DiaDoMes [5]:= 'Cinco';
  DiaDoMes [6]:= 'Seis';
  DiaDoMes [7]:= 'Sete';
  DiaDoMes [8]:= 'Oito';
  DiaDoMes [9]:= 'Nove';
  DiaDoMes [10]:= 'Dez';
  DiaDoMes [11]:= 'Onze';
  DiaDoMes [12]:= 'Doze';
  DiaDoMes [13]:= 'Treze';
  DiaDoMes [14]:= 'Quatorze';
  DiaDoMes [15]:= 'Quinze';
  DiaDoMes [16]:= 'Dezesseis';
  DiaDoMes [17]:= 'Dezessete';
  DiaDoMes [18]:= 'Dezoito';
  DiaDoMes [19]:= 'Dezenove';
  DiaDoMes [20]:= 'Vinte';
  DiaDoMes [21]:= 'Vinte e Um';
  DiaDoMes [22]:= 'Vinte e Dois';
  DiaDoMes [23]:= 'Vinte e Três';
  DiaDoMes [24]:= 'Vinte e Quatro';
  DiaDoMes [25]:= 'Vinte e Cinco';
  DiaDoMes [26]:= 'Vinte e Seis';
  DiaDoMes [27]:= 'Vinte e Sete';
  DiaDoMes [28]:= 'Vinte e Oito';
  DiaDoMes [29]:= 'Vinte e Nove';
  DiaDoMes [30]:= 'Trinta';
  DiaDoMes [31]:= 'Trinta e Um';
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  AnoExt [2010]:= 'Dois Mil e Dez';
  AnoExt [2011]:= 'Dois Mil e Onze';
  AnoExt [2012]:= 'Dois Mil e Doze';
  AnoExt [2013]:= 'Dois Mil e Treze';
  AnoExt [2014]:= 'Dois Mil e Quatorze';
  AnoExt [2015]:= 'Dois Mil e Quinze';
  AnoExt [2016]:= 'Dois Mil e Dezesseis';
  AnoExt [2017]:= 'Dois Mil e Dezessete';
  AnoExt [2018]:= 'Dois Mil e Dezoito';
  AnoExt [2019]:= 'Dois Mil e Dezenove';
  AnoExt [2020]:= 'Dois Mil e Vinte';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDoMes[dia] + ' de ' + Meses[Mes]+ ' de ' + AnoExt[Ano];
end;

function extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Três', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;
 
function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='Cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil e ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+'';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
if Centavos='' then
 begin
  Result:=Result+'.';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+' e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo.'
 else
  Result:=Result+' Centavos.';
end;
end;

procedure TfrmVendaProduto.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmVendaProduto.btnLimparClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       DBGrid1.DataSource.Enabled := False;
       edtCod.Clear; edtCodCli.Clear; edtSaldo.Text := '0,00';
       cbxCliente.Text := '';
       dtpData.Date := Date;
       mmoObs.Clear;
       CheckBox1.Checked := False; CheckBox2.Checked := False;
       FormShow(Self);
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       DBGrid2.DataSource.Enabled := False;
       edtCodIten.Clear; edtCodProd.Clear; edtQtd.Text := '0'; edtVlProd.Text := '0,00'; edtDesconto.Text := '0'; edtVlTotal.Text := '0,00'; edtTotal.Text := '0,00';
       cbxProd.Text := '';
       cbxProd.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       DBGrid3.DataSource.Enabled := False;
       edtCodParc.Clear; edtDias.Text := '0'; edtVlUniParc.Text := '0,00'; edtVlParcela.Text := '0,00'; edtQtdParc.Text := '0'; edtAcrescimo.Text := '0';
       dtpDataParc.Date := Date;
       mkeParcela.Clear;
       mmoObsParcela.Clear;
       rdgForma.ItemIndex := -1; rdgStatus.ItemIndex := -1;
       If dtpDataParc.Color = clRed then begin
          dtpDataParc.Color := clWindow;
       end;
    end;
    If PageControl1.ActivePage = TabSheet4 then begin
       DBGrid4.DataSource.Enabled := False;
       edtCodPag.Clear; edtVlPag.Text := '0,00'; edtMulta.Text := '0'; edtVlPago.Text := '0,00';
       dtpDataPag.Date := Date;
       cbxEspecie.Text := '';
       mmoObsPag.Clear;
       chbStatus.Checked := False;
    end;
    If PageControl1.ActivePage = TabSheet5 then begin
       rdgConsultar.ItemIndex := -1;
       dtpIni.Date := Date - 15; dtpFim.Date := Date + 15;
       edtTotal2.Text := '0,00';
    end;
end;

procedure TfrmVendaProduto.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    If PageControl1.ActivePage = TabSheet1 then begin
       btnLimparClick(Self);
       nNovo := fBuscaCodVenda + 1;
       edtCod.Text := IntToStr(nNovo);
       cbxCliente.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       btnLimparClick(Self);
       nNovo := fBuscaCodIVenda + 1;
       edtCodIten.Text := IntToStr(nNovo);
       edtCodProd.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       nNovo := fBuscaCodParcela + 1;
       edtCodParc.Text := IntToStr(nNovo);
       If edtVlUniParc.Text = '0,00' then begin
          edtVlUniParc.Text := edtSaldo.Text;
       end;
       If edtQtdParc.Text = '0' then begin
          edtQtdParc.SetFocus;
       end
       else begin
          mkeParcela.SetFocus;
       end;
    end;
    If PageControl1.ActivePage = TabSheet4 then begin
       btnLimparClick(Self);
       nNovo := fBuscaCodPagamento + 1;
       edtCodPag.Text := IntToStr(nNovo);
       edtVlPag.Text := edtVlParcela.Text;
       cbxEspecie.SetFocus;
    end;
end;

procedure TfrmVendaProduto.FormShow(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheet1;
    dtpData.Date := Date; dtpDataParc.Date := Date; dtpDataPag.Date := Date;
    dtpIni.Date := Date - 15; dtpFim.Date := Date + 15;
    dmEnterprise.dsEnterprise.Enabled := False;
    dtpData.SetFocus;
end;

procedure TfrmVendaProduto.FormCreate(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_nome from produtos order by p_nome');
       Active := True;
       while not Eof do begin
          cbxProd.Items.Add(FieldByName('p_nome').AsString);
          Next;
       end;
    end;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxCliente.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmVendaProduto.btnInserirClick(Sender: TObject);
var vDias : Integer;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If PageControl1.ActivePage = TabSheet1 then begin
          ActiveControl := nil;
          If edtCod.Text <> '' then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             fConvertSaldo;
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Insert into vendas (V_COD, C_COD, V_DATA, V_SALDO, V_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodCli.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtSaldo.Text)+', '+QuotedStr(mmoObs.Text)+')');
                ExecSQL;
             end;
             fConvertSaldo;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro cadastrado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo registro','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet2 then begin
          If edtCodIten.Text <> '' then begin
             If Estoque = 'Liberado' then begin
                fConvertQtd;
                fConvertVlProd;
                fConvertDesconto;
                fConvertVlTotal;
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Insert into itens_venda (IV_COD, V_COD, P_COD, IV_QTD, IV_VALOR, IV_DESCONTO, IV_VLTOTAL) values ('+QuotedStr(edtCodIten.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodProd.Text)+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlProd.Text)+', '+QuotedStr(edtDesconto.Text)+', '+QuotedStr(edtVlTotal.Text)+')');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Update vendas set v_saldo = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                end;
                fConvertQtd;
                fConvertVlProd;
                fConvertDesconto;
                fConvertVlTotal;
                SomarSaldo;
                BaixarEstoque;
                Application.MessageBox('Registro cadastrado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
          end
          else begin
             Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo registro','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet3 then begin
          If edtCodParc.Text <> '' then begin
             vDias := StrToInt(edtDias.Text);
             edtParcelaExt.Text := extenso(StrToFloat(edtVlParcela.Text));
             DateTimePicker1.Date := dtpDataParc.Date+vDias;
             edtDataExt.Text := DataExtenso(DateTimePicker1.Date);
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             fConvertVlParcUni;
             fConvertAcrescimo;
             fConvertVlParcela;
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Insert into parcelas (PR_COD, V_COD, PR_DATA, PR_FORMA, PR_QTD, PR_PARCELA, PR_DIAS, PR_VLVENDA, PR_ACRESCIMO, PR_VLPARCELA, PR_STATUS, PR_OBS, PR_PARCELAEXT, PR_DATAEXT) values ('+QuotedStr(edtCodParc.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(dtpDataParc.Date+vDias))+', '+QuotedStr(FormaPagamento)+', '+QuotedStr(edtQtdParc.Text)+', '+QuotedStr(mkeParcela.Text)+', '+QuotedStr(edtDias.Text)+', '+QuotedStr(edtVlUniParc.Text)+', '+QuotedStr(edtAcrescimo.Text)+', '+QuotedStr(edtVlParcela.Text)+', '+QuotedStr(StatusPagamento)+', '+QuotedStr(mmoObsParcela.Text)+', '+QuotedStr(edtParcelaExt.Text)+', '+QuotedStr(edtDataExt.Text)+')');
                ExecSQL;
             end;
             fConvertVlParcUni;
             fConvertAcrescimo;
             fConvertVlParcela;
             SomarSaldo;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro cadastrado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo registro','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet4 then begin
          If edtCodPag.Text <> '' then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             fConvertVlPagamento;
             fConvertMulta;
             fConvertVlPago;
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Insert into pagamentos (PG_COD, V_COD, PR_COD, PG_DATA, PG_ESPECIE, PG_VALOR, PG_MULTA, PG_VLPAGO, PG_STATUS, PG_OBS) values ('+QuotedStr(edtCodPag.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodParc.Text)+', '+QuotedStr(DateToStr(dtpDataPag.Date))+', '+QuotedStr(cbxEspecie.Text)+', '+QuotedStr(edtVlPag.Text)+', '+QuotedStr(edtMulta.Text)+', '+QuotedStr(edtVlPago.Text)+', '+QuotedStr(StatusQuitacao)+', '+QuotedStr(mmoObsPag.Text)+')');
                ExecSQL;
             end;
             fConvertVlPagamento;
             fConvertMulta;
             fConvertVlPago;
             SomarSaldo;
             ShortDateFormat := 'dd/mm/yyyy';
             Caixa;
             Application.MessageBox('Registro cadastrado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             If dtpDataParc.Color = clRed then begin
                dtpDataParc.Color := clWindow;
             end;
          end
          else begin
             Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo registro','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmVendaProduto.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If PageControl1.ActivePage = TabSheet1 then begin
          If edtCod.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from pagamentos where v_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from parcelas where v_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from itens_venda where v_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from vendas where v_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   Application.MessageBox('Venda Excluida com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
                   btnLimparClick(Self);
                end;
             end;
          end
          else begin
             Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet2 then begin
          If edtCodIten.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from itens_venda where iv_cod = '+ QuotedStr(edtCodIten.Text)+'');
                   ExecSQL;
                   SubtrairSaldo;
                   EstornarEstoque;
                   Application.MessageBox('Produto Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
                   btnLimparClick(Self);
                end;
             end;
          end
          else begin
             Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet3 then begin
          If edtCodParc.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from parcelas where pr_cod = '+ QuotedStr(edtCodParc.Text)+'');
                   ExecSQL;
                   SubtrairSaldo;
                   Application.MessageBox('Produto Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
                   btnLimparClick(Self);
                end;
             end;
          end
          else begin
             Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet4 then begin
          If edtCodPag.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from pagamentos where pg_cod = '+ QuotedStr(edtCodPag.Text)+'');
                   ExecSQL;
                   SubtrairSaldo;
                   Application.MessageBox('Produto Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
                   btnLimparClick(Self);
                end;
             end;
          end
          else begin
             Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmVendaProduto.btnSelecionarClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmEnterprise.zqEnterprise do begin
          If CheckBox2.Checked = False then begin
             If CheckBox1.Checked = False then begin
                Active := False;
                SQL.Clear;
                SQL.Add('select V.*, C.c_nome from vendas V, clientes C where V.c_cod = C.c_cod order by C.c_nome, V.v_data desc');
                Active := True;
             end
             else begin
                Active := False;
                SQL.Clear;
                SQL.Add('select V.*, C.c_nome from vendas V, clientes C where V.c_cod = C.c_cod and V.v_saldo > 0 order by C.c_nome, V.v_data desc');
                Active := True;
             end;
          end
          else begin
             If CheckBox1.Checked = False then begin
                Active := False;
                SQL.Clear;
                SQL.Add('select V.*, C.c_nome from vendas V, clientes C where V.v_data = '+QuotedStr(DateToStr(dtpData.Date))+' and V.c_cod = C.c_cod order by C.c_nome, V.v_data desc');
                Active := True;
             end
             else begin
                Active := False;
                SQL.Clear;
                SQL.Add('select V.*, C.c_nome from vendas V, clientes C where V.v_data = '+QuotedStr(DateToStr(dtpData.Date))+' and V.c_cod = C.c_cod and V.v_saldo > 0 order by C.c_nome, V.v_data desc');
                Active := True;
             end;
          end;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('v_saldo') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('v_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('v_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('v_saldo').FieldName;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(iv_vltotal) from itens_venda where v_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          If FieldByName('sum(iv_vltotal)').AsString <> '' then begin
             edtTotal.Text := FieldByName('sum(iv_vltotal)').AsString;
             edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select IV.*, P.p_nome from itens_venda IV, produtos P where v_cod = '+QuotedStr(edtCod.Text)+' and IV.p_cod = P.p_cod order by P.p_nome');
          Active := True;
          DBGrid2.DataSource.Enabled := True;
          Open;
          (FieldByName('iv_valor') as TNumericField).DisplayFormat := ',0.00';
          (FieldByName('iv_vltotal') as TNumericField).DisplayFormat := ',0.00';
          DBGrid2.Columns.Items[0].FieldName := FieldByName('iv_cod').FieldName;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('p_nome').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('iv_qtd').FieldName;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('iv_valor').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('iv_desconto').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('iv_vltotal').FieldName;
       end;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from parcelas where v_cod = '+QuotedStr(edtCod.Text)+' order by pr_data');
          Active := True;
          DBGrid3.DataSource.Enabled := True;
          Open;
          (FieldByName('pr_vlvenda') as TNumericField).DisplayFormat := ',0.00';
          (FieldByName('pr_vlparcela') as TNumericField).DisplayFormat := ',0.00';
          DBGrid3.Columns.Items[0].FieldName := FieldByName('pr_cod').FieldName;
          DBGrid3.Columns.Items[1].FieldName := FieldByName('pr_data').FieldName;
          DBGrid3.Columns.Items[2].FieldName := FieldByName('pr_qtd').FieldName;
          DBGrid3.Columns.Items[3].FieldName := FieldByName('pr_parcela').FieldName;
          DBGrid3.Columns.Items[4].FieldName := FieldByName('pr_dias').FieldName;
          DBGrid3.Columns.Items[5].FieldName := FieldByName('pr_vlvenda').FieldName;
          DBGrid3.Columns.Items[6].FieldName := FieldByName('pr_acrescimo').FieldName;
          DBGrid3.Columns.Items[7].FieldName := FieldByName('pr_vlparcela').FieldName;
          DBGrid3.Columns.Items[8].FieldName := FieldByName('pr_forma').FieldName;
          DBGrid3.Columns.Items[9].FieldName := FieldByName('pr_status').FieldName;
       end;
    end;
    If PageControl1.ActivePage = TabSheet4 then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select PG.*, PR.v_cod from pagamentos PG, parcelas PR where PR.v_cod = '+QuotedStr(edtCod.Text)+' and PG.pr_cod = PR.pr_cod order by PG.pg_data');
          Active := True;
          DBGrid4.DataSource.Enabled := True;
          Open;
          (FieldByName('pg_valor') as TNumericField).DisplayFormat := ',0.00';
          (FieldByName('pg_vlpago') as TNumericField).DisplayFormat := ',0.00';
          DBGrid4.Columns.Items[0].FieldName := FieldByName('pg_cod').FieldName;
          DBGrid4.Columns.Items[1].FieldName := FieldByName('pg_data').FieldName;
          DBGrid4.Columns.Items[2].FieldName := FieldByName('pg_especie').FieldName;
          DBGrid4.Columns.Items[3].FieldName := FieldByName('pg_valor').FieldName;
          DBGrid4.Columns.Items[4].FieldName := FieldByName('pg_multa').FieldName;
          DBGrid4.Columns.Items[5].FieldName := FieldByName('pg_vlpago').FieldName;
          DBGrid4.Columns.Items[6].FieldName := FieldByName('pg_status').FieldName;
       end;
    end;
    If PageControl1.ActivePage = TabSheet5 then begin
       If rdgConsultar.ItemIndex = 0 then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(IV.iv_vltotal) from vendas V, clientes C, itens_venda IV where V.v_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and V.c_cod = C.c_cod and IV.v_cod = V.v_cod');
             Active := True;
             If FieldByName('sum(IV.iv_vltotal)').AsString <> '' then begin
                edtTotal2.Text := FieldByName('sum(IV.iv_vltotal)').AsString;
                edtTotal2.Text := FormatCurr(',0.00', StrToFloat(edtTotal2.Text));
             end
             else begin
                edtTotal2.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('select V.v_cod ''Código'' , V.v_data ''Data'', C.c_nome ''Cliente'', sum(IV.iv_vltotal) ''Valor R$'' from vendas V, clientes C, itens_venda IV where V.v_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and V.c_cod = C.c_cod and IV.v_cod = V.v_cod group by C.c_nome order by C.c_nome');
             Active := True;
             If dmEnterprise.zqEnterprise.RecordCount <> 0 then begin
                DBGrid5.DataSource.Enabled := True;
                Open;
                (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
                DBGrid5.Columns.Items[0].Width := 50;
                DBGrid5.Columns.Items[1].Width := 70;
                DBGrid5.Columns.Items[2].Width := 500;
                DBGrid5.Columns.Items[3].Width := 65;
             end;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If rdgConsultar.ItemIndex = 1 then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(IV.iv_vltotal) from vendas V, produtos P, itens_venda IV where V.v_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and IV.p_cod = P.p_cod and IV.v_cod = V.v_cod');
             Active := True;
             If FieldByName('sum(IV.iv_vltotal)').AsString <> '' then begin
                edtTotal2.Text := FieldByName('sum(IV.iv_vltotal)').AsString;
                edtTotal2.Text := FormatCurr(',0.00', StrToFloat(edtTotal2.Text));
             end
             else begin
                edtTotal2.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('select V.v_cod ''Código'' , V.v_data ''Data'', P.p_nome ''Prdouto'', sum(IV.iv_qtd) ''Quant.'', sum(IV.iv_vltotal) ''Valor R$'' from vendas V, produtos P, itens_venda IV where V.v_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and IV.p_cod = P.p_cod and IV.v_cod = V.v_cod group by P.p_nome order by P.p_nome');
             Active := True;
             If dmEnterprise.zqEnterprise.RecordCount <> 0 then begin
                DBGrid5.DataSource.Enabled := True;
                Open;
                (FieldByName('Valor R$') as TNumericField).DisplayFormat := ',0.00';
                DBGrid5.Columns.Items[0].Width := 50;
                DBGrid5.Columns.Items[1].Width := 70;
                DBGrid5.Columns.Items[2].Width := 470;
                DBGrid5.Columns.Items[3].Width := 50;
                DBGrid5.Columns.Items[4].Width := 65;
             end;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

procedure TfrmVendaProduto.cbxClienteChange(Sender: TObject);
begin
    If cbxCliente.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from clientes where c_nome = '+QuotedStr(cbxCliente.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
       end;
    end;
end;

procedure TfrmVendaProduto.DBGrid1DblClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select V.*, C.c_nome from vendas V, clientes C where V.v_cod = '+QuotedStr(edtCod.Text)+' and V.c_cod = C.c_cod');
       Active := True;
       dtpData.Date := FieldByName('v_data').AsDateTime;
       cbxCliente.Text := FieldByName('c_nome').AsString;
       edtCodCli.Text := FieldByName('c_cod').AsString;
       edtSaldo.Text := FieldByName('v_saldo').AsString;
       mmoObs.Text := FieldByName('v_obs').AsString;
       edtSaldo.Text := FormatCurr('0.00', StrToCurr(edtSaldo.Text));
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmVendaProduto.btnCalcClick(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmVendaProduto.cbxProdChange(Sender: TObject);
begin
    If cbxProd.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select p_cod, p_vlvenda from produtos where p_nome = '+QuotedStr(cbxProd.Text)+'');
          Active := True;
          edtCodProd.Text := FieldByName('p_cod').AsString;
          edtVlProd.Text := FieldByName('p_vlvenda').AsString;
          If edtVlProd.Text <> '' then begin
             edtVlProd.Text := FormatCurr('0.00', StrToCurr(edtVlProd.Text));
          end
          else begin
             edtVlProd.Text := '0,00';
          end;
       end;
    end;
end;

procedure TfrmVendaProduto.edtVlTotalEnter(Sender: TObject);
var vQtd, vValor, vDesconto : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vValor := StrToFloat(edtVlProd.Text);
    vDesconto := StrToFloat(edtDesconto.Text);
    edtVlTotal.Text := FloatToStr((vQtd*vValor)-(((vQtd*vValor)*vDesconto)/100));
    edtVlTotal.Text := FormatCurr('0.00', StrToCurr(edtVlTotal.Text));
end;

procedure TfrmVendaProduto.rdgFormaClick(Sender: TObject);
begin
    edtQtdParc.SetFocus;
end;

procedure TfrmVendaProduto.edtVlParcelaEnter(Sender: TObject);
var vParcela : Integer;
    vValor, vAcrescimo : Double;
begin
    vParcela := StrToInt(edtQtdParc.Text);
    vValor := StrToFloat(edtVlUniParc.Text);
    vAcrescimo := StrToFloat(edtAcrescimo.Text);
    edtVlParcela.Text := FloatToStr((vValor/vParcela)+((vValor/vParcela)*vAcrescimo/100));
    edtVlParcela.Text := FormatCurr('0.00', StrToCurr(edtVlParcela.Text));
end;

procedure TfrmVendaProduto.edtVlPagoEnter(Sender: TObject);
var vPagamento, vMulta : Double;
begin
    vPagamento := StrToFloat(edtVlPag.Text);
    vMulta := StrToFloat(edtMulta.Text);
    edtVlPago.Text := FloatToStr(vPagamento+((vPagamento*vMulta)/100));
    edtVlPago.Text := FormatCurr('0.00', StrToCurr(edtVlPago.Text));
end;

procedure TfrmVendaProduto.cbxClienteExit(Sender: TObject);
begin
    If edtCodCli.Text = '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from clientes where c_nome = '+QuotedStr(cbxCliente.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
       end;
    end;
end;

procedure TfrmVendaProduto.cbxClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       cbxClienteExit(Self);
       With dmEnterprise.zqEnterprise do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select V.*, C.c_nome from vendas V, clientes C where V.c_cod = '+QuotedStr(edtCodCli.Text)+' and V.c_cod = C.c_cod order by V.v_data desc');
             Active := True;
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('select V.*, C.c_nome from vendas V, clientes C where V.c_cod = '+QuotedStr(edtCodCli.Text)+' and V.c_cod = C.c_cod and V.v_saldo > 0 order by V.v_data desc');
             Active := True;
          end;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('v_saldo') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('v_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('v_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('v_saldo').FieldName;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmVendaProduto.DBGrid2DblClick(Sender: TObject);
begin
    edtCodIten.Text := DBGrid2.SelectedField.Text;
    DBGrid2.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select IV.*, P.p_nome from itens_venda IV, produtos P where iv_cod = '+QuotedStr(edtCodIten.Text)+' and IV.p_cod = P.p_cod');
       Active := True;
       edtCodProd.Text := FieldByName('p_cod').AsString;
       cbxProd.Text := FieldByName('p_nome').AsString;
       edtQtd.Text := FieldByName('iv_qtd').AsString;
       edtVlProd.Text := FieldByName('iv_valor').AsString;
       edtDesconto.Text := FieldByName('iv_desconto').AsString;
       edtVlTotal.Text := FieldByName('iv_vltotal').AsString;
       edtVlProd.Text := FormatCurr('0.00', StrToCurr(edtVlProd.Text));
       edtVlTotal.Text := FormatCurr('0.00', StrToCurr(edtVlTotal.Text));
    end;
end;

procedure TfrmVendaProduto.DBGrid3DblClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    edtCodParc.Text := DBGrid3.SelectedField.Text;
    DBGrid3.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from parcelas where pr_cod = '+QuotedStr(edtCodParc.Text)+'');
       Active := True;
       edtQtdParc.Text := FieldByName('pr_qtd').AsString;
       mkeParcela.Text := FieldByName('pr_parcela').AsString;
       edtDias.Text := FieldByName('pr_dias').AsString;
       dtpDataParc.Date := FieldByName('pr_data').AsDateTime;
       edtVlUniParc.Text := FieldByName('pr_vlvenda').AsString;
       edtAcrescimo.Text := FieldByName('pr_acrescimo').AsString;
       edtVlParcela.Text := FieldByName('pr_vlparcela').AsString;
       mmoObsParcela.Text := FieldByName('pr_obs').AsString;
       If FieldByName('pr_forma').AsString = 'À VISTA' then begin
          rdgForma.ItemIndex := 0;
       end
       else begin
          rdgForma.ItemIndex := 1;
       end;
       If FieldByName('pr_status').AsString = 'SIM' then begin
          rdgStatus.ItemIndex := 0;
       end
       else begin
          rdgStatus.ItemIndex := 1;
       end;
       edtVlUniParc.Text := FormatCurr('0.00', StrToCurr(edtVlUniParc.Text));
       edtVlParcela.Text := FormatCurr('0.00', StrToCurr(edtVlParcela.Text));
    end;
    If rdgStatus.ItemIndex = 1 then begin
       If dtpDataParc.Date < Date then begin
          Application.MessageBox('Essa conta está vencida.','MyShop - Atenção',MB_OK+MB_ICONINFORMATION);
          dtpDataParc.Color := clRed;
       end;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmVendaProduto.DBGrid4DblClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    edtCodPag.Text := DBGrid4.SelectedField.Text;
    DBGrid4.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from pagamentos where pg_cod = '+QuotedStr(edtCodPag.Text)+'');
       Active := True;
       dtpDataPag.Date := FieldByName('pg_data').AsDateTime;
       cbxEspecie.Text := FieldByName('pg_especie').AsString;
       edtVlPag.Text := FieldByName('pg_valor').AsString;
       edtMulta.Text := FieldByName('pg_multa').AsString;
       edtVlPago.Text := FieldByName('pg_vlpago').AsString;
       mmoObsPag.Text := FieldByName('pg_obs').AsString;
       If FieldByName('pg_status').AsString = 'SIM' then begin
          chbStatus.Checked := True;
       end
       else begin
          chbStatus.Checked := False;
       end;
       edtVlPag.Text := FormatCurr('0.00', StrToCurr(edtVlPag.Text));
       edtVlPago.Text := FormatCurr('0.00', StrToCurr(edtVlPago.Text));
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmVendaProduto.PageControl1Change(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    If PageControl1.ActivePage = TabSheet1 then begin
       btnImprimeRecibo.Caption := '&Imprimir';
       btnImprimeRecibo.Font.Color := clRed;
       dtpData.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       btnImprimeRecibo.Caption := 'N&ota';
       btnImprimeRecibo.Font.Color := clGreen;
       btnImprimeRecibo.Hint := 'Imprimir Nota';
       edtCodProd.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       btnImprimeRecibo.Caption := '&Duplicata';
       btnImprimeRecibo.Font.Color := clGreen;
       btnImprimeRecibo.Hint := 'Imprimir Duplicata';
       edtQtdParc.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet4 then begin
       btnImprimeRecibo.Caption := '&Imprimir';
       btnImprimeRecibo.Font.Color := clRed;
       cbxEspecie.SetFocus;
    end;
end;

procedure TfrmVendaProduto.SomarSaldo;
var vSaldo, vTotal, vPag, vTotalPag, vQtd, vVenda, vVlParcela, vParcela : Double;
begin
    If PageControl1.ActivePage = TabSheet2 then begin
       vSaldo := StrToFloat(edtSaldo.Text);
       vTotal := StrToFloat(edtVlTotal.Text);
       edtSaldo.Text := FloatToStr(vSaldo+vTotal);
       fConvertSaldo;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set v_saldo = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       fConvertSaldo;
       edtSaldo.Text := FormatCurr('0.00', StrToCurr(edtSaldo.Text));
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       vSaldo := StrToFloat(edtSaldo.Text);
       vQtd := StrToFloat(edtQtdParc.Text);
       vVenda := StrToFloat(edtVlUniParc.Text);
       vVlParcela := StrToFloat(edtVlParcela.Text);
       vParcela := (vVlParcela-(vVenda/vQtd));
       edtSaldo.Text := FloatToStr(vSaldo+vParcela);
       fConvertSaldo;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set v_saldo = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       fConvertSaldo;
       edtSaldo.Text := FormatCurr('0.00', StrToCurr(edtSaldo.Text));
    end;
    If PageControl1.ActivePage = TabSheet4 then begin
       vSaldo := StrToFloat(edtSaldo.Text);
       vTotal := StrToFloat(edtVlPago.Text);
       vPag := StrToFloat(edtVlPag.Text);
       vTotalPag := vTotal-vPag;
       edtSaldo.Text := FloatToStr((vSaldo+vTotalPag)-vTotal);
       fConvertSaldo;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set v_saldo = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Active := False;
          SQL.Clear;
          SQL.Add('Update parcelas set pr_status = '+QuotedStr(StatusQuitacao)+' where pr_cod = '+QuotedStr(edtCodParc.Text)+'');
          ExecSQL;
       end;
       fConvertSaldo;
       edtSaldo.Text := FormatCurr('0.00', StrToCurr(edtSaldo.Text));
    end;
end;

procedure TfrmVendaProduto.SubtrairSaldo;
var vSaldo, vTotal, vPag, vTotalPag, vQtd, vVenda, vVlParcela, vParcela : Double;
begin
    If PageControl1.ActivePage = TabSheet2 then begin
       vSaldo := StrToFloat(edtSaldo.Text);
       vTotal := StrToFloat(edtVlTotal.Text);
       With dmEnterprise.zqEnterprise do begin
          edtSaldo.Text := FloatToStr(vSaldo-vTotal);
          fConvertSaldo;
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set v_saldo = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertSaldo;
          edtSaldo.Text := FormatCurr('0.00', StrToCurr(edtSaldo.Text));
       end;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       vSaldo := StrToFloat(edtSaldo.Text);
       vQtd := StrToFloat(edtQtdParc.Text);
       vVenda := StrToFloat(edtVlUniParc.Text);
       vVlParcela := StrToFloat(edtVlParcela.Text);
       vParcela := (vVlParcela-(vVenda/vQtd));
       edtSaldo.Text := FloatToStr(vSaldo-vParcela);
       With dmEnterprise.zqEnterprise do begin
          fConvertSaldo;
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set v_saldo = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertSaldo;
          edtSaldo.Text := FormatCurr('0.00', StrToCurr(edtSaldo.Text));
       end;
    end;
    If PageControl1.ActivePage = TabSheet4 then begin
       vSaldo := StrToFloat(edtSaldo.Text);
       vTotal := StrToFloat(edtVlPago.Text);
       vPag := StrToFloat(edtVlPag.Text);
       vTotalPag := vTotal-vPag;
       edtSaldo.Text := FloatToStr((vSaldo-vTotalPag)+vTotal);
       With dmEnterprise.zqEnterprise do begin
          fConvertSaldo;
          Active := False;
          SQL.Clear;
          SQL.Add('Update vendas set v_saldo = '+QuotedStr(edtSaldo.Text)+' where v_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          chbStatus.Checked := False;
          Active := False;
          SQL.Clear;
          SQL.Add('Update parcelas set pr_status = '+QuotedStr(StatusQuitacao)+' where pr_cod = '+QuotedStr(edtCodParc.Text)+'');
          ExecSQL;
          fConvertSaldo;
          edtSaldo.Text := FormatCurr('0.00', StrToCurr(edtSaldo.Text));
       end;
    end;
end;

procedure TfrmVendaProduto.BaixarEstoque;
var vQtdAtual, vQtdNovo : Double;
begin
    vQtdAtual := StrToFloat(edtQtd.Text);
    DecimalSeparator := '.';
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_estoque from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       Active := True;
       vQtdNovo := FieldByName('p_estoque').AsFloat;
       Active := True;
       SQL.Clear;
       SQL.Add('Update produtos set p_estoque = '+FloatToStr(vQtdNovo - vQtdAtual)+' where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       ExecSQL;
       DecimalSeparator := ',';
    end;
end;

procedure TfrmVendaProduto.EstornarEstoque;
var vQtdAtual, vQtdNovo : Double;
begin
    vQtdAtual := StrToFloat(edtQtd.Text);
    DecimalSeparator := '.';
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_estoque from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       Active := True;
       vQtdNovo := FieldByName('p_estoque').AsFloat;
       Active := True;
       SQL.Clear;
       SQL.Add('Update produtos set p_estoque = '+FloatToStr(vQtdNovo + vQtdAtual)+' where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       ExecSQL;
       DecimalSeparator := ',';
    end;
end;

procedure TfrmVendaProduto.btnImprimeReciboClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet2 then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select V.*, C.*, IV.*, P.p_nome from vendas V, clientes C, itens_venda IV, produtos P where V.c_cod = C.c_cod and V.v_cod = IV.v_cod and P.p_cod = IV.p_cod and V.v_cod = '+QuotedStr(edtCod.Text)+' order by P.p_nome');
          Active := True;
       end;
       Try
         Application.CreateForm(TqrpNota, qrpNota);
         Foto;
         qrpNota.QRLabel3.Caption := edtTotal.Text;
         qrpNota.Preview;
       Finally
            qrpNota.Free;
       end;
       btnSelecionarClick(Self);
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select V.v_cod, PR.*, C.C_nome, C.c_cpf, C.c_endereco, C.c_cidade, C.c_uf from vendas V, clientes C, parcelas PR where V.c_cod = C.c_cod and V.v_cod = PR.v_cod and V.v_cod = '+QuotedStr(edtCod.Text)+' and PR.pr_dias <> 0 and PR.pr_status = ''NÃO'' order by PR.pr_data');
          Active := True;
       end;
       Try
         Application.CreateForm(TqrpDuplicata, qrpDuplicata);
         Foto;
         qrpDuplicata.Preview;
       Finally
            qrpDuplicata.Free;
       end;
       btnSelecionarClick(Self);
    end;
end;

procedure TfrmVendaProduto.Foto;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    If PageControl1.ActivePage = TabSheet2 then begin
       Jpeg := nil;
       With qrpNota.ZQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('r_foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             qrpNota.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
             qrpNota.QRImage1.Picture.Assign(nil);
          end;
          Jpeg.Free;
          fFoto.Destroy;
       end;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       Jpeg := nil;
       With qrpDuplicata.ZQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('r_foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             qrpDuplicata.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
             qrpDuplicata.QRImage1.Picture.Assign(nil);
          end;
          Jpeg.Free;
          fFoto.Destroy;
       end;
    end;
end;

procedure TfrmVendaProduto.cbxProdExit(Sender: TObject);
begin
    If edtCodProd.Text = '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select p_cod, p_vlvenda from produtos where p_nome = '+QuotedStr(cbxProd.Text)+'');
          Active := True;
          edtCodProd.Text := FieldByName('p_cod').AsString;
          edtVlProd.Text := FieldByName('p_vlvenda').AsString;
          If edtVlProd.Text <> '' then begin
             edtVlProd.Text := FormatCurr('0.00', StrToCurr(edtVlProd.Text));
          end
          else begin
             edtVlProd.Text := '0,00';
          end;
       end;
    end;
end;

procedure TfrmVendaProduto.edtCodProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       If edtCodProd.Text <> '' then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select p_nome, p_vlvenda from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
             Active := True;
             cbxProd.Text := FieldByName('p_nome').AsString;
             edtVlProd.Text := FieldByName('p_vlvenda').AsString;
             If edtVlProd.Text <> '' then begin
                edtVlProd.Text := FormatCurr('0.00', StrToCurr(edtVlProd.Text));
             end
             else begin
                edtVlProd.Text := '0,00';
             end;
          end;
          edtQtd.SetFocus;
       end;
    end;
end;

procedure TfrmVendaProduto.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid1.DataSource.Enabled = True then begin
       DBGrid1.Hint := 'Para Selecionar, editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid1.Hint := '';
    end;
end;

procedure TfrmVendaProduto.DBGrid2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid2.DataSource.Enabled = True then begin
       DBGrid2.Hint := 'Para Selecionar, editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid2.Hint := '';
    end;
end;

procedure TfrmVendaProduto.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If DBGrid3.DataSource.Enabled = True then begin
       DBGrid3.Hint := 'Para Selecionar, editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid3.Hint := '';
    end;
end;

procedure TfrmVendaProduto.DBGrid4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid4.DataSource.Enabled = True then begin
       DBGrid4.Hint := 'Para Selecionar, editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid4.Hint := '';
    end;
end;

procedure TfrmVendaProduto.Caixa;
var nNovo : Integer;
begin
    nNovo := fBuscaCodCaixa + 1;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertVlPago;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into caixa (CX_COD, CX_DATA, CX_DESCRICAO, CX_SITUACAO, CX_VALOR, CX_OBS, CX_OPERACAO) values ('+IntToStr(nNovo)+', '+QuotedStr(DateToStr(dtpDataPag.Date))+', ''VENDA DE PRODUTO'', ''ENTRADA'', '+QuotedStr(edtVlPago.Text)+', ''Sem Obs.'', ''A'')');
       ExecSQL;
    end;
    fConvertVlPago;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmVendaProduto.CheckBox1Click(Sender: TObject);
begin
    If cbxCliente.Text <> '' then begin
       cbxCliente.SetFocus;
    end;
end;

procedure TfrmVendaProduto.CheckBox2Click(Sender: TObject);
begin
    If CheckBox2.Checked = True then begin
       Label4.Font.Color := clBlue;
       dtpData.SetFocus;
    end
    else begin
       Label4.Font.Color := clBlack;
    end;
end;

end.
