unit ControleDiario_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DateUtils, Buttons;

type
  TfrmControleDiario = class(TForm)
    GroupBox1: TGroupBox;
    dtpIni: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Label2: TLabel;
    edtDias: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    btnImprimir: TBitBtn;
    btnLimpar: TBitBtn;
    btnSair: TBitBtn;
    btnCalcular: TBitBtn;
    Label3: TLabel;
    cbxLote: TComboBox;
    DateTimePicker1: TDateTimePicker;
    rgpControle: TRadioGroup;
    Edit1: TEdit;
    edtCodLote: TEdit;
    btnPeriodo: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure rgpControleClick(Sender: TObject);
    procedure cbxLoteChange(Sender: TObject);
    procedure btnPeriodoClick(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure dtpIniChange(Sender: TObject);
    procedure dtpFimChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleDiario: TfrmControleDiario;

implementation

uses Carro_Comando_dm, ADODB, DB, ImprimeResumoConf_frm;

{$R *.dfm}

function Lote() : Double;
var Controle, Ano : String;
begin
    If frmControleDiario.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmControleDiario.rgpControle.ItemIndex = -1 then
       Controle := '';
    Ano := frmControleDiario.Edit1.Text;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(lt_qtd) from lotes where lt_data <= '+QuotedStr(DateToStr(frmControleDiario.DateTimePicker1.Date))+' and lt_ano = '+QuotedStr(Ano)+' and lt_controle = '+QuotedStr(Controle)+'');
       Active := True;
       Lote := FieldByName('sum(lt_qtd)').AsFloat;
    end;
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
    If frmControleDiario.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmControleDiario.rgpControle.ItemIndex = -1 then
       Controle := '';
end;

procedure TfrmControleDiario.FormShow(Sender: TObject);
begin
    dtpIni.Date := Date-10;
    dtpFim.Date := Date+10;
    edtDias.Text := '0';
    cbxLote.Text := '';
    LabeledEdit1.Text := '0'; LabeledEdit2.Text := '0';
    LabeledEdit4.Text := '0,00'; LabeledEdit6.Text := '0,000';
    LabeledEdit7.Text := '0'; LabeledEdit8.Text := '0,000'; LabeledEdit9.Text := '0,00';
    LabeledEdit10.Text := '0'; LabeledEdit11.Text := '0'; LabeledEdit12.Text := '0';
    Edit1.Text := AnoConfinamento;
    rgpControle.ItemIndex := -1;
    dtpIni.SetFocus;
end;

procedure TfrmControleDiario.btnImprimirClick(Sender: TObject);
var vEntrada, vSaida, vTotal, vAnimais : Integer;
    vAno, vControle : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vAno := AnoConfinamento;
    vControle := Controle;
    vEntrada := StrToInt(LabeledEdit11.Text);
    vSaida := StrToInt(LabeledEdit12.Text);
    vTotal := vEntrada-vSaida;
    vAnimais := StrToInt(LabeledEdit10.Text);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select P.p_nome, sum(DT.dt_qtdtotal) ''quantidade'', sum(DT.dt_vltotal)/sum(DT.dt_qtdtotal) ''valor uni'', sum(DT.dt_vltotal) ''valor'', p.p_cod from produtos P, dieta DT where P.p_cod = DT.p_cod and DT.dt_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and DT.lt_cod = '+QuotedStr(edtCodLote.Text)+' and DT.dt_ano = '+QuotedStr(vAno)+' and DT.dt_controle = '+QuotedStr(vControle)+' group by P.p_nome order by P.p_nome');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    Try
      Application.CreateForm(TfrmImprimeResumoConf, frmImprimeResumoConf);
      If Controle = 'P' then begin
         frmImprimeResumoConf.QRLabel12.Caption := 'Pasto';
      end;
      If Controle = 'C' then begin
         frmImprimeResumoConf.QRLabel12.Caption := 'Confinamento';
      end;
      frmImprimeResumoConf.qrpResumoConf.Preview;
    Finally
         frmImprimeResumoConf.qrpResumoConf.Free;
    end;
end;

procedure TfrmControleDiario.btnLimparClick(Sender: TObject);
begin
    FormShow(Sender);
    cbxLote.Clear;
end;

procedure TfrmControleDiario.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmControleDiario.btnCalcularClick(Sender: TObject);
var vEntrada, vSaida, vAnimais, vAnimaisSaida, vAnimaisTotais, vDias, vSumAnimais : Integer;
    vAlimento, vAlimentoTotal, vValorAlimento, vVlAlimentoTotal,
    vDespesa, vDespesaTotal, vConsmoBoi, vLote, vLote2, vVlConsumoBoi, vComida : Double;
    vAno, vControle, Result : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    If cbxLote.Text <> '' then begin
       btnCalcular.Cursor := crSQLWait;
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       edtDias.Text := IntToStr(DaysBetween(dtpIni.Date,dtpFim.Date)+1);
       vAlimentoTotal := 0;
       vVlAlimentoTotal := 0;
       vDespesaTotal := 0;
       vDias := StrToInt(edtDias.Text);
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(lt_qtd) from lotes where lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+'');
          Active := True;
          vSumAnimais := FieldByName('sum(lt_qtd)').AsInteger;
          Active := False;
          SQL.Clear;
          SQL.Add('select lt_qtd from lotes where lt_lote = '+QuotedStr(cbxLote.Text)+' and lt_ano = '+QuotedStr(vAno)+' and lt_controle = '+QuotedStr(vControle)+'');
          Active := True;
          vAnimais := FieldByName('lt_qtd').AsInteger;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(SL.sl_qtd), L.lt_lote from saida_lotes SL, lotes L where L.lt_lote = '+QuotedStr(cbxLote.Text)+' and L.lt_ano = '+QuotedStr(vAno)+' and L.lt_controle = '+QuotedStr(vControle)+' and L.lt_cod = SL.lt_cod and SL.sl_data <= '+QuotedStr(DateToStr(dtpFim.Date))+' group by L.lt_lote');
          Active := True;
          Result := FieldByName('sum(SL.sl_qtd)').AsString;
          If Result <> '' then begin
             vAnimaisSaida := FieldByName('sum(SL.sl_qtd)').AsInteger;
          end
          else begin
             vAnimaisSaida := 0;
          end;
          vAnimaisTotais := vAnimais-vAnimaisSaida;
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(dt_qtdtotal) ''consumo'' from dieta where dt_data >= '+QuotedStr(DateToStr(dtpFim.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+'group by dt_data');
          Active := True;
          vComida := FieldByName('consumo').AsFloat;
          If vComida = 0 then begin
             Application.MessageBox('Não existe movimento para este lote no período consultado.','Omega - Aviso',MB_OK+MB_ICONINFORMATION);
             FormShow(Sender);
          end
          else begin
             If vAnimais = 0 then begin
                Application.MessageBox('Não existe movimento para este lote no período consultado.','Omega - Aviso',MB_OK+MB_ICONINFORMATION);
                FormShow(Sender);
             end
             else begin
                While DateTimePicker1.Date < dtpFim.Date do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('select sum(dt_qtdtotal) ''consumo'', sum(dt_vltotal) ''valor'' from dieta where dt_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+' group by dt_data');
                   Active := True;
                   vAlimento := FieldByName('consumo').AsFloat;
                   vValorAlimento := FieldByName('valor').AsFloat;
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
                   DateTimePicker1.Date := DateTimePicker1.Date+1;
                end;
                LabeledEdit1.Text := FloatToStr(((vAlimentoTotal/vSumAnimais)*vAnimais)/vDias);
                LabeledEdit2.Text := FloatToStr((vAlimentoTotal/vSumAnimais)*vAnimais);
                LabeledEdit9.Text := FloatToStr(((vVlAlimentoTotal/vSumAnimais)*vAnimais)/vDias);
                LabeledEdit4.Text := FloatToStr((vVlAlimentoTotal/vSumAnimais)*vAnimais);
                LabeledEdit11.Text := FloatToStr(vAnimais);
                LabeledEdit12.Text := FloatToStr(vSaida);
                LabeledEdit10.Text := FloatToStr(vAnimais-vSaida);
                LabeledEdit6.Text := FloatToStr(((vVlAlimentoTotal/vSumAnimais)*vAnimais)/((vAlimentoTotal/vSumAnimais)*vAnimais));
                LabeledEdit7.Text := FloatToStr(((vAlimentoTotal/vSumAnimais)*vAnimais)/vDias/vAnimais);
                LabeledEdit8.Text := FloatToStr(((vVlAlimentoTotal/vSumAnimais)*vAnimais)/vDias/vAnimais);
                LabeledEdit1.Text := FormatFloat(',0.##',(StrToFloat(LabeledEdit1.Text)));
                LabeledEdit2.Text := FormatFloat(',0.##',(StrToFloat(LabeledEdit2.Text)));
                LabeledEdit4.Text := FormatCurr(',0.00', StrToCurr(LabeledEdit4.Text));
                LabeledEdit6.Text := FormatCurr('0.000', StrToCurr(LabeledEdit6.Text));
                LabeledEdit7.Text := FormatFloat(',0.###',(StrToFloat(LabeledEdit7.Text)));
                LabeledEdit8.Text := FormatCurr('0.000', StrToCurr(LabeledEdit8.Text));
                LabeledEdit9.Text := FormatCurr(',0.00', StrToCurr(LabeledEdit9.Text));
                DateTimePicker1.Date := dtpIni.Date;
                ShortDateFormat := 'yyyy-mm-dd';
             end;
          end;
       end;
       btnCalcular.Cursor := crHandPoint;
    end
    else begin
       Application.MessageBox('O campo Lote não pode estar vazio!','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmControleDiario.CheckBox1Click(Sender: TObject);
begin
    dtpIni.SetFocus;
end;

procedure TfrmControleDiario.rgpControleClick(Sender: TObject);
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
end;

procedure TfrmControleDiario.cbxLoteChange(Sender: TObject);
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

procedure TfrmControleDiario.btnPeriodoClick(Sender: TObject);
var vAno, vControle : String;
begin
    If cbxLote.Text <> '' then begin
       vAno := AnoConfinamento;
       vControle := Controle;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select strftime(''%d/%m/%Y'', min(dt_data)) ''inicio'', strftime(''%d/%m/%Y'', max(dt_data)) ''fim'' from dieta where dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+'');
          Active := True;
          dtpIni.Date := FieldByName('inicio').AsDateTime;
          dtpFim.Date := FieldByName('fim').AsDateTime;
          DateTimePicker1Change(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo Lote não pode estar vazio!','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmControleDiario.DateTimePicker1Change(Sender: TObject);
begin
    DateTimePicker1.Date := dtpIni.Date;
end;

procedure TfrmControleDiario.dtpIniChange(Sender: TObject);
begin
    DateTimePicker1Change(Sender);
end;

procedure TfrmControleDiario.dtpFimChange(Sender: TObject);
begin
    DateTimePicker1Change(Sender);
end;

end.





























