unit Agenda_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, Calendar, StdCtrls, ExtCtrls, Buttons, Mask,
  DBGrids, DBCtrls;

type
  TfrmAgenda = class(TForm)
    GroupBox1: TGroupBox;
    edtCod: TLabeledEdit;
    edtEvento: TLabeledEdit;
    edtLocal: TLabeledEdit;
    gpbCalendario: TGroupBox;
    MonthCalendar1: TMonthCalendar;
    mmObs: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtpData: TDateTimePicker;
    Edit1: TEdit;
    mkeHora: TMaskEdit;
    ckbLembrar: TCheckBox;
    Label4: TLabel;
    mkeLembrar: TMaskEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    DBNavigator1: TDBNavigator;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ckbLembrarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses DateUtils, DB, Principal_frm, Agenda_qrp, Enterprise_dm;

{$R *.dfm}

function fBuscaCodAgenda() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select a_cod from agenda order by a_cod desc');
       Active := True;
       fBuscaCodAgenda := FieldByName('a_cod').AsInteger;
    end;
end;

function Lembrar() : String;
begin
    If frmAgenda.ckbLembrar.Checked = True then begin
       Lembrar := 'S';
    end
    else begin
       Lembrar := 'N';
    end;
end;

procedure TfrmAgenda.btnSairClick(Sender: TObject);
begin
    dmEnterprise.zqEnterprise.SQL.Clear;
    dmEnterprise.zqEnterprise.Active := False;
    Close;
end;

procedure TfrmAgenda.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtEvento.Clear; edtLocal.Clear; mkeHora.Clear; mkeLembrar.Text := '00:00:00';
    mmObs.Clear;
    ckbLembrar.Checked := False;
    MonthCalendar1.Date := Date;
    gpbCalendario.Caption := 'Clique em uma data para consultar';
    DBGrid1.Visible := True;
    DBNavigator1.Enabled := True;
    dmEnterprise.zqEnterprise.Active := False;
    dmEnterprise.zqEnterprise.SQL.Clear;
end;

procedure TfrmAgenda.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := True;
    MonthCalendar1.Date := Date;
    dtpData.Date := MonthCalendar1.Date;
    gpbCalendario.Caption := 'Clique em uma data para consultar';
end;

procedure TfrmAgenda.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodAgenda + 1;
    edtCod.Text := IntToStr(nNovo);
    gpbCalendario.Caption := 'Clique em uma data para cadastrar';
    DBGrid1.Visible := False;
    dtpData.Enabled := False;
    edtEvento.SetFocus;
end;

procedure TfrmAgenda.btnInserirClick(Sender: TObject);
begin
    If edtEvento.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into agenda (A_COD, A_EVENTO, A_LOCAL, A_HORARIO, A_OBS, A_DATA, A_LEMBRAR, A_HORA) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtEvento.Text)+', '+QuotedStr(edtLocal.Text)+', '+QuotedStr(mkeHora.Text)+', '+QuotedStr(mmObs.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(Lembrar)+', '+QuotedStr(mkeLembrar.Text)+')');
          ExecSQL;
          Active := False;
          SQL.Clear;
          SQL.Add('select a_hora, a_data from agenda where a_data = '+QuotedStr(DateToStr(Date))+' and a_lembrar = ''S'' order by a_hora');
          Active := True;
          frmPrincipal.edtHora.Text := FieldByName('a_hora').AsString;
          frmPrincipal.DateTimePicker1.Date := FieldByName('a_data').AsDateTime;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       btnLimparClick(Self);
    end
    else begin
       Application.MessageBox('O campo Local não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmAgenda.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update agenda set A_EVENTO = '+QuotedStr(edtEvento.Text)+', A_LOCAL = '+QuotedStr(edtLocal.Text)+', A_HORARIO = '+QuotedStr(mkeHora.Text)+', A_OBS = '+QuotedStr(mmObs.Text)+', A_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', A_LEMBRAR = '+QuotedStr(Lembrar)+', A_HORA = '+QuotedStr(mkeLembrar.Text)+' where a_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Active := False;
          SQL.Clear;
          SQL.Add('select a_hora, a_data from agenda where a_data = '+QuotedStr(DateToStr(Date))+' and a_lembrar = ''S'' order by a_hora');
          Active := True;
          frmPrincipal.edtHora.Text := FieldByName('a_hora').AsString;
          frmPrincipal.DateTimePicker1.Date := FieldByName('a_data').AsDateTime;
          Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para atualizar dados.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmAgenda.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from agenda where a_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
          btnLimparClick(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmAgenda.MonthCalendar1Click(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If gpbCalendario.Caption = 'Clique em uma data para cadastrar' then begin
       dtpData.Date := MonthCalendar1.Date;
    end;
    If gpbCalendario.Caption = 'Clique em uma data para consultar' then begin
       dtpData.Date:= MonthCalendar1.Date;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select a_data from agenda where a_data = '+QuotedStr(DateToStr(dtpData.Date))+'');
          Active := True;
          Edit1.Text := FieldByName('a_data').AsString;
          If Edit1.Text <> '' then begin
             Active := False;
             SQL.Clear;
             SQL.Add('select * from agenda where a_data = '+QuotedStr(DateToStr(dtpData.Date))+' order by a_horario, a_evento');
             Active := True;
             DBGrid1.Visible := True;
             DBNavigator1.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('a_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('a_evento').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('a_horario').FieldName;
          end
          else begin
             DBGrid1.Visible := True;
             DBNavigator1.Enabled := True;
          end;
       end;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmAgenda.DBGrid1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.SelectedField.Text;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from agenda where a_cod = '+QuotedStr(Edit1.Text)+'');
       Active := True;
       edtCod.Text := FieldByName('a_cod').AsString;
       edtEvento.Text := FieldByName('a_evento').AsString;
       edtLocal.Text := FieldByName('a_local').AsString;
       mkeHora.Text := FieldByName('a_horario').AsString;
       mmObs.Text := FieldByName('a_obs').AsString;
       dtpData.Date := FieldByName('a_data').AsDateTime;
       mkeLembrar.Text := FieldByName('a_hora').AsString;
       If FieldByName('a_lembrar').AsString = 'S' then begin
          ckbLembrar.Checked := True;
       end
       else begin
          ckbLembrar.Checked := False;
       end;
    end;
    DBGrid1.Visible := False;
    DBNavigator1.Enabled := False;
    dtpData.Enabled := True;
    GroupBox1.SetFocus;
end;

procedure TfrmAgenda.ckbLembrarClick(Sender: TObject);
begin
    If ckbLembrar.Checked = False then begin
       mkeLembrar.Text := '00:00:00';
       GroupBox1.SetFocus;
    end
    else begin
       mkeLembrar.SetFocus;
    end;
end;

procedure TfrmAgenda.btnImprimirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from agenda where a_data = '+QuotedStr(DateToStr(frmAgenda.MonthCalendar1.Date))+' order by a_horario, a_evento');
       Active := True;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    Try
      Application.CreateForm(TqrpAgenda, qrpAgenda);
      qrpAgenda.qrlData.Caption := DateToStr(dtpData.Date);
      qrpAgenda.Preview;
    Finally
         qrpAgenda.Free;
    end;
end;

end.
