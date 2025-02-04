unit CadCateg_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DBCtrls, Buttons;

type
  TfrmCadCateg = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnSair: TSpeedButton;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
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
  frmCadCateg: TfrmCadCateg;

implementation

uses Carro_Comando_dm;

{$R *.dfm}

function fBuscaCodCateg() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select t_cod from categoria order by t_cod desc');
       Active := True;
       fBuscaCodCateg := FieldByName('t_cod').AsInteger;
    end;
end;

procedure TfrmCadCateg.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodCateg + 1;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert categoria (t_cod, t_ramo) Values ('+IntToStr(nNovo)+', '''')');
       ExecSQL;
       FormShow(Sender);
    end;
end;

procedure TfrmCadCateg.btnSairClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
    end;
    Close;
end;

procedure TfrmCadCateg.FormShow(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from categoria order by t_cod');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('t_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('t_ramo').FieldName;
       Last;
       DBGrid1.Columns.Items[0].Color := clMoneyGreen;
    end;
end;

end.
