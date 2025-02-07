unit Reservas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls,
  DBCtrls;

type
  TfrmReservas = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtCod: TLabeledEdit;
    cbxNome: TComboBox;
    mmObs: TMemo;
    cbxFilme: TComboBox;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    CheckBox2: TCheckBox;
    DBNavigator1: TDBNavigator;
    MonthCalendar1: TMonthCalendar;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dtpDataChange(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReservas: TfrmReservas;

implementation

uses Locadora_dm, ZDataset, DB;

{$R *.dfm}

function fSituacao() : String;
begin
    If frmReservas.CheckBox1.Checked = True then
       fSituacao := 'SIM'
    else
       fSituacao := 'NÃO';
end;

function fDisponibilidade() : String;
begin
    If frmReservas.CheckBox2.Checked = True then
       fDisponibilidade := 'SIM'
    else
       fDisponibilidade := 'NÃO';
end;

function fBuscaCodReserva() : Integer;
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_cod from reservas order by r_cod desc');
       Active := True;
       fBuscaCodReserva := FieldByName('r_cod').AsInteger;
    end;
end;

procedure TfrmReservas.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmReservas.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    edtCod.Clear;
    cbxNome.Text := ''; cbxFilme.Text := '';
    MonthCalendar1.Date := Date;
    CheckBox1.Checked := False;
    CheckBox2.Checked := False;
    cbxNome.SetFocus;
end;

procedure TfrmReservas.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    If cbxNome.Text = '' then begin
       btnLimparClick(Sender);
       nNovo := fBuscaCodReserva + 1;
       edtCod.Text := IntToStr(nNovo);
       cbxNome.SetFocus;
    end
    else begin
       DBGrid1.DataSource.Enabled := False;
       edtCod.Clear;
       cbxFilme.Text := '';
       CheckBox1.Checked := False;
       CheckBox2.Checked := False;
       nNovo := fBuscaCodReserva + 1;
       edtCod.Text := IntToStr(nNovo);
       cbxFilme.SetFocus;
    end;
end;

procedure TfrmReservas.FormCreate(Sender: TObject);
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select f_nome from filmes order by f_nome');
       Active := True;
       while not Eof do begin
          cbxFilme.Items.Add(FieldByName('f_nome').AsString);
          Next;
       end;
    end;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxNome.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmReservas.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    MonthCalendar1.Date := Date;
    cbxNome.SetFocus;
end;

procedure TfrmReservas.btnInserirClick(Sender: TObject);
var vStatus, vDisponivel : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If cbxNome.Text <> '' then begin
       vStatus := fSituacao;
       vDisponivel := fDisponibilidade;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into reservas (R_COD, R_CLIENTE, R_FILME, R_DATA, R_DISPONIBILIDADE, R_STATUS, R_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxNome.Text)+', '+QuotedStr(cbxFilme.Text)+', '+QuotedStr(DateToStr(MonthCalendar1.Date))+', '+QuotedStr(vDisponivel)+', '+QuotedStr(vStatus)+', '+QuotedStr(mmObs.Text)+')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       MonthCalendar1Click(Self);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmReservas.btnAtualizarClick(Sender: TObject);
var vStatus, vDisponivel : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If cbxNome.Text <> '' then begin
       vStatus := fSituacao;
       vDisponivel := fDisponibilidade;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update reservas set R_CLIENTE = '+QuotedStr(cbxNome.Text)+', R_FILME = '+QuotedStr(cbxFilme.Text)+', R_DATA = '+QuotedStr(DateToStr(MonthCalendar1.Date))+', R_DISPONIBILIDADE = '+QuotedStr(vDisponivel)+', R_STATUS = '+QuotedStr(vStatus)+', R_OBS = '+QuotedStr(mmObs.Text)+' where r_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Application.MessageBox('Registro Atualizado com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       MonthCalendar1Click(Self);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmReservas.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','Rental - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmLocadora.zqLocadora do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from reservas where r_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Excluido com Sucesso!','Rental - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
          btnLimparClick(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','Rental - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmReservas.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from reservas where r_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
       cbxNome.Text := FieldByName('r_cliente').AsString;
       cbxFilme.Text := FieldByName('r_filme').AsString;
       mmObs.Text := FieldByName('r_obs').AsString;
       If FieldByName('r_status').AsString = 'SIM' then begin
          CheckBox1.Checked := True;
       end
       else begin
          CheckBox1.Checked := False;
       end;
       If FieldByName('r_disponibilidade').AsString = 'SIM' then begin
          CheckBox2.Checked := True;
       end
       else begin
          CheckBox2.Checked := False;
       end;
    end;
end;

procedure TfrmReservas.dtpDataChange(Sender: TObject);
begin
    cbxNome.SetFocus;
end;

procedure TfrmReservas.MonthCalendar1Click(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_cod, r_cliente, r_filme, r_disponibilidade, r_status from reservas where r_data = '+QuotedStr(DateToStr(MonthCalendar1.Date))+' order by r_cliente, r_filme');
       Active := True;
       DBGrid1.DataSource.Enabled := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('r_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('r_cliente').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('r_filme').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('r_disponibilidade').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('r_status').FieldName;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

end.
