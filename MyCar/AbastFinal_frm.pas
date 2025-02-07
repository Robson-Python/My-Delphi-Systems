unit AbastFinal_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmAbastFinal = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cbxVeic: TComboBox;
    edtPlaca: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Shape1: TShape;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    RadioButton1: TRadioButton;
    Shape2: TShape;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbastFinal: TfrmAbastFinal;

implementation

uses Carro_Comando_dm;

{$R *.dfm}

procedure TfrmAbastFinal.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    cbxVeic.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmAbastFinal.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmAbastFinal.FormCreate(Sender: TObject);
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
end;

procedure TfrmAbastFinal.cbxVeicExit(Sender: TObject);
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
       RadioButton1.SetFocus;
    end;
end;

procedure TfrmAbastFinal.btnExecutarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton1.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, motoristas, categoria, gerencial, combustivel where carros.placa = '+QuotedStr(edtPlaca.Text)+' and combustivel.comb_status = ''FINALIZADO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = combustivel.ger_cod order by carros.modelo, motoristas.nome');
             Active := True;
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, motoristas, categoria, gerencial, combustivel where carros.placa = '+QuotedStr(edtPlaca.Text)+' and combustivel.comb_status = ''FINALIZADO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = combustivel.ger_cod and dt_reg between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by carros.modelo, motoristas.nome');
             Active := True;
          end;
          If RecordCount = 0 then begin
             Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             DBGrid1.Columns.Items[0].FieldName := FieldByName('comb_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('dt_reg').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('nome_categ').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('posto').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('comb_marca').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('comb_tipo').FieldName;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('comb_qtd').FieldName;
             DBGrid1.Columns.Items[10].FieldName := FieldByName('comb_vl_uni').FieldName;
             DBGrid1.Columns.Items[11].FieldName := FieldByName('comb_vl_tot').FieldName;
             DBGrid1.Columns.Items[12].FieldName := FieldByName('comb_km_ini').FieldName;
             DBGrid1.Columns.Items[13].FieldName := FieldByName('comb_km_fin').FieldName;
             DBGrid1.Columns.Items[14].FieldName := FieldByName('comb_km_perc').FieldName;
             DBGrid1.Columns.Items[15].FieldName := FieldByName('comb_med').FieldName;
             DBGrid1.Columns.Items[16].FieldName := FieldByName('comb_status').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

end.
