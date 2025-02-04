unit Manutencao_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, DateUtils, DBCtrls,
  Grids, DBGrids;

type
  TfrmManutencao = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lblVeiculo: TLabel;
    edtCod: TLabeledEdit;
    cbxVeic: TComboBox;
    edtCodVeic: TLabeledEdit;
    GroupBox2: TGroupBox;
    lblVenc: TLabel;
    dtpVenc: TDateTimePicker;
    edtKm: TLabeledEdit;
    edtKmFin: TLabeledEdit;
    edtQtd: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    cbxSistema: TComboBox;
    btnSair: TSpeedButton;
    btnCalc: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnNovo: TSpeedButton;
    edtServico: TLabeledEdit;
    dtpDtServ: TDateTimePicker;
    lblDtServ: TLabel;
    edtProduto: TLabeledEdit;
    edtVlServico: TLabeledEdit;
    mmoObs: TMemo;
    lblRest: TLabel;
    Shape3: TShape;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    edtTotal: TLabeledEdit;
    Shape2: TShape;
    btnImprimir: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure cbxVeicChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtVlTotEnter(Sender: TObject);
    procedure edtVlUniExit(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbxVeicKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencao: TfrmManutencao;

implementation

uses Carro_Comando_dm, DB, Manutencao_qrp;

{$R *.dfm}

function fBuscaCodMan() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select mt_cod from manutencao order by mt_cod desc');
       Active := True;
       fBuscaCodMan := FieldByName('mt_cod').AsInteger;
    end;
end;

function fConvertVlUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmManutencao.edtVlUni.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmManutencao.edtVlUni.Text := valor;
end;

function fConvertVlTot() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmManutencao.edtVlTot.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmManutencao.edtVlTot.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmManutencao.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmManutencao.edtQtd.Text := valor;
end;

function fConvertServico() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmManutencao.edtServico.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmManutencao.edtServico.Text := valor;
end;

function vStatus() : String;
begin
    If frmManutencao.RadioGroup1.ItemIndex = 0 then
       vStatus := 'SIM'
    else
       vStatus := 'NÃO'
end;

procedure TfrmManutencao.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmManutencao.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    edtCod.Clear; edtCodVeic.Clear; edtServico.Clear; edtProduto.Clear; edtKm.Clear; edtKmFin.Clear; edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlServico.Text := '0,00'; edtVlTot.Text := '0,00'; edtTotal.Text := '0,00';
    cbxVeic.Text := ''; cbxSistema.Text := '';
    dtpDtServ.Date := Date; dtpVenc.Date := Date;
    mmoObs.Clear;
    RadioGroup1.ItemIndex := -1;
    dmCarroComando.zqCarro.SQL.Clear;
    cbxVeic.SetFocus;
end;

procedure TfrmManutencao.FormCreate(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros order by c_mmodelo');
       Active := True;
       while not Eof do begin
          cbxVeic.Items.Add(FieldByName('c_mmodelo').AsString);
          Next;
       end;
    end;
end;

procedure TfrmManutencao.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    dtpDtServ.Date := Date;
    dtpVenc.Date := Date;
    cbxVeic.SetFocus;
end;

procedure TfrmManutencao.btnInserirClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       fConvertVlUni;
       fConvertVlTot;
       fConvertQtd;
       fConvertServico;
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into manutencao (MT_COD, C_COD, MT_SERVICO, MT_SISTEMA, MT_PRODUTO, MT_DTSERVICO, MT_DTPXSERVICO, MT_KMINI, MT_KMFIM, MT_QTD, MT_VALOR, MT_VLSERVICO, MT_VTOTAL, MT_STATUS, MT_OBS) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodVeic.Text)+', '+QuotedStr(edtServico.Text)+', '+QuotedStr(cbxSistema.Text)+', '+QuotedStr(edtProduto.Text)+', '+QuotedStr(DateToStr(dtpDtServ.Date))+', '+QuotedStr(DateToStr(dtpVenc.Date))+', '+QuotedStr(edtKm.Text)+', '+QuotedStr(edtKmFin.Text)+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlUni.Text)+', '+QuotedStr(edtVlServico.Text)+', '+QuotedStr(edtVlTot.Text)+', '+QuotedStr(vStatus)+', '+QuotedStr(mmoObs.Text)+')');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertVlUni;
          fConvertVlTot;
          fConvertQtd;
          fConvertServico;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       edtCod.Clear; edtServico.Clear; edtProduto.Clear; edtKm.Clear; edtKmFin.Clear; edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlServico.Text := '0,00'; edtVlTot.Text := '0,00';
       dtpDtServ.Date := Date; dtpVenc.Date := Date;
       mmoObs.Clear;
       RadioGroup1.ItemIndex := -1;
       btnSelecionarClick(Self);
    end
    else begin
       Application.MessageBox('O campo código não pode estar vazio!','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmManutencao.btnSelecionarClick(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
       If cbxSistema.Text = '' then begin
          Application.MessageBox('Por favor, selecione o Sistema para consultar!','MyCar - Atenção',MB_OK+MB_ICONINFORMATION);
          cbxSistema.SetFocus;
       end
       else begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(mt_vtotal) from manutencao where c_cod = '+QuotedStr(edtCodVeic.Text)+' and mt_sistema = '+QuotedStr(cbxSistema.Text)+'');
             Active := True;
             If FieldByName('sum(mt_vtotal)').AsString <> '' then begin
                edtTotal.Text := FieldByName('sum(mt_vtotal)').AsString;
                edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
             end
             else begin
                edtTotal.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from manutencao where c_cod = '+QuotedStr(edtCodVeic.Text)+' and mt_sistema = '+QuotedStr(cbxSistema.Text)+' order by mt_dtservico desc, mt_servico');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             Open;
             (FieldByName('mt_valor') as TNumericField).DisplayFormat := ',0.00';
             (FieldByName('mt_vtotal') as TNumericField).DisplayFormat := ',0.00';
             (FieldByName('mt_vlservico') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].FieldName := FieldByName('mt_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('mt_servico').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('mt_dtservico').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('mt_dtpxservico').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('mt_qtd').FieldName;
             DBGrid1.Columns.Items[5].FieldName := FieldByName('mt_valor').FieldName;
             DBGrid1.Columns.Items[6].FieldName := FieldByName('mt_vlservico').FieldName;
             DBGrid1.Columns.Items[7].FieldName := FieldByName('mt_vtotal').FieldName;
             DBGrid1.Columns.Items[8].FieldName := FieldByName('mt_status').FieldName;
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo Veículo não pode ser vazio! Selecione um veículo para consultar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmManutencao.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       fConvertVlUni;
       fConvertVlTot;
       fConvertQtd;
       fConvertServico;
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update manutencao set MT_SERVICO = '+QuotedStr(edtServico.Text)+', MT_SISTEMA = '+QuotedStr(cbxSistema.Text)+', MT_PRODUTO = '+QuotedStr(edtProduto.Text)+', MT_DTSERVICO = '+QuotedStr(DateToStr(dtpDtServ.Date))+', MT_DTPXSERVICO = '+QuotedStr(DateToStr(dtpVenc.Date))+', MT_KMINI = '+QuotedStr(edtKm.Text)+', MT_KMFIM = '+QuotedStr(edtKmFin.Text)+', MT_QTD = '+QuotedStr(edtQtd.Text)+', MT_VALOR = '+QuotedStr(edtVlUni.Text)+', MT_VLSERVICO = '+QuotedStr(edtVlServico.Text)+', MT_VTOTAL = '+QuotedStr(edtVlTot.Text)+', MT_STATUS = '+QuotedStr(vStatus)+', MT_OBS = '+QuotedStr(mmoObs.Text)+' where mt_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       fConvertVlUni;
       fConvertVlTot;
       fConvertQtd;
       fConvertServico;
       ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnSelecionarClick(Self);
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um veículo para atualizar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmManutencao.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from manutencao where mt_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             edtCod.Clear; edtServico.Clear; edtProduto.Clear; edtKm.Clear; edtKmFin.Clear; edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlServico.Text := '0,00'; edtVlTot.Text := '0,00';
             cbxSistema.Text := '';
             dtpDtServ.Date := Date; dtpVenc.Date := Date;
             mmoObs.Clear;
             RadioGroup1.ItemIndex := -1;
             btnSelecionarClick(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um veículo para atualizar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmManutencao.cbxVeicExit(Sender: TObject);
begin
    If edtCodVeic.Text = '' then begin
        With dmCarroComando.zqCarro do begin
           Active := False;
           SQL.Clear;
           SQL.Add('Select c_cod from carros where c_mmodelo = '+QuotedStr(cbxVeic.Text)+'');
           Active := True;
           edtCodVeic.Text := FieldByName('c_cod').AsString;
        end;
    end;
    If edtCod.Text = '' then begin
       cbxSistema.SetFocus;
    end
    else begin
       edtServico.SetFocus;
    end;
end;

procedure TfrmManutencao.cbxVeicChange(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
        With dmCarroComando.zqCarro do begin
           Active := False;
           SQL.Clear;
           SQL.Add('Select c_cod from carros where c_mmodelo = '+QuotedStr(cbxVeic.Text)+'');
           Active := True;
           edtCodVeic.Text := FieldByName('c_cod').AsString;
        end;
    end;
end;

procedure TfrmManutencao.btnNovoClick(Sender: TObject);
var nNovo: Integer;
begin
    btnLimparClick(Self);
    nNovo := fBuscaCodMan + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxVeic.SetFocus;
end;

procedure TfrmManutencao.edtVlTotEnter(Sender: TObject);
var vQtd, vVlUni, vServico : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vVlUni := StrToFloat(edtVlUni.Text);
    vServico := StrToFloat(edtVlServico.Text);
    edtVlTot.Text := FloatToStr((vQtd*vVlUni)+vServico);
    edtVlServico.Text := FormatCurr('0.00', StrToFloat(edtVlServico.Text));
    edtVlTot.Text := FormatCurr('0.00', StrToFloat(edtVlTot.Text));
end;

procedure TfrmManutencao.edtVlUniExit(Sender: TObject);
begin
    edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
end;

procedure TfrmManutencao.btnCalcClick(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmManutencao.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If edtCodVeic.Text <> '' then
       DBGrid1.Hint := 'Para editar, atualizar ou excluir os dados, dê um duplo clique no registro selecionado'
    else
       DBGrid1.Hint := '';
end;

procedure TfrmManutencao.cbxVeicKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       btnSelecionarClick(Self);
    end;
end;

procedure TfrmManutencao.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from manutencao where mt_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
       edtServico.Text := FieldByName('mt_servico').AsString;
       cbxSistema.Text := FieldByName('mt_sistema').AsString;
       edtProduto.Text := FieldByName('mt_produto').AsString;
       dtpDtServ.Date := FieldByName('mt_dtservico').AsDateTime;
       dtpVenc.Date := FieldByName('mt_dtpxservico').AsDateTime;
       edtKm.Text := FieldByName('mt_kmini').AsString;
       edtKmFin.Text := FieldByName('mt_kmfim').AsString;
       edtQtd.Text := FieldByName('mt_qtd').AsString;
       edtVlUni.Text := FieldByName('mt_valor').AsString;
       edtVlServico.Text := FieldByName('mt_vlservico').AsString;
       edtVlTot.Text := FieldByName('mt_vtotal').AsString;
       mmoObs.Text := FieldByName('mt_obs').AsString;
       If FieldByName('mt_status').AsString = 'SIM' then begin
          RadioGroup1.ItemIndex := 0
       end
       else begin
          RadioGroup1.ItemIndex := 1;
       end;
    end;
    edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
    edtVlServico.Text := FormatCurr('0.00', StrToCurr(edtVlServico.Text));
    edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
    btnSelecionarClick(Self);
    edtServico.SetFocus;
end;

procedure TfrmManutencao.btnImprimirClick(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
       Try
         Application.CreateForm(TqrpManutencao, qrpManutencao);
         btnSelecionarClick(Self);
         qrpManutencao.qrlTotal.Caption := edtTotal.Text;
         qrpManutencao.qrlCodVeiculo.Caption := edtCodVeic.Text;
         qrpManutencao.qrlVeiculo.Caption := cbxVeic.Text;
         qrpManutencao.Preview;
       Finally
            qrpManutencao.Free;
       end;
       edtTotal.Text := '0,00';
    end
    else begin
       Application.MessageBox('Selecione o Veículo para imprimir!','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

end.
