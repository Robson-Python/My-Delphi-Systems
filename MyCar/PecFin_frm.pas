unit PecFin_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, ComCtrls, StdCtrls;

type
  TfrmPecFin = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    cbxVeic: TComboBox;
    edtPlaca: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Shape1: TShape;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    cbxCateg: TComboBox;
    lblCateg: TLabel;
    RadioGroup1: TRadioGroup;
    Shape2: TShape;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure PecasTrocadas;
    procedure PecasFuncionando;
    procedure cbxVeicExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPecFin: TfrmPecFin;

implementation

uses Carro_Comando_dm, GerPecas_frm, DB;

{$R *.dfm}

function fBuscaCodCatTrocado() : Integer;
begin
     With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from carros, motoristas, categoria, gerencial, pecas_servicos, custos where categoria.nome_categ = '+QuotedStr(frmPecFin.cbxCateg.Text)+' and carros.placa = '+QuotedStr(frmPecFin.edtPlaca.Text)+' and pecas_servicos.stats = ''TROCADO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = pecas_servicos.ger_cod and pecas_servicos.pec_cod = custos.pec_cod');
       Active := True;
       fBuscaCodCatTrocado := FieldByName('cod_categ').AsInteger;
    end;
end;

function fBuscaCodCatFuncionando() : Integer;
begin
     With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from carros, motoristas, categoria, gerencial, pecas_servicos, custos where categoria.nome_categ = '+QuotedStr(frmPecFin.cbxCateg.Text)+' and carros.placa = '+QuotedStr(frmPecFin.edtPlaca.Text)+' and pecas_servicos.stats = ''FUNCIONANDO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = pecas_servicos.ger_cod and pecas_servicos.pec_cod = custos.pec_cod');
       Active := True;
       fBuscaCodCatFuncionando := FieldByName('cod_categ').AsInteger;
    end;
end;


procedure TfrmPecFin.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    cbxVeic.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmPecFin.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmPecFin.PecasTrocadas;
var cCodCat : Integer;
begin
    cCodCat := fBuscaCodCatTrocado;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       If CheckBox1.Checked = False then begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from carros, motoristas, categoria, gerencial, pecas_servicos, custos where categoria.cod_categ = '+IntToStr(cCodCat)+' and carros.placa = '+QuotedStr(edtPlaca.Text)+' and pecas_servicos.stats = ''TROCADO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = pecas_servicos.ger_cod and pecas_servicos.pec_cod = custos.pec_cod');
          Active := True;
       end
       else begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from carros, motoristas, categoria, gerencial, pecas_servicos, custos where categoria.cod_categ = '+IntToStr(cCodCat)+' and carros.placa = '+QuotedStr(edtPlaca.Text)+' and custos.dt_troca between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and pecas_servicos.stats = ''TROCADO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = pecas_servicos.ger_cod and pecas_servicos.pec_cod = custos.pec_cod');
          Active := True;
       end;
       If RecordCount = 0 then begin
          Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
       end
       else begin
          DBGrid1.Columns.Items[0].FieldName := FieldByName('ger_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('dt_reg').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('modelo').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('placa').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('nome').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('nome_categ').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('pec_marca').FieldName;
          DBGrid1.Columns.Items[7].FieldName := FieldByName('pec_model').FieldName;
          DBGrid1.Columns.Items[8].FieldName := FieldByName('aplic').FieldName;
          DBGrid1.Columns.Items[9].FieldName := FieldByName('loja').FieldName;
          DBGrid1.Columns.Items[10].FieldName := FieldByName('dt_compr').FieldName;
          DBGrid1.Columns.Items[11].FieldName := FieldByName('gart').FieldName;
          DBGrid1.Columns.Items[12].FieldName := FieldByName('stats').FieldName;
          DBGrid1.Columns.Items[13].FieldName := FieldByName('dt_troca').FieldName;
          DBGrid1.Columns.Items[14].FieldName := FieldByName('qtd').FieldName;
          DBGrid1.Columns.Items[15].FieldName := FieldByName('vl_unit').FieldName;
          DBGrid1.Columns.Items[16].FieldName := FieldByName('vl_tot').FieldName;
          DBGrid1.Columns.Items[17].FieldName := FieldByName('cus_km_ini').FieldName;
          DBGrid1.Columns.Items[18].FieldName := FieldByName('cus_km_fin').FieldName;
          DBGrid1.Columns.Items[19].FieldName := FieldByName('km_perc').FieldName;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
    end;
end;

procedure TfrmPecFin.PecasFuncionando;
var cCodCat : Integer;
begin
    cCodCat := fBuscaCodCatFuncionando;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       If CheckBox1.Checked = False then begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from carros, motoristas, categoria, gerencial, pecas_servicos, custos where categoria.cod_categ = '+IntToStr(cCodCat)+' and carros.placa = '+QuotedStr(edtPlaca.Text)+' and pecas_servicos.stats = ''FUNCIONANDO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = pecas_servicos.ger_cod and pecas_servicos.pec_cod = custos.pec_cod');
          Active := True;
       end
       else begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from carros, motoristas, categoria, gerencial, pecas_servicos, custos where categoria.cod_categ = '+IntToStr(cCodCat)+' and carros.placa = '+QuotedStr(edtPlaca.Text)+' and custos.dt_troca between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and pecas_servicos.stats = ''FUNCIONANDO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = pecas_servicos.ger_cod and pecas_servicos.pec_cod = custos.pec_cod');
          Active := True;
       end;
       If RecordCount = 0 then begin
          Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
       end
       else begin
          DBGrid1.Columns.Items[0].FieldName := FieldByName('ger_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('dt_reg').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('modelo').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('placa').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('nome').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('nome_categ').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('pec_marca').FieldName;
          DBGrid1.Columns.Items[7].FieldName := FieldByName('pec_model').FieldName;
          DBGrid1.Columns.Items[8].FieldName := FieldByName('aplic').FieldName;
          DBGrid1.Columns.Items[9].FieldName := FieldByName('loja').FieldName;
          DBGrid1.Columns.Items[10].FieldName := FieldByName('dt_compr').FieldName;
          DBGrid1.Columns.Items[11].FieldName := FieldByName('gart').FieldName;
          DBGrid1.Columns.Items[12].FieldName := FieldByName('stats').FieldName;
          DBGrid1.Columns.Items[13].FieldName := FieldByName('dt_troca').FieldName;
          DBGrid1.Columns.Items[14].FieldName := FieldByName('qtd').FieldName;
          DBGrid1.Columns.Items[15].FieldName := FieldByName('vl_unit').FieldName;
          DBGrid1.Columns.Items[16].FieldName := FieldByName('vl_tot').FieldName;
          DBGrid1.Columns.Items[17].FieldName := FieldByName('cus_km_ini').FieldName;
          DBGrid1.Columns.Items[18].FieldName := FieldByName('cus_km_fin').FieldName;
          DBGrid1.Columns.Items[19].FieldName := FieldByName('km_perc').FieldName;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
    end;

end;

procedure TfrmPecFin.cbxVeicExit(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select placa from carros where modelo = '+QuotedStr(cbxVeic.Text)+'');
          Active := True;
          edtPlaca.Text := FieldByName('placa').AsString;
          SQL.Clear;
       end;
       cbxCateg.SetFocus;
    end;
end;

procedure TfrmPecFin.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros order by modelo');
       Active := True;
       while not Eof do begin
          cbxVeic.Items.Add(FieldByName('modelo').AsString);
          Next;
       end;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from categoria order by nome_categ');
       Active := True;
       while not Eof do begin
          cbxCateg.Items.Add(FieldByName('nome_categ').AsString);
          Next;
       end;
    end;
end;

procedure TfrmPecFin.btnExecutarClick(Sender: TObject);
begin
    If RadioGroup1.ItemIndex = 0 then
       PecasFuncionando
    else
       PecasTrocadas;
end;

end.
