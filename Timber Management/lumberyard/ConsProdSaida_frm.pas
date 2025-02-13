unit ConsProdSaida_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmConsProdSaida = class(TForm)
    DBGrid1: TDBGrid;
    Shape2: TShape;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    btnFechar: TBitBtn;
    Shape1: TShape;
    Panel4: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsProdSaida: TfrmConsProdSaida;

implementation

uses Carro_Comando_dm, ADODB, SelSaida_frm;

{$R *.dfm}

procedure TfrmConsProdSaida.btnFecharClick(Sender: TObject);
begin
    frmSelSaida.rdbSaida.Checked := True;
    frmSelSaida.Saida;
    Close;
end;

procedure TfrmConsProdSaida.FormShow(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from itens_saida, produtos where itens_saida.p_cod = produtos.p_cod and sv_cod = '+QuotedStr(frmSelSaida.edtCod.Text)+' order by is_cod');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('p_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('p_n_prod').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('is_qtd').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('p_uni_med').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('is_vl_uni').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('is_vl_tot').FieldName;
    end;
end;

end.
