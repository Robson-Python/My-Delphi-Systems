unit Contas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Spin, Grids, DBGrids, Jpeg,
  DBCtrls;

type
  TfrmContas = class(TForm)
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
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    btnImprimir: TSpeedButton;
    btnCalc: TSpeedButton;
    Label5: TLabel;
    edtCod: TEdit;
    edtMulta: TLabeledEdit;
    edtVlTotal: TLabeledEdit;
    edtDesconto: TLabeledEdit;
    Label6: TLabel;
    edtTotal: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure edtVlTotalEnter(Sender: TObject);
    procedure Foto;
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Caixa;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContas: TfrmContas;

implementation

uses DB, Contas_qrp, MaskUtils, Enterprise_dm, Principal_frm;

{$R *.dfm}

function fBuscaCodConta() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ct_cod from contas order by ct_cod desc');
       Active := True;
       fBuscaCodConta := FieldByName('ct_cod').AsInteger;
    end;
end;

function fBuscaCodCaixa() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cx_cod from caixa order by cx_cod desc');
       Active := True;
       fBuscaCodCaixa := FieldByName('cx_cod').AsInteger;
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

function fConvertDesconto() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmContas.edtDesconto.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmContas.edtDesconto.Text := valor;
end;

function fConvertMulta() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmContas.edtMulta.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmContas.edtMulta.Text := valor;
end;

function fConvertValorTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmContas.edtVlTotal.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmContas.edtVlTotal.Text := valor;
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

procedure TfrmContas.btnSairClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := True;
    dmEnterprise.zqEnterprise.SQL.Clear;
    dmEnterprise.zqEnterprise.Active := False;
    Close;
end;

procedure TfrmContas.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtConta.Clear; speAno.Text := Ano(dtpVencimento.Date); edtValor.Text := '0,00'; edtTotal.Text := '0,00';
    edtVlTotal.Text := '0,00'; edtDesconto.Text := '0,00'; edtMulta.Text := '0,00'; 
    cbxPeriodo.Text := '';
    dtpVencimento.Date := Date;
    rdgTipo.ItemIndex := -1;
    rdgSituacao.ItemIndex := -1;
    mmoObs.Clear;
    GroupBox1.SetFocus;
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
    edtConta.SetFocus;
end;

procedure TfrmContas.btnInserirClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtConta.Text <> '' then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          fConvertValor;
          fConvertDesconto;
          fConvertMulta;
          fConvertValorTotal;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into contas (CT_COD, CT_DESCRICAO, CT_PERIODO, CT_ANO, CT_DATA, CT_VALOR, CT_DESCONTO, CT_MULTA, CT_VLTOTAL, CT_TIPO, CT_STATUS, CT_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtConta.Text)+', '+QuotedStr(cbxPeriodo.Text)+', '+QuotedStr(speAno.Text)+', '+QuotedStr(DateToStr(dtpVencimento.Date))+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(edtDesconto.Text)+', '+QuotedStr(edtMulta.Text)+', '+QuotedStr(edtVlTotal.Text)+', '+QuotedStr(fTipo)+', '+QuotedStr(fSituacao)+', '+QuotedStr(mmoObs.Text)+')');
             ExecSQL;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertValor;
          fConvertDesconto;
          fConvertMulta;
          fConvertValorTotal;
          If fSituacao = 'S' then begin
             Caixa;
          end;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       end
       else begin
          Application.MessageBox('O campo Descrição não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmContas.btnAtualizarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtCod.Text <> '' then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          fConvertValor;
          fConvertDesconto;
          fConvertMulta;
          fConvertValorTotal;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update CONTAS set CT_DESCRICAO = '+QuotedStr(edtConta.Text)+', CT_PERIODO = '+QuotedStr(cbxPeriodo.Text)+', CT_ANO = '+QuotedStr(speAno.Text)+', CT_DATA = '+QuotedStr(DateToStr(dtpVencimento.Date))+', CT_VALOR = '+QuotedStr(edtValor.Text)+', CT_DESCONTO = '+QuotedStr(edtDesconto.Text)+', CT_MULTA = '+QuotedStr(edtMulta.Text)+', CT_VLTOTAL = '+QuotedStr(edtVlTotal.Text)+', CT_TIPO = '+QuotedStr(fTipo)+', CT_STATUS = '+QuotedStr(fSituacao)+', CT_OBS = '+QuotedStr(mmoObs.Text)+' where ct_cod = '+QuotedStr(edtCod.Text)+'');
             ExecSQL;
             fConvertValor;
             fConvertDesconto;
             fConvertMulta;
             fConvertValorTotal;
             If fSituacao = 'S' then begin
                Caixa;
             end;
             Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end;
          ShortDateFormat := 'dd/mm/yyyy';
       end
       else begin
          Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para atualizar dados.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyOfficer - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmContas.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtCod.Text <> '' then begin
          If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from contas where ct_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
             btnLimparClick(Self);
          end;
       end
       else begin
          Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmContas.btnSelecionarClick(Sender: TObject);
begin
    dtpVencimento.Color := clWindow;
    If cbxPeriodo.Text <> '' then begin
       If rdgTipo.ItemIndex <> -1 then begin
          If rdgSituacao.ItemIndex <> -1 then begin
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(ct_vltotal) from contas where ct_periodo = '+QuotedStr(cbxPeriodo.Text)+' and ct_ano = '+QuotedStr(speAno.Text)+' and ct_tipo = '+QuotedStr(fTipo)+' and ct_status = '+QuotedStr(fSituacao)+' order by ct_descricao, ct_data');
                Active := True;
                If FieldByName('sum(ct_vltotal)').AsString <> '' then begin
                   edtTotal.Text := FieldByName('sum(ct_vltotal)').AsString;
                   edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
                end
                else begin
                   edtTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('select ct_cod, ct_descricao, ct_data, ct_vltotal, ct_obs from contas where ct_periodo = '+QuotedStr(cbxPeriodo.Text)+' and ct_ano = '+QuotedStr(speAno.Text)+' and ct_tipo = '+QuotedStr(fTipo)+' and ct_status = '+QuotedStr(fSituacao)+' order by ct_data, ct_descricao');
                Active := True;
                DBGrid1.DataSource.Enabled := True;
                Open;
                (FieldByName('ct_vltotal') as TNumericField).DisplayFormat := ',0.00';
                DBGrid1.Columns.Items[0].FieldName := FieldByName('ct_cod').FieldName;
                DBGrid1.Columns.Items[1].FieldName := FieldByName('ct_data').FieldName;
                DBGrid1.Columns.Items[2].FieldName := FieldByName('ct_descricao').FieldName;
                DBGrid1.Columns.Items[3].FieldName := FieldByName('ct_vltotal').FieldName;
             end;
          end
          else begin
             Application.MessageBox('Selecione a Situação da conta para consultar!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
             rdgTipo.SetFocus;
          end;
       end
       else begin
          Application.MessageBox('Selecione o Tipo de conta para consultar!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          rdgTipo.SetFocus;
       end;
    end
    else begin
       Application.MessageBox('Selecione o Período/Mês para poder consultar!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       cbxPeriodo.SetFocus;
    end;
    edtCod.Clear; edtConta.Clear; edtValor.Text := '0,00'; edtDesconto.Text :='0,00'; edtMulta.Text := '0,00'; edtVlTotal.Text := '0,00'; mmoObs.Clear;
    dtpVencimento.Date := Date;
end;

procedure TfrmContas.FormActivate(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    dtpVencimento.Date := Date;
    speAno.Text := Ano(dtpVencimento.Date);
    GroupBox1.SetFocus;
end;

procedure TfrmContas.DBGrid1DblClick(Sender: TObject);
begin
    If DBGrid1.Columns.Grid.SelectedField.AsInteger > 0 then begin
       Edit1.Text := DBGrid1.SelectedField.Text;
       DBGrid1.DataSource.Enabled := False;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from contas where ct_cod = '+QuotedStr(Edit1.Text)+'');
          Active := True;
          edtCod.Text := FieldByName('ct_cod').AsString;
          edtConta.Text := FieldByName('ct_descricao').AsString;
          edtValor.Text := FieldByName('ct_valor').AsString;
          edtDesconto.Text := FieldByName('ct_desconto').AsString;
          edtMulta.Text := FieldByName('ct_multa').AsString;
          edtVlTotal.Text := FieldByName('ct_vltotal').AsString;
          cbxPeriodo.Text := FieldByName('ct_periodo').AsString;
          speAno.Text := FieldByName('ct_ano').AsString;
          dtpVencimento.Date := FieldByName('ct_data').AsDateTime;
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
    edtDesconto.Text := FormatCurr('0.00', StrToFloat(edtDesconto.Text));
    edtMulta.Text := FormatCurr('0.00', StrToFloat(edtMulta.Text));
    edtVlTotal.Text := FormatCurr('0.00', StrToFloat(edtVlTotal.Text));
    DBGrid1.DataSource.Enabled := False;
    edtTotal.Text := '0,00';
    If rdgSituacao.ItemIndex = 1 then begin
       If dtpVencimento.Date < Date then begin
          Application.MessageBox('Essa conta está vencida.','MyShop - Atenção',MB_OK+MB_ICONINFORMATION);
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
         Foto;
         qrpContas.qrlMes.Caption := cbxPeriodo.Text;
         qrpContas.qrlAno.Caption := speAno.Text;
         qrpContas.qrlTotal.Caption := edtTotal.Text;
         If rdgTipo.ItemIndex = 0 then begin
            qrpContas.qrlTipo.Caption := 'Contas à Pagar';
         end
         else begin
            qrpContas.qrlTipo.Caption := 'Contas à Receber';
         end;
         If rdgSituacao.ItemIndex = 0 then begin
            qrpContas.qrlSituacao.Caption := 'Contas Pagas';
         end
         else begin
            qrpContas.qrlSituacao.Caption := 'Contas não Pagas';
         end;
         qrpContas.Preview;
       Finally
            qrpContas.Free;
       end;
       edtTotal.Text := '0,00';
    end
    else begin
       Application.MessageBox('Selecione o Período/Mês para imprimir!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
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

procedure TfrmContas.edtVlTotalEnter(Sender: TObject);
var vValor, vDesconto, vMulta : Double;
begin
    vValor := StrToFloat(edtValor.Text);
    vDesconto := StrToFloat(edtDesconto.Text);
    vMulta := StrToFloat(edtMulta.Text);
    edtVlTotal.Text := FloatToStr((vValor-vDesconto)+vMulta);
    edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
    edtMulta.Text := FormatCurr('0.00', StrToFloat(edtMulta.Text));
    edtDesconto.Text := FormatCurr('0.00', StrToFloat(edtDesconto.Text));
    edtVlTotal.Text := FormatCurr('0.00', StrToFloat(edtVlTotal.Text));
end;

procedure TfrmContas.Foto;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With qrpContas.ZQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from registro');
       Active := True;
       fFoto := CreateBlobStream(FieldByName('r_foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          qrpContas.QRImage1.Picture.Assign(Jpeg);
       end
       else begin
          qrpContas.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
    end;
end;

procedure TfrmContas.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    If DBGrid1.DataSource.Enabled = True then begin
       DBGrid1.Hint := 'Para editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid1.Hint := '';
    end;
end;

procedure TfrmContas.Caixa;
var nNovo : Integer;
begin
    nNovo := fBuscaCodCaixa + 1;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertValorTotal;
    With dmEnterprise.zqEnterprise do begin
       If fTipo = 'R' then begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into caixa (CX_COD, CX_DATA, CX_DESCRICAO, CX_SITUACAO, CX_VALOR, CX_OBS, CX_OPERACAO) values ('+IntToStr(nNovo)+', '+QuotedStr(DateToStr(Date))+', ''RECEBIMENTO DE CONTAS'', ''ENTRADA'', '+QuotedStr(edtVlTotal.Text)+', ''Sem Obs.'', ''A'')');
          ExecSQL;
       end
       else begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into caixa (CX_COD, CX_DATA, CX_DESCRICAO, CX_SITUACAO, CX_VALOR, CX_OBS, CX_OPERACAO) values ('+IntToStr(nNovo)+', '+QuotedStr(DateToStr(Date))+', ''PAGAMENTO DE CONTAS'', ''SAÍDA'', '+QuotedStr(edtVlTotal.Text)+', ''Sem Obs.'', ''A'')');
          ExecSQL;
       end;
    end;
    fConvertValorTotal;
    ShortDateFormat := 'dd/mm/yyyy';
end;

end.
