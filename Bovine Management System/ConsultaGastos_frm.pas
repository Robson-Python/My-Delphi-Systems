unit ConsultaGastos_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, Jpeg;

type
  TfrmCosultaGastos = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    Panel4: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    RadioButton1: TRadioButton;
    DBGrid1: TDBGrid;
    edtValorTotal: TLabeledEdit;
    Edit1: TEdit;
    btnImprimir: TBitBtn;
    rgpControle: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Foto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCosultaGastos: TfrmCosultaGastos;

implementation

uses Carro_Comando_dm, ADODB, CadDespesa_frm, ImprimeConsultaGasto_frm, DB;

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
    If frmCosultaGastos.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmCosultaGastos.rgpControle.ItemIndex = -1 then
       Controle := '';
end;

procedure TfrmCosultaGastos.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCosultaGastos.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := True;
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    edtValorTotal.Text := '0,00';
    RadioButton1.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmCosultaGastos.btnExecutarClick(Sender: TObject);
var vAno, vControle : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    vAno := AnoConfinamento;
    vControle := Controle;
    If RadioButton1.Checked = True then begin
       If CheckBox1.Checked = False then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(d_valor) ''Valor'' from despesas where d_ano = '+QuotedStr(vAno)+' and d_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('valor').AsFloat <> 0 then begin
                edtValorTotal.Text := FieldByName('Valor').AsString;
                edtValorTotal.Text := FormatCurr(',0.00', StrToCurr(edtValorTotal.Text));
             end
             else begin
                edtValorTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('Select d_cod ''Código'', d_nome ''Nome da Despesa'', d_data ''Data'', d_valor ''Valor'', d_descr ''Descrição'' from despesas where d_ano = '+QuotedStr(vAno)+' and d_controle = '+QuotedStr(vControle)+' order by d_data, d_nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('Código').FieldName;
             DBGrid1.Columns.Items[0].Width := 50;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('Nome da Despesa').FieldName;
             DBGrid1.Columns.Items[1].Width := 250;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('Data').FieldName;
             DBGrid1.Columns.Items[2].Width := 70;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('Valor').FieldName;
             DBGrid1.Columns.Items[3].Width := 70;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('Descrição').FieldName;
             DBGrid1.Columns.Items[4].Width := 500;
          end;
       end;
       If CheckBox1.Checked = True then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(d_valor) ''Valor'' from despesas where d_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and d_ano = '+QuotedStr(vAno)+' and d_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('valor').AsFloat <> 0 then begin
                edtValorTotal.Text := FieldByName('Valor').AsString;
                edtValorTotal.Text := FormatCurr(',0.00', StrToCurr(edtValorTotal.Text));
             end
             else begin
                edtValorTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('Select d_cod ''Código'', d_nome ''Nome da Despesa'', d_data ''Data'', d_valor ''Valor'', d_descr ''Descrição'' from despesas where d_data between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and d_ano = '+QuotedStr(vAno)+' and d_controle = '+QuotedStr(vControle)+' order by d_data, d_nome');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('Código').FieldName;
             DBGrid1.Columns.Items[0].Width := 50;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('Nome da Despesa').FieldName;
             DBGrid1.Columns.Items[1].Width := 250;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('Data').FieldName;
             DBGrid1.Columns.Items[2].Width := 70;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('Valor').FieldName;
             DBGrid1.Columns.Items[3].Width := 70;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('Descrição').FieldName;
             DBGrid1.Columns.Items[4].Width := 500;
          end;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmCosultaGastos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCosultaGastos.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from despesas where d_cod = '+QuotedStr(Edit1.Text)+'');
       Active := True;
       frmCadDespesas.edtCod.Text := FieldByName('d_cod').AsString;
       frmCadDespesas.edtDespesa.Text := FieldByName('d_nome').AsString;
       frmCadDespesas.dtpData.Date := FieldByName('d_data').AsDateTime;
       frmCadDespesas.edtValor.Text := FieldByName('d_valor').AsString;
       frmCadDespesas.edtValor.Text := FormatCurr(',0.00', StrToCurr(frmCadDespesas.edtValor.Text));
       frmCadDespesas.memoDescr.Text := FieldByName('d_descr').AsString;
       If FieldByName('d_controle').AsString = 'P' then begin
          frmCadDespesas.rgpControle.ItemIndex := 0;
       end
       else begin
          frmCadDespesas.rgpControle.ItemIndex := 1;
       end;
       frmCadDespesas.GroupBox1.SetFocus;
    end;
    Close;
end;

procedure TfrmCosultaGastos.btnImprimirClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TqrpConsultaGasto, qrpConsultaGasto);
      Foto;
      btnExecutarClick(Sender);
      qrpConsultaGasto.qrlDataIni.Caption := DateToStr(DateTimePicker1.Date);
      qrpConsultaGasto.qrlDataFim.Caption := DateToStr(DateTimePicker2.Date);
      If Controle = 'P' then begin
         qrpConsultaGasto.QRLabel9.Caption := 'Pasto';
      end;
      If Controle = 'C' then begin
         qrpConsultaGasto.QRLabel9.Caption := 'Confinamento';
      end;
      qrpConsultaGasto.Preview;
    Finally
         qrpConsultaGasto.Free;
    end;
end;

procedure TfrmCosultaGastos.Foto;
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
         qrpConsultaGasto.QRImage1.Picture.Assign(Jpeg);
       end
       else begin
          qrpConsultaGasto.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       qrpConsultaGasto.qrlUsuario.Caption := FieldByName('usuario').AsString;
       qrpConsultaGasto.qrlValorGeral.Caption := frmCosultaGastos.edtValorTotal.Text;
    end;
end;

end.
