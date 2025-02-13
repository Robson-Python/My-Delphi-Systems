unit Saida_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, DateUtils, ExtDlgs, DB, ADODB, Jpeg;

type
  TfrmSaida = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    btnCons: TSpeedButton;
    Shape1: TShape;
    ADOQuery1: TADOQuery;
    btnAtualizar: TSpeedButton;
    DBNavigator1: TDBNavigator;
    lblDtEntrada: TLabel;
    dtpData: TDateTimePicker;
    edtIdEmp1: TEdit;
    cbxEmpresa: TComboBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtPlaqueta: TLabeledEdit;
    edtCodPlaq: TLabeledEdit;
    edtMed2: TLabeledEdit;
    edtComprimento: TLabeledEdit;
    edtVolume: TLabeledEdit;
    edtCustoPlaq: TLabeledEdit;
    edtPreco: TLabeledEdit;
    edtUtilizado: TLabeledEdit;
    edtMed1: TLabeledEdit;
    edtIdEspecie: TEdit;
    edtIdClass: TEdit;
    edtUtilLinear: TLabeledEdit;
    Label1: TLabel;
    cbxTipo: TComboBox;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    edtId: TLabeledEdit;
    edtEspecie: TEdit;
    edtClass: TEdit;
    CheckBox1: TCheckBox;
    edtResultado: TEdit;
    Label11: TLabel;
    Label4: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure Itens;
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbxEmpresaChange(Sender: TObject);
    procedure cbxEspecieChange(Sender: TObject);
    procedure cbxClassifChange(Sender: TObject);
    procedure edtPlaquetaExit(Sender: TObject);
    procedure edtUtilLinearExit(Sender: TObject);
    procedure Saida;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaida: TfrmSaida;

implementation

uses Carro_Comando_dm, Principal_frm,
  ImprimeVenda_frm, ImprimeSaidaTora_frm;

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
//  DiaDasemana [3]:= 'Ter�afeira';
//  DiaDasemana [4]:= 'Quarta-feira';
//  DiaDasemana [5]:= 'Quinta-feira';
//  DiaDasemana [6]:= 'Sexta-feira';
//  DiaDasemana [7]:= 'S�bado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Mar�o';
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

function fBuscaCodSaida() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select id from saida');
       Active := True;
       Last;
       fBuscaCodSaida := FieldByName('id').AsInteger;
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

function fConvertMed1 : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtMed1.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtMed1.Text := valor;
end;

function fConvertMed2 : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtMed2.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtMed2.Text := valor;
end;

function fConvertComp : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtComprimento.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtComprimento.Text := valor;
end;

function fConvertVol : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtVolume.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtVolume.Text := valor;
end;

function fConvertSaldo : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtUtilizado.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtUtilizado.Text := valor;
end;

function fConvertUtilLinear : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtUtilLinear.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtUtilLinear.Text := valor;
end;

function fConvertResultado : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtResultado.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtResultado.Text := valor;
end;

function fConvertLabel4 : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.Label4.Caption;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.Label4.Caption := valor;
end;

procedure TfrmSaida.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmSaida.btnLimparClick(Sender: TObject);
begin
    edtId.Clear; cbxEmpresa.Clear; edtEspecie.Clear; edtClass.Clear; cbxTipo.Text := ''; edtIdEmp1.Clear;
    edtPlaqueta.Clear; edtCodPlaq.Clear; edtIdEspecie.Clear; edtIdClass.Clear;
    Label4.Caption := ''; Label11.Caption := '';
    cbxTipo.Enabled := True;
    DateTimePicker1.Enabled := True;
    FormShow(Sender);
    FormCreate(Sender);
    dmVendas.ADOQuery1.Active := False;
    DecimalSeparator := ',';
end;

procedure TfrmSaida.FormShow(Sender: TObject);
begin
    dtpData.Date := Date;
    DateTimePicker1.Date := Date;
    edtMed1.Text := '0,000'; edtMed2.Text := '0,000'; edtComprimento.Text := '00,000'; edtVolume.Text := '0,000'; edtUtilizado.Text := '0,000'; edtUtilLinear.Text := '0,000';
    edtCustoPlaq.Text := '0,00'; edtPreco.Text := '0,00';
    DBGrid1.DataSource.Enabled := False;
    CheckBox1.Checked := False;
    cbxEmpresa.SetFocus;
end;

procedure TfrmSaida.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresa order by razaoSocial');
       Active := True;
       while not Eof do begin
          cbxEmpresa.Items.Add(FieldByName('razaoSocial').AsString);
          Next;
       end;
    end;
end;

procedure TfrmSaida.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodSaida + 1;
    edtId.Text := IntToStr(nNovo);
    dmVendas.DataSource1.Enabled := False;
    edtPlaqueta.Clear;
    edtPlaqueta.SetFocus;
    Label11.Caption := DataExtenso(Now);
    DecimalSeparator := ',';
end;

procedure TfrmSaida.btnDeletarClick(Sender: TObject);
var sSaldo, uUtil : Double;
begin
    If edtId.Text <> '' then begin
       If Application.MessageBox('Tem certeza que deseja Excluir os Registros?','Controle de Toras - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from saida where id = '+ QuotedStr(edtId.Text)+'');
             ExecSQL;
          end;
          sSaldo := StrToFloat(edtUtilizado.Text);
          uUtil := StrToFloat(edtUtilLinear.Text);
          edtResultado.Text := FloatToStr(sSaldo + uUtil);
          fConvertResultado;
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.add('Update plaqueta set saldoLinear = '+QuotedStr(edtResultado.Text)+' where id = '+QuotedStr(edtCodPlaq.Text)+'');
             ExecSQL;
          end;
          fConvertResultado;
          Application.MessageBox('Registro Deletado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          FormShow(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode estar vazio!','Controle de Toras - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmSaida.Itens;
begin
    DBGrid1.DataSource.Enabled := True;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from plaquetas, saida, sub_especie where plaquetas.p_cod = saida.p_cod and plaquetas.se_cod = sub_especie.se_cod and plaquetas.p_numero = '+QuotedStr(edtId.Text)+'');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('sd_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('sd_dt_saida').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('sd_tipo').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('p_numero').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('p_med1').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('p_med2').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('p_comp').FieldName;
       DBGrid1.Columns.Items[7].FieldName := FieldByName('p_volume').FieldName;
       DBGrid1.Columns.Items[8].FieldName := FieldByName('se_descricao').FieldName;
       DBGrid1.Columns.Items[9].FieldName := FieldByName('sd_saldo').FieldName;
       DBGrid1.Columns.Items[10].FieldName := FieldByName('sd_disp_ml').FieldName;
       DBGrid1.Columns.Items[11].FieldName := FieldByName('sd_corte').FieldName;
       DBGrid1.Columns.Items[12].FieldName := FieldByName('sd_util_m3').FieldName;
    end;
end;

procedure TfrmSaida.btnAtualizarClick(Sender: TObject);
var sSaldo, uUtil : Double;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    sSaldo := StrToFloat(edtUtilizado.Text);
    uUtil := StrToFloat(edtUtilLinear.Text);
    edtResultado.Text := FloatToStr(sSaldo - uUtil);
    fConvertUtilLinear;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into saida (id, dataSaida, quantidadeLinear, tipo, empresa_id, plaqueta_id) Values ('+QuotedStr(edtId.Text)+', '+ QuotedStr(DateToStr(DateTimePicker1.Date))+', '+QuotedStr(edtUtilLinear.Text)+', '+QuotedStr(cbxTipo.Text)+', '+QuotedStr(edtIdEmp1.Text)+', '+QuotedStr(edtCodPlaq.Text)+')');
       ExecSQL;
    end;
    fConvertUtilLinear;
    fConvertResultado;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Update plaqueta set saldoLinear = '+QuotedStr(edtResultado.Text)+' where id = '+QuotedStr(edtCodPlaq.Text)+'');
       ExecSQL;
    end;
    fConvertResultado;
    Saida;
    edtId.Clear; edtEspecie.Clear; edtClass.Clear; cbxTipo.Text := '';
    edtPlaqueta.Clear; edtCodPlaq.Clear; edtIdEspecie.Clear; edtIdClass.Clear;
    FormShow(Sender);
    btnConsClick(Sender);
end;

procedure TfrmSaida.btnConsClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    DecimalSeparator := ',';
    If CheckBox1.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select S.id, S.dataSaida, S.tipo, P.plaqueta, replace(format(P.diametro1,3), ".",",") ''diametro 1'', replace(format(P.diametro2,3), ".",",") ''diametro 2'', '+
          'replace(format(P.comprimento,3), ".",",") ''comprimento'', replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', '+
          'replace(format(S.quantidadeLinear,3), ".",",") ''utilizado ML'', replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*quantidadeLinear*0.7854,3), ".",",") ''utilizado m3'', EM.razaoSocial, E.descricao '+
          'from saida S, plaqueta P, empresa EM, especie E where EM.id = '+QuotedStr(edtIdEmp1.Text)+' and dataSaida = '+QuotedStr(DateToStr(dtpData.Date))+' and S.empresa_id = EM.id and S.plaqueta_id = P.id and E.id = P.especie_id order by S.id');
          Active := True;
          If RecordCount = 0 then begin
            Application.MessageBox('Registro n�o encontrado...','Controle de Toras - Informa��o',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('id').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('razaoSocial').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('dataSaida').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('tipo').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('plaqueta').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('diametro 1').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('diametro 2').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('comprimento').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('volume').FieldName;
             DBGrid1.Columns.Items[8].Width := 60;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('descricao').FieldName;
             DBGrid1.Columns.Items[10].FieldName := FieldByName('utilizado ML').FieldName;
             DBGrid1.Columns.Items[10].Width := 58;
             DBGrid1.Columns.Items[11].FieldName := FieldByName('utilizado m3').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end
    else begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select S.id, S.dataSaida, S.tipo, P.plaqueta, replace(format(P.diametro1,3), ".",",") ''diametro 1'', replace(format(P.diametro2,3), ".",",") ''diametro 2'', '+
          'replace(format(P.comprimento,3), ".",",") ''comprimento'', replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', '+
          'replace(format(S.quantidadeLinear,3), ".",",") ''utilizado ML'', replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*quantidadeLinear*0.7854,3), ".",",") ''utilizado m3'', EM.razaoSocial, E.descricao '+
          'from saida S, plaqueta P, empresa EM, especie E where EM.id = '+QuotedStr(edtIdEmp1.Text)+' and S.empresa_id = EM.id and S.plaqueta_id = P.id and E.id = P.especie_id order by S.id');
          Active := True;
          If RecordCount = 0 then begin
            Application.MessageBox('Registro n�o encontrado...','Controle de Toras - Informa��o',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('id').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('razaoSocial').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('dataSaida').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('tipo').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('plaqueta').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('diametro 1').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('diametro 2').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('comprimento').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('volume').FieldName;
             DBGrid1.Columns.Items[8].Width := 60;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('descricao').FieldName;
             DBGrid1.Columns.Items[10].FieldName := FieldByName('utilizado ML').FieldName;
             DBGrid1.Columns.Items[10].Width := 58;
             DBGrid1.Columns.Items[11].FieldName := FieldByName('utilizado m3').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

procedure TfrmSaida.DBGrid1DblClick(Sender: TObject);
begin
    edtId.Text := DBGrid1.SelectedField.Text;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select S.*, P.*, replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', (custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854), E.descricao, C.descricao''clas'' '+
       'from saida S, plaqueta P, especie E, classificacao C where S.id = '+QuotedStr(edtId.Text)+' and S.plaqueta_id = P.id and E.id = P.especie_id and P.classificacao_id = C.id');
       Active := True;
       edtId.Text := FieldByName('id').AsString;
       edtPlaqueta.Text := FieldByName('plaqueta').AsString;
       edtUtilLinear.Text := FieldByName('quantidadeLinear').AsString;
       cbxTipo.Text := FieldByName('tipo').AsString;
       DateTimePicker1.Date := FieldByName('dataSaida').AsDateTime;
       edtMed1.Text := FieldByName('diametro1').AsString;
       edtMed2.Text := FieldByName('diametro2').AsString;
       edtComprimento.Text := FieldByName('comprimento').AsString;
       edtVolume.Text := FieldByName('volume').AsString;
       edtUtilizado.Text := FieldByName('saldoLinear').AsString;
       edtCustoPlaq.Text := FieldByName('custo').AsString;
       edtPreco.Text := FieldByName('(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)').AsString;
       edtEspecie.Text := FieldByName('descricao').AsString;
       edtClass.Text := FieldByName('clas').AsString;
       edtCodPlaq.Text := FieldByName('plaqueta_id').AsString;
       edtIdEspecie.Text := FieldByName('especie_id').AsString;
       edtIdClass.Text := FieldByName('classificacao_id').AsString;
       edtCustoPlaq.Text := FormatCurr('0.00', StrToCurr(edtCustoPlaq.Text));
       edtPreco.Text := FormatCurr('0.00', StrToCurr(edtPreco.Text));
       edtMed1.Text := FormatFloat('0.000###',(StrToFloat(edtMed1.Text)));
       edtMed2.Text := FormatFloat('0.000###',(StrToFloat(edtMed2.Text)));
       edtComprimento.Text := FormatFloat('0.000###',(StrToFloat(edtComprimento.Text)));
       edtVolume.Text := FormatFloat('0.0###',(StrToFloat(edtVolume.Text)));
       edtUtilizado.Text := FormatFloat('0.000###',(StrToFloat(edtUtilizado.Text)));
       edtUtilLinear.Text := FormatFloat('0.000###',(StrToFloat(edtUtilLinear.Text)));
    end;
    btnConsClick(Sender);
end;

procedure TfrmSaida.cbxEmpresaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpresa.Text)+'');
       Active := True;
       edtIdEmp1.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmSaida.cbxEspecieChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from especie where descricao = '+QuotedStr(edtEspecie.Text)+'');
       Active := True;
       edtIdEspecie.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmSaida.cbxClassifChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from classificacao where descricao = '+QuotedStr(edtClass.Text)+'');
       Active := True;
       edtIdClass.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmSaida.edtPlaquetaExit(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select P.*, (((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854), (custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854), E.descricao, C.descricao''clas'' '+
       'from plaqueta P, especie E, classificacao C where P.plaqueta = '+QuotedStr(edtPlaqueta.Text)+' and P.empresa_id = '+QuotedStr(edtIdEmp1.Text)+' and E.id = P.especie_id and P.classificacao_id = C.id');
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Registro n�o encontrado...','Controle de Toras - Informa��o',MB_OK+MB_ICONINFORMATION);
       end
       else begin
          edtPlaqueta.Text := FieldByName('plaqueta').AsString;
          edtUtilLinear.Text := FieldByName('saldoLinear').AsString;
          edtMed1.Text := FieldByName('diametro1').AsString;
          edtMed2.Text := FieldByName('diametro2').AsString;
          edtComprimento.Text := FieldByName('comprimento').AsString;
          edtVolume.Text := FieldByName('(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)').AsString;
          edtUtilizado.Text := FieldByName('saldoLinear').AsString;
          edtCustoPlaq.Text := FieldByName('custo').AsString;
          edtPreco.Text := FieldByName('(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)').AsString;
          edtEspecie.Text := FieldByName('descricao').AsString;
          edtClass.Text := FieldByName('clas').AsString;
          edtCodPlaq.Text := FieldByName('id').AsString;
          edtIdEspecie.Text := FieldByName('especie_id').AsString;
          edtIdClass.Text := FieldByName('classificacao_id').AsString;
          edtCustoPlaq.Text := FormatCurr('0.00', StrToCurr(edtCustoPlaq.Text));
          edtPreco.Text := FormatCurr('0.00', StrToCurr(edtPreco.Text));
          edtMed1.Text := FormatFloat('0.000###',(StrToFloat(edtMed1.Text)));
          edtMed2.Text := FormatFloat('0.000###',(StrToFloat(edtMed2.Text)));
          edtComprimento.Text := FormatFloat('0.000###',(StrToFloat(edtComprimento.Text)));
          edtVolume.Text := FormatFloat('0.###',(StrToFloat(edtVolume.Text)));
          edtUtilizado.Text := FormatFloat('0.000###',(StrToFloat(edtUtilizado.Text)));
          edtUtilLinear.Text := FormatFloat('0.000###',(StrToFloat(edtUtilLinear.Text)));
       end;
    end;
    edtUtilLinear.SetFocus;
    If edtUtilLinear.Text = '0,000' then begin
       cbxTipo.Enabled := False;
       DateTimePicker1.Enabled := False;
    end;
end;

procedure TfrmSaida.edtUtilLinearExit(Sender: TObject);
var mMed1, mMed2, cComp : Double;
begin
    mMed1 := StrToFloat(edtMed1.Text);
    mMed2 := StrToFloat(edtMed2.Text);
    cComp := StrToFloat(edtUtilLinear.Text);
    Label4.Caption := FloatToStr(((mMed1+mMed2)/2)*((mMed1+mMed2)/2)*cComp*0.7854);
    Label4.Caption := FormatFloat('0,###',(StrToFloat(Label4.Caption)));
    fConvertLabel4;
    edtUtilLinear.Text := FormatFloat('0,###',(StrToFloat(edtUtilLinear.Text)));
    fConvertUtilLinear;
end;

procedure TfrmSaida.Saida;
var vAnterior, vEntrada, vEntradaAtual, vSaida, vResult, vSaldo: Double;
    vPeriodo : String;
    nNovo : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select ea_periodo, ea_anterior, ea_entrada, ea_saida from estoque_acumulativo where especie_id = '+QuotedStr(edtIdEspecie.Text)+' and empresa_id = '+QuotedStr(edtIdEmp1.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
       Active := True;
       vPeriodo := FieldByName('ea_periodo').AsString;
       vEntrada := FieldByName('ea_entrada').AsFloat;
       vSaida := FieldByName('ea_saida').AsFloat;
       vAnterior := FieldByName('ea_anterior').AsFloat;
       vEntradaAtual := StrToFloat(Label4.Caption);
       vResult := vSaida+vEntradaAtual;
       If vPeriodo = Label11.Caption then begin
          DecimalSeparator := '.';
          Active := False;
          SQL.Clear;
          SQL.Add('update estoque_acumulativo set ea_saida = '+QuotedStr(FloatToStr(vResult))+', ea_saldo = '+QuotedStr(FloatToStr((vAnterior+vEntrada)-vResult))+' where empresa_id = '+QuotedStr(edtIdEmp1.Text)+' and especie_id = '+QuotedStr(edtIdEspecie.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
          ExecSQL;
       end;
       If vPeriodo <> Label11.Caption then begin
          Active := False;
          SQL.Clear;
          SQL.Add('select ea_saldo from estoque_acumulativo where especie_id = '+QuotedStr(edtIdEspecie.Text)+' and empresa_id = '+QuotedStr(edtIdEmp1.Text)+' order by ea_cod desc');
          Active := True;
          vSaldo := FieldByName('ea_saldo').AsFloat;
          nNovo := fBuscaCodAcumulativo + 1;
          DecimalSeparator := '.';
          Active := False;
          SQL.Clear;
          SQL.Add('insert into estoque_acumulativo (ea_cod, empresa_id, especie_id, ea_periodo, ea_anterior, ea_entrada, ea_saida, ea_saldo) values ('+IntToStr(nNovo)+', '+QuotedStr(edtIdEmp1.Text)+', '+QuotedStr(edtIdEspecie.Text)+', '+QuotedStr(Label11.Caption)+', '+QuotedStr(FloatToStr(vSaldo))+', ''0.000'', ''0.000'', ''0.000'')');
          ExecSQL;
          DecimalSeparator := ',';
          Active := False;
          SQL.Clear;
          SQL.Add('select ea_periodo, ea_anterior, ea_entrada, ea_saida from estoque_acumulativo where especie_id = '+QuotedStr(edtIdEspecie.Text)+' and empresa_id = '+QuotedStr(edtIdEmp1.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
          Active := True;
          vPeriodo := FieldByName('ea_periodo').AsString;
          vEntrada := FieldByName('ea_entrada').AsFloat;
          vSaida := FieldByName('ea_saida').AsFloat;
          vAnterior := FieldByName('ea_anterior').AsFloat;
          vEntradaAtual := StrToFloat(Label4.Caption);
          vResult := vEntrada+vEntradaAtual;
          If vPeriodo = Label11.Caption then begin
             DecimalSeparator := '.';
             Active := False;
             SQL.Clear;
             SQL.Add('update estoque_acumulativo set ea_saida = '+QuotedStr(FloatToStr(vResult))+', ea_saldo = '+QuotedStr(FloatToStr((vAnterior+vEntrada)-vResult))+' where empresa_id = '+QuotedStr(edtIdEmp1.Text)+' and especie_id = '+QuotedStr(edtIdEspecie.Text)+' and ea_periodo = '+QuotedStr(Label11.Caption)+'');
             ExecSQL;
          end;
       end;
    end;
end;

procedure TfrmSaida.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If odd(dmVendas.ADOQuery1.RecNo) then begin
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


