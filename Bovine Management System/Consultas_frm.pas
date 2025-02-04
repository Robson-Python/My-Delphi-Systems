unit Consultas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ComCtrls, DateUtils;

type
  TfrmConsultas = class(TForm)
    Panel2: TPanel;
    Shape2: TShape;
    GroupBox1: TGroupBox;
    edtCod: TLabeledEdit;
    edtAno: TLabeledEdit;
    chkAtivar: TCheckBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    btnIncluir: TBitBtn;
    btnAtualizar: TBitBtn;
    btnSair: TBitBtn;
    btnExcluir: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure Consulta;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses Carro_Comando_dm, ADODB, Principal_frm, DB;

{$R *.dfm}

function fBuscaCodigo() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_cod from confinamento order by c_cod desc');
       Active := True;
       fBuscaCodigo := FieldByName('c_cod').AsInteger;
    end;
end;


procedure TfrmConsultas.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmConsultas.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := True;
    Consulta;
    edtAno.SetFocus;
end;

procedure TfrmConsultas.btnIncluirClick(Sender: TObject);
var Ativar : String;
    nNovo : Integer;
begin
    nNovo := fBuscaCodigo + 1;
    edtCod.Text := IntToStr(nNovo);
    If chkAtivar.Checked = True then begin
       Ativar := 'ATIVO';
    end
    else begin
       Ativar := 'INATIVO';
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into confinamento (C_COD, C_ANO, C_STATUS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtAno.Text)+', '+QuotedStr(Ativar)+')');
       ExecSQL;
    end;
    Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
    Consulta;
end;

procedure TfrmConsultas.btnExcluirClick(Sender: TObject);
begin
    If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Delete from confinamento where c_cod = '+ QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
          edtCod.Clear; edtAno.Clear;
          chkAtivar.Checked := False;
       end;
    end;
end;

procedure TfrmConsultas.btnAtualizarClick(Sender: TObject);
var Ativar : String;
begin
    If chkAtivar.Checked = True then begin
       Ativar := 'ATIVO';
    end
    else begin
       Ativar := 'INATIVO';
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update confinamento set C_ANO = '+QuotedStr(edtAno.Text)+', C_STATUS = '+QuotedStr(Ativar)+' where c_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
    end;
    Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
    Consulta;
end;

procedure TfrmConsultas.Consulta;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select c_cod, c_ano, c_status from confinamento order by c_cod');
       Active := True;
    end;
    DBGrid1.Columns.Items[0].Width := 50;
    DBGrid1.Columns.Items[1].Width := 50;
end;

procedure TfrmConsultas.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from confinamento where c_cod = '+QuotedStr(Edit1.Text)+'');
       Active := True;
       edtCod.Text := FieldByName('c_cod').AsString;
       edtAno.Text := FieldByName('c_ano').AsString;
       If FieldByName('c_status').AsString = 'ATIVO' then begin
          chkAtivar.Checked := True;
       end
       else begin
          chkAtivar.Checked := False;
       end;
    end;
    Consulta;
end;

end.
