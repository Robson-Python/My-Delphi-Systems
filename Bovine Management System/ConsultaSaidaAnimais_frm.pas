unit ConsultaSaidaAnimais_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, ComCtrls;

type
  TfrmConsultaSaidaAnimais = class(TForm)
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
    RadioGroup1: TRadioGroup;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    edtVlTotal: TLabeledEdit;
    edtValorBoi: TLabeledEdit;
    edtValorVaca: TLabeledEdit;
    edtValorNovilha: TLabeledEdit;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
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
  frmConsultaSaidaAnimais: TfrmConsultaSaidaAnimais;

implementation

uses Carro_Comando_dm, SaidaAnimais_frm;

{$R *.dfm}

function Controle() : String;
begin
    If frmConsultaSaidaAnimais.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmConsultaSaidaAnimais.rgpControle.ItemIndex = -1 then
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

function Despesa : Double;
var vBoi, vVaca, vNovilha : Double;
begin
    vBoi := StrToFloat(frmSaidaAnimais.edtDespesaBoi.Text);
    vVaca := StrToFloat(frmSaidaAnimais.edtDespesaVaca.Text);
    vNovilha := StrToFloat(frmSaidaAnimais.edtDespesaNovilha.Text);
    frmSaidaAnimais.edtDespesa.Text := FloatToStr(vBoi+vVaca+vNovilha);
    frmSaidaAnimais.edtDespesa.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtDespesa.Text));
end;

function Frete : Double;
var vBoi, vVaca, vNovilha : Double;
begin
    vBoi := StrToFloat(frmSaidaAnimais.edtValorFreteBoi.Text);
    vVaca := StrToFloat(frmSaidaAnimais.edtValorFreteVaca.Text);
    vNovilha := StrToFloat(frmSaidaAnimais.edtValorFreteNovilha.Text);
    frmSaidaAnimais.edtFrete.Text := FloatToStr(vBoi+vVaca+vNovilha);
    frmSaidaAnimais.edtFrete.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtFrete.Text));
end;

procedure TfrmConsultaSaidaAnimais.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmConsultaSaidaAnimais.FormShow(Sender: TObject);
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

procedure TfrmConsultaSaidaAnimais.btnExecutarClick(Sender: TObject);
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
             SQL.Add('Select sum(sa_qtdboi), sum(sa_pesototalboi), sum(sa_arrobafrigoboi), sum(sa_qtdvaca), sum(sa_pesototalvaca), sum(sa_arrobafrigovaca), sum(sa_qtdnovilha), sum(sa_pesototalnovilha), sum(sa_arrobafrigonovilha), '+
             'sum(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha), sum(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha) ''arroba geral'', sum(sa_totalgeralarroba) from saida_animais where sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
             Active := True;
             edtValorBoi.Text := FieldByName('sum(sa_pesototalboi)').AsString;
             edtArrobaBoi.Text := FieldByName('sum(sa_arrobafrigoboi)').AsString;
             edtValorVaca.Text := FieldByName('sum(sa_pesototalvaca)').AsString;
             edtArrobaVaca.Text := FieldByName('sum(sa_arrobafrigovaca)').AsString;
             edtValorNovilha.Text := FieldByName('sum(sa_pesototalnovilha)').AsString;
             edtArrobaNovilha.Text := FieldByName('sum(sa_arrobafrigonovilha)').AsString;
             edtVlTotal.Text := FieldByName('sum(sa_totalgeralarroba)').AsString;
             edtArrobaGeral.Text := FieldByName('arroba geral').AsString;
             edtQtdBoi.Text := FieldByName('sum(sa_qtdboi)').AsString;
             edtQtdVaca.Text := FieldByName('sum(sa_qtdvaca)').AsString;
             edtQtdNovilha.Text := FieldByName('sum(sa_qtdnovilha)').AsString;
             edtQtdGeral.Text := FieldByName('sum(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha)').AsString;
             Active := False;
             SQL.Clear;
             SQL.Add('select sa_cod ''cod'', sa_data ''data'', sa_qtdboi+sa_qtdvaca+sa_qtdnovilha ''cabecas'', sa_pesoboi+sa_pesovaca+sa_pesonovilha ''peso vivo'', '+
             '(sa_pesototalboi+sa_pesototalvaca+sa_pesototalnovilha)/(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha) ''valor @'', '+
             'sa_pesofrigoboi+sa_pesofrigovaca+sa_pesofrigonovilha ''frigo'', sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha ''peso @'', '+
             '(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha)/(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha) ''media @'', '+
             '(sa_pesofrigoboi+sa_pesofrigovaca+sa_pesofrigonovilha)/(sa_pesoboi+sa_pesovaca+sa_pesonovilha)*100 ''rend'', '+
             'sa_pesototalboi+sa_pesototalvaca+sa_pesototalnovilha ''valor total @'' from saida_animais saida_animais where sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+' order by sa_data');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('data').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('cabecas').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('peso vivo').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('valor @').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('frigo').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('peso @').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('media @').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('rend').FieldName;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('valor total @').FieldName;
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
                SQL.Add('Select sum(sa_qtdboi), sum(sa_pesototalboi), sum(sa_arrobafrigoboi), sum(sa_qtdvaca), sum(sa_pesototalvaca), sum(sa_arrobafrigovaca), sum(sa_qtdnovilha), sum(sa_pesototalnovilha), sum(sa_arrobafrigonovilha), '+
                'sum(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha), sum(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha) ''arroba geral'', sum(sa_totalgeralarroba) from saida_animais where sa_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
                Active := True;
                edtValorBoi.Text := FieldByName('sum(sa_pesototalboi)').AsString;
                edtArrobaBoi.Text := FieldByName('sum(sa_arrobafrigoboi)').AsString;
                edtValorVaca.Text := FieldByName('sum(sa_pesototalvaca)').AsString;
                edtArrobaVaca.Text := FieldByName('sum(sa_arrobafrigovaca)').AsString;
                edtValorNovilha.Text := FieldByName('sum(sa_pesototalnovilha)').AsString;
                edtArrobaNovilha.Text := FieldByName('sum(sa_arrobafrigonovilha)').AsString;
                edtVlTotal.Text := FieldByName('sum(sa_totalgeralarroba)').AsString;
                edtArrobaGeral.Text := FieldByName('arroba geral').AsString;
                edtQtdBoi.Text := FieldByName('sum(sa_qtdboi)').AsString;
                edtQtdVaca.Text := FieldByName('sum(sa_qtdvaca)').AsString;
                edtQtdNovilha.Text := FieldByName('sum(sa_qtdnovilha)').AsString;
                edtQtdGeral.Text := FieldByName('sum(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha)').AsString;
                Active := False;
                SQL.Clear;
                SQL.Add('select sa_cod ''cod'', sa_data ''data'', sa_qtdboi+sa_qtdvaca+sa_qtdnovilha ''cabecas'', sa_pesoboi+sa_pesovaca+sa_pesonovilha ''peso vivo'', '+
                '(sa_pesototalboi+sa_pesototalvaca+sa_pesototalnovilha)/(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha) ''valor @'', '+
                'sa_pesofrigoboi+sa_pesofrigovaca+sa_pesofrigonovilha ''frigo'', sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha ''peso @'', '+
                '(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha)/(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha) ''media @'', '+
                '(sa_pesofrigoboi+sa_pesofrigovaca+sa_pesofrigonovilha)/(sa_pesoboi+sa_pesovaca+sa_pesonovilha) ''rend'', '+
                'sa_pesototalboi+sa_pesototalvaca+sa_pesototalnovilha ''valor total @'' from saida_animais where sa_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+' order by sa_data');
                Active := True;
                DBGrid1.Columns.Items[0].FieldName := FieldByName('cod').FieldName;
                DBGrid1.Columns.Items[1].FieldName := FieldByName('data').FieldName;
                DBGrid1.Columns.Items[2].FieldName := FieldByName('cabecas').FieldName;
                DBGrid1.Columns.Items[3].FieldName := FieldByName('peso vivo').FieldName;
                DBGrid1.Columns.Items[4].FieldName := FieldByName('valor @').FieldName;
                DBGrid1.Columns.Items[5].FieldName := FieldByName('frigo').FieldName;
                DBGrid1.Columns.Items[6].FieldName := FieldByName('peso @').FieldName;
                DBGrid1.Columns.Items[7].FieldName := FieldByName('media @').FieldName;
                DBGrid1.Columns.Items[8].FieldName := FieldByName('rend').FieldName;
                DBGrid1.Columns.Items[9].FieldName := FieldByName('valor total @').FieldName;
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
          ShortDateFormat := 'dd/mm/yyyy';
       end;
end;

procedure TfrmConsultaSaidaAnimais.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmConsultaSaidaAnimais.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from saida_animais where sa_cod = '+QuotedStr(Edit1.Text)+'');
       Active := True;
       frmSaidaAnimais.edtCodSaida.Text := FieldByName('SA_COD').AsString;
       frmSaidaAnimais.dtpDtSaida.Date := FieldByName('SA_DATA').AsDateTime;
       frmSaidaAnimais.edtQtdBoi.Text := FieldByName('SA_QTDBOI').AsString;
       frmSaidaAnimais.edtPesoBoi.Text := FieldByName('SA_PESOBOI').AsString;
       frmSaidaAnimais.edtPesoBoi.Text := FormatCurr(',0', StrToCurr(frmSaidaAnimais.edtPesoBoi.Text));
       frmSaidaAnimais.edtValorBoi.Text := FieldByName('SA_VALORARROBABOI').AsString;
       frmSaidaAnimais.edtValorBoi.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorBoi.Text));
       frmSaidaAnimais.edtQtdVaca.Text := FieldByName('SA_QTDVACA').AsString;
       frmSaidaAnimais.edtPesoVaca.Text := FieldByName('SA_PESOVACA').AsString;
       frmSaidaAnimais.edtPesoVaca.Text := FormatCurr(',0', StrToCurr(frmSaidaAnimais.edtPesoVaca.Text));
       frmSaidaAnimais.edtValorVaca.Text := FieldByName('SA_VALORARROBAVACA').AsString;
       frmSaidaAnimais.edtValorVaca.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorVaca.Text));
       frmSaidaAnimais.edtQtdNovilha.Text := FieldByName('SA_QTDNOVILHA').AsString;
       frmSaidaAnimais.edtPesoNovilha.Text := FieldByName('SA_PESONOVILHA').AsString;
       frmSaidaAnimais.edtPesoNovilha.Text := FormatCurr(',0', StrToCurr(frmSaidaAnimais.edtPesoNovilha.Text));
       frmSaidaAnimais.edtValorNovilha.Text := FieldByName('SA_VALORARROBANOVILHA').AsString;
       frmSaidaAnimais.edtValorNovilha.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorNovilha.Text));
       frmSaidaAnimais.edtValorGeral.Text := FieldByName('SA_TOTALGERALARROBA').AsString;
       frmSaidaAnimais.edtValorGeral.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorGeral.Text));
       frmSaidaAnimais.edtPesoFrigoBoi.Text := FieldByName('SA_PESOFRIGOBOI').AsString;
       frmSaidaAnimais.edtPesoFrigoBoi.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtPesoFrigoBoi.Text));
       frmSaidaAnimais.edtPesoFrigoArrobaBoi.Text := FieldByName('SA_ARROBAFRIGOBOI').AsString;
//       frmSaidaAnimais.edtPesoFrigoArrobaBoi.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtPesoFrigoArrobaBoi.Text));
       frmSaidaAnimais.edtRendimentoBoi.Text := FieldByName('SA_RENDIMBOI').AsString;
       frmSaidaAnimais.edtValorFrigoBoi.Text := FieldByName('SA_PESOTOTALBOI').AsString;
       frmSaidaAnimais.edtValorFrigoBoi.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorFrigoBoi.Text));
       frmSaidaAnimais.edtValorFreteBoi.Text := FieldByName('SA_FRETEBOI').AsString;
       frmSaidaAnimais.edtValorFreteBoi.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorFreteBoi.Text));
       frmSaidaAnimais.edtDespesaBoi.Text := FieldByName('SA_DESPESABOI').AsString;
       frmSaidaAnimais.edtDespesaBoi.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtDespesaBoi.Text));
       frmSaidaAnimais.edtPesoFrigoVaca.Text := FieldByName('SA_PESOFRIGOVACA').AsString;
       frmSaidaAnimais.edtPesoFrigoVaca.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtPesoFrigoVaca.Text));
       frmSaidaAnimais.edtPesoFrigoArrobaVaca.Text := FieldByName('SA_ARROBAFRIGOVACA').AsString;
//       frmSaidaAnimais.edtPesoFrigoArrobaVaca.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtPesoFrigoArrobaVaca.Text));
       frmSaidaAnimais.edtRendimentoVaca.Text := FieldByName('SA_RENDIMVACA').AsString;
       frmSaidaAnimais.edtValorFrigoVaca.Text := FieldByName('SA_PESOTOTALVACA').AsString;
       frmSaidaAnimais.edtValorFrigoVaca.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorFrigoVaca.Text));
       frmSaidaAnimais.edtValorFreteVaca.Text := FieldByName('SA_FRETEVACA').AsString;
       frmSaidaAnimais.edtValorFreteVaca.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorFreteVaca.Text));
       frmSaidaAnimais.edtDespesaVaca.Text := FieldByName('SA_DESPESAVACA').AsString;
       frmSaidaAnimais.edtDespesaVaca.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtDespesaVaca.Text));
       frmSaidaAnimais.edtPesoFrigoNovilha.Text := FieldByName('SA_PESOFRIGONOVILHA').AsString;
       frmSaidaAnimais.edtPesoFrigoNovilha.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtPesoFrigoNovilha.Text));
       frmSaidaAnimais.edtPesoFrigoArrobaNovilha.Text := FieldByName('SA_ARROBAFRIGONOVILHA').AsString;
//       frmSaidaAnimais.edtPesoFrigoArrobaNovilha.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtPesoFrigoArrobaNovilha.Text));
       frmSaidaAnimais.edtRendimentoNovilha.Text := FieldByName('SA_RENDIMNOVILHA').AsString;
       frmSaidaAnimais.edtValorFrigoNovilha.Text := FieldByName('SA_PESOTOTALNOVILHA').AsString;
       frmSaidaAnimais.edtValorFrigoNovilha.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorFrigoNovilha.Text));
       frmSaidaAnimais.edtValorFreteNovilha.Text := FieldByName('SA_FRETENOVILHA').AsString;
       frmSaidaAnimais.edtValorFreteNovilha.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtValorFreteNovilha.Text));
       frmSaidaAnimais.edtDespesaNovilha.Text := FieldByName('SA_DESPESANOVILHA').AsString;
       frmSaidaAnimais.edtDespesaNovilha.Text := FormatCurr(',0.00', StrToCurr(frmSaidaAnimais.edtDespesaNovilha.Text));
       frmSaidaAnimais.edtMediaBoi.Text := FieldByName('SA_MEDIABOI').AsString;
       frmSaidaAnimais.edtMediaVaca.Text := FieldByName('SA_MEDIAVACA').AsString;
       frmSaidaAnimais.edtMediaNovilha.Text := FieldByName('SA_MEDIANOVILHA').AsString;
       If FieldByName('sa_controle').AsString = 'P' then begin
          frmSaidaAnimais.rgpControle.ItemIndex := 0;
       end
       else begin
          frmSaidaAnimais.rgpControle.ItemIndex := 1;
       end;
       Frete;
       Despesa;
       frmSaidaAnimais.GroupBox1.SetFocus;
       frmSaidaAnimais.GroupBox5.Enabled := True;
    end;
    Close;
    dmCarroComando.DataSource1.Enabled := True;    
end;

procedure TfrmConsultaSaidaAnimais.CheckBox1Click(Sender: TObject);
begin
    DateTimePicker1.SetFocus;
end;

end.
