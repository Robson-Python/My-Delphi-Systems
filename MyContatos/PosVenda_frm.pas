unit PosVenda_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Mask, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, DateUtils;

type
  TfrmPosVenda = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    cbxCliente: TComboBox;
    lblCliente: TLabel;
    mkePlaca: TMaskEdit;
    lblPlaca: TLabel;
    edtCodCli: TEdit;
    lblCodCli: TLabel;
    Label1: TLabel;
    edtMoto: TEdit;
    dtpDtPrevista: TDateTimePicker;
    lblDtPrevista: TLabel;
    Label2: TLabel;
    edtModelo: TEdit;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    dsRetorno: TDataSource;
    btnFeed: TSpeedButton;
    DBGrid3: TDBGrid;
    GroupBox2: TGroupBox;
    lblDtRealizado: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblCodRetorno: TLabel;
    lblObs: TLabel;
    lblFeedEmpresa: TLabel;
    lblMotivo: TLabel;
    Label7: TLabel;
    edtKm: TLabeledEdit;
    edtResponsavel: TLabeledEdit;
    dtpDtRealizado: TDateTimePicker;
    edtDuvida: TEdit;
    edtElogio: TEdit;
    edtSugestao: TEdit;
    edtReclamacao: TEdit;
    edtCodPosVenda: TEdit;
    edtObs: TEdit;
    edtFeedEmpresa: TEdit;
    cbxPercaGarantia: TComboBox;
    btnReagendar: TBitBtn;
    rdgRealizado: TRadioGroup;
    edtReagendar: TEdit;
    btnRetornoFeed: TBitBtn;
    dtpRetornoFeed: TDateTimePicker;
    dtpData: TDateTimePicker;
    Label8: TLabel;
    dtpRetorno: TDateTimePicker;
    edtDia: TEdit;
    edtMes: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbxClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BuscaCliente;
    procedure rdgRealizadoClick(Sender: TObject);
    procedure btnReagendarClick(Sender: TObject);
    procedure edtFeedEmpresaExit(Sender: TObject);
    procedure btnRetornoFeedClick(Sender: TObject);
    procedure btnFeedClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dtpRetornoFeedExit(Sender: TObject);
    procedure dtpDtPrevistaCloseUp(Sender: TObject);
    procedure dtpDtPrevistaExit(Sender: TObject);
    procedure dtpRetornoFeedCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPosVenda: TfrmPosVenda;

implementation

{$R *.dfm}

uses Contato_dm;

function fBuscaCodRetorno() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select pv_cod from pos_venda order by pv_cod desc');
       Active := True;
       fBuscaCodRetorno := FieldByName('pv_cod').AsInteger;
    end;
end;

function fBuscaFeed() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select f_cod from feedback order by f_cod desc');
       Active := True;
       fBuscaFeed := FieldByName('f_cod').AsInteger;
    end;
end;

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

procedure TfrmPosVenda.btnAtualizarClick(Sender: TObject);
begin
    If edtCodPosVenda.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update pos_venda set PV_KM = '+QuotedStr(edtKm.Text)+', PV_DT_REALIZADO = '+QuotedStr(DateToStr(dtpDtRealizado.Date))+', PV_RESPONSAVEL = '+QuotedStr(edtResponsavel.Text)+', PV_DUVIDA = '+QuotedStr(edtDuvida.Text)+', PV_RECLAMACAO = '+QuotedStr(edtReclamacao.Text)+', PV_ELOGIO = '+QuotedStr(edtElogio.Text)+', PV_SUGESTAO = '+QuotedStr(edtSugestao.Text)+', PV_OBS = '+QuotedStr(edtObs.Text)+', PV_FEEDBACK_EMPRESA = '+QuotedStr(edtFeedEmpresa.Text)+', PV_MOTIVO_PERDA_GARANTIA = '+QuotedStr(cbxPercaGarantia.Text)+' where PV_COD = '+QuotedStr(edtCodPosVenda.Text)+'');
          ExecSQL;
          if edtFeedEmpresa.Text <> '' then begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update feedback set f_status = ''SIM'' where pv_cod = '+QuotedStr(edtCodPosVenda.Text)+'');
             ExecSQL;
          end;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Atualizado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Nome não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPosVenda.btnDeletarClick(Sender: TObject);
begin
    If edtCodPosVenda.Text <> '' then begin
        If Application.MessageBox('Excluir Registro?','MyContatos - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
           With dmContato.fdqContato do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from feedback where pv_cod = '+ QuotedStr(edtCodPosVenda.Text)+'');
              ExecSQL;
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from pos_venda where pv_cod = '+ QuotedStr(edtCodPosVenda.Text)+'');
              ExecSQL;
           end;
           btnLimparClick(Self);
           Application.MessageBox('Registro Excluido com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
        end;
     end
     else begin
        Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
     end;
end;

procedure TfrmPosVenda.btnFeedClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select PV.pv_cod, C.c_nome, F.f_data, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, C.c_contato1, C.c_contato2 from Clientes_PV CP, Feedback F, Clientes C, Pos_Venda PV where F.f_data = '+QuotedStr(DateToStr(dtpDtPrevista.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and F.pv_cod = PV.pv_cod and F.f_status = ''NÃO'' order by C.c_nome');
       Active := True;
       dsRetorno.Enabled := True;
       DBGrid3.Columns.Items[0].FieldName := FieldByName('pv_cod').FieldName;
       DBGrid3.Columns.Items[1].FieldName := FieldByName('f_data').FieldName;
       DBGrid3.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
       DBGrid3.Columns.Items[3].FieldName := FieldByName('cp_categoria').FieldName;
       DBGrid3.Columns.Items[4].FieldName := FieldByName('cp_modelo').FieldName;
       DBGrid3.Columns.Items[5].FieldName := FieldByName('cp_placa').FieldName;
       DBGrid3.Columns.Items[6].FieldName := FieldByName('c_contato1').FieldName;
       DBGrid3.Columns.Items[7].FieldName := FieldByName('c_contato2').FieldName;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    GroupBox2.Visible := False;
    DBGrid3.Visible := True;
    Panel4.Visible := True;
    Panel3.Visible := True;
    Panel4.Caption := 'Consulta de Feedback aos Clientes';
end;

procedure TfrmPosVenda.btnInserirClick(Sender: TObject);
var Realizado : string;
begin
    If edtCodPosVenda.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into pos_venda (PV_COD, CP_COD, PV_KM, PV_DT_REALIZADO, PV_RESPONSAVEL, PV_DUVIDA, PV_RECLAMACAO, PV_ELOGIO, PV_SUGESTAO, PV_OBS, PV_FEEDBACK_EMPRESA, PV_MOTIVO_PERDA_GARANTIA, PV_AUDITADO) Values ('+QuotedStr(edtCodPosVenda.Text)+', '+QuotedStr(edtCodCli.Text)+', '+QuotedStr(edtKm.Text)+', '+QuotedStr(DateToStr(dtpDtRealizado.Date))+', '+QuotedStr(edtResponsavel.Text)+', '+QuotedStr(edtDuvida.Text)+', '+QuotedStr(edtReclamacao.Text)+', '+QuotedStr(edtElogio.Text)+', '+QuotedStr(edtSugestao.Text)+', '+QuotedStr(edtObs.Text)+', '+QuotedStr(edtFeedEmpresa.Text)+', '+QuotedStr(cbxPercaGarantia.Text)+', ''NÃO'')');
          ExecSQL;
          if rdgRealizado.ItemIndex = 0 then begin
             Realizado := 'SIM';
          end
          else begin
             Realizado := 'NÃO';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('Update contatos_pv set ct_realizado = '+QuotedStr(Realizado)+' where ct_data = '+QuotedStr(DateToStr(dtpDtPrevista.Date))+' and cp_cod = '+QuotedStr(edtCodCli.Text)+'');
          ExecSQL;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       if edtFeedEmpresa.Text = '' then begin
          dtpRetornoFeed.Enabled := True;
          btnRetornoFeed.Enabled := True;
          dtpRetorno.Date := dtpDtRealizado.Date;
       end;
       dtpDtPrevista.SetFocus;
       Application.MessageBox('Registro Efetuado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPosVenda.btnLimparClick(Sender: TObject);
begin
    dsRetorno.Enabled := False;
    edtResponsavel.Clear; edtMoto.Clear; edtCodPosVenda.Clear; edtCodCli.Clear; edtKm.Clear; edtDia.Clear; edtMes.Clear;
    edtDuvida.Clear; edtSugestao.Clear; edtReclamacao.Clear; edtElogio.Clear; edtObs.Clear; edtModelo.Clear;
    cbxCliente.Text := ''; cbxPercaGarantia.Text := '';
    mkePlaca.Clear;
    dtpDtRealizado.Date := Date; dtpDtPrevista.Date := Date; dtpRetornoFeed.Date := Date;
    edtFeedEmpresa.Clear;
    DBGrid2.Visible := False;
    DBGrid1.Visible := False;
    DBGrid3.Visible := False;
    GroupBox2.Visible := True;
    Panel4.Caption := 'Consulta de Retorno aos Clientes';
    Panel4.Visible := False;
    Panel3.Visible := False;
    dtpDtPrevista.SetFocus;
    rdgRealizado.ItemIndex := -1;
    btnReagendar.Enabled := False;
    lblDtPrevista.Font.Color := clBlack;
    btnRetornoFeed.Enabled := False;
    dtpRetornoFeed.Enabled := False;
    btnRetornoFeed.Caption := 'Agendar Re&torno';
end;

procedure TfrmPosVenda.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
//    btnLimparClick(Sender);
    nNovo := fBuscaCodRetorno + 1;
    edtCodPosVenda.Text := IntToStr(nNovo);
    edtKm.SetFocus;
end;

procedure TfrmPosVenda.btnReagendarClick(Sender: TObject);
var Realizado : string;
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    if rdgRealizado.ItemIndex = 0 then begin
       Realizado := 'SIM';
    end
    else begin
       Realizado := 'NÃO';
    end;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update contatos_pv set ct_data = '+QuotedStr(DateToStr(dtpDtPrevista.Date))+', ct_realizado = '+QuotedStr(Realizado)+' where ct_cod = '+QuotedStr(edtReagendar.Text)+'');
       ExecSQL;
    end;
    ShowMessage('Reagendamento Confirmado!');
    btnReagendar.Enabled := False;
    lblDtPrevista.Font.Color := clBlack;
    rdgRealizado.ItemIndex := -1;
    dtpDtPrevista.Date := Date;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmPosVenda.btnRetornoFeedClick(Sender: TObject);
var vCod : Integer;
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    if btnRetornoFeed.Caption = 'Agendar Re&torno' then begin
       vCod := fBuscaFeed + 1;
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into feedback (f_cod, pv_cod, f_data, f_status) values ('+QuotedStr(IntToStr(vCod))+', '+QuotedStr(edtCodPosVenda.Text)+', '+QuotedStr(DateToStr(dtpRetornoFeed.Date))+', ''NÃO'')');
          ExecSQL;
       end;
       ShowMessage('Agendamento de Retorno Confirmado!');
       btnRetornoFeed.Enabled := False;
       dtpRetornoFeed.Enabled := False;
    end
    else begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update feedback set f_data = '+QuotedStr(DateToStr(dtpRetornoFeed.Date))+' where pv_cod = '+QuotedStr(edtCodPosVenda.Text)+'');
          ExecSQL;
       end;
       ShowMessage('Reagendamento de Retorno Confirmado!');
       btnRetornoFeed.Enabled := False;
       dtpRetornoFeed.Enabled := False;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmPosVenda.btnSairClick(Sender: TObject);
begin
    dmContato.fdqContato.SQL.Clear;
    Close;
end;

procedure TfrmPosVenda.btnSelecionarClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select CP.cp_cod, C.c_nome, CT.ct_data, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, C.c_contato1, C.c_contato2 from Clientes_PV CP, Contatos_PV CT, Clientes C where CT.ct_data = '+QuotedStr(DateToStr(dtpDtPrevista.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = CT.cp_cod and CT.ct_realizado = ''NÃO'' order by C.c_nome');
       Active := True;
       dsRetorno.Enabled := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('cp_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('ct_data').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('cp_categoria').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('cp_modelo').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('cp_placa').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('c_contato1').FieldName;
       DBGrid1.Columns.Items[7].FieldName := FieldByName('c_contato2').FieldName;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    GroupBox2.Visible := False;
    DBGrid1.Visible := True;
    Panel4.Visible := True;
    Panel3.Visible := True;
//    DBGrid2.Visible := False;
    Panel4.Caption := 'Consulta de Retorno aos Clientes';
end;

procedure TfrmPosVenda.cbxClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select PV.pv_cod, C.c_nome, PV.pv_dt_realizado, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, PV.pv_km from Pos_Venda PV, Clientes C, Clientes_PV CP where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and PV.cp_cod = CP.cp_cod and CP.c_cod = C.c_cod order by PV.pv_dt_realizado, CP.cp_placa');
          Active := True;
          dsRetorno.Enabled := True;
          DBGrid2.Columns.Items[0].FieldName := FieldByName('pv_cod').FieldName;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('c_nome').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('pv_dt_realizado').FieldName;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('cp_categoria').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('cp_modelo').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('cp_placa').FieldName;
          DBGrid2.Columns.Items[6].FieldName := FieldByName('pv_km').FieldName;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       DBGrid2.Visible := True;
       GroupBox2.Visible := False;
       Panel4.Visible := True;
       Panel3.Visible := True;
       Panel4.Caption := 'Pós Venda Realiazado para esse Cliente';
    end;
end;

procedure TfrmPosVenda.DBGrid1DblClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    edtCodCli.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    DBGrid1.Visible := False;
    Panel3.Visible := False;
    Panel4.Visible := False;
    GroupBox2.Visible := True;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select CP.cp_cod, C.c_nome, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, C.c_dia_nasc, C.c_mes_nasc from Clientes_PV CP, clientes C, Contatos_PV CT where CP.cp_cod = '+QuotedStr(edtCodCli.Text)+' and CP.c_cod = C.c_cod and CP.cp_cod = CT.cp_cod');
       Active := True;
       edtCodCli.Text := FieldByName('cp_cod').AsString;
       cbxCliente.Text := FieldByName('c_nome').AsString;
       edtMoto.Text := FieldByName('cp_categoria').AsString;
       edtModelo.Text := FieldByName('cp_modelo').AsString;
       mkePlaca.Text := FieldByName('cp_placa').AsString;
       edtDia.Text := FieldByName('c_dia_nasc').AsString;
       edtMes.Text := FieldByName('c_mes_nasc').AsString;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    btnNovoClick(Sender);
end;

procedure TfrmPosVenda.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmPosVenda.DBGrid2DblClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    edtCodPosVenda.Text := DBGrid2.SelectedField.Text;
    DBGrid2.DataSource.Enabled := False;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select PV.*, C.c_nome, CP.cp_cod, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, C.c_dia_nasc, C.c_mes_nasc from Pos_Venda PV, Clientes C, Clientes_PV CP where PV.pv_cod = '+QuotedStr(edtCodPosVenda.Text)+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod');
       Active := True;
       edtCodCli.Text := FieldByName('cp_cod').AsString;
       cbxCliente.Text := FieldByName('c_nome').AsString;
       edtMoto.Text := FieldByName('cp_categoria').AsString;
       edtModelo.Text := FieldByName('cp_modelo').AsString;
       mkePlaca.Text := FieldByName('cp_placa').AsString;
       edtDia.Text := FieldByName('c_dia_nasc').AsString;
       edtMes.Text := FieldByName('c_mes_nasc').AsString;
       edtKm.Text := FieldByName('pv_km').AsString;
       dtpDtRealizado.Date := FieldByName('pv_dt_realizado').AsDateTime;
       edtResponsavel.Text := FieldByName('pv_responsavel').AsString;
       edtDuvida.Text := FieldByName('pv_duvida').AsString;
       edtReclamacao.Text := FieldByName('pv_reclamacao').AsString;
       edtElogio.Text := FieldByName('pv_elogio').AsString;
       edtSugestao.Text := FieldByName('pv_sugestao').AsString;
       edtObs.Text := FieldByName('pv_obs').AsString;
       cbxPercaGarantia.Text := FieldByName('pv_motivo_perda_garantia').AsString;
       edtFeedEmpresa.Text := FieldByName('pv_feedback_empresa').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('Select f_data from feedback where pv_cod = '+QuotedStr(edtCodPosVenda.Text)+'');
       Active := True;
       if dmContato.fdqContato.RecordCount <> 0  then begin
          dtpRetornoFeed.Date := FieldByName('f_data').AsDateTime;
       end
       else begin
          dtpRetornoFeed.Date := Date;
       end;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
//    BuscaCliente;
    GroupBox2.Visible := True;
    DBGrid2.Visible := False;
    Panel4.Visible := False;
    Panel3.Visible := False;
    Panel4.Caption := 'Consulta de Retorno aos Clientes';
    rdgRealizado.ItemIndex := 0;
    cbxCliente.SetFocus;
end;

procedure TfrmPosVenda.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmPosVenda.DBGrid3DblClick(Sender: TObject);
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    edtCodPosVenda.Text := DBGrid3.SelectedField.Text;
    DBGrid3.DataSource.Enabled := False;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select PV.*, F.f_data, C.c_nome, CP.cp_cod, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, C.c_dia_nasc, C.c_mes_nasc from Pos_Venda PV, Clientes C, Clientes_PV CP, Feedback F where PV.pv_cod = '+QuotedStr(edtCodPosVenda.Text)+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and F.pv_cod = PV.pv_cod');
       Active := True;
       edtCodCli.Text := FieldByName('cp_cod').AsString;
       dtpRetornoFeed.Date := FieldByName('f_data').AsDateTime;
       cbxCliente.Text := FieldByName('c_nome').AsString;
       edtMoto.Text := FieldByName('cp_categoria').AsString;
       edtModelo.Text := FieldByName('cp_modelo').AsString;
       mkePlaca.Text := FieldByName('cp_placa').AsString;
       edtDia.Text := FieldByName('c_dia_nasc').AsString;
       edtMes.Text := FieldByName('c_mes_nasc').AsString;
       edtKm.Text := FieldByName('pv_km').AsString;
       dtpDtRealizado.Date := FieldByName('pv_dt_realizado').AsDateTime;
       edtResponsavel.Text := FieldByName('pv_responsavel').AsString;
       edtDuvida.Text := FieldByName('pv_duvida').AsString;
       edtReclamacao.Text := FieldByName('pv_reclamacao').AsString;
       edtElogio.Text := FieldByName('pv_elogio').AsString;
       edtSugestao.Text := FieldByName('pv_sugestao').AsString;
       edtObs.Text := FieldByName('pv_obs').AsString;
       cbxPercaGarantia.Text := FieldByName('pv_motivo_perda_garantia').AsString;
       edtFeedEmpresa.Text := FieldByName('pv_feedback_empresa').AsString;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
//    BuscaCliente;
    GroupBox2.Visible := True;
    DBGrid3.Visible := False;
    Panel4.Visible := False;
    Panel3.Visible := False;
    Panel4.Caption := 'Consulta de Retorno aos Clientes';
    rdgRealizado.ItemIndex := 0;
    btnRetornoFeed.Enabled := True;
    btnRetornoFeed.Caption := 'Reagendar Re&torno';
    dtpRetornoFeed.Enabled := True;
    dtpRetorno.Date := dtpRetornoFeed.Date;
    cbxCliente.SetFocus;
end;

procedure TfrmPosVenda.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nLinha : Integer;
begin
    nLinha := DBGrid3.DataSource.DataSet.RecNo;
    If odd(nLinha) then begin
       DBGrid3.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid3.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPosVenda.dtpDtPrevistaCloseUp(Sender: TObject);
var vDias : Integer;
begin
    if btnReagendar.Enabled = True then begin
       vDias := DaysBetween(dtpData.Date,dtpDtPrevista.Date);
       if vDias >=5 then begin
          ShowMessage('Escolha uma data entre '+DateToStr(dtpData.Date)+' e '+DateToStr(dtpData.Date+5)+'');
          dtpDtPrevista.Date := dtpData.Date;
       end;
    end;
end;

procedure TfrmPosVenda.dtpDtPrevistaExit(Sender: TObject);
var vDiaSemana : Integer;
    vData : TDate;
begin
    vData := dtpDtPrevista.Date;
    vDiaSemana := DayOfWeek(vData);
    if vDiaSemana = 1 then begin
       dtpDtPrevista.Date := vData + 1;
    end;
    if vDiaSemana = 2 then begin
       dtpDtPrevista.Date := vData;
    end;
    if vDiaSemana = 3 then begin
       dtpDtPrevista.Date := vData;
    end;
    if vDiaSemana = 4 then begin
       dtpDtPrevista.Date := vData;
    end;
    if vDiaSemana = 5 then begin
       dtpDtPrevista.Date := vData;
    end;
    if vDiaSemana = 6 then begin
       dtpDtPrevista.Date := vData;
    end;
    if vDiaSemana = 7 then begin
       dtpDtPrevista.Date := vData + 2;
    end;
end;

procedure TfrmPosVenda.dtpRetornoFeedCloseUp(Sender: TObject);
var vDias : Integer;
begin
    vDias := DaysBetween(dtpRetorno.Date,dtpRetornoFeed.Date);
    if vDias >=5 then begin
       ShowMessage('Escolha uma data entre '+DateToStr(dtpRetorno.Date)+' e '+DateToStr(dtpRetorno.Date+5)+'');
       dtpRetornoFeed.Date := dtpRetorno.Date;
    end;
end;

procedure TfrmPosVenda.dtpRetornoFeedExit(Sender: TObject);
var vDiaSemana : Integer;
    vData : TDate;
begin
    vData := dtpRetornoFeed.Date;
    vDiaSemana := DayOfWeek(vData);
    if vDiaSemana = 1 then begin
       dtpRetornoFeed.Date := vData + 1;
    end;
    if vDiaSemana = 2 then begin
       dtpRetornoFeed.Date := vData;
    end;
    if vDiaSemana = 3 then begin
       dtpRetornoFeed.Date := vData;
    end;
    if vDiaSemana = 4 then begin
       dtpRetornoFeed.Date := vData;
    end;
    if vDiaSemana = 5 then begin
       dtpRetornoFeed.Date := vData;
    end;
    if vDiaSemana = 6 then begin
       dtpRetornoFeed.Date := vData;
    end;
    if vDiaSemana = 7 then begin
       dtpRetornoFeed.Date := vData + 2;
    end;
end;

procedure TfrmPosVenda.edtFeedEmpresaExit(Sender: TObject);
begin
//    if edtDuvida.Text <> '' then begin
//       if edtFeedEmpresa.Text = '' then begin
//          dtpRetornoFeed.Enabled := True;
//          btnRetornoFeed.Enabled := True;
//       end
//       else begin
//          dtpRetornoFeed.Enabled := False;
//          btnRetornoFeed.Enabled := False;
//       end
//    end
//    else begin
//       if edtReclamacao.Text <> '' then begin
//          if edtFeedEmpresa.Text = '' then begin
//             dtpRetornoFeed.Enabled := True;
//             btnRetornoFeed.Enabled := True;
//          end
//       end
//       else begin
//          dtpRetornoFeed.Enabled := False;
//          btnRetornoFeed.Enabled := False;
//       end;
//    end;
end;

procedure TfrmPosVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    btnSairClick(Self);
end;

procedure TfrmPosVenda.FormCreate(Sender: TObject);
begin
     With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxCliente.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
    dsRetorno.Enabled := False;
    dtpDtRealizado.Date := Date;
    dtpRetornoFeed.Date := Date;
    dtpDtPrevista.Date := Date;
end;

procedure TfrmPosVenda.rdgRealizadoClick(Sender: TObject);
begin
    if rdgRealizado.ItemIndex = 1 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select ct_cod from contatos_pv where ct_data = '+QuotedStr(DateToStr(dtpDtPrevista.Date))+' and cp_cod = '+QuotedStr(edtCodCli.Text)+'');
          Active := True;
          edtReagendar.Text := FieldByName('ct_cod').AsString;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       dtpDtPrevista.SetFocus;
       lblDtPrevista.Font.Color := clRed;
       btnReagendar.Enabled := True;
       dtpData.Date := dtpDtPrevista.Date;
    end;
end;

procedure TfrmPosVenda.BuscaCliente;
begin
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select PV.pv_cod, C.c_nome, PV.pv_dt_realizado, CP.cp_moto, CP.cp_placa, PV.pv_km, PV.pv_responsavel from Pos_Venda PV, Clientes C, Clientes_PV CP where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod order by C.c_nome');
       Active := True;
       dsRetorno.Enabled := True;
       DBGrid2.Columns.Items[0].FieldName := FieldByName('pv_cod').FieldName;
       DBGrid2.Columns.Items[1].FieldName := FieldByName('c_nome').FieldName;
       DBGrid2.Columns.Items[2].FieldName := FieldByName('pv_dt_realizado').FieldName;
       DBGrid2.Columns.Items[3].FieldName := FieldByName('cp_moto').FieldName;
       DBGrid2.Columns.Items[4].FieldName := FieldByName('cp_placa').FieldName;
       DBGrid2.Columns.Items[5].FieldName := FieldByName('pv_km').FieldName;
       DBGrid2.Columns.Items[6].FieldName := FieldByName('pv_responsavel').FieldName;
    end;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    DBGrid2.Visible := True;
end;

end.
