unit ConsultaEntradaAnimais_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, ComCtrls;

type
  TfrmConsultaEntradaAnimais = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    Edit1: TEdit;
    Panel2: TPanel;
    edtVlTotal: TLabeledEdit;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    edtValorBoi: TLabeledEdit;
    edtValorVaca: TLabeledEdit;
    edtValorNovilha: TLabeledEdit;
    DBNavigator1: TDBNavigator;
    edtArrobaBoi: TLabeledEdit;
    edtArrobaVaca: TLabeledEdit;
    edtArrobaNovilha: TLabeledEdit;
    edtArrobaGeral: TLabeledEdit;
    edtQtdBoi: TLabeledEdit;
    edtQtdVaca: TLabeledEdit;
    edtQtdNovilha: TLabeledEdit;
    edtQtdGeral: TLabeledEdit;
    rgpControle: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaEntradaAnimais: TfrmConsultaEntradaAnimais;

implementation

uses Carro_Comando_dm, EntradaAnimais_frm, DB;

{$R *.dfm}

function Controle() : String;
begin
    If frmConsultaEntradaAnimais.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmConsultaEntradaAnimais.rgpControle.ItemIndex = -1 then
       Controle := '';
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

procedure TfrmConsultaEntradaAnimais.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmConsultaEntradaAnimais.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    edtVlTotal.Text := '0,00'; edtArrobaGeral.Text := '0';
    edtValorBoi.Text := '0,00'; edtArrobaBoi.Text := '0';
    edtValorVaca.Text := '0,00'; edtArrobaVaca.Text := '0';
    edtValorNovilha.Text := '0,00'; edtArrobaNovilha.Text := '0';
    RadioGroup1.ItemIndex := 0;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmConsultaEntradaAnimais.btnExecutarClick(Sender: TObject);
var vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       If CheckBox1.Checked = False then begin
          If RadioGroup1.ItemIndex = 0 then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(ea_qtdboi), sum(ea_vltotalboi), sum(ea_pesoarrobaboi), sum(ea_qtdvaca), sum(ea_vltotalvaca), sum(ea_pesoarrobavaca), sum(ea_qtdnovilha), sum(ea_vltotalnovilha), sum(ea_pesoarrobanovilha), '+
             'sum(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha), sum(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha) ''arroba geral'', sum(ea_valorgeral) from entrada_animais where ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
             Active := True;
             edtValorBoi.Text := FieldByName('sum(ea_vltotalboi)').AsString;
             edtArrobaBoi.Text := FieldByName('sum(ea_pesoarrobaboi)').AsString;
             edtValorVaca.Text := FieldByName('sum(ea_vltotalvaca)').AsString;
             edtArrobaVaca.Text := FieldByName('sum(ea_pesoarrobavaca)').AsString;
             edtValorNovilha.Text := FieldByName('sum(ea_vltotalnovilha)').AsString;
             edtArrobaNovilha.Text := FieldByName('sum(ea_pesoarrobanovilha)').AsString;
             edtVlTotal.Text := FieldByName('sum(ea_valorgeral)').AsString;
             edtArrobaGeral.Text := FieldByName('arroba geral').AsString;
             edtQtdBoi.Text := FieldByName('sum(ea_qtdboi)').AsString;
             edtQtdVaca.Text := FieldByName('sum(ea_qtdvaca)').AsString;
             edtQtdNovilha.Text := FieldByName('sum(ea_qtdnovilha)').AsString;
             edtQtdGeral.Text := FieldByName('sum(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha)').AsString;
             Active := False;
             SQL.Clear;
             SQL.Add('select ea_cod ''cod'', ea_data ''data'', ea_qtdboi+ea_qtdvaca+ea_qtdnovilha ''cabecas'', ea_pesoboi+ea_pesovaca+ea_pesonovilha ''peso vivo'', ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha '+
             '''peso @'', (ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha)/(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha) ''media @'', '+
             '(ea_vltotalboi+ea_vltotalvaca+ea_vltotalnovilha)/(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha) ''valor @'', '+
             'ea_vltotalboi+ea_vltotalvaca+ea_vltotalnovilha ''valor total @'' from entrada_animais where ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+' order by ea_data');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('data').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('cabecas').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('peso vivo').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('peso @').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('media @').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('valor @').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('valor total @').FieldName;
             If dmCarroComando.ADOQuery1.RecordCount <> 0 then begin
                edtValorBoi.Text := FormatCurr(',0.00', StrToCurr(edtValorBoi.Text));
                edtValorVaca.Text := FormatCurr(',0.00', StrToCurr(edtValorVaca.Text));
                edtValorNovilha.Text := FormatCurr(',0.00', StrToCurr(edtValorNovilha.Text));
                edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
             end
             else begin
                edtArrobaBoi.Text := '0';
                edtArrobaVaca.Text := '0';
                edtArrobaNovilha.Text := '0';
                edtArrobaGeral.Text := '0';
                edtValorBoi.Text := '0,00';
                edtValorVaca.Text := '0,00';
                edtValorNovilha.Text := '0,00';
                edtVlTotal.Text := '0,00';
             end;
          end;
       end;
       If CheckBox1.Checked = True then begin
          If RadioGroup1.ItemIndex = 0 then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(ea_qtdboi), sum(ea_vltotalboi), sum(ea_pesoarrobaboi), sum(ea_qtdvaca), sum(ea_vltotalvaca), sum(ea_pesoarrobavaca), sum(ea_qtdnovilha), sum(ea_vltotalnovilha), sum(ea_pesoarrobanovilha), '+
             'sum(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha), sum(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha) ''arroba geral'', sum(ea_valorgeral) from entrada_animais where ea_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
             Active := True;
             edtValorBoi.Text := FieldByName('sum(ea_vltotalboi)').AsString;
             edtArrobaBoi.Text := FieldByName('sum(ea_pesoarrobaboi)').AsString;
             edtValorVaca.Text := FieldByName('sum(ea_vltotalvaca)').AsString;
             edtArrobaVaca.Text := FieldByName('sum(ea_pesoarrobavaca)').AsString;
             edtValorNovilha.Text := FieldByName('sum(ea_vltotalnovilha)').AsString;
             edtArrobaNovilha.Text := FieldByName('sum(ea_pesoarrobanovilha)').AsString;
             edtVlTotal.Text := FieldByName('sum(ea_valorgeral)').AsString;
             edtArrobaGeral.Text := FieldByName('arroba geral').AsString;
             edtQtdBoi.Text := FieldByName('sum(ea_qtdboi)').AsString;
             edtQtdVaca.Text := FieldByName('sum(ea_qtdvaca)').AsString;
             edtQtdNovilha.Text := FieldByName('sum(ea_qtdnovilha)').AsString;
             edtQtdGeral.Text := FieldByName('sum(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha)').AsString;
             Active := False;
             SQL.Clear;
             SQL.Add('select ea_cod ''cod'', ea_data ''data'', ea_qtdboi+ea_qtdvaca+ea_qtdnovilha ''cabecas'', ea_pesoboi+ea_pesovaca+ea_pesonovilha ''peso vivo'', ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha '+
             '''peso @'', (ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha)/(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha) ''media @'', '+
             '(ea_vltotalboi+ea_vltotalvaca+ea_vltotalnovilha)/(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha) ''valor @'', '+
             'ea_vltotalboi+ea_vltotalvaca+ea_vltotalnovilha ''valor total @'' from entrada_animais where ea_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+' order by ea_data');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('data').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('cabecas').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('peso vivo').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('peso @').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('media @').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('valor @').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('valor total @').FieldName;
             If dmCarroComando.ADOQuery1.RecordCount <> 0 then begin
                edtValorBoi.Text := FormatCurr(',0.00', StrToCurr(edtValorBoi.Text));
                edtValorVaca.Text := FormatCurr(',0.00', StrToCurr(edtValorVaca.Text));
                edtValorNovilha.Text := FormatCurr(',0.00', StrToCurr(edtValorNovilha.Text));
                edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
             end
             else begin
                edtArrobaBoi.Text := '0';
                edtArrobaVaca.Text := '0';
                edtArrobaNovilha.Text := '0';
                edtArrobaGeral.Text := '0';
                edtValorBoi.Text := '0,00';
                edtValorVaca.Text := '0,00';
                edtValorNovilha.Text := '0,00';
                edtVlTotal.Text := '0,00';
                edtQtdBoi.Text := '0';
                edtQtdVaca.Text := '0';
                edtQtdNovilha.Text := '0';
                edtQtdGeral.Text := '0';
             end;
          end;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmConsultaEntradaAnimais.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If odd(dmCarroComando.ADOQuery1.RecNo) then begin
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

procedure TfrmConsultaEntradaAnimais.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from entrada_animais where ea_cod = '+QuotedStr(Edit1.Text)+'');
       Active := True;
       frmEntradaAnimais.edtCodEntrada.Text := FieldByName('EA_COD').AsString;
       frmEntradaAnimais.dtpDtEntrada.Date := FieldByName('EA_DATA').AsDateTime;
       frmEntradaAnimais.edtQtdBoi.Text := FieldByName('EA_QTDBOI').AsString;
       frmEntradaAnimais.edtPesoBoi.Text := FieldByName('EA_PESOBOI').AsString;
       frmEntradaAnimais.edtPesoBoi.Text := FormatCurr(',0', StrToCurr(frmEntradaAnimais.edtPesoBoi.Text));
       frmEntradaAnimais.edtPesoTotalBoi.Text := FieldByName('EA_PESOARROBABOI').AsString;
       frmEntradaAnimais.edtPesoTotalBoi.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtPesoTotalBoi.Text));
       frmEntradaAnimais.edtMediaBoi.Text := FieldByName('EA_MEDIAARROBABOI').AsString;
       frmEntradaAnimais.edtValorBoi.Text := FieldByName('EA_VALORARROBABOI').AsString;
       frmEntradaAnimais.edtValorBoi.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorBoi.Text));
       frmEntradaAnimais.edtValorTotalBoi.Text := FieldByName('EA_VLTOTALARROBABOI').AsString;
       frmEntradaAnimais.edtValorTotalBoi.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorTotalBoi.Text));
       frmEntradaAnimais.edtValorFreteBoi.Text := FieldByName('EA_VLFRETEBOI').AsString;
       frmEntradaAnimais.edtValorFreteBoi.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorFreteBoi.Text));
       frmEntradaAnimais.edtDespesaBoi.Text := FieldByName('EA_VLDESPESABOI').AsString;
       frmEntradaAnimais.edtDespesaBoi.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtDespesaBoi.Text));
       frmEntradaAnimais.edtVlTotalBoi.Text := FieldByName('EA_VLTOTALBOI').AsString;
       frmEntradaAnimais.edtVlTotalBoi.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtVlTotalBoi.Text));
       frmEntradaAnimais.edtValorGeralBoi.Text := FieldByName('EA_VLGERALBOI').AsString;
       frmEntradaAnimais.edtValorGeralBoi.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorGeralBoi.Text));
       frmEntradaAnimais.edtQtdVaca.Text := FieldByName('EA_QTDVACA').AsString;
       frmEntradaAnimais.edtPesoVaca.Text := FieldByName('EA_PESOVACA').AsString;
       frmEntradaAnimais.edtPesoVaca.Text := FormatCurr(',0', StrToCurr(frmEntradaAnimais.edtPesoVaca.Text));
       frmEntradaAnimais.edtPesoTotalVaca.Text := FieldByName('EA_PESOARROBAVACA').AsString;
       frmEntradaAnimais.edtPesoTotalVaca.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtPesoTotalVaca.Text));
       frmEntradaAnimais.edtMediaVaca.Text:= FieldByName('EA_MEDIAARROBAVACA').AsString;
       frmEntradaAnimais.edtValorVaca.Text := FieldByName('EA_VALORARROBAVACA').AsString;
       frmEntradaAnimais.edtValorVaca.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorVaca.Text));
       frmEntradaAnimais.edtValorTotalVaca.Text := FieldByName('EA_VLTOTALARROBAVACA').AsString;
       frmEntradaAnimais.edtValorTotalVaca.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorTotalVaca.Text));
       frmEntradaAnimais.edtValorFreteVaca.Text := FieldByName('EA_VLFRETEVACA').AsString;
       frmEntradaAnimais.edtValorFreteVaca.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorFreteVaca.Text));
       frmEntradaAnimais.edtDespesaVaca.Text := FieldByName('EA_VLDESPESAVACA').AsString;
       frmEntradaAnimais.edtDespesaVaca.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtDespesaVaca.Text));
       frmEntradaAnimais.edtVlTotalVaca.Text := FieldByName('EA_VLTOTALVACA').AsString;
       frmEntradaAnimais.edtVlTotalVaca.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtVlTotalVaca.Text));
       frmEntradaAnimais.edtValorGeralVaca.Text := FieldByName('EA_VLGERALVACA').AsString;
       frmEntradaAnimais.edtValorGeralVaca.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorGeralVaca.Text));
       frmEntradaAnimais.edtQtdNovilha.Text := FieldByName('EA_QTDNOVILHA').AsString;
       frmEntradaAnimais.edtPesoNovilha.Text := FieldByName('EA_PESONOVILHA').AsString;
       frmEntradaAnimais.edtPesoNovilha.Text := FormatCurr(',0', StrToCurr(frmEntradaAnimais.edtPesoNovilha.Text));
       frmEntradaAnimais.edtPesoTotalNovilha.Text := FieldByName('EA_PESOARROBANOVILHA').AsString;
       frmEntradaAnimais.edtPesoTotalNovilha.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtPesoTotalNovilha.Text));
       frmEntradaAnimais.edtMediaNovilha.Text := FieldByName('EA_MEDIAARROBANOVILHA').AsString;
       frmEntradaAnimais.edtValorNovilha.Text := FieldByName('EA_VALORARROBANOVILHA').AsString;
       frmEntradaAnimais.edtValorNovilha.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorNovilha.Text));
       frmEntradaAnimais.edtValorTotalNovilha.Text := FieldByName('EA_VLTOTALARROBANOVILHA').AsString;
       frmEntradaAnimais.edtValorTotalNovilha.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorTotalNovilha.Text));
       frmEntradaAnimais.edtValorFreteNovilha.Text := FieldByName('EA_VLFRETENOVILHA').AsString;
       frmEntradaAnimais.edtValorFreteNovilha.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorFreteNovilha.Text));
       frmEntradaAnimais.edtDespesaNovilha.Text := FieldByName('EA_VLDESPESANOVILHA').AsString;
       frmEntradaAnimais.edtDespesaNovilha.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtDespesaNovilha.Text));
       frmEntradaAnimais.edtVlTotalNovilha.Text := FieldByName('EA_VLTOTALNOVILHA').AsString;
       frmEntradaAnimais.edtVlTotalNovilha.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtVlTotalNovilha.Text));
       frmEntradaAnimais.edtValorGeralNovilha.Text := FieldByName('EA_VLGERALNOVILHA').AsString;
       frmEntradaAnimais.edtValorGeralNovilha.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorGeralNovilha.Text));
       frmEntradaAnimais.edtValorGeral.Text := FieldByName('EA_VALORGERAL').AsString;
       frmEntradaAnimais.edtValorGeral.Text := FormatCurr(',0.00', StrToCurr(frmEntradaAnimais.edtValorGeral.Text));
       frmEntradaAnimais.edtVendedor.Text := FieldByName('EA_VENDEDOR').AsString;
       If FieldByName('ea_controle').AsString = 'P' then begin
          frmEntradaAnimais.rgpControle.ItemIndex := 0;
       end
       else begin
          frmEntradaAnimais.rgpControle.ItemIndex := 1;
       end;
       frmEntradaAnimais.GroupBox1.SetFocus;
    end;
    Close;
end;

procedure TfrmConsultaEntradaAnimais.CheckBox1Click(Sender: TObject);
begin
    DateTimePicker1.SetFocus;
end;

end.
