unit ConsultaEntProd_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, ComCtrls, Jpeg;

type
  TfrmConsultaEntProd = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cbxConsulta: TComboBox;
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
    DBNavigator1: TDBNavigator;
    edtVlTotal: TLabeledEdit;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    btnImprimir: TBitBtn;
    rgpControle: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnImprimirClick(Sender: TObject);
    procedure Foto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaEntProd: TfrmConsultaEntProd;

implementation

uses Carro_Comando_dm, CadProd_frm, ImprimeConsultaEntradaAlimento_frm,
  ImprimeResumoAlimento_frm, DB;

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
    If frmConsultaEntProd.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmConsultaEntProd.rgpControle.ItemIndex = -1 then
       Controle := '';
end;

procedure TfrmConsultaEntProd.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmConsultaEntProd.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := True;
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    edtVlTotal.Text := '0,00';
    cbxConsulta.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmConsultaEntProd.btnExecutarClick(Sender: TObject);
var vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If cbxConsulta.ItemIndex = 0 then begin
       With dmCarroComando.ADOQuery1 do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(ep_vltotal) from entrada_produtos where ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('sum(ep_vltotal)').AsFloat <> 0 then begin
                edtVlTotal.Text := FieldByName('sum(ep_vltotal)').AsString;
                edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
             end
             else begin
                edtVlTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('select EP.ep_cod, EP.ep_dtentrada, P.p_nome, EP.ep_qtd, EP.ep_vlcompra, EP.ep_vlunit, EP.ep_vlfrete, '+
             'EP.ep_vldespesa, EP.ep_vltotal '+
             'from entrada_produtos EP, produtos P where EP.p_cod = P.p_cod and EP.ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+' order by P.p_nome, EP.ep_dtentrada');
             Active := True;
             Open;
             (FieldByName('ep_vlcompra') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vlunit') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vlfrete') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vldespesa') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vltotal') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].FieldName := FieldByName('ep_cod').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'C�digo';
             DBGrid1.Columns.Items[0].Width := 50;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('ep_dtentrada').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Data';
             DBGrid1.Columns.Items[1].Width := 70;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Alimento';
             DBGrid1.Columns.Items[2].Width := 170;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('ep_qtd').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Quantidade';
             DBGrid1.Columns.Items[3].Width := 80;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('ep_vlcompra').FieldName;
             DBGrid1.Columns.Items[4].Title.Caption := 'Valor Compra';
             DBGrid1.Columns.Items[4].Width := 90;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('ep_vlunit').FieldName;
             DBGrid1.Columns.Items[5].Title.Caption := 'Valor Unit�rio';
             DBGrid1.Columns.Items[5].Width := 90;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('ep_vlfrete').FieldName;
             DBGrid1.Columns.Items[6].Title.Caption := 'Valor Frete';
             DBGrid1.Columns.Items[6].Width := 80;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('ep_vldespesa').FieldName;
             DBGrid1.Columns.Items[7].Title.Caption := 'Valor Despesa';
             DBGrid1.Columns.Items[7].Width := 100;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('ep_vltotal').FieldName;
             DBGrid1.Columns.Items[8].Title.Caption := 'Valor Total';
             DBGrid1.Columns.Items[8].Width := 75;
          end;
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(ep_vltotal) from entrada_produtos where ep_dtentrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('sum(ep_vltotal)').AsFloat <> 0 then begin
                edtVlTotal.Text := FieldByName('sum(ep_vltotal)').AsString;
                edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
             end
             else begin
                edtVlTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('select EP.ep_cod, EP.ep_dtentrada, P.p_nome, EP.ep_qtd, EP.ep_vlcompra, EP.ep_vlunit, EP.ep_vlfrete, '+
             'EP.ep_vldespesa, EP.ep_vltotal '+
             'from entrada_produtos EP, produtos P where EP.ep_dtentrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and EP.p_cod = P.p_cod and EP.ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+' order by EP.ep_dtentrada, P.p_nome');
             Active := True;
             Open;
             (FieldByName('ep_vlcompra') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vlunit') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vlfrete') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vldespesa') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('ep_vltotal') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].FieldName := FieldByName('ep_cod').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'C�digo';
             DBGrid1.Columns.Items[0].Width := 50;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('ep_dtentrada').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Data';
             DBGrid1.Columns.Items[1].Width := 70;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('p_nome').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Alimento';
             DBGrid1.Columns.Items[2].Width := 170;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('ep_qtd').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'Quantidade';
             DBGrid1.Columns.Items[3].Width := 80;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('ep_vlcompra').FieldName;
             DBGrid1.Columns.Items[4].Title.Caption := 'Valor Compra';
             DBGrid1.Columns.Items[4].Width := 90;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('ep_vlunit').FieldName;
             DBGrid1.Columns.Items[5].Title.Caption := 'Valor Unit�rio';
             DBGrid1.Columns.Items[5].Width := 90;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('ep_vlfrete').FieldName;
             DBGrid1.Columns.Items[6].Title.Caption := 'Valor Frete';
             DBGrid1.Columns.Items[6].Width := 80;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('ep_vldespesa').FieldName;
             DBGrid1.Columns.Items[7].Title.Caption := 'Valor Despesa';
             DBGrid1.Columns.Items[7].Width := 100;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('ep_vltotal').FieldName;
             DBGrid1.Columns.Items[8].Title.Caption := 'Valor Total';
             DBGrid1.Columns.Items[8].Width := 75;
          end;
       end;
    end;
    If cbxConsulta.ItemIndex = 1 then begin
       With dmCarroComando.ADOQuery1 do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(ep_vltotal) from entrada_produtos where ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('sum(ep_vltotal)').AsFloat <> 0 then begin
                edtVlTotal.Text := FieldByName('sum(ep_vltotal)').AsString;
                edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
             end
             else begin
                edtVlTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('select P.p_nome, sum(EP.ep_qtd), sum(Ep.ep_vltotal), sum(EP.ep_vltotal)/sum(EP.ep_qtd) '+
             'from produtos P, entrada_produtos EP where EP.p_cod = P.p_cod and EP.ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+' group by P.p_nome');
             Active := True;
             Open;
             (FieldByName('sum(Ep.ep_vltotal)') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('sum(EP.ep_vltotal)/sum(EP.ep_qtd)') as TNumericField).DisplayFormat := ',0.000';
             DBGrid1.Columns.Items[0].FieldName := FieldByName('p_nome').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Alimento';
             DBGrid1.Columns.Items[0].Width := 170;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('sum(EP.ep_qtd)').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Quantidade';
             DBGrid1.Columns.Items[1].Width := 80;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('sum(Ep.ep_vltotal)').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Valor Total';
             DBGrid1.Columns.Items[2].Width := 75;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('sum(EP.ep_vltotal)/sum(EP.ep_qtd)').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'M�dia';
             DBGrid1.Columns.Items[3].Width := 50;
          end;
          If CheckBox1.Checked = True then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(ep_vltotal) from entrada_produtos where ep_dtentrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+'');
             Active := True;
             If FieldByName('sum(ep_vltotal)').AsFloat <> 0 then begin
                edtVlTotal.Text := FieldByName('sum(ep_vltotal)').AsString;
                edtVlTotal.Text := FormatCurr(',0.00', StrToCurr(edtVlTotal.Text));
             end
             else begin
                edtVlTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('select P.p_nome, sum(EP.ep_qtd), sum(Ep.ep_vltotal), sum(EP.ep_vltotal)/sum(EP.ep_qtd) '+
             'from produtos P, entrada_produtos EP where ep_dtentrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and EP.p_cod = P.p_cod and ep_ano = '+QuotedStr(vAno)+' and ep_controle = '+QuotedStr(vControle)+' group by P.p_nome');
             Active := True;
             Open;
             (FieldByName('sum(Ep.ep_vltotal)') as TNumericField).DisplayFormat := ',0.00';
             Open;
             (FieldByName('sum(EP.ep_vltotal)/sum(EP.ep_qtd)') as TNumericField).DisplayFormat := ',0.000';
             DBGrid1.Columns.Items[0].FieldName := FieldByName('p_nome').FieldName;
             DBGrid1.Columns.Items[0].Title.Caption := 'Alimento';
             DBGrid1.Columns.Items[0].Width := 170;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('sum(EP.ep_qtd)').FieldName;
             DBGrid1.Columns.Items[1].Title.Caption := 'Quantidade';
             DBGrid1.Columns.Items[1].Width := 80;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('sum(Ep.ep_vltotal)').FieldName;
             DBGrid1.Columns.Items[2].Title.Caption := 'Valor Total';
             DBGrid1.Columns.Items[2].Width := 75;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('sum(EP.ep_vltotal)/sum(EP.ep_qtd)').FieldName;
             DBGrid1.Columns.Items[3].Title.Caption := 'M�dia';
             DBGrid1.Columns.Items[3].Width := 50;
          end;
       end;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmConsultaEntProd.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    frmCadProd.GroupBox4.Enabled := True;
    frmCadProd.btnExcluir.Enabled := True;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from entrada_produtos where ep_cod = '+QuotedStr(Edit1.Text)+'');
       Active := True;
       frmCadProd.edtCodEntrada.Text := FieldByName('ep_cod').AsString;
       frmCadProd.dtpDtEntrada.Date := FieldByName('ep_dtentrada').AsDateTime;
       frmCadProd.edtEntrada.Text := FieldByName('ep_qtd').AsString;
       frmCadProd.edtVlUni.Text := FieldByName('ep_vlunit').AsString;
       frmCadProd.edtVlUni.Text := FormatCurr('0.000', StrToCurr(frmCadProd.edtVlUni.Text));
       frmCadProd.edtVlTot.Text := FieldByName('ep_vltotal').AsString;
       frmCadProd.edtVlTot.Text := FormatCurr(',0.00', StrToCurr(frmCadProd.edtVlTot.Text));
       frmCadProd.edtDespesa.Text := FieldByName('ep_vldespesa').AsString;
       frmCadProd.edtDespesa.Text := FormatCurr(',0.00', StrToCurr(frmCadProd.edtDespesa.Text));
       frmCadProd.edtFrete.Text := FieldByName('ep_vlfrete').AsString;
       frmCadProd.edtFrete.Text := FormatCurr(',0.00', StrToCurr(frmCadProd.edtFrete.Text));
       frmCadProd.edtVlCompra.Text := FieldByName('ep_vlcompra').AsString;
       frmCadProd.edtVlCompra.Text := FormatCurr(',0.00', StrToCurr(frmCadProd.edtVlCompra.Text));
       If FieldByName('ep_controle').AsString = 'P' then begin
          frmCadProd.rgpControle.ItemIndex := 0;
       end
       else begin
          frmCadProd.rgpControle.ItemIndex := 1;
       end;
       frmCadProd.dtpDtEntrada.SetFocus;
    end;
    Close;
end;

procedure TfrmConsultaEntProd.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//    If odd(dmCarroComando.ADOQuery1.RecNo) then begin
//       DBGrid1.Canvas.Font.Color:= clBlack;
//       DBGrid1.Canvas.Brush.Color:= $00D4D4D4;
//    end
//    else begin
//       DBGrid1.Canvas.Font.Color:= clBlack;
//       DBGrid1.Canvas.Brush.Color:= clWhite;
//    end;
//    DBGrid1.Canvas.FillRect(Rect);
//    DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

procedure TfrmConsultaEntProd.btnImprimirClick(Sender: TObject);
begin
    If cbxConsulta.ItemIndex = 0 then begin
       Try
         Application.CreateForm(TqrpConsultaEntradaAlimentos, qrpConsultaEntradaAlimentos);
         Foto;
         btnExecutarClick(Sender);
         qrpConsultaEntradaAlimentos.qrlDataIni.Caption := DateToStr(DateTimePicker1.Date);
         qrpConsultaEntradaAlimentos.qrlDataFim.Caption := DateToStr(DateTimePicker2.Date);
         If Controle = 'P' then begin
            qrpConsultaEntradaAlimentos.QRLabel13.Caption := 'Pasto';
         end;
         If Controle = 'C' then begin
            qrpConsultaEntradaAlimentos.QRLabel13.Caption := 'Confinamento';
         end;
         qrpConsultaEntradaAlimentos.Preview;
       Finally
            qrpConsultaEntradaAlimentos.Free;
       end;
    end;
    If cbxConsulta.ItemIndex = 1 then begin
       Try
         Application.CreateForm(TqrpImprimeResumoAlimento, qrpImprimeResumoAlimento);
         qrpImprimeResumoAlimento.qrlDataIni.Caption := DateToStr(DateTimePicker1.Date);
         qrpImprimeResumoAlimento.qrlDataFim.Caption := DateToStr(DateTimePicker2.Date);
         If Controle = 'P' then begin
              qrpImprimeResumoAlimento.QRLabel3.Caption := 'Pasto';
         end;
         If Controle = 'C' then begin
            qrpImprimeResumoAlimento.QRLabel3.Caption := 'Confinamento';
         end;
         qrpImprimeResumoAlimento.Preview;
       Finally
            qrpImprimeResumoAlimento.Free;
       end;
    end;
end;

procedure TfrmConsultaEntProd.Foto;
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
          qrpConsultaEntradaAlimentos.QRImage1.Picture.Assign(Jpeg);
       end
       else begin
         qrpConsultaEntradaAlimentos.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       qrpConsultaEntradaAlimentos.qrlUsuario.Caption := FieldByName('usuario').AsString;
       qrpConsultaEntradaAlimentos.qrlValorGeral.Caption := frmConsultaEntProd.edtVlTotal.Text;
    end;
end;

end.
