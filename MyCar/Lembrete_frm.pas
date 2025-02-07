unit Lembrete_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, MPlayer;

type
  TfrmLembrete = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Shape2: TShape;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    btnOk: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLembrete: TfrmLembrete;

implementation

uses Carro_Comando_dm, DB;

{$R *.dfm}

procedure TfrmLembrete.FormShow(Sender: TObject);
var dData : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    dData := DateToStr(Date);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c.placa, c.modelo, m.mt_manut, m.mt_dtvenc from carros c, manutencao m where m.mt_dtvenc = '+QuotedStr(dData)+' and c.placa = m.placa and m.mt_sit = ''ATIVO'' order by c.modelo and m.mt_dtvenc');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('mt_manut').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('placa').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('modelo').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('mt_dtvenc').FieldName;
       First;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    MediaPlayer1.Open;
    MediaPlayer1.Play;
end;

procedure TfrmLembrete.btnOkClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

end.
