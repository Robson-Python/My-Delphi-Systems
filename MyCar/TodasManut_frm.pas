unit TodasManut_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmTodasManut = class(TForm)
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Shape2: TShape;
    DBGrid1: TDBGrid;
    Shape1: TShape;
    Panel4: TPanel;
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
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    RadioButton1: TRadioButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTodasManut: TfrmTodasManut;

implementation

uses Carro_Comando_dm, DB;

{$R *.dfm}

procedure TfrmTodasManut.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmTodasManut.FormCreate(Sender: TObject);
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

procedure TfrmTodasManut.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    cbxVeic.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmTodasManut.cbxVeicExit(Sender: TObject);
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

procedure TfrmTodasManut.btnExecutarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton1.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, motoristas, manutencao where carros.placa = '+QuotedStr(edtPlaca.Text)+' and manutencao.mt_sit = ''VENCIDO'' and carros.placa = manutencao.placa and motoristas.cpf = manutencao.cpf order by carros.modelo, motoristas.nome');
             Active := True;
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, motoristas, manutencao where carros.placa = '+QuotedStr(edtPlaca.Text)+' and manutencao.mt_sit = ''VENCIDO'' and carros.placa = manutencao.placa and motoristas.cpf = manutencao.cpf and manutencao.mt_dtvenc between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by carros.modelo, motoristas.nome');
             Active := True;
          end;
          If RecordCount = 0 then begin
             Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             DBGrid1.Columns.Items[0].FieldName := FieldByName('mt_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('nome').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('mt_manut').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('mt_loja').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('mt_dtserv').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('mt_dtvenc').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('mt_kmini').FieldName;
             DBGrid1.Columns.Items[9].FieldName := FieldByName('mt_kmfin').FieldName;
             DBGrid1.Columns.Items[10].FieldName := FieldByName('mt_qtd').FieldName;
             DBGrid1.Columns.Items[11].FieldName := FieldByName('mt_vluni').FieldName;
             DBGrid1.Columns.Items[12].FieldName := FieldByName('mt_vltot').FieldName;
             DBGrid1.Columns.Items[13].FieldName := FieldByName('mt_obs').FieldName;
             DBGrid1.Columns.Items[14].FieldName := FieldByName('mt_sit').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

end.
