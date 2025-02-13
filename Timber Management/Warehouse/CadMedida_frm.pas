unit CadMedida_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DBGrids, DBCtrls;

type
  TfrmCadMed = class(TForm)
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
  frmCadMed: TfrmCadMed;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

{$R *.dfm}


function fBuscaCodMed() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select med_cod from medidas order by med_cod desc');
       Active := True;
       fBuscaCodMed := FieldByName('med_cod').AsInteger;
    end;
end;


procedure TfrmCadMed.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
//    If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
    nNovo := fBuscaCodMed + 1;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into medidas (med_cod, med_nome, med_simb) Values ('+IntToStr(nNovo)+', '''', '''')');
       ExecSQL;
       FormShow(Sender);
    end;
//    end
//    else begin
//       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
//    end;
end;

procedure TfrmCadMed.btnSairClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
    end;
    Close;
end;


procedure TfrmCadMed.FormShow(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from medidas order by med_cod');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('med_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('med_nome').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('med_simb').FieldName;
       Last;
       DBGrid1.Columns.Items[0].Color := clMoneyGreen;
    end;
end;

end.
