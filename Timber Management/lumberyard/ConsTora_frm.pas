unit ConsTora_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, ADODB,
  DBCtrls;

type
  TfrmConsTora = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtIdEmp1: TEdit;
    cbxEmpresa: TComboBox;
    edtPlaqueta: TLabeledEdit;
    btnExecutar: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    edtPlaq2: TLabeledEdit;
    edtMed2: TLabeledEdit;
    edtComprimento: TLabeledEdit;
    edtVolume: TLabeledEdit;
    edtCustoPlaq: TLabeledEdit;
    edtPreco: TLabeledEdit;
    edtM3Utilizada: TLabeledEdit;
    edtMed1: TLabeledEdit;
    edtIdEspecie: TEdit;
    edtIdClass: TEdit;
    DateTimePicker1: TDateTimePicker;
    edtId: TLabeledEdit;
    edtEspecie: TEdit;
    edtClass: TEdit;
    edtRomaneio: TEdit;
    btnFechar: TBitBtn;
    edtEmpresa: TEdit;
    Label4: TLabel;
    edtIdEmp2: TEdit;
    Label5: TLabel;
    edtMLUtiliz: TLabeledEdit;
    edtM3Disp: TLabeledEdit;
    edtMLDisp: TLabeledEdit;
    DBGrid2: TDBGrid;
    CheckBox1: TCheckBox;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxEmpresaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Saida;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsTora: TfrmConsTora;

implementation

uses Carro_Comando_dm;

{$R *.dfm}

procedure TfrmConsTora.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsTora.FormCreate(Sender: TObject);
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

procedure TfrmConsTora.cbxEmpresaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpresa.Text)+'');
       Active := True;
       edtIdEmp1.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmConsTora.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date;
    dmVendas.DataSource1.Enabled := False;
end;

procedure TfrmConsTora.btnExecutarClick(Sender: TObject);
begin
    dmVendas.DataSource1.Enabled := True;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If CheckBox1.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select P.id, P.plaqueta, P.dataEntrada, P.romaneio, replace(format(P.diametro1,3), ".",",") ''diametro1'', replace(format(P.diametro2,3), ".",",") ''diametro2'', replace(format(P.comprimento,3), ".",",") ''comprimento'', '+
          'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', replace(format(P.custo,2), ".",",") ''custo'', '+
          'replace(format(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,2), ".",",") ''valor'', '+
          'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854,3), ".",",") ''m3 utilizado'', '+
          'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854),3), ".",",") ''m3 disp'', '+
          'replace(format(P.comprimento-P.saldoLinear,3), ".",",") ''ml utilizado'', '+
          'replace(format(P.saldoLinear,3), ".",",") ''ml disponivel'', EM.razaoSocial, C.descricao ''cla'', E.descricao '+
          'from plaqueta P, empresa EM, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp1.Text)+' and P.plaqueta = '+QuotedStr(edtPlaqueta.Text)+' and EM.id = P.empresa_id and E.id = P.especie_id and P.classificacao_id = C.id group by P.id');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('id').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('razaoSocial').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('plaqueta').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('dataEntrada').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('romaneio').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('descricao').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('cla').FieldName;
          DBGrid1.Columns.Items[7].FieldName := FieldByName('diametro1').FieldName;
          DBGrid1.Columns.Items[8].FieldName := FieldByName('diametro2').FieldName;
          DBGrid1.Columns.Items[9].FieldName := FieldByName('comprimento').FieldName;
          DBGrid1.Columns.Items[10].FieldName := FieldByName('volume').FieldName;
          DBGrid1.Columns.Items[11].FieldName := FieldByName('custo').FieldName;
          DBGrid1.Columns.Items[11].Width := 60;
          DBGrid1.Columns.Items[12].FieldName := FieldByName('valor').FieldName;
          DBGrid1.Columns.Items[13].FieldName := FieldByName('m3 utilizado').FieldName;
          DBGrid1.Columns.Items[14].FieldName := FieldByName('m3 disp').FieldName;
          DBGrid1.Columns.Items[15].FieldName := FieldByName('ml utilizado').FieldName;
          DBGrid1.Columns.Items[16].FieldName := FieldByName('ml disponivel').FieldName;
          DBGrid1.Columns.Items[16].Width := 60;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
    end
    else begin
       dmVendas.DataSource1.Enabled := False;
       If edtIdEmp1.Text <> '' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select P.id, P.plaqueta, P.dataEntrada, P.romaneio, replace(format(P.diametro1,3), ".",",") ''diametro1'', replace(format(P.diametro2,3), ".",",") ''diametro2'', replace(format(P.comprimento,3), ".",",") ''comprimento'', '+
             'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', replace(format(P.custo,2), ".",",") ''custo'', '+
             'replace(format(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,2), ".",",") ''valor'', '+
             'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854,3), ".",",") ''m3 utilizado'', '+
             'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854),3), ".",",") ''m3 disp'', '+
             'replace(format(P.comprimento-P.saldoLinear,3), ".",",") ''ml utilizado'', '+
             'replace(format(P.saldoLinear,3), ".",",") ''ml disponivel'', EM.razaoSocial, C.descricao ''cla'', E.descricao '+
             'from plaqueta P, empresa EM, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp1.Text)+' and EM.id = P.empresa_id and E.id = P.especie_id and P.classificacao_id = C.id group by P.id');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('id').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('razaoSocial').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('plaqueta').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('dataEntrada').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('romaneio').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('descricao').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('cla').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('diametro1').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('diametro2').FieldName;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('comprimento').FieldName;
             DBGrid1.Columns.Items[10].FieldName := FieldByName('volume').FieldName;
             DBGrid1.Columns.Items[11].FieldName := FieldByName('custo').FieldName;
             DBGrid1.Columns.Items[11].Width := 60;
             DBGrid1.Columns.Items[12].FieldName := FieldByName('valor').FieldName;
             DBGrid1.Columns.Items[13].FieldName := FieldByName('m3 utilizado').FieldName;
             DBGrid1.Columns.Items[14].FieldName := FieldByName('m3 disp').FieldName;
             DBGrid1.Columns.Items[15].FieldName := FieldByName('ml utilizado').FieldName;
             DBGrid1.Columns.Items[16].FieldName := FieldByName('ml disponivel').FieldName;
             DBGrid1.Columns.Items[16].Width := 60;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

procedure TfrmConsTora.DBGrid1DblClick(Sender: TObject);
begin
    edtId.Text := DBGrid1.SelectedField.Text;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select P.*, replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*saldoLinear*0.7854,3), ".",",") ''m3 disp'', '+
       'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854,3), ".",",") ''volume'', (custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854), '+
       'replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854,3), ".",",") ''m3 util'', '+
       'replace(format(P.comprimento-P.saldoLinear,3), ".",",") ''ml utilizada'', EM.razaoSocial, C.descricao ''cla'', E.descricao from plaqueta P, empresa EM, especie E, classificacao C where P.id = '+QuotedStr(edtId.Text)+' and EM.id = P.empresa_id and E.id = P.especie_id and P.classificacao_id = C.id group by P.id');
       Active := True;
       edtPlaq2.Text := FieldByName('plaqueta').AsString;
       edtIdEmp2.Text := FieldByName('empresa_id').AsString;
       edtEmpresa.Text := FieldByName('razaoSocial').AsString;
       edtIdEspecie.Text := FieldByName('especie_id').AsString;
       edtEspecie.Text := FieldByName('descricao').AsString;
       edtIdClass.Text := FieldByName('classificacao_id').AsString;
       edtClass.Text := FieldByName('cla').AsString;
       DateTimePicker1.Date := FieldByName('dataEntrada').AsDateTime;
       edtRomaneio.Text := FieldByName('romaneio').AsString;
       edtM3Utilizada.Text := FieldByName('m3 util').AsString;
       edtM3Disp.Text := FieldByName('m3 disp').AsString;
       edtMLUtiliz.Text := FieldByName('ml utilizada').AsString;
       edtMLDisp.Text := FieldByName('saldoLinear').AsString;
       edtMed1.Text := FieldByName('diametro1').AsString;
       edtMed2.Text := FieldByName('diametro2').AsString;
       edtComprimento.Text := FieldByName('comprimento').AsString;
       edtVolume.Text := FieldByName('volume').AsString;
       edtCustoPlaq.Text := FieldByName('custo').AsString;
       edtPreco.Text := FieldByName('(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)').AsString;
       edtCustoPlaq.Text := FormatCurr('0.00', StrToCurr(edtCustoPlaq.Text));
       edtPreco.Text := FormatCurr('0.00', StrToCurr(edtPreco.Text));
       edtMed1.Text := FormatFloat('0.000###',(StrToFloat(edtMed1.Text)));
       edtMed2.Text := FormatFloat('0.000###',(StrToFloat(edtMed2.Text)));
       edtComprimento.Text := FormatFloat('0.000###',(StrToFloat(edtComprimento.Text)));
       edtVolume.Text := FormatFloat('0.000##',(StrToFloat(edtVolume.Text)));
       edtM3Utilizada.Text := FormatFloat('0.000##',(StrToFloat(edtM3Utilizada.Text)));
       edtM3Disp.Text := FormatFloat('0.000##',(StrToFloat(edtM3Disp.Text)));
       edtMLUtiliz.Text := FormatFloat('0.000###',(StrToFloat(edtMLUtiliz.Text)));
       edtMLDisp.Text := FormatFloat('0.000###',(StrToFloat(edtMLDisp.Text)));
       edtPreco.Text := FormatCurr('0.00', StrToCurr(edtPreco.Text));
    end;
    btnExecutarClick(Sender);
    Saida;
end;

procedure TfrmConsTora.Saida;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select S.dataSaida, S.tipo, replace(format(S.quantidadeLinear,3), ".",",") ''ml utilizada'', replace(format(((diametro1+diametro2)/2)*((diametro1+diametro2)/2) * quantidadeLinear * 0.7854,3), ".",",") ''m3 utilizada'' '+
       'from saida S, plaqueta P where P.id = '+QuotedStr(edtId.Text)+' and P.id = S.plaqueta_id order by S.dataSaida');
       Active := True;
       DBGrid2.DataSource.Enabled := True;
       DBGrid2.Columns.Items[0].FieldName := FieldByName('dataSaida').FieldName;
       DBGrid2.Columns.Items[1].FieldName := FieldByName('tipo').FieldName;
       DBGrid2.Columns.Items[2].FieldName := FieldByName('ml utilizada').FieldName;
       DBGrid2.Columns.Items[3].FieldName := FieldByName('m3 utilizada').FieldName;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmConsTora.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmConsTora.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If odd(ADOQuery1.RecNo) then begin
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

end.
