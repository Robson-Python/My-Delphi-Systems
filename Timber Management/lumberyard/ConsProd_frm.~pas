unit ConsProd_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmConsProd = class(TForm)
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
  frmConsProd: TfrmConsProd;

implementation

uses SelEntrada_frm, Carro_Comando_dm, ADODB, DB;

{$R *.dfm}

procedure TfrmConsProd.btnFecharClick(Sender: TObject);
begin
    frmSelEntrada.rdbEntrada.Checked := True;
    frmSelEntrada.Entradas;
    Close;
end;

procedure TfrmConsProd.FormShow(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from itens_entrada, produtos where itens_entrada.p_cod = produtos.p_cod and ec_cod = '+QuotedStr(frmSelEntrada.edtCod.Text)+' order by ie_cod');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('p_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('p_n_prod').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('ie_qtd').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('p_uni_med').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('ie_vl_uni').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('ie_vl_tot').FieldName;
    end;
end;

end.
