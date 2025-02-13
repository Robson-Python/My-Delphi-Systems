unit Pecas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, DateUtils, ExtDlgs;

type
  TfrmPecas = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtCod: TLabeledEdit;
    lblVeiculo: TLabel;
    cbxVeic: TComboBox;
    edtCodVeiculo: TLabeledEdit;
    Shape1: TShape;
    btnNovo: TSpeedButton;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    Shape3: TShape;
    Shape2: TShape;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    lblRest: TLabel;
    edtKm: TLabeledEdit;
    edtPeca: TLabeledEdit;
    edtQtd: TLabeledEdit;
    edtValor: TLabeledEdit;
    edtVlTotal: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    mmoObs: TMemo;
    btnCalc: TSpeedButton;
    dtpDtReg: TDateTimePicker;
    lblDtReg: TLabel;
    edtServico: TLabeledEdit;
    edtTotal: TLabeledEdit;
    btnImprimir: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbxVeicChange(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure edtVlTotalEnter(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure cbxVeicKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPecas: TfrmPecas;

implementation

uses Carro_Comando_dm, DB, Pecas_qrp, Contas_qrp;

{$R *.dfm}

function fBuscaCodPec() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select pc_cod from pecas order by pc_cod desc');
       Active := True;
       fBuscaCodPec := FieldByName('pc_cod').AsInteger;
    end;
end;

function fConvertVlUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmPecas.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmPecas.edtValor.Text := valor;
end;

function fConvertVlTot() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmPecas.edtVlTotal.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmPecas.edtVlTotal.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmPecas.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmPecas.edtQtd.Text := valor;
end;

function fConvertServico() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmPecas.edtServico.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmPecas.edtServico.Text := valor;
end;

function vStatus() : String;
begin
    If frmPecas.RadioGroup1.ItemIndex = 0 then
       vStatus := 'SIM'
    else
       vStatus := 'N�O'
end;

procedure TfrmPecas.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmPecas.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    edtCod.Clear; edtCodVeiculo.Clear; edtPeca.Clear; edtKm.Clear; edtQtd.Text := '0'; edtValor.Text := '0,00'; edtVlTotal.Text := '0,00'; edtServico.Text := '0,00'; edtTotal.Text := '0,00';
    cbxVeic.Text := '';
    dtpDtReg.Date := Date;
    mmoObs.Clear;
    RadioGroup1.ItemIndex := -1;
    dmCarroComando.zqCarro.SQL.Clear;
    cbxVeic.SetFocus;
end;

procedure TfrmPecas.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    dtpDtReg.Date := Date;
    cbxVeic.SetFocus;
end;

procedure TfrmPecas.FormCreate(Sender: TObject);
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

procedure TfrmPecas.btnInserirClick(Sender: TObject);
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
          SQL.Add('Insert into pecas (PC_COD, C_COD, PC_DATA, PC_KM, PC_NOME, PC_QTD, PC_VALOR, PC_SERVICO, PC_VTOTAL, PC_STATUS, PC_OBS) Values ('+QuotedStr(edtCod.Text)+', '+edtCodVeiculo.Text+', '+QuotedStr(DateToStr(dtpDtReg.Date))+', '+QuotedStr(edtKm.Text)+', '+QuotedStr(edtPeca.Text)+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(edtServico.Text)+', '+QuotedStr(edtVlTotal.Text)+', '+QuotedStr(vStatus)+', '+QuotedStr(mmoObs.Text)+')');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertVlUni;
          fConvertVlTot;
          fConvertQtd;
          fConvertServico;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       edtCod.Clear; edtPeca.Clear; edtKm.Clear; edtQtd.Text := '0'; edtValor.Text := '0,00'; edtVlTotal.Text := '0,00'; edtServico.Text := '0,00';
       dtpDtReg.Date := Date;
       mmoObs.Clear;
       RadioGroup1.ItemIndex := -1;
       btnSelecionarClick(Self);
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode estar vazio!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPecas.btnAtualizarClick(Sender: TObject);
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
          SQL.Add('Update pecas set pc_data = '+QuotedStr(DateToStr(dtpDtReg.Date))+', pc_nome = '+QuotedStr(edtPeca.Text)+', pc_km = '+QuotedStr(edtKm.Text)+', pc_qtd = '+QuotedStr(edtQtd.Text)+', pc_valor = '+QuotedStr(edtValor.Text)+', pc_servico = '+QuotedStr(edtServico.Text)+', pc_vtotal = '+QuotedStr(edtVlTotal.Text)+', pc_obs = '+QuotedStr(mmoObs.Text)+', pc_status = '+QuotedStr(vStatus)+' where pc_cod = '+ QuotedStr(edtCod.Text)+'');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertVlUni;
          fConvertVlTot;
          fConvertQtd;
          fConvertServico;
          Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnSelecionarClick(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode ser vazio! Selecione um ve�culo para atualizar dados.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPecas.btnSelecionarClick(Sender: TObject);
begin
    ActiveControl := nil;
    If cbxVeic.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sum(pc_vtotal) from pecas where c_cod = '+QuotedStr(edtCodVeiculo.Text)+'');
          Active := True;
          If FieldByName('sum(pc_vtotal)').AsString <> '' then begin
             edtTotal.Text := FieldByName('sum(pc_vtotal)').AsString;
             edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('select * from pecas where c_cod = '+QuotedStr(edtCodVeiculo.Text)+' order by pc_data, pc_nome');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          Open;
          (FieldByName('pc_valor') as TNumericField).DisplayFormat := ',0.00';
          (FieldByName('pc_vtotal') as TNumericField).DisplayFormat := ',0.00';
          (FieldByName('pc_servico') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('pc_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('pc_data').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('pc_nome').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('pc_km').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('pc_qtd').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('pc_valor').FieldName;
          DBGrid1.Columns.Items[6].FieldName := FieldByName('pc_servico').FieldName;
          DBGrid1.Columns.Items[7].FieldName := FieldByName('pc_vtotal').FieldName;
          DBGrid1.Columns.Items[8].FieldName := FieldByName('pc_status').FieldName;
       end;
    end
    else begin
       Application.MessageBox('O campo Ve�culo n�o pode ser vazio! Selecione um ve�culo para consultar dados.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPecas.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from pecas where pc_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             edtCod.Clear; edtPeca.Clear; edtKm.Clear; edtQtd.Text := '0'; edtValor.Text := '0,00'; edtVlTotal.Text := '0,00'; edtServico.Text := '0,00';
             dtpDtReg.Date := Date;
             mmoObs.Clear;
             RadioGroup1.ItemIndex := -1;
             btnSelecionarClick(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode ser vazio! Selecione um registro para poder excluir.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmPecas.btnNovoClick(Sender: TObject);
var nNovo: Integer;
begin
    btnLimparClick(Self);
    nNovo := fBuscaCodPec + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxVeic.SetFocus;
end;

procedure TfrmPecas.cbxVeicChange(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from carros where c_mmodelo = '+QuotedStr(cbxVeic.Text)+'');
          Active := True;
          edtCodVeiculo.Text := FieldByName('c_cod').AsString;
       end;
    end;
end;

procedure TfrmPecas.cbxVeicExit(Sender: TObject);
begin
    If edtCodVeiculo.Text = '' then begin
        With dmCarroComando.zqCarro do begin
           Active := False;
           SQL.Clear;
           SQL.Add('Select c_cod from carros where c_mmodelo = '+QuotedStr(cbxVeic.Text)+'');
           Active := True;
           edtCodVeiculo.Text := FieldByName('c_cod').AsString;
        end;
    end;
    If edtCod.Text <> '' then begin
       dtpDtReg.SetFocus;
    end;
end;

procedure TfrmPecas.btnCalcClick(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmPecas.edtVlTotalEnter(Sender: TObject);
var vQtd, vUnit, vServico : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vUnit := StrToFloat(edtValor.Text);
    vServico := StrToFloat(edtServico.Text);
    edtVlTotal.Text := FloatToStr((vUnit*vQtd)+vServico);
    edtVlTotal.Text := FormatCurr('0.00', StrToCurr(edtVlTotal.Text));
    edtServico.Text := FormatCurr('0.00', StrToCurr(edtServico.Text));
end;

procedure TfrmPecas.edtValorExit(Sender: TObject);
begin
    edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
end;

procedure TfrmPecas.cbxVeicKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       btnSelecionarClick(Self);
    end;
end;

procedure TfrmPecas.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from pecas where pc_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
       dtpDtReg.Date := FieldByName('pc_data').AsDateTime;
       edtPeca.Text := FieldByName('pc_nome').AsString;
       edtKm.Text := FieldByName('pc_km').AsString;
       edtQtd.Text := FieldByName('pc_qtd').AsString;
       edtValor.Text := FieldByName('pc_valor').AsString;
       edtServico.Text := FieldByName('pc_servico').AsString;
       edtVlTotal.Text := FieldByName('pc_vtotal').AsString;
       mmoObs.Text := FieldByName('pc_obs').AsString;
       If FieldByName('pc_status').AsString = 'SIM' then begin
          RadioGroup1.ItemIndex := 0
       end
       else begin
          RadioGroup1.ItemIndex := 1;
       end;
    end;
    edtVlTotal.Text := FormatCurr('0.00', StrToCurr(edtVlTotal.Text));
    edtServico.Text := FormatCurr('0.00', StrToCurr(edtServico.Text));
    edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
    btnSelecionarClick(Self);
    edtPeca.SetFocus;
end;

procedure TfrmPecas.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If edtCodVeiculo.Text <> '' then
       DBGrid1.Hint := 'Para editar, atualizar ou excluir os dados, d� um duplo clique no registro selecionado'
    else
       DBGrid1.Hint := '';
end;

procedure TfrmPecas.btnImprimirClick(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
       Try
         Application.CreateForm(TqrpPecas, qrpPecas);
         btnSelecionarClick(Self);
         qrpPecas.qrlTotal.Caption := edtTotal.Text;
         qrpPecas.qrlCodVeiculo.Caption := edtCodVeiculo.Text;
         qrpPecas.qrlVeiculo.Caption := cbxVeic.Text;
         qrpPecas.Preview;
       Finally
            qrpPecas.Free;
       end;
       edtTotal.Text := '0,00';
    end
    else begin
       Application.MessageBox('Selecione o Ve�culo para imprimir!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

end.
