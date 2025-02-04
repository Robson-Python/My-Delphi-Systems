unit Auditoria_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls;

type
  TfrmAuditoria = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    dtpDtAuditoria: TDateTimePicker;
    lblDtAuditoria: TLabel;
    mmoObs: TMemo;
    lblObs: TLabel;
    rdgConfirmacao: TRadioGroup;
    rdgClassificacao: TRadioGroup;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    edtCodAuditoria: TEdit;
    lblCodPosVenda: TLabel;
    GroupBox2: TGroupBox;
    dtpInicio: TDateTimePicker;
    lblDtPosvenda: TLabel;
    dtpFim: TDateTimePicker;
    edtCodPV: TEdit;
    Label1: TLabel;
    dsAuditoria: TDataSource;
    btnPesquisar: TBitBtn;
    DBGrid2: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cbxClienteChange(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditoria: TfrmAuditoria;

implementation

{$R *.dfm}

uses Contato_dm;

function Ano(Data:TDateTime): String;
{Retorna uma data por extenso}
var
//  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := '01';
  Meses [2] := '02';
  Meses [3] := '03';
  Meses [4] := '04';
  Meses [5] := '05';
  Meses [6] := '06';
  Meses [7] := '07';
  Meses [8] := '08';
  Meses [9] := '09';
  Meses [10]:= '10';
  Meses [11]:= '11';
  Meses [12]:= '12';
  DecodeDate (Data, Ano, Mes, Dia);
//  NoDia := DayOfWeek (Data);
  Result := IntToStr(Ano);
end;

function fBuscaCodAuditoria() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select a_cod from auditoria order by a_cod desc');
       Active := True;
       fBuscaCodAuditoria := FieldByName('a_cod').AsInteger;
    end;
end;

function Confirmacao () : String;
begin
    If frmAuditoria.rdgConfirmacao.ItemIndex = 0 then begin
       Confirmacao := 'SIM';
    end
    else begin
       Confirmacao := 'NÃO';
    end;
end;

function Classificacao () : String;
begin
    If frmAuditoria.rdgClassificacao.ItemIndex = 0 then begin
       Classificacao := 'BOM';
    end;
    If frmAuditoria.rdgClassificacao.ItemIndex = 1 then begin
       Classificacao := 'REGULAR';
    end;
    if frmAuditoria.rdgClassificacao.ItemIndex = 2 then begin
       Classificacao := 'RUIM';
    end;
end;

procedure TfrmAuditoria.btnAtualizarClick(Sender: TObject);
begin
    If edtCodAuditoria.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update auditoria set A_DT_AUDITORIA = '+QuotedStr(DateToStr(dtpDtAuditoria.Date))+', A_CONFIRMACAO_CONTATO = '+QuotedStr(Confirmacao)+', A_CLASSIFICACAO = '+QuotedStr(Classificacao)+', A_OBS = '+QuotedStr(mmoObs.Text)+' where A_COD = '+QuotedStr(edtCodAuditoria.Text)+'');
          ExecSQL;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Atualizado com Sucesso!','Contato - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','Contato - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmAuditoria.btnDeletarClick(Sender: TObject);
begin
    If edtCodAuditoria.Text <> '' then begin
        If Application.MessageBox('Excluir Registro?','Contato - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
           With dmContato.fdqContato do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from auditoria where a_cod = '+ QuotedStr(edtCodAuditoria.Text)+'');
              ExecSQL;
           end;
           btnLimparClick(Self);
           Application.MessageBox('Registro Excluido com Sucesso!','Contato - Sucesso',MB_OK+MB_ICONINFORMATION);
        end;
     end
     else begin
        Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','Contato - Atenção',MB_OK+MB_ICONWARNING);
     end;
end;

procedure TfrmAuditoria.btnInserirClick(Sender: TObject);
var vConfirmacao, vClassificacao : string;
begin
    If edtCodAuditoria.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       vConfirmacao := Confirmacao;
       vClassificacao := Classificacao;
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into auditoria (A_COD, PV_COD, A_DT_AUDITORIA, A_CONFIRMACAO_CONTATO, A_CLASSIFICACAO, A_OBS) Values ('+QuotedStr(edtCodAuditoria.Text)+', '+QuotedStr(edtCodPV.Text)+', '+QuotedStr(DateToStr(dtpDtAuditoria.Date))+', '+QuotedStr(vConfirmacao)+', '+QuotedStr(vClassificacao)+', '+QuotedStr(mmoObs.Text)+')');
          ExecSQL;
          Active := False;
          SQL.Clear;
          SQL.Add('Update pos_venda set pv_auditado = ''SIM'' where pv_cod = '+QuotedStr(edtCodPV.Text)+'');
          ExecSQL;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       btnLimparClick(Self);
       Application.MessageBox('Registro Efetuado com Sucesso!','Contato - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','Contato - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmAuditoria.btnLimparClick(Sender: TObject);
begin
    dsAuditoria.Enabled := False;
    edtCodAuditoria.Clear; edtCodPV.Clear;
    dtpDtAuditoria.Date := Date;
    mmoObs.Clear;
    rdgConfirmacao.ItemIndex := -1; rdgClassificacao.ItemIndex := -1;
    DBGrid2.Visible := False;
    DBGrid2.Visible := False;
    dtpInicio.Date := Date - 15; dtpFim.Date := Date + 15;
    Panel4.Caption := 'Auditoria';
end;

procedure TfrmAuditoria.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodAuditoria + 1;
    edtCodAuditoria.Text := IntToStr(nNovo);
    dtpDtAuditoria.SetFocus;
end;

procedure TfrmAuditoria.btnPesquisarClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select C.c_nome, C.c_contato1, C.c_contato2, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, PV.* from Pos_Venda PV, Clientes C, Clientes_PV CP where PV.pv_dt_realizado between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and PV.pv_auditado = ''NÃO'' order by PV.pv_dt_realizado');
       Active := True;
       dsAuditoria.Enabled := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('pv_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('pv_dt_realizado').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('c_contato1').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('c_contato2').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('cp_categoria').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('cp_modelo').FieldName;
       DBGrid1.Columns.Items[7].FieldName := FieldByName('cp_placa').FieldName;
       DBGrid1.Columns.Items[8].FieldName := FieldByName('pv_km').FieldName;
       DBGrid1.Columns.Items[9].FieldName := FieldByName('pv_responsavel').FieldName;
       DBGrid1.Columns.Items[10].FieldName := FieldByName('pv_duvida').FieldName;
       DBGrid1.Columns.Items[11].FieldName := FieldByName('pv_reclamacao').FieldName;
       DBGrid1.Columns.Items[12].FieldName := FieldByName('pv_elogio').FieldName;
       DBGrid1.Columns.Items[13].FieldName := FieldByName('pv_sugestao').FieldName;
       DBGrid1.Columns.Items[14].FieldName := FieldByName('pv_obs').FieldName;
       DBGrid1.Columns.Items[15].FieldName := FieldByName('pv_feedback_empresa').FieldName;
       DBGrid1.Columns.Items[16].FieldName := FieldByName('pv_motivo_perda_garantia').FieldName;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       Panel4.Caption := 'Pós Vendas Realizados no Período Selecionado';
       DBGrid2.Visible := False;
    end;
end;

procedure TfrmAuditoria.btnSairClick(Sender: TObject);
begin
    dmContato.fdqContato.SQL.Clear;
    Close;
end;

procedure TfrmAuditoria.btnSelecionarClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select A.a_cod, A.a_dt_auditoria, C.c_nome, C.c_contato1, C.c_contato2, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, PV.* from Pos_Venda PV, Clientes C, Clientes_PV CP, Auditoria A where A.a_dt_auditoria between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and PV.pv_cod = A.pv_cod order by A.a_dt_auditoria desc');
       Active := True;
       dsAuditoria.Enabled := True;
       DBGrid2.Columns.Items[0].FieldName := FieldByName('a_cod').FieldName;
       DBGrid2.Columns.Items[1].FieldName := FieldByName('a_dt_auditoria').FieldName;
       DBGrid2.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
       DBGrid2.Columns.Items[3].FieldName := FieldByName('c_contato1').FieldName;
       DBGrid2.Columns.Items[4].FieldName := FieldByName('c_contato2').FieldName;
       DBGrid2.Columns.Items[5].FieldName := FieldByName('cp_categoria').FieldName;
       DBGrid2.Columns.Items[6].FieldName := FieldByName('cp_modelo').FieldName;
       DBGrid2.Columns.Items[7].FieldName := FieldByName('cp_placa').FieldName;
       DBGrid2.Columns.Items[8].FieldName := FieldByName('pv_km').FieldName;
       DBGrid2.Columns.Items[9].FieldName := FieldByName('pv_responsavel').FieldName;
       DBGrid2.Columns.Items[10].FieldName := FieldByName('pv_duvida').FieldName;
       DBGrid2.Columns.Items[11].FieldName := FieldByName('pv_reclamacao').FieldName;
       DBGrid2.Columns.Items[12].FieldName := FieldByName('pv_elogio').FieldName;
       DBGrid2.Columns.Items[13].FieldName := FieldByName('pv_sugestao').FieldName;
       DBGrid2.Columns.Items[14].FieldName := FieldByName('pv_obs').FieldName;
       DBGrid2.Columns.Items[15].FieldName := FieldByName('pv_feedback_empresa').FieldName;
       DBGrid2.Columns.Items[16].FieldName := FieldByName('pv_motivo_perda_garantia').FieldName;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    end;
    DBGrid2.Visible := True;
    Panel4.Caption := 'Auditoria';
end;

procedure TfrmAuditoria.cbxClienteChange(Sender: TObject);
begin

       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from clientes where c_nome =');
          Active := True;
//          edtCodCli.Text := FieldByName('c_cod').AsString;
       end;
end;

procedure TfrmAuditoria.DBGrid1DblClick(Sender: TObject);
var vConfirmacao, vClassificacao : string;
begin
    btnLimparClick(Sender);
    edtCodPV.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    btnNovoClick(Self);
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select C.c_nome, C.c_contato1, C.c_contato2, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, PV.* from Pos_Venda PV, Clientes C, Clientes_PV CP where Pv.pv_cod = '+QuotedStr(edtCodPV.Text)+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod order by PV.pv_dt_realizado');
       Active := True;
       dsAuditoria.Enabled := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('pv_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('pv_dt_realizado').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('c_contato1').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('c_contato2').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('cp_categoria').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('cp_modelo').FieldName;
       DBGrid1.Columns.Items[7].FieldName := FieldByName('cp_placa').FieldName;
       DBGrid1.Columns.Items[8].FieldName := FieldByName('pv_km').FieldName;
       DBGrid1.Columns.Items[9].FieldName := FieldByName('pv_responsavel').FieldName;
       DBGrid1.Columns.Items[10].FieldName := FieldByName('pv_duvida').FieldName;
       DBGrid1.Columns.Items[11].FieldName := FieldByName('pv_reclamacao').FieldName;
       DBGrid1.Columns.Items[12].FieldName := FieldByName('pv_elogio').FieldName;
       DBGrid1.Columns.Items[13].FieldName := FieldByName('pv_sugestao').FieldName;
       DBGrid1.Columns.Items[14].FieldName := FieldByName('pv_obs').FieldName;
       DBGrid1.Columns.Items[15].FieldName := FieldByName('pv_feedback_empresa').FieldName;
       DBGrid1.Columns.Items[16].FieldName := FieldByName('pv_motivo_perda_garantia').FieldName;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       Panel4.Caption := 'Pós Vendas Realizados no Período Selecionado';
    end;
end;

procedure TfrmAuditoria.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nLinha : Integer;
begin
    nLinha := DBGrid1.DataSource.DataSet.RecNo;
    If odd(nLinha) then begin
       DBGrid1.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid1.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAuditoria.DBGrid2DblClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    edtCodAuditoria.Text := DBGrid2.SelectedField.Text;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from auditoria where a_cod = '+QuotedStr(edtCodAuditoria.Text)+'');
       Active := True;
       edtCodAuditoria.Text := FieldByName('a_cod').AsString;
       edtCodPV.Text := FieldByName('pv_cod').AsString;
       dtpDtAuditoria.Date := FieldByName('a_dt_auditoria').AsDateTime;
       mmoObs.Text := FieldByName('a_obs').AsString;
       if FieldByName('a_confirmacao_contato').AsString = 'SIM' then begin
          rdgConfirmacao.ItemIndex := 0;
       end;
       if FieldByName('a_confirmacao_contato').AsString = 'NÃO' then begin
          rdgConfirmacao.ItemIndex := 1;
       end;
       if FieldByName('a_classificacao').AsString = 'BOM' then begin
          rdgClassificacao.ItemIndex := 0;
       end;
       if FieldByName('a_classificacao').AsString = 'REGULAR' then begin
          rdgClassificacao.ItemIndex := 1;
       end;
       If FieldByName('a_classificacao').AsString = 'RUIM' then begin
          rdgClassificacao.ItemIndex := 2;
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('Select A.a_cod, A.a_dt_auditoria, C.c_nome, C.c_nome, C.c_contato1, C.c_contato2, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, PV.* from Pos_Venda PV, Clientes C, Clientes_PV CP, Auditoria A where a_cod = '+QuotedStr(edtCodAuditoria.Text)+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and PV.pv_cod = A.pv_cod order by A.a_dt_auditoria desc');
       Active := True;
       dsAuditoria.Enabled := True;
       DBGrid2.Columns.Items[0].FieldName := FieldByName('a_cod').FieldName;
       DBGrid2.Columns.Items[1].FieldName := FieldByName('a_dt_auditoria').FieldName;
       DBGrid2.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
       DBGrid2.Columns.Items[3].FieldName := FieldByName('c_contato1').FieldName;
       DBGrid2.Columns.Items[4].FieldName := FieldByName('c_contato2').FieldName;
       DBGrid2.Columns.Items[5].FieldName := FieldByName('cp_categoria').FieldName;
       DBGrid2.Columns.Items[6].FieldName := FieldByName('cp_modelo').FieldName;
       DBGrid2.Columns.Items[7].FieldName := FieldByName('cp_placa').FieldName;
       DBGrid2.Columns.Items[8].FieldName := FieldByName('pv_km').FieldName;
       DBGrid2.Columns.Items[9].FieldName := FieldByName('pv_responsavel').FieldName;
       DBGrid2.Columns.Items[10].FieldName := FieldByName('pv_duvida').FieldName;
       DBGrid2.Columns.Items[11].FieldName := FieldByName('pv_reclamacao').FieldName;
       DBGrid2.Columns.Items[12].FieldName := FieldByName('pv_elogio').FieldName;
       DBGrid2.Columns.Items[13].FieldName := FieldByName('pv_sugestao').FieldName;
       DBGrid2.Columns.Items[14].FieldName := FieldByName('pv_obs').FieldName;
       DBGrid2.Columns.Items[15].FieldName := FieldByName('pv_feedback_empresa').FieldName;
       DBGrid2.Columns.Items[16].FieldName := FieldByName('pv_motivo_perda_garantia').FieldName;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmAuditoria.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nLinha : Integer;
begin
    nLinha := DBGrid2.DataSource.DataSet.RecNo;
    If odd(nLinha) then begin
       DBGrid2.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid2.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmAuditoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    btnSairClick(Self);
end;

procedure TfrmAuditoria.FormCreate(Sender: TObject);
begin
    dtpDtAuditoria.Date := Date;
    dtpInicio.Date := Date - 15;
    dtpFim.Date := Date + 15;
end;

end.
