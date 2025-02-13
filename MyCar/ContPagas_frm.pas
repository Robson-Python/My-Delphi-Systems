unit ContPagas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls;

type
  TfrmConPagas = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    Panel4: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
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
    DBGrid1: TDBGrid;
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
  frmConPagas: TfrmConPagas;

implementation

uses Carro_Comando_dm;

{$R *.dfm}

procedure TfrmConPagas.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmConPagas.FormCreate(Sender: TObject);
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

procedure TfrmConPagas.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    cbxVeic.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmConPagas.cbxVeicExit(Sender: TObject);
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

procedure TfrmConPagas.btnExecutarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton1.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          If CheckBox1.Checked = False then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, fornecedores, contas where carros.placa = '+QuotedStr(edtPlaca.Text)+' and contas.ct_sit = ''PAGO'' and carros.placa = contas.placa and fornecedores.cnpj = contas.cnpj order by carros.modelo, fornecedores.fn_nome');
             Active := True;
          end
          else begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from carros, fornecedores, contas where carros.placa = '+QuotedStr(edtPlaca.Text)+' and contas.ct_sit = ''PAGO'' and carros.placa = contas.placa and fornecedores.cnpj = contas.cnpj and contas.ct_venc between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by carros.modelo, fornecedores.fn_nome');
             Active := True;
          end;
          If RecordCount = 0 then begin
             Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             DBGrid1.Columns.Items[0].FieldName := FieldByName('ct_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('modelo').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('placa').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('ct_nf').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('fn_nome').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('ct_ref').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('ct_valor').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('ct_venc').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('ct_sit').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

end.
