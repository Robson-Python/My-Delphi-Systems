unit ConsultaDespesa_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, StdCtrls, ComCtrls, Jpeg,
  DB, ADODB;

type
  TfrmConsltaDespesa = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    Shape1: TShape;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    Shape2: TShape;
    DBGrid1: TDBGrid;
    edtVlTotal: TLabeledEdit;
    Edit1: TEdit;
    edtQtdGasto: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    DBNavigator1: TDBNavigator;
    btnImprimir: TBitBtn;
    ADOQuery1: TADOQuery;
    CheckBox1: TCheckBox;
    rgpControle: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnImprimirClick(Sender: TObject);
    procedure Foto;
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsltaDespesa: TfrmConsltaDespesa;

implementation

uses Carro_Comando_dm, Alimentos_frm,
  ImprimeConsultaAlimentos_frm;

{$R *.dfm}

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
    If frmConsltaDespesa.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmConsltaDespesa.rgpControle.ItemIndex = -1 then
       Controle := '';
end;

procedure TfrmConsltaDespesa.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmConsltaDespesa.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    edtVlTotal.Text := '0,00'; edtQtdGasto.Text := '0,00';
    RadioGroup1.ItemIndex := 0;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmConsltaDespesa.btnExecutarClick(Sender: TObject);
var vAno, vControle : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vAno := AnoConfinamento;
    vControle := Controle;
    With dmCarroComando.ADOQuery1 do begin
       If RadioGroup1.ItemIndex = 0 then begin
          If CheckBox1.Checked = False then begin
              DBGrid1.DataSource.Enabled := False;
              Active := False;
              SQL.Clear;
              SQL.Add('select sum(dt_vltotal) from dieta where dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+'');
              Active := True;
              If FieldByName('sum(dt_vltotal)').AsFloat <> 0 then begin
                 edtVlTotal.Text := FieldByName('sum(dt_vltotal)').AsString;
                 edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
              end
              else begin
                edtVlTotal.Text := '0,00';
              end;
              Active := False;
              SQL.Clear;
              SQL.Add('select sum(dt_qtdtotal) from dieta where dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+'');
              Active := True;
              If FieldByName('sum(dt_qtdtotal)').AsFloat <> 0 then begin
                 edtQtdGasto.Text := FieldByName('sum(dt_qtdtotal)').AsString;
                 edtQtdGasto.Text := FormatFloat(',0.##',(StrToFloat(edtQtdGasto.Text)));
              end
              else begin
                edtQtdGasto.Text := '0,00';
              end;
              Active := False;
              SQL.Clear;
              SQL.Add('select dt_coddt, strftime(''%d/%m/%Y'', min(dt_data)) ''inicio'', strftime(''%d/%m/%Y'', max(dt_data)) ''fim'', sum(dt_qtdtotal), sum(dt_vltotal) ''Valor'' from dieta where dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+' group by dt_coddt order by dt_data');
              Active := True;
              DBGrid1.DataSource.Enabled := True;
              DBGrid1.Columns.Items[0].FieldName := FieldByName('dt_coddt').FieldName;
              DBGrid1.Columns.Items[1].FieldName := FieldByName('inicio').FieldName;
              DBGrid1.Columns.Items[2].FieldName := FieldByName('fim').FieldName;
              DBGrid1.Columns.Items[3].FieldName := FieldByName('sum(dt_qtdtotal)').FieldName;
              DBGrid1.Columns.Items[4].FieldName := FieldByName('Valor').FieldName;
              ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If RadioGroup1.ItemIndex = 0 then begin
          If CheckBox1.Checked = True then begin
             DBGrid1.DataSource.Enabled := False;
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(dt_vltotal) from dieta where dt_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('sum(dt_vltotal)').AsFloat <> 0 then begin
                 edtVlTotal.Text := FieldByName('sum(dt_vltotal)').AsString;
                 edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
              end
              else begin
                edtVlTotal.Text := '0,00';
              end;
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(dt_qtdtotal) from dieta where dt_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('sum(dt_qtdtotal)').AsFloat <> 0 then begin
                 edtQtdGasto.Text := FieldByName('sum(dt_qtdtotal)').AsString;
                 edtQtdGasto.Text := FormatFloat(',0.##',(StrToFloat(edtQtdGasto.Text)));
              end
              else begin
                edtQtdGasto.Text := '0,00';
              end;
             Active := False;
             SQL.Clear;
             SQL.Add('select dt_coddt, min(dt_data), max(dt_data), sum(dt_qtdtotal), sum(dt_vltotal) ''Valor'' from dieta where dt_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+' group by dt_coddt order by dt_data');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('dt_coddt').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('min(dt_data)').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('max(dt_data)').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('sum(dt_qtdtotal)').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('Valor').FieldName;
          end;
      end;
      ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmConsltaDespesa.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select dieta.*, strftime(''%d/%m/%Y'', min(dt_data)) ''inicio'', strftime(''%d/%m/%Y'', max(dt_data)) ''fim'', sum(dt_qtdtotal), sum(dt_vltotal) from dieta where dt_coddt = '+QuotedStr(Edit1.Text)+' group by dt_coddt');
       Active := True;
       frmAlimentos.edtCod.Text := FieldByName('dt_coddt').AsString;
       frmAlimentos.dtpData.Date := FieldByName('inicio').AsDateTime;
       frmAlimentos.dtpDataFinal.Date := FieldByName('fim').AsDateTime;
       frmAlimentos.edtQtdKilo.Text := FieldByName('sum(dt_qtdtotal)').AsString;
       frmAlimentos.edtVlTotal.Text := FieldByName('sum(dt_vltotal)').AsString;
       frmAlimentos.edtQtdKilo.Text := FormatFloat('0.##',(StrToFloat(frmAlimentos.edtQtdKilo.Text)));
       frmAlimentos.edtVlTotal.Text := FormatCurr('0.00', StrToCurr(frmAlimentos.edtVlTotal.Text));
       If FieldByName('dt_controle').AsString = 'P' then begin
          frmAlimentos.rgpControle.ItemIndex := 0;
       end
       else begin
          frmAlimentos.rgpControle.ItemIndex := 1;
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('select DT.p_cod, P.p_nome, sum(dt_qtdtotal), DT.dt_vluni ''Valor'', sum(DT.dt_vltotal) ''Total'' from dieta DT, produtos P where dt_coddt = '+QuotedStr(Edit1.Text)+' and DT.p_cod = P.p_cod group by p_nome');
       Active := True;
       frmAlimentos.dbgAlimentos.Columns.Items[0].FieldName := FieldByName('p_cod').FieldName;
       frmAlimentos.dbgAlimentos.Columns.Items[1].FieldName := FieldByName('p_nome').FieldName;
       frmAlimentos.dbgAlimentos.Columns.Items[2].FieldName := FieldByName('sum(dt_qtdtotal)').FieldName;
       frmAlimentos.dbgAlimentos.Columns.Items[3].FieldName := FieldByName('Valor').FieldName;
       frmAlimentos.dbgAlimentos.Columns.Items[4].FieldName := FieldByName('Total').FieldName;
       frmAlimentos.edtDiasEnter(Sender);
       frmAlimentos.GroupBox1.SetFocus;
    end;
    Close;
    dmCarroComando.DataSource1.Enabled := True;    
end;

procedure TfrmConsltaDespesa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmConsltaDespesa.btnImprimirClick(Sender: TObject);
var vAno, vControle : String;
begin
    DBGrid1.DataSource.Enabled := False;
    vAno := AnoConfinamento;
    vControle := Controle;
    Try
      Application.CreateForm(TqrpConsultaAlimentos, qrpConsultaAlimentos);
      Foto;
      btnExecutarClick(Sender);
      DateSeparator := '/';
      ShortDateFormat := 'yyyy-mm-dd';
      With ADOQuery1 do begin
         Active := False;
         SQL.Clear;
         SQL.Add('select P.p_nome, sum(DT.dt_qtdtotal), sum(DT.dt_vltotal), p.p_cod from produtos P, dieta DT where P.p_cod = DT.p_cod and DT.dt_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+' group by P.p_nome order by P.p_nome');
         Active := True;
         ShortDateFormat := 'dd/mm/yyyy';
      end;
      qrpConsultaAlimentos.qrlDataIni.Caption := DateToStr(DateTimePicker1.Date);
      qrpConsultaAlimentos.qrlDataFim.Caption := DateToStr(DateTimePicker2.Date);
      If Controle = 'P' then begin
         qrpConsultaAlimentos.QRLabel7.Caption := 'Pasto';
      end;
      If Controle = 'C' then begin
         qrpConsultaAlimentos.QRLabel7.Caption := 'Confinamento';
      end;
      qrpConsultaAlimentos.Preview;
    Finally
         qrpConsultaAlimentos.Free;
    end;
end;

procedure TfrmConsltaDespesa.Foto;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario, foto from registro where codigo = 1');
       Active := True;
       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          qrpConsultaAlimentos.QRImage1.Picture.Assign(Jpeg);
       end
       else begin
         qrpConsultaAlimentos.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       qrpConsultaAlimentos.qrlUsuario.Caption := FieldByName('usuario').AsString;
       qrpConsultaAlimentos.qrlQtdTotal.Caption := frmConsltaDespesa.edtQtdGasto.Text;
       qrpConsultaAlimentos.qrlValorGeral.Caption := frmConsltaDespesa.edtVlTotal.Text;
    end;
end;

procedure TfrmConsltaDespesa.CheckBox1Click(Sender: TObject);
begin
    DateTimePicker1.SetFocus;
end;

end.

