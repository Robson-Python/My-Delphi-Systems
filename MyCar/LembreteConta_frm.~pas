unit LembreteConta_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, MPlayer, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TfrmLembreteConta = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    btnOk: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    MediaPlayer1: TMediaPlayer;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLembreteConta: TfrmLembreteConta;

implementation

uses Carro_Comando_dm;

{$R *.dfm}

procedure TfrmLembreteConta.btnOkClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmLembreteConta.FormShow(Sender: TObject);
var dData : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    dData := DateToStr(Date);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c.placa, c.modelo, t.ct_ref, t.ct_nf, t.ct_venc from carros c, contas t where t.ct_venc = '+QuotedStr(dData)+' and c.placa = t.placa and t.ct_sit = ''NÃO PAGO'' order by c.modelo and t.ct_venc');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('ct_ref').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('ct_nf').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('placa').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('modelo').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('ct_venc').FieldName;
       First;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    MediaPlayer1.Open;
    MediaPlayer1.Play;
end;

end.
