unit TdasViag_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmTdasViag = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    cbxVeic: TComboBox;
    edtPlaca: TEdit;
    GroupBox2: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    Shape1: TShape;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    RadioButton1: TRadioButton;
    Shape2: TShape;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTdasViag: TfrmTdasViag;

implementation

uses Carro_Comando_dm, GerViagem_frm, ADODB, DB;

{$R *.dfm}

procedure TfrmTdasViag.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmTdasViag.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    cbxVeic.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmTdasViag.FormCreate(Sender: TObject);
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

procedure TfrmTdasViag.cbxVeicExit(Sender: TObject);
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

procedure TfrmTdasViag.btnExecutarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton1.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, motoristas, viagens where carros.placa = viagens.placa and motoristas.cpf = viagens.cpf and carros.placa = '+QuotedStr(edtPlaca.Text)+' and viagens.viag_sit = ''FINALIZADO'' order by carros.modelo, motoristas.nome, viagens.dt_viag');
             Active := True;
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, motoristas, viagens where carros.placa = viagens.placa and motoristas.cpf = viagens.cpf and carros.placa = '+QuotedStr(edtPlaca.Text)+' and viagens.viag_sit = ''FINALIZADO'' and dt_viag between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by carros.modelo, motoristas.nome, viagens.dt_viag');
             Active := True;
          end;
          If RecordCount = 0 then begin
             Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             DBGrid1.Columns.Items[0].FieldName := FieldByName('cod_viag').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('descr').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('origem').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('dt_viag').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('saida').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('viag_km_ini').FieldName;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('viag_km_fin').FieldName;
             DBGrid1.Columns.Items[10].FieldName := FieldByName('viag_km_perc').FieldName;
             DBGrid1.Columns.Items[11].FieldName := FieldByName('destino').FieldName;
             DBGrid1.Columns.Items[12].FieldName := FieldByName('dt_cheg').FieldName;
             DBGrid1.Columns.Items[13].FieldName := FieldByName('chegada').FieldName;
             DBGrid1.Columns.Items[14].FieldName := FieldByName('tempo').FieldName;
             DBGrid1.Columns.Items[15].FieldName := FieldByName('viag_sit').FieldName;
             DBGrid1.Columns.Items[16].FieldName := FieldByName('obs').FieldName;
             Last;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

end.

