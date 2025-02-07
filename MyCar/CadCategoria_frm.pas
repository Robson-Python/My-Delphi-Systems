unit CadCategoria_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DBGrids, DBCtrls;

type
  TfrmCadCategoria = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Shape1: TShape;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

{$R *.dfm}


function fBuscaCodCateg() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from categoria');
       Active := True;
       fBuscaCodCateg := FieldByName('ultimo').AsInteger;
    end;
end;


procedure TfrmCadCategoria.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from categoria');
          Active := True;
          If dmCarroComando.ADOQuery1.RecordCount = fBuscaCodCateg then
             nNovo := fBuscaCodCateg + 1
          else
             nNovo := fBuscaCodCateg;
          end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into categoria (cod_categ, nome_categ) Values ('+IntToStr(nNovo)+', '''')');
          ExecSQL;
          FormShow(Sender);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCadCategoria.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
    end;
    Close;
end;


procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from categoria order by cod_categ');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('cod_categ').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('nome_categ').FieldName;
       Last;
       DBGrid1.Columns.Items[0].Color := clMoneyGreen;
    end;
end;

end.
