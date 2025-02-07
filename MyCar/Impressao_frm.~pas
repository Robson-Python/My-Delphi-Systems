unit Impressao_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmImpressao = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

uses ImprimeViagem_frm, Carro_Comando_dm, ADODB, ImprimeAbast_frm,
  ImprimePeca_frm;

{$R *.dfm}

procedure TfrmImpressao.btnOkClick(Sender: TObject);
begin
    If RadioButton4.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from carros, motoristas, viagens where carros.placa = viagens.placa and motoristas.cpf = viagens.cpf order by carros.modelo, motoristas.nome');
          Active := True;
          Try
            Application.CreateForm(TfrmImprimeViag, frmImprimeViag);
            frmImprimeViag.qrpViagem.Preview;
          Finally
               frmImprimeViag.Free;
          end;
       end;
    end;
    If RadioButton5.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from carros, motoristas, categoria, gerencial, combustivel where carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = combustivel.ger_cod');
          Active := True;
          Try
            Application.CreateForm(TfrmImprAbast, frmImprAbast);
            frmImprAbast.qrpAbast.Preview;
          Finally
               frmImprAbast.Free;
          end;
       end;
    end;
    If RadioButton2.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from carros, categoria, gerencial, pecas_servicos, custos where carros.placa=gerencial.placa and categoria.cod_categ=gerencial.cod_categ and gerencial.ger_cod=pecas_servicos.ger_cod and pecas_servicos.pec_cod=custos.pec_cod');
          Active := True;
          Try
            Application.CreateForm(TfrmImprimePeca, frmImprimePeca);
            frmImprimePeca.qrpPeca.Preview;
          Finally
               frmImprimePeca.Free;
          end;
       end;
    end;
    Close;
end;


end.
