unit SelEntrada_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, ComCtrls, StdCtrls, DateUtils;

type
  TfrmSelEntrada = class(TForm)
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
    rdbEntrada: TRadioButton;
    DBGrid1: TDBGrid;
    edtCod: TEdit;
    rdbNFiscal: TRadioButton;
    edtNfiscal: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Entradas;
    procedure btnExecutarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure NotaFiscal;
    procedure rdbNFiscalClick(Sender: TObject);
    procedure rdbEntradaClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEntrada: TfrmSelEntrada;

implementation

uses Entrada_frm, DB, Carro_Comando_dm, ADODB, ConsProd_frm, Math;

{$R *.dfm}

procedure TfrmSelEntrada.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date - 15;
    DateTimePicker2.Date := Date + 15;
    DBGrid1.DataSource.Enabled := True;
    dmVendas.ADOQuery1.SQL.Clear;
end;

procedure TfrmSelEntrada.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    DBGrid1.DataSource.Enabled := False;
    Close;
end;

procedure TfrmSelEntrada.Entradas;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If CheckBox1.Checked = False then begin
       If rdbEntrada.Checked = True then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select entrada.*, replace(format(entrada.ec_vl_entrada,2), ".",",") ''entrada'', fornecedores.* from entrada, fornecedores where entrada.f_cnpj = fornecedores.f_cnpj order by ec_cod');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('ec_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('f_cnpj').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('f_nome').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('ec_dt_emiss').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('ec_dt_entrada').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('ec_n_nf').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('entrada').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end
    else begin
       If rdbEntrada.Checked = True then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select entrada.*, replace(format(entrada.ec_vl_entrada,2), ".",",") ''entrada'', fornecedores.* from entrada, fornecedores where ec_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and entrada.f_cnpj = fornecedores.f_cnpj order by ec_cod');
             Active := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('ec_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('f_cnpj').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('f_nome').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('ec_dt_emiss').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('ec_dt_entrada').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('ec_n_nf').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('entrada').FieldName;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

procedure TfrmSelEntrada.btnExecutarClick(Sender: TObject);
begin
    If rdbEntrada.Checked = True then begin
       Entradas;
    end;
    If rdbNFiscal.Checked = True then begin
       NotaFiscal;
    end;
end;

procedure TfrmSelEntrada.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    Try
      Application.CreateForm(TfrmConsProd, frmConsProd);
      frmConsProd.ShowModal;
    Finally
         frmConsProd.Free;
    end;
end;

procedure TfrmSelEntrada.NotaFiscal;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select entrada.*, replace(format(entrada.ec_vl_entrada,2), ".",",") ''entrada'', fornecedores.* from entrada, fornecedores where entrada.f_cnpj = fornecedores.f_cnpj and entrada.ec_n_nf = '+QuotedStr(edtNfiscal.Text)+' order by ec_cod');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('ec_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('f_cnpj').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('f_nome').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('ec_dt_emiss').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('ec_dt_entrada').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('ec_n_nf').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('entrada').FieldName;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
end;

procedure TfrmSelEntrada.rdbNFiscalClick(Sender: TObject);
begin
    If rdbNFiscal.Checked = True then begin
       edtNfiscal.Visible := True;
       edtNfiscal.SetFocus;
    end;
    CheckBox1.Checked := False;
end;

procedure TfrmSelEntrada.rdbEntradaClick(Sender: TObject);
begin
    edtNfiscal.Visible := False;
    edtNfiscal.Clear;
end;

procedure TfrmSelEntrada.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       edtCod.Text := DBGrid1.SelectedField.Text;
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select EC.*, F.f_nome from entrada EC, fornecedores F where EC.f_cnpj = F.f_cnpj and EC.ec_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          frmEntrada.edtCod.Text := FieldByName('ec_cod').AsString;
          frmEntrada.dtpDtEntrada.Date := FieldByName('ec_dt_emiss').AsDateTime;
          frmEntrada.cbxForn.Text := FieldByName('f_nome').AsString;
          frmEntrada.mkeCnpj.Text := FieldByName('f_cnpj').AsString;
          frmEntrada.edtNFiscal.Text := FieldByName('ec_n_nf').AsString;
          frmEntrada.dtpDtEntrada.Date := FieldByName('ec_dt_entrada').AsDateTime;
          frmEntrada.edtVlEntr.Text := FieldByName('ec_vl_entrada').AsString;
          frmEntrada.edtVlEntr.Text := FormatCurr('0.00', StrToCurr(frmEntrada.edtVlEntr.Text));
          frmEntrada.Itens;
          frmEntrada.GroupBox3.Enabled := True;
          frmEntrada.edtQtd.SetFocus;
       end;
       Close;
    end;
end;

end.
