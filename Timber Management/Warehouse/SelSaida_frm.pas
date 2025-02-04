unit SelSaida_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, ComCtrls, StdCtrls, DateUtils;

type
  TfrmSelSaida = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Shape1: TShape;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    Shape2: TShape;
    CheckBox1: TCheckBox;
    rdbSaida: TRadioButton;
    edtCod: TEdit;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Saida;
    procedure btnExecutarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelSaida: TfrmSelSaida;

implementation

uses DB, Carro_Comando_dm, ADODB, Math, ConsProdSaida_frm, Saida_frm;

{$R *.dfm}

procedure TfrmSelSaida.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    DBGrid1.DataSource.Enabled := True;
    dmVendas.ADOQuery1.SQL.Clear;
end;

procedure TfrmSelSaida.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    DBGrid1.DataSource.Enabled := False;
    Close;
end;

procedure TfrmSelSaida.Saida;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If CheckBox1.Checked = False then begin
       If rdbSaida.Checked = True then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select saida.*, replace(format(sv_tot_saida,2), ".",",") ''saida'', clientes.* from saida, clientes where saida.c_cpfj = clientes.c_cpfj order by sv_cod');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('sv_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('c_cpfj').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('sv_dt_emiss').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('saida').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('sv_situacao').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end
    else begin
       If rdbSaida.Checked = True then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select saida.*, replace(format(sv_tot_saida,2), ".",",") ''saida'', clientes.* from saida, clientes where sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and saida.c_cpfj = clientes.c_cpfj order by sv_cod');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('sv_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('c_cpfj').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('sv_dt_emiss').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('saida').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('sv_situacao').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

procedure TfrmSelSaida.btnExecutarClick(Sender: TObject);
begin
    If rdbSaida.Checked = True then
       Saida;
end;

procedure TfrmSelSaida.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    Try
      Application.CreateForm(TfrmConsProdSaida, frmConsProdSaida);
      frmConsProdSaida.ShowModal;
    Finally
         frmConsProdSaida.Free;
    end;
end;

procedure TfrmSelSaida.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       edtCod.Text := DBGrid1.SelectedField.Text;
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select SV.*, C.c_nome from saida SV, clientes C where SV.c_cpfj = C.c_cpfj and SV.sv_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          frmSaida.edtCod.Text := FieldByName('sv_cod').AsString;
          frmSaida.dtpDtEmiss.Date := FieldByName('sv_dt_emiss').AsDateTime;
          frmSaida.mkeCpfj.Text := FieldByName('c_cpfj').AsString;
          frmSaida.cbxCli.Text := FieldByName('c_nome').AsString;
          frmSaida.edtVlSaida.Text := FieldByName('sv_tot_saida').AsString;
          frmSaida.edtVlSaida.Text := FormatCurr('0.00', StrToCurr(frmSaida.edtVlSaida.Text));
          If FieldByName('sv_situacao').AsString = 'CONSUMO' then begin
             frmSaida.RadioGroup1.ItemIndex := 0;
          end
          else begin
             frmSaida.RadioGroup1.ItemIndex := 1;
          end;
          frmSaida.Itens;
          frmSaida.GroupBox3.Enabled := True;
          frmSaida.edtQtd.SetFocus;
       end;
    end;
    Close;
end;

end.
