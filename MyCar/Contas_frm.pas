unit Contas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Spin, Grids, DBGrids,
  DBCtrls;

type
  TfrmContas = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    edtConta: TLabeledEdit;
    Label1: TLabel;
    cbxPeriodo: TComboBox;
    Label2: TLabel;
    dtpVencimento: TDateTimePicker;
    edtValor: TLabeledEdit;
    Label3: TLabel;
    mmoObs: TMemo;
    rdgTipo: TRadioGroup;
    rdgSituacao: TRadioGroup;
    DBGrid1: TDBGrid;
    speAno: TSpinEdit;
    Label4: TLabel;
    Edit1: TEdit;
    Shape2: TShape;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    edtTotal: TLabeledEdit;
    Shape3: TShape;
    Panel4: TPanel;
    btnImprimir: TSpeedButton;
    btnCalc: TSpeedButton;
    GroupBox2: TGroupBox;
    lblVeiculo: TLabel;
    lblDtReg: TLabel;
    edtCod: TLabeledEdit;
    cbxVeic: TComboBox;
    edtCodVeiculo: TLabeledEdit;
    dtpDtReg: TDateTimePicker;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxVeicChange(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContas: TfrmContas;

implementation

uses DB, MaskUtils, Carro_Comando_dm, Contas_qrp;

{$R *.dfm}

function fBuscaCodConta() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ct_cod from contas order by ct_cod desc');
       Active := True;
       fBuscaCodConta := FieldByName('ct_cod').AsInteger;
    end;
end;

function fTipo() : String;
begin
    If frmContas.rdgTipo.ItemIndex = 0 then
       fTipo := 'P'
    else
       fTipo := 'R';
end;

function fSituacao() : String;
begin
    If frmContas.rdgSituacao.ItemIndex = 0 then
       fSituacao := 'S'
    else
       fSituacao := 'N';
end;

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmContas.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmContas.edtValor.Text := valor;
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
  DiaDasemana [3]:= 'Ter�afeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'S�bado';
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

procedure TfrmContas.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmContas.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtConta.Clear; speAno.Text := Ano(dtpVencimento.Date); edtValor.Text := '0,00'; edtTotal.Text := '0,00'; edtCodVeiculo.Clear;
    cbxPeriodo.Text := ''; cbxVeic.Text := '';
    dtpVencimento.Date := Date;
    rdgTipo.ItemIndex := -1;
    rdgSituacao.ItemIndex := -1;
    mmoObs.Clear;
    cbxVeic.SetFocus;
    DBGrid1.DataSource.Enabled := False;
    If dtpVencimento.Color = clRed then begin
       dtpVencimento.Color := clWindow;
    end;
end;

procedure TfrmContas.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodConta + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxVeic.SetFocus;
end;

procedure TfrmContas.btnInserirClick(Sender: TObject);
begin
    If edtConta.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       fConvertValor;
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into contas (CT_COD, C_COD, CT_DATA, CT_NOME, CT_PERIODO, CT_ANO, CT_VENCIMENTO, CT_VALOR, CT_TIPO, CT_STATUS, CT_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodVeiculo.Text)+', '+QuotedStr(DateToStr(dtpDtReg.Date))+', '+QuotedStr(edtConta.Text)+', '+QuotedStr(cbxPeriodo.Text)+', '+QuotedStr(speAno.Text)+', '+QuotedStr(DateToStr(dtpVencimento.Date))+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(fTipo)+', '+QuotedStr(fSituacao)+', '+QuotedStr(mmoObs.Text)+')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       fConvertValor;
    end
    else begin
       Application.MessageBox('O campo Ve�culo n�o pode estar vazio!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmContas.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       fConvertValor;
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update CONTAS set CT_NOME = '+QuotedStr(edtConta.Text)+', CT_DATA  = '+QuotedStr(DateToStr(dtpDtReg.Date))+', CT_PERIODO = '+QuotedStr(cbxPeriodo.Text)+', CT_ANO = '+QuotedStr(speAno.Text)+', CT_VENCIMENTO = '+QuotedStr(DateToStr(dtpVencimento.Date))+', CT_VALOR = '+QuotedStr(edtValor.Text)+', CT_TIPO = '+QuotedStr(fTipo)+', CT_STATUS = '+QuotedStr(fSituacao)+', CT_OBS = '+QuotedStr(mmoObs.Text)+' where ct_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          fConvertValor;
          Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end
    else begin
       Application.MessageBox('Selecione um ve�culo para atualizar dados.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmContas.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from contas where ct_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Excluido com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
          btnLimparClick(Self);
       end;
    end
    else begin
       Application.MessageBox('Selecione um ve�culo para poder excluir.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmContas.edtValorExit(Sender: TObject);
begin
//    edtValor.Text := FormatCurr(',0.00', StrToFloat(edtValor.Text));
end;

procedure TfrmContas.btnSelecionarClick(Sender: TObject);
begin
    dtpVencimento.Color := clWindow;
    If cbxPeriodo.Text <> '' then begin
       If rdgTipo.ItemIndex <> -1 then begin
          If rdgSituacao.ItemIndex <> -1 then begin
             With dmCarroComando.zqCarro do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(ct_valor) from contas where c_cod = '+QuotedStr(edtCodVeiculo.Text)+' and ct_periodo = '+QuotedStr(cbxPeriodo.Text)+' and ct_ano = '+QuotedStr(speAno.Text)+' and ct_tipo = '+QuotedStr(fTipo)+' and ct_status = '+QuotedStr(fSituacao)+' order by ct_nome, ct_vencimento');
                Active := True;
                If FieldByName('sum(ct_valor)').AsString <> '' then begin
                   edtTotal.Text := FieldByName('sum(ct_valor)').AsString;
                   edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
                end
                else begin
                   edtTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('select ct_cod, ct_nome, ct_vencimento, ct_valor, ct_obs, ct_data from contas where c_cod = '+QuotedStr(edtCodVeiculo.Text)+' and ct_periodo = '+QuotedStr(cbxPeriodo.Text)+' and ct_ano = '+QuotedStr(speAno.Text)+' and ct_tipo = '+QuotedStr(fTipo)+' and ct_status = '+QuotedStr(fSituacao)+' order by ct_vencimento, ct_nome');
                Active := True;
                DBGrid1.DataSource.Enabled := True;
                Open;
                (FieldByName('ct_valor') as TNumericField).DisplayFormat := ',0.00';
                DBGrid1.Columns.Items[0].FieldName := FieldByName('ct_cod').FieldName;
                DBGrid1.Columns.Items[1].FieldName := FieldByName('ct_vencimento').FieldName;
                DBGrid1.Columns.Items[2].FieldName := FieldByName('ct_nome').FieldName;
                DBGrid1.Columns.Items[3].FieldName := FieldByName('ct_valor').FieldName;
             end;
          end
          else begin
             Application.MessageBox('Selecione a Situa��o da Conta para consultar!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
             rdgSituacao.Buttons[0].SetFocus;
          end;
       end
       else begin
          Application.MessageBox('Selecione o Tipo de conta para consultar!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
          rdgTipo.Buttons[0].SetFocus;
       end;
    end
    else begin
       Application.MessageBox('Selecione o Per�odo/M�s para poder consultar!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
       cbxPeriodo.SetFocus;
    end;
    edtCod.Clear; edtConta.Clear; edtValor.Text := '0,00'; mmoObs.Clear;
    dtpVencimento.Date := Date;
end;

procedure TfrmContas.FormActivate(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    dtpVencimento.Date := Date;
    dtpDtReg.Date := Date;
    speAno.Text := Ano(dtpVencimento.Date);
    cbxVeic.SetFocus;
end;

procedure TfrmContas.DBGrid1DblClick(Sender: TObject);
begin
    If DBGrid1.Columns.Grid.SelectedField.AsInteger > 0 then begin
       Edit1.Text := DBGrid1.SelectedField.Text;
       DBGrid1.DataSource.Enabled := False;
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from contas where ct_cod = '+QuotedStr(Edit1.Text)+'');
          Active := True;
          edtCod.Text := FieldByName('ct_cod').AsString;
          edtConta.Text := FieldByName('ct_nome').AsString;
          edtValor.Text := FieldByName('ct_valor').AsString;
          cbxPeriodo.Text := FieldByName('ct_periodo').AsString;
          speAno.Text := FieldByName('ct_ano').AsString;
          dtpVencimento.Date := FieldByName('ct_vencimento').AsDateTime;
          dtpDtReg.Date := FieldByName('ct_data').AsDateTime;
          mmoObs.Text := FieldByName('ct_obs').AsString;
          If FieldByName('ct_tipo').AsString = 'P' then begin
             rdgTipo.ItemIndex := 0;
          end
          else begin
             rdgTipo.ItemIndex := 1;
          end;
          If FieldByName('ct_status').AsString = 'S' then begin
             rdgSituacao.ItemIndex := 0;
          end
          else begin
             rdgSituacao.ItemIndex := 1;
          end;
       end;
    end;
    edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
    DBGrid1.DataSource.Enabled := False;
    edtTotal.Text := '0,00';
    If rdgSituacao.ItemIndex = 1 then begin
       If dtpVencimento.Date < Date then begin
          Application.MessageBox('Essa conta est� vencida.','MyCar - Aten��o',MB_OK+MB_ICONINFORMATION);
          dtpVencimento.Color := clRed;
       end;
    end;
end;

procedure TfrmContas.btnImprimirClick(Sender: TObject);
begin
    If cbxPeriodo.Text <> '' then begin
       Try
         Application.CreateForm(TqrpContas, qrpContas);
         btnSelecionarClick(Self);
         qrpContas.qrlMes.Caption := cbxPeriodo.Text;
         qrpContas.qrlAno.Caption := speAno.Text;
         qrpContas.qrlTotal.Caption := edtTotal.Text;
         qrpContas.qrlCodVeiculo.Caption := edtCodVeiculo.Text;
         qrpContas.qrlVeiculo.Caption := cbxVeic.Text;
         If rdgTipo.ItemIndex = 0 then begin
            qrpContas.qrlTipo.Caption := 'Contas � Pagar';
         end
         else begin
            qrpContas.qrlTipo.Caption := 'Contas � Receber';
         end;
         If rdgSituacao.ItemIndex = 0 then begin
            qrpContas.qrlSituacao.Caption := 'Contas Pagas';
         end
         else begin
            qrpContas.qrlSituacao.Caption := 'Contas n�o Pagas';
         end;
         qrpContas.Preview;
       Finally
            qrpContas.Free;
       end;
       edtTotal.Text := '0,00';
    end
    else begin
       Application.MessageBox('Selecione o Per�odo/M�s para imprimir!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmContas.btnCalcClick(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmContas.FormCreate(Sender: TObject);
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

procedure TfrmContas.cbxVeicChange(Sender: TObject);
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

procedure TfrmContas.cbxVeicExit(Sender: TObject);
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

end.
