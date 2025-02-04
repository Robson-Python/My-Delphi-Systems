unit Alerta_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, MPlayer;

type
  TfrmAlerta = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCod: TLabeledEdit;
    edtEvento: TLabeledEdit;
    edtLocal: TLabeledEdit;
    mmObs: TMemo;
    mkeHora: TMaskEdit;
    btnOk: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    edtData: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlerta: TfrmAlerta;

implementation

uses Principal_frm, DB, Carro_Comando_dm;

{$R *.dfm}

procedure TfrmAlerta.FormShow(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from agenda where a_hora = '+QuotedStr(frmPrincipal.edtHora.Text)+' and a_data = '+QuotedStr(DateToStr(frmPrincipal.DateTimePicker1.Date))+' and a_lembrar = ''S''');
       Active := True;
       edtCod.Text := FieldByName('a_cod').AsString;
       edtEvento.Text := FieldByName('a_evento').AsString;
       edtLocal.Text := FieldByName('a_local').AsString;
       mkeHora.Text := FieldByName('a_horario').AsString;
       mmObs.Text := FieldByName('a_obs').AsString;
       ShortDateFormat := 'dd/mm/yyyy';
       edtData.Text := FieldByName('a_data').AsString;
    end;
    GroupBox1.SetFocus;
    GroupBox1.Enabled := False;
end;

procedure TfrmAlerta.btnOkClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update agenda set a_lembrar = ''N'', a_hora = ''00:00:00'' where a_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       Active := False;
       SQL.Clear;
       SQL.Add('select a_hora from agenda where a_data = '+QuotedStr(DateToStr(Date))+' and a_lembrar = ''S'' order by a_hora');
       Active := True;
       frmPrincipal.edtHora.Text := FieldByName('a_hora').AsString;
       frmPrincipal.DateTimePicker1.Date := Date;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    Close;
end;

procedure TfrmAlerta.Timer1Timer(Sender: TObject);
begin
    MediaPlayer1.Play;
end;

end.
