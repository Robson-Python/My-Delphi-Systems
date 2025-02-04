unit Entrada_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, DateUtils, ExtDlgs, DB, ADODB, Jpeg;

type
  TfrmEntrada = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    lblForn: TLabel;
    cbxDest: TComboBox;
    btnCons: TSpeedButton;
    Shape1: TShape;
    dtpData: TDateTimePicker;
    lblDtEntrada: TLabel;
    btnAtualizar: TSpeedButton;
    ADOQuery1: TADOQuery;
    btnSalvar: TSpeedButton;
    Label1: TLabel;
    cbxForn: TComboBox;
    Label2: TLabel;
    cbxEmpresa: TComboBox;
    Label4: TLabel;
    cbxFreteiro: TComboBox;
    GroupBox2: TGroupBox;
    edtMCubico: TLabeledEdit;
    edtVlMadeira: TLabeledEdit;
    edtVlFrete: TLabeledEdit;
    edtCusto: TLabeledEdit;
    btnConfirmar: TBitBtn;
    edtRomaneio: TLabeledEdit;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbxDest2: TComboBox;
    dtpData2: TDateTimePicker;
    cbxForn2: TComboBox;
    cbxEmp2: TComboBox;
    cbxFret2: TComboBox;
    edtRomaneio2: TLabeledEdit;
    GroupBox3: TGroupBox;
    edtPlaqueta: TLabeledEdit;
    edtCodPlaq: TLabeledEdit;
    btnIncluir: TBitBtn;
    edtMed2: TLabeledEdit;
    edtComprimento: TLabeledEdit;
    edtVolume: TLabeledEdit;
    cbxEspecie: TComboBox;
    cbxClassif: TComboBox;
    edtCustoPlaq: TLabeledEdit;
    edtPreco: TLabeledEdit;
    edtUtilizado: TLabeledEdit;
    btnNovaTora: TBitBtn;
    edtMed1: TLabeledEdit;
    DBGrid1: TDBGrid;
    edtIdEmp1: TEdit;
    edtIdDest1: TEdit;
    edtIdForn1: TEdit;
    edtIdFret1: TEdit;
    edtIdEmp2: TEdit;
    edtIdDest2: TEdit;
    edtIdForn2: TEdit;
    edtIdFret2: TEdit;
    edtId: TLabeledEdit;
    edtIdEspecie: TEdit;
    edtIdClass: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    DataSource1: TDataSource;
    btnConfirmaEntrada: TBitBtn;
    btnAlterar: TBitBtn;
    btnRemover: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label11: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure Itens;
    procedure btnConsClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtComprimentoExit(Sender: TObject);
    procedure edtCustoPlaqExit(Sender: TObject);
    procedure btnNovaToraClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtVlFreteExit(Sender: TObject);
    procedure edtMed1Exit(Sender: TObject);
    procedure edtMed2Exit(Sender: TObject);
    procedure cbxEmpresaChange(Sender: TObject);
    procedure cbxDestChange(Sender: TObject);
    procedure cbxFornChange(Sender: TObject);
    procedure cbxFreteiroChange(Sender: TObject);
    procedure cbxEmp2Change(Sender: TObject);
    procedure cbxDest2Change(Sender: TObject);
    procedure cbxForn2Change(Sender: TObject);
    procedure cbxFret2Change(Sender: TObject);
    procedure cbxEspecieChange(Sender: TObject);
    procedure cbxClassifChange(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Soma;
    procedure btnConfirmaEntradaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Entrada;
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntrada: TfrmEntrada;

implementation

uses Carro_Comando_dm, Principal_frm,
  ImprimeCompra_frm, Setores_frm;

{$R *.dfm}

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
//  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
//{ Dias da Semana }
//  DiaDasemana [1]:= 'Domingo';
//  DiaDasemana [2]:= 'Segunda-feira';
//  DiaDasemana [3]:= 'Terçafeira';
//  DiaDasemana [4]:= 'Quarta-feira';
//  DiaDasemana [5]:= 'Quinta-feira';
//  DiaDasemana [6]:= 'Sexta-feira';
//  DiaDasemana [7]:= 'Sábado';
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
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := Meses[Mes]+ ' ' + IntToStr(Ano);
end;

function fBuscaCodEntrada() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select id from entrada');
       Active := True;
       Last;
       fBuscaCodEntrada := FieldByName('id').AsInteger;
    end;
end;

function fBuscaCodAcumulativo() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ea_cod from estoque_acumulativo');
       Active := True;
       Last;
       fBuscaCodAcumulativo:= FieldByName('ea_cod').AsInteger;
    end;
end;

function fBuscaCodPlaq() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select id from plaqueta');
       Active := True;
       Last;
       fBuscaCodPlaq := FieldByName('id').AsInteger;
    end;
end;

function fConvertVlMadeira() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtVlMadeira.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtVlMadeira.Text := valor;
end;

function fConvertVlFrete() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtVlFrete.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtVlFrete.Text := valor;
end;

function fConvertCustoMad : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtCusto.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtCusto.Text := valor;
end;

function fConvertMed1 : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtMed1.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtMed1.Text := valor;
end;

function fConvertMed2 : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtMed2.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtMed2.Text := valor;
end;

function fConvertComp : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtComprimento.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtComprimento.Text := valor;
end;

function fConvertVol : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtVolume.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtVolume.Text := valor;
end;

function fConvertSaldo : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtUtilizado.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtUtilizado.Text := valor;
end;

function fConvertCustoPlaq : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtCustoPlaq.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtCustoPlaq.Text := valor;
end;

function fConvertPreco : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtPreco.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtPreco.Text := valor;
end;

function fConvertMtCub : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtMCubico.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtMCubico.Text := valor;
end;

procedure TfrmEntrada.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmEntrada.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    DBGrid2.DataSource.Enabled := False;
    edtRomaneio.Clear; edtIdEmp1.Clear; edtIdDest1.Clear; edtIdForn1.Clear; edtIdFret1.Clear;
    edtRomaneio2.Clear; edtIdEmp2.Clear; edtIdDest2.Clear; edtIdForn2.Clear; edtIdFret2.Clear;
    edtCodPlaq.Clear; edtPlaqueta.Clear;
    cbxDest.Clear; cbxForn.Clear; cbxEmpresa.Clear; cbxFreteiro.Clear; cbxDest2.Clear; cbxForn2.Clear; cbxEmp2.Clear; cbxFret2.Clear;
    edtIdEspecie.Clear; edtIdClass.Clear;
    cbxEspecie.Clear; cbxClassif.Clear;
    Label11.Caption := '';
    edtId.Clear;
    FormShow(Sender);
    FormCreate(Sender);
    dmVendas.ADOQuery1.Active := False;
    dmVendas.DataSource1.Enabled := True;
    cbxEmpresa.SetFocus;
    DecimalSeparator := ',';
end;

procedure TfrmEntrada.FormShow(Sender: TObject);
begin
    dtpData.Date := Date;
    dtpData2.Date := Date;
    edtMed1.Text := '0,000'; edtMed2.Text := '0,000'; edtComprimento.Text := '00,000';
    edtVolume.Text := '0,000'; edtCustoPlaq.Text := '0,00'; edtPreco.Text := '0,00'; edtUtilizado.Text := '0,000'; edtMCubico.Text := '0,000'; edtVlMadeira.Text := '0,00';
    edtVlFrete.Text := '0,00'; edtCusto.Text := '0,00';
    DBGrid1.DataSource.Enabled := False;
    DBGrid2.DataSource.Enabled := False;
    edtRomaneio.SetFocus;
end;

procedure TfrmEntrada.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresa order by razaoSocial');
       Active := True;
       while not Eof do begin
          cbxEmpresa.Items.Add(FieldByName('razaoSocial').AsString);
          cbxEmp2.Items.Add(FieldByName('razaoSocial').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from deposito order by descricao');
       Active := True;
       while not Eof do begin
          cbxDest.Items.Add(FieldByName('descricao').AsString);
          cbxDest2.Items.Add(FieldByName('descricao').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from terceiro order by nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('nome').AsString);
          cbxForn2.Items.Add(FieldByName('nome').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from terceiro order by nome');
       Active := True;
       while not Eof do begin
          cbxFreteiro.Items.Add(FieldByName('nome').AsString);
          cbxFret2.Items.Add(FieldByName('nome').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from especie order by descricao');
       Active := True;
       while not Eof do begin
          cbxEspecie.Items.Add(FieldByName('descricao').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from classificacao order by descricao');
       Active := True;
       while not Eof do begin
          cbxClassif.Items.Add(FieldByName('descricao').AsString);
          Next;
       end;
    end;
end;

procedure TfrmEntrada.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    DecimalSeparator := ',';
    nNovo := fBuscaCodEntrada + 1;
    edtId.Text := IntToStr(nNovo);
    dmVendas.DataSource1.Enabled := False;
    edtRomaneio2.SetFocus;
end;

procedure TfrmEntrada.btnDeletarClick(Sender: TObject);
begin
    If edtId.Text <> '' then begin
       If Application.MessageBox('Tem certeza que deseja Excluir os Registros?','Controle de Toras - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from entrada_plaqueta where entrada_id = '+ QuotedStr(edtId.Text)+'');
             ExecSQL;
          end;
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from plaqueta where romaneio = '+ QuotedStr(edtRomaneio2.Text)+'');
             ExecSQL;
          end;
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from entrada where id = '+ QuotedStr(edtId.Text)+'');
             ExecSQL;
          end;
          Application.MessageBox('Registro Deletado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          FormShow(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmEntrada.btnIncluirClick(Sender: TObject);
var nNovo : Integer;
    mMtCub, vMad, vVolume, pPreco : Double;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    nNovo := fBuscaCodPlaq + 1;
    edtCodPlaq.Text := IntToStr(nNovo);
//    fConvertMtCub;
//    fConvertVol;
    mMtCub := StrToFloat(edtMCubico.Text);
    vMad := StrToFloat(edtVlMadeira.Text);
    vVolume := StrToFloat(edtVolume.Text);
    pPreco := StrToFloat(edtPreco.Text);
    fConvertCustoPlaq;
    fConvertPreco;
    fConvertVlMadeira;
    fConvertVol;
    fConvertMed1;
    fConvertMed2;
    fConvertComp;
    fConvertSaldo;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into plaqueta (id, comprimento, custo, diametro1, diametro2, plaqueta, saldoLinear, especie_id, classificacao_id, empresa_id, romaneio, dataEntrada) Values ('+QuotedStr(edtCodPlaq.Text)+', '+QuotedStr(edtComprimento.Text)+', '+QuotedStr(edtCustoPlaq.Text)+', '+ QuotedStr(edtMed1.Text)+', '+QuotedStr(edtMed2.Text)+','+ QuotedStr(edtPlaqueta.Text)+', '+QuotedStr(edtComprimento.Text)+', '+QuotedStr(edtIdEspecie.Text)+', '+QuotedStr(edtIdClass.Text)+', '+QuotedStr(edtIdEmp2.Text)+', '+QuotedStr(edtRomaneio2.Text)+', '+QuotedStr(DateToStr(dtpData2.Date))+')');
       ExecSQL;
       Active := False;
       SQL.Clear;
       SQL.add('Insert into entrada_plaqueta (Entrada_id, plaqueta_id) Values ('+QuotedStr(edtId.Text)+', '+QuotedStr(edtCodPlaq.Text)+')');
       ExecSQL;
    end;
    fConvertCustoPlaq;
    fConvertPreco;
    fConvertVlMadeira;
//    fConvertMtCub;
    fConvertVol;
    fConvertMed1;
    fConvertMed2;
    fConvertComp;
    fConvertSaldo;
//    Application.MessageBox('Tora Incluida!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
//    fConvertMtCub;
    fConvertVlMadeira;
    edtMCubico.Text := FloatToStr(vVolume + mMtCub);
    edtVlMadeira.Text := FloatToStr(pPreco + vMad);
    edtMCubico.Text := FormatFloat('0.###',(StrToFloat(edtMCubico.Text)));
    edtVlMadeira.Text := FormatCurr('0.00', StrToCurr(edtVlMadeira.Text));
//    fConvertMtCub;
    Entrada; 
    Itens;
end;

procedure TfrmEntrada.Itens;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select P.id, P.plaqueta, replace(format(P.diametro1,3), ".",",") ''diametro1'', replace(format(P.diametro2,3), ".",",") ''diametro2'', replace(format(P.comprimento,3), ".",",") ''comprimento'', '+
       'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', replace(format(P.custo,2), ".",",") ''custo'', '+
       'replace(format(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,2), ".",",") ''preço'', '+
       'replace(format(comprimento - saldoLinear,3), ".",",") ''utilizado'', E.descricao, C.descricao''class'' '+
       'from plaqueta P, especie E, classificacao C, entrada EN where P.romaneio = '+QuotedStr(edtRomaneio2.Text)+' and EN.id = '+QuotedStr(edtId.Text)+' and P.empresa_id = EN.empresa_id and P.especie_id = E.id and P.classificacao_id = C.id order by P.id');
       Active := True;
       DBGrid1.DataSource.Enabled := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('id').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('plaqueta').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('diametro1').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('diametro2').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('comprimento').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('volume').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('descricao').FieldName;
       DBGrid1.Columns.Items[7].FieldName := FieldByName('class').FieldName;
       DBGrid1.Columns.Items[8].FieldName := FieldByName('custo').FieldName;
       DBGrid1.Columns.Items[9].FieldName := FieldByName('preço').FieldName;
       DBGrid1.Columns.Items[10].FieldName := FieldByName('utilizado').FieldName;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmEntrada.btnConsClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If dtpData.Date <> 0000-00-00 then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select EN.id, EN.dataEntrada,EN.romaneio, replace(format(EN.valorFrete,2), ".",",") ''valorFrete'', E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where EN.dataEntrada = '+QuotedStr(DateToStr(dtpData.Date))+' and EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id order by EN.id');
          Active := True;
          dmVendas.DataSource1.Enabled := True;
          DBGrid2.Columns.Items[0].FieldName := FieldByName('id').FieldName;
          DBGrid2.Columns.Items[0].Width := 60;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('romaneio').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('dataEntrada').FieldName;
          DBGrid2.Columns.Items[2].Width := 70;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('razaoSocial').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('descricao').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('nome').FieldName;
          DBGrid2.Columns.Items[6].FieldName := FieldByName('freteiro').FieldName;
          DBGrid2.Columns.Items[7].FieldName := FieldByName('valorFrete').FieldName;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
    end;
    If edtRomaneio.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select EN.id, EN.dataEntrada,EN.romaneio, replace(format(EN.valorFrete,2), ".",",") ''valorFrete'', E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where EN.romaneio = '+QuotedStr(edtRomaneio.Text)+' and EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id order by EN.id');
          Active := True;
          dmVendas.DataSource1.Enabled := True;
          DBGrid2.Columns.Items[0].FieldName := FieldByName('id').FieldName;
          DBGrid2.Columns.Items[0].Width := 60;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('romaneio').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('dataEntrada').FieldName;
          DBGrid2.Columns.Items[2].Width := 70;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('razaoSocial').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('descricao').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('nome').FieldName;
          DBGrid2.Columns.Items[6].FieldName := FieldByName('freteiro').FieldName;
          DBGrid2.Columns.Items[7].FieldName := FieldByName('valorFrete').FieldName;
       end;
    end;
    If cbxEmpresa.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select EN.id, EN.dataEntrada,EN.romaneio, replace(format(EN.valorFrete,2), ".",",") ''valorFrete'', E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where E.razaosocial = '+QuotedStr(cbxEmpresa.Text)+' and EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id order by EN.id');
          Active := True;
          dmVendas.DataSource1.Enabled := True;
          DBGrid2.Columns.Items[0].FieldName := FieldByName('id').FieldName;
          DBGrid2.Columns.Items[0].Width := 60;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('romaneio').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('dataEntrada').FieldName;
          DBGrid2.Columns.Items[2].Width := 70;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('razaoSocial').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('descricao').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('nome').FieldName;
          DBGrid2.Columns.Items[6].FieldName := FieldByName('freteiro').FieldName;
          DBGrid2.Columns.Items[7].FieldName := FieldByName('valorFrete').FieldName;
       end;
    end;
    If cbxDest.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select EN.id, EN.dataEntrada,EN.romaneio, replace(format(EN.valorFrete,2), ".",",") ''valorFrete'', E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where D.descricao = '+QuotedStr(cbxDest.Text)+' and EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id order by EN.id');
          Active := True;
          dmVendas.DataSource1.Enabled := True;
          DBGrid2.Columns.Items[0].FieldName := FieldByName('id').FieldName;
          DBGrid2.Columns.Items[0].Width := 60;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('romaneio').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('dataEntrada').FieldName;
          DBGrid2.Columns.Items[2].Width := 70;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('razaoSocial').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('descricao').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('nome').FieldName;
          DBGrid2.Columns.Items[6].FieldName := FieldByName('freteiro').FieldName;
          DBGrid2.Columns.Items[7].FieldName := FieldByName('valorFrete').FieldName;
       end;
    end;
    If cbxForn.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select EN.id, EN.dataEntrada,EN.romaneio, replace(format(EN.valorFrete,2), ".",",") ''valorFrete'', E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where T.nome = '+QuotedStr(cbxForn.Text)+' and EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id order by EN.id');
          Active := True;
          dmVendas.DataSource1.Enabled := True;
          DBGrid2.Columns.Items[0].FieldName := FieldByName('id').FieldName;
          DBGrid2.Columns.Items[0].Width := 60;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('romaneio').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('dataEntrada').FieldName;
          DBGrid2.Columns.Items[2].Width := 70;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('razaoSocial').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('descricao').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('nome').FieldName;
          DBGrid2.Columns.Items[6].FieldName := FieldByName('freteiro').FieldName;
          DBGrid2.Columns.Items[7].FieldName := FieldByName('valorFrete').FieldName;
       end;
    end;
    If cbxFreteiro.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select EN.id, EN.dataEntrada,EN.romaneio, replace(format(EN.valorFrete,2), ".",",") ''valorFrete'', E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where TT.nome = '+QuotedStr(cbxFreteiro.Text)+' and EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id order by EN.id');
          Active := True;
          dmVendas.DataSource1.Enabled := True;
          DBGrid2.Columns.Items[0].FieldName := FieldByName('id').FieldName;
          DBGrid2.Columns.Items[0].Width := 60;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('romaneio').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('dataEntrada').FieldName;
          DBGrid2.Columns.Items[2].Width := 70;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('razaoSocial').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('descricao').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('nome').FieldName;
          DBGrid2.Columns.Items[6].FieldName := FieldByName('freteiro').FieldName;
          DBGrid2.Columns.Items[7].FieldName := FieldByName('valorFrete').FieldName;
       end;
    end;
end;

procedure TfrmEntrada.DBGrid1DblClick(Sender: TObject);
begin
    edtCodPlaq.Text := DBGrid1.SelectedField.Text;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select P.*, replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', (custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854), (comprimento - saldoLinear), '+
       'E.descricao, C.descricao''class'' from plaqueta P, especie E, classificacao C, entrada EN where P.id = '+QuotedStr(edtCodPlaq.Text)+'  and P.empresa_id = EN.empresa_id and P.especie_id = E.id and P.classificacao_id = C.id');
       Active := True;
       edtPlaqueta.Text := FieldByName('plaqueta').AsString;
       edtMed1.Text := FieldByName('diametro1').AsString;
       edtMed2.Text := FieldByName('diametro2').AsString;
       edtComprimento.Text := FieldByName('comprimento').AsString;
       edtVolume.Text := FieldByName('volume').AsString;
       edtIdEspecie.Text := FieldByName('especie_id').AsString;
       cbxEspecie.Text := FieldByName('descricao').AsString;
       edtIdClass.Text := FieldByName('classificacao_id').AsString;
       cbxClassif.Text := FieldByName('class').AsString;
       edtCustoPlaq.Text := FieldByName('custo').AsString;
       edtPreco.Text := FieldByName('(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)').AsString;
       edtUtilizado.Text := FieldByName('(comprimento - saldoLinear)').AsString;
       edtCustoPlaq.Text := FormatCurr('0.00', StrToCurr(edtCustoPlaq.Text));
       edtPreco.Text := FormatCurr('0.00', StrToCurr(edtPreco.Text));
       edtMed1.Text := FormatFloat('0.000###',(StrToFloat(edtMed1.Text)));
//       fConvertMed1;
       edtMed2.Text := FormatFloat('0.000###',(StrToFloat(edtMed2.Text)));
//       fConvertMed2;
       edtComprimento.Text := FormatFloat('0.000###',(StrToFloat(edtComprimento.Text)));
//       fConvertComp;
       edtVolume.Text := FormatFloat('0.000###',(StrToFloat(edtVolume.Text)));
//       fConvertVol;
       edtUtilizado.Text := FormatFloat('0.000###',(StrToFloat(edtUtilizado.Text)));
       btnConsClick(Sender);
       Itens;
    end;
end;

procedure TfrmEntrada.btnAtualizarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertVlMadeira;
    fConvertVlFrete;
    fConvertCustoMad;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update entrada set dataEntrada = '+QuotedStr(DateToStr(dtpData2.Date))+', valorFrete = '+QuotedStr(edtVlFrete.Text)+', romaneio = '+QuotedStr(edtRomaneio2.Text)+', freteiro_id = '+QuotedStr(edtIdFret2.Text)+', destino_id = '+QuotedStr(edtIdDest2.Text)+', fornecedor_id = '+QuotedStr(edtIdForn2.Text)+' where id = '+QuotedStr(edtId.Text)+'');
       ExecSQL;
       Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
       ShortDateFormat := 'dd/mm/yyyy';
       fConvertVlMadeira;
       fConvertVlFrete;
       fConvertCustoMad;
    end;
end;

procedure TfrmEntrada.edtComprimentoExit(Sender: TObject);
var mMed1, mMed2, cComp : Double;
begin
//    fConvertMed1;
//    fConvertMed2;
//    fConvertComp;
//    fConvertVol;
//    fConvertSaldo;
    mMed1 := StrToFloat(edtMed1.Text);
    mMed2 := StrToFloat(edtMed2.Text);
    cComp := StrToFloat(edtComprimento.Text);
    edtComprimento.Text := FormatFloat('00,###',(StrToFloat(edtComprimento.Text)));
    edtVolume.Text := FloatToStr(((mMed1+mMed2)/2)*((mMed1+mMed2)/2)*cComp*0.7854);
    edtVolume.Text := FormatFloat('0,###',(StrToFloat(edtVolume.Text)));
    edtUtilizado.Text := edtVolume.Text;
//    fConvertMed1;
//    fConvertMed2;
    fConvertComp;
    fConvertVol;
    fConvertSaldo;
    cbxEspecie.SetFocus;
end;

procedure TfrmEntrada.edtCustoPlaqExit(Sender: TObject);
var cCusto, vVolume : Double;
begin
//    fConvertVol;
    cCusto := StrToFloat(edtCustoPlaq.Text);
    vVolume := StrToFloat(edtVolume.Text);
    edtPreco.Text := FloatToStr(cCusto * vVolume);
    edtCustoPlaq.Text := FormatCurr('0.00', StrToCurr(edtCustoPlaq.Text));
    edtPreco.Text := FormatCurr('0.00', StrToFloat(edtPreco.Text));
//    fConvertVol;
end;

procedure TfrmEntrada.btnNovaToraClick(Sender: TObject);
var nNovo, nPlaqueta : Integer;
begin
    DecimalSeparator := ',';
    dmVendas.DataSource1.Enabled := False;
    nNovo := fBuscaCodPlaq + 1;
    edtCodPlaq.Text := IntToStr(nNovo);
    nPlaqueta := StrToInt(edtPlaqueta.Text);
    edtPlaqueta.Text := IntToStr(nPlaqueta+1);
    edtPlaqueta.SetFocus;
    edtCodPlaq.Clear; edtMed1.Text := '0,000'; edtMed2.Text := '0,000'; edtComprimento.Text := '00,000'; edtVolume.Text := '0,000'; cbxClassif.Text := ''; cbxEspecie.Text := ''; edtCustoPlaq.Clear; edtCustoPlaq.Clear; edtPreco.Text := '0,00'; edtCustoPlaq.Text := '0,00'; edtUtilizado.Text := '0,000';
    edtIdEspecie.Clear; edtIdClass.Clear;
    Itens;
end;

procedure TfrmEntrada.btnConfirmarClick(Sender: TObject);
begin
    fConvertVlMadeira;
    fConvertVlFrete;
    fConvertCustoMad;
    fConvertMtCub;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update entrada set en_mt_cub = '+QuotedStr(edtMCubico.Text)+', en_vl_madeira = '+QuotedStr(edtVlMadeira.Text)+', en_vl_frete = '+QuotedStr(edtVlFrete.Text)+', en_vl_custo = '+QuotedStr(edtCusto.Text)+' where en_cod = '+QuotedStr(edtId.Text)+'');
       ExecSQL;
    end;
    fConvertVlMadeira;
    fConvertVlFrete;
    fConvertCustoMad;
    fConvertMtCub;
    Itens;
    btnConfirmar.Enabled := False;
    Application.MessageBox('Cadastro Encerrado!','Controle de Toras - Sucesso',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmEntrada.edtVlFreteExit(Sender: TObject);
var vMad, vFrete : Double;
begin
    vMad := StrToFloat(edtVlMadeira.Text);
    vFrete := StrToFloat(edtVlFrete.Text);
    edtVlFrete.Text := FormatCurr('0.00', StrToFloat(edtVlFrete.Text));
    edtCusto.Text := FormatCurr('0.00', StrToFloat(edtCusto.Text));
    btnConfirmaEntrada.SetFocus;
end;

procedure TfrmEntrada.edtMed1Exit(Sender: TObject);
begin
    edtMed1.Text := FormatFloat('0,###',(StrToFloat(edtMed1.Text)));
    fConvertMed1;
end;

procedure TfrmEntrada.edtMed2Exit(Sender: TObject);
begin
    edtMed2.Text := FormatFloat('0,###',(StrToFloat(edtMed2.Text)));
    fConvertMed2;
end;

procedure TfrmEntrada.cbxEmpresaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpresa.Text)+'');
       Active := True;
       edtIdEmp1.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxDestChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from deposito where descricao = '+QuotedStr(cbxDest.Text)+'');
       Active := True;
       edtIdDest1.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxFornChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from terceiro where nome = '+QuotedStr(cbxForn.Text)+'');
       Active := True;
       edtIdForn1.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxFreteiroChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from terceiro where nome = '+QuotedStr(cbxFreteiro.Text)+'');
       Active := True;
       edtIdFret1.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxEmp2Change(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmp2.Text)+'');
       Active := True;
       edtIdEmp2.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxDest2Change(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from deposito where descricao = '+QuotedStr(cbxDest2.Text)+'');
       Active := True;
       edtIdDest2.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxForn2Change(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from terceiro where nome = '+QuotedStr(cbxForn2.Text)+'');
       Active := True;
       edtIdForn2.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxFret2Change(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from terceiro where nome = '+QuotedStr(cbxFret2.Text)+'');
       Active := True;
       edtIdFret2.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxEspecieChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from especie where descricao = '+QuotedStr(cbxEspecie.Text)+'');
       Active := True;
       edtIdEspecie.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.cbxClassifChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from classificacao where descricao = '+QuotedStr(cbxClassif.Text)+'');
       Active := True;
       edtIdClass.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEntrada.DBGrid2DblClick(Sender: TObject);
begin
    edtId.Text := DBGrid2.SelectedField.Text;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select EN.*, E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where EN.id = '+QuotedStr(edtId.Text)+' and EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id');
       Active := True;
       edtRomaneio2.Text := FieldByName('romaneio').AsString;
       dtpData2.Date := FieldByName('dataEntrada').AsDateTime;
       edtIdEmp2.Text := FieldByName('empresa_id').AsString;
       cbxEmp2.Text := FieldByName('razaoSocial').AsString;
       edtIdDest2.Text := FieldByName('destino_id').AsString;
       cbxDest2.Text := FieldByName('descricao').AsString;
       edtIdForn2.Text := FieldByName('fornecedor_id').AsString;
       cbxForn2.Text := FieldByName('nome').AsString;
       edtIdFret2.Text := FieldByName('freteiro_id').AsString;
       cbxFret2.Text := FieldByName('freteiro').AsString;
       edtVlFrete.Text := FieldByName('valorFrete').AsString;
       edtVlFrete.Text := FormatCurr('0.00', StrToCurr(edtVlFrete.Text));
//       edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
//       edtCustoPlaq.Text := FormatCurr('0.00', StrToCurr(edtCustoPlaq.Text));
//       edtPreco.Text := FormatCurr('0.00', StrToCurr(edtPreco.Text));
    Soma;
    btnConsClick(Sender);
    Itens;
    end;
end;

procedure TfrmEntrada.Soma;
var vFrete, vMad : Double;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) from plaqueta where romaneio = '+QuotedStr(edtRomaneio2.Text)+'');
       Active := True;
       edtMCubico.Text := FieldByName('sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)').AsString;
       edtMCubico.Text := FormatFloat('0.###',(StrToFloat(edtMCubico.Text)));
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) from plaqueta where romaneio = '+QuotedStr(edtRomaneio2.Text)+'');
       Active := True;
       edtVlMadeira.Text := FieldByName('sum(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)').AsString;
       edtVlMadeira.Text := FormatCurr('0.00',StrToCurr(edtVlMadeira.Text));
    end;
    vFrete := StrToFloat(edtVlFrete.Text);
    vMad := StrToFloat(edtVlMadeira.Text);
    edtCusto.Text := FloatToStr(vMad + vFrete);
    edtCusto.Text := FormatCurr('0.00',StrToCurr(edtCusto.Text));
end;

procedure TfrmEntrada.btnConfirmaEntradaClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
//    nNovo := fBuscaCodEntrada + 1;
//    edtId.Text := IntToStr(nNovo);
    fConvertVlMadeira;
    fConvertVlFrete;
    fConvertCustoMad;
    fConvertMtCub;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into entrada (id, dataEntrada, romaneio, valorFrete, freteiro_id, destino_id, fornecedor_id, empresa_id) Values ('+QuotedStr(edtId.Text)+', '+ QuotedStr(DateToStr(dtpData2.Date))+', '+QuotedStr(edtRomaneio2.Text)+', '+QuotedStr(edtVlFrete.Text)+', '+QuotedStr(edtIdFret2.Text)+', '+QuotedStr(edtIdDest2.Text)+', '+QuotedStr(edtIdForn2.Text)+', '+QuotedStr(edtIdEmp2.Text)+')');
       ExecSQL;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    fConvertVlMadeira;
    fConvertVlFrete;
    fConvertCustoMad;
    fConvertMtCub;
    edtPlaqueta.SetFocus;
    Label11.Caption := DataExtenso(Now);
end;

procedure TfrmEntrada.btnSalvarClick(Sender: TObject);
begin
    btnLimparClick(Sender);
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select EN.*, E.razaoSocial, D.descricao, T.nome, TT.nome ''freteiro'' from Entrada EN, empresa E, Deposito D, terceiro T, terceiro TT where EN.empresa_id = E.id and EN.destino_id = D.id and EN.fornecedor_id = T.id and EN.freteiro_id = TT.id order by EN.id');
       Active := True;
       dmVendas.DataSource1.Enabled := True;
       DBGrid2.Columns.Items[0].FieldName := FieldByName('id').FieldName;
       DBGrid2.Columns.Items[1].FieldName := FieldByName('romaneio').FieldName;
       DBGrid2.Columns.Items[2].FieldName := FieldByName('dataEntrada').FieldName;
       DBGrid2.Columns.Items[3].FieldName := FieldByName('razaoSocial').FieldName;
       DBGrid2.Columns.Items[4].FieldName := FieldByName('descricao').FieldName;
       DBGrid2.Columns.Items[5].FieldName := FieldByName('nome').FieldName;
       DBGrid2.Columns.Items[6].FieldName := FieldByName('freteiro').FieldName;
       DBGrid2.Columns.Items[7].FieldName := FieldByName('valorFrete').FieldName;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmEntrada.btnRemoverClick(Sender: TObject);
var vEntrada, vAtual, vSaida, vResult, vResult2 : Double;
begin
    Label11.Caption := DataExtenso(dtpData2.Date);
    DecimalSeparator := ',';
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ea_entrada, ea_saida from estoque_acumulativo where empresa_id = '+QuotedStr(edtIdEmp2.Text)+' and especie_id = '+QuotedStr(edtIdEspecie.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
       Active := True;
       vEntrada := FieldByName('ea_entrada').AsFloat;
       vSaida := FieldByName('ea_saida').AsFloat;
       vAtual := StrToFloat(edtVolume.Text);
       vResult := vEntrada-vAtual;
       vResult2 := vResult-vSaida;
       DecimalSeparator := '.';
       Active := False;
       SQL.Clear;
       SQL.Add('Update estoque_acumulativo set ea_entrada = '+QuotedStr(FloatToStr(vResult))+', ea_saldo = '+QuotedStr(FloatToStr(vResult2))+' where empresa_id = '+QuotedStr(edtIdEmp2.Text)+' and especie_id = '+QuotedStr(edtIdEspecie.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
       ExecSQL;
       DecimalSeparator := ',';
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Delete from entrada_plaqueta where plaqueta_id = '+ QuotedStr(edtCodPlaq.Text)+'');
       ExecSQL;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Delete from plaqueta where id = '+ QuotedStr(edtCodPlaq.Text)+'');
       ExecSQL;
    end;
    btnNovaToraClick(Sender);
end;

procedure TfrmEntrada.btnAlterarClick(Sender: TObject);
begin
    fConvertMed1;
    fConvertMed2;
    fConvertComp;
    fConvertVol;
    fConvertSaldo;
    fConvertCustoPlaq;
    fConvertPreco;
    fConvertMtCub;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update plaqueta set comprimento = '+QuotedStr(edtComprimento.Text)+', custo = '+QuotedStr(edtCustoPlaq.Text)+', diametro1 = '+QuotedStr(edtMed1.Text)+', diametro2 = '+QuotedStr(edtMed2.Text)+', plaqueta = '+QuotedStr(edtPlaqueta.Text)+', especie_id = '+QuotedStr(edtIdEspecie.Text)+', classificacao_id = '+QuotedStr(edtIdClass.Text)+', saldoLinear = '+QuotedStr(edtComprimento.Text)+' where id = '+QuotedStr(edtCodPlaq.Text)+'');
       ExecSQL;
       fConvertMed1;
       fConvertMed2;
       fConvertComp;
       fConvertVol;
       fConvertSaldo;
       fConvertCustoPlaq;
       fConvertPreco;
       fConvertMtCub;
    end;
    btnNovaToraClick(Sender);
end;

procedure TfrmEntrada.Entrada;
var vAnterior, vEntrada, vEntradaAtual, vSaida, vResult, vSaldo: Double;
    vPeriodo : String;
    nNovo : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select ea_periodo, ea_anterior, ea_entrada, ea_saida from estoque_acumulativo where especie_id = '+QuotedStr(edtIdEspecie.Text)+' and empresa_id = '+QuotedStr(edtIdEmp2.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
       Active := True;
       vPeriodo := FieldByName('ea_periodo').AsString;
       vEntrada := FieldByName('ea_entrada').AsFloat;
       vSaida := FieldByName('ea_saida').AsFloat;
       vAnterior := FieldByName('ea_anterior').AsFloat;
       vEntradaAtual := StrToFloat(edtVolume.Text);
       vResult := vEntrada+vEntradaAtual;
       If vPeriodo = Label11.Caption then begin
          DecimalSeparator := '.';
          Active := False;
          SQL.Clear;
          SQL.Add('update estoque_acumulativo set ea_entrada = '+QuotedStr(FloatToStr(vResult))+', ea_saldo = '+QuotedStr(FloatToStr((vAnterior+vResult)-vSaida))+' where empresa_id = '+QuotedStr(edtIdEmp2.Text)+' and especie_id = '+QuotedStr(edtIdEspecie.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
          ExecSQL;
       end;
       If vPeriodo <> Label11.Caption then begin
          Active := False;
          SQL.Clear;
          SQL.Add('select ea_saldo from estoque_acumulativo where especie_id = '+QuotedStr(edtIdEspecie.Text)+' and empresa_id = '+QuotedStr(edtIdEmp2.Text)+' order by ea_cod desc');
          Active := True;
          vSaldo := FieldByName('ea_saldo').AsFloat;
          nNovo := fBuscaCodAcumulativo + 1;
          DecimalSeparator := '.';
          Active := False;
          SQL.Clear;
          SQL.Add('insert into estoque_acumulativo (ea_cod, empresa_id, especie_id, ea_periodo, ea_anterior, ea_entrada, ea_saida, ea_saldo) values ('+IntToStr(nNovo)+', '+QuotedStr(edtIdEmp2.Text)+', '+QuotedStr(edtIdEspecie.Text)+', '+QuotedStr(Label11.Caption)+', '+QuotedStr(FloatToStr(vSaldo))+', ''0.000'', ''0.000'', ''0.000'')');
          ExecSQL;
          DecimalSeparator := ',';
          Active := False;
          SQL.Clear;
          SQL.Add('select ea_periodo, ea_anterior, ea_entrada, ea_saida from estoque_acumulativo where especie_id = '+QuotedStr(edtIdEspecie.Text)+' and empresa_id = '+QuotedStr(edtIdEmp2.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
          Active := True;
          vPeriodo := FieldByName('ea_periodo').AsString;
          vEntrada := FieldByName('ea_entrada').AsFloat;
          vSaida := FieldByName('ea_saida').AsFloat;
          vAnterior := FieldByName('ea_anterior').AsFloat;
          vEntradaAtual := StrToFloat(edtVolume.Text);
          vResult := vEntrada+vEntradaAtual;
          If vPeriodo = Label11.Caption then begin
             DecimalSeparator := '.';
             Active := False;
             SQL.Clear;
             SQL.Add('update estoque_acumulativo set ea_entrada = '+QuotedStr(FloatToStr(vResult))+', ea_saldo = '+QuotedStr(FloatToStr((vAnterior+vResult)-vSaida))+' where empresa_id = '+QuotedStr(edtIdEmp2.Text)+' and especie_id = '+QuotedStr(edtIdEspecie.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
             ExecSQL;
          end;
       end;
    end;
end;

procedure TfrmEntrada.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If odd(dmVendas.ADOQuery1.RecNo) then begin
       DBGrid2.Canvas.Font.Color:= clBlack;
       DBGrid2.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid2.Canvas.Font.Color:= clBlack;
       DBGrid2.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid2.Canvas.FillRect(Rect);
    DBGrid2.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

procedure TfrmEntrada.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If odd(ADOQuery1.RecNo) then begin
       DBGrid1.Canvas.Font.Color:= clBlack;
       DBGrid1.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid1.Canvas.Font.Color:= clBlack;
       DBGrid1.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

end.







