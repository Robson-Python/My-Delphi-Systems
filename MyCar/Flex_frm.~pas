unit Flex_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmFlex = class(TForm)
    GroupBox1: TGroupBox;
    edtAlccol: TLabeledEdit;
    edtGasolina: TLabeledEdit;
    lblResult: TLabel;
    lblValor: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnCalcular: TBitBtn;
    btnSair: TBitBtn;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFlex: TfrmFlex;

implementation

{$R *.dfm}

procedure TfrmFlex.btnCalcularClick(Sender: TObject);
var vAlcool, vGasolina, vValor : Double;
begin
    vAlcool := StrToFloat(edtAlccol.Text);
    vGasolina := StrToFloat(edtGasolina.Text);
    vValor := 0;
    lblValor.Caption := FloatToStr(vAlcool/vGasolina);
    lblValor.Caption := FormatFloat('0.##',(StrToFloat(lblValor.Caption)));
    lblValor.Caption := FormatCurr('0.00', StrToCurr(lblValor.Caption));
    lblValor.Visible := True;
    lblResult.Visible := True;
    vValor := StrToFloat(lblValor.Caption);
    If vValor <= 0.70 then begin
       lblValor.Font.Color := clGreen;
    end
    else begin
       lblValor.Font.Color := $0009D1E1;
    end;
end;

procedure TfrmFlex.btnSairClick(Sender: TObject);
begin
    Close;
end;

end.
