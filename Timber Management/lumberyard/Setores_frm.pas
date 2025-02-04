unit Setores_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DBGrids, DBCtrls, ComCtrls;

type
  TfrmSetores = class(TForm)
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtIdEmp: TLabeledEdit;
    edtEmpresa: TLabeledEdit;
    edtIdEsp: TLabeledEdit;
    edtEspecie: TLabeledEdit;
    btnConfirmar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetores: TfrmSetores;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm, Entrada_frm;

{$R *.dfm}


function fBuscaCodSetor() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from setores ');
       Active := True;
       fBuscaCodSetor := FieldByName('ultimo').AsInteger;
    end;
end;

procedure TfrmSetores.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSetores.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date-10;
    DateTimePicker2.Date := Date+10;
    edtIdEmp.Text := frmEntrada.edtIdEmp2.Text;
    edtEmpresa.Text := frmEntrada.cbxEmpresa.Text;
    edtIdEsp.Text := frmEntrada.edtIdEspecie.Text;
    edtEspecie.Text := frmEntrada.cbxEspecie.Text;
end;

end.
