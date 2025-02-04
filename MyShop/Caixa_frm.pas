unit Caixa_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DBCtrls, Grids, DBGrids,
  Spin;

type
  TfrmCaixa = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtCod: TEdit;
    Label2: TLabel;
    dtpData: TDateTimePicker;
    rdgSituacao: TRadioGroup;
    mmObs: TMemo;
    Label3: TLabel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Label4: TLabel;
    edtVlTotal: TEdit;
    Label5: TLabel;
    edtSaldo: TEdit;
    Label6: TLabel;
    edtDescricao: TEdit;
    Label7: TLabel;
    edtValor: TEdit;
    CheckBox1: TCheckBox;
    lblDias: TLabel;
    edtDias: TSpinEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure Saldo;
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure rdgSituacaoClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpDataCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses Enterprise_dm, Principal_frm, DB, ZDataset;

{$R *.dfm}

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

function fSituacao() : String;
begin
    If frmCaixa.rdgSituacao.ItemIndex = 0 then
       fSituacao := 'ENTRADA'
    else
       fSituacao := 'SAÍDA';
end;

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCaixa.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCaixa.edtValor.Text := valor;
end;

procedure TfrmCaixa.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCaixa.btnLimparClick(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    edtCod.Clear; edtDescricao.Clear; edtValor.Text := '0,00'; edtVlTotal.Text := '0,00';
    rdgSituacao.ItemIndex := -1;
    CheckBox1.Checked := False;
    dtpData.Date := Date;
    mmObs.Clear;
    edtDescricao.SetFocus;
end;

procedure TfrmCaixa.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodCaixa + 1;
    edtCod.Text := IntToStr(nNovo);
    edtDescricao.SetFocus;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
    Saldo;
    dmEnterprise.dsEnterprise.Enabled := False;
    dtpData.Date := Date;
    rdgSituacao.ItemIndex:= -1;
    edtDescricao.SetFocus;
end;

procedure TfrmCaixa.btnInserirClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       If edtCod.Text <> '' then begin
          fConvertValor;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into caixa (CX_COD, CX_DATA, CX_DESCRICAO, CX_SITUACAO, CX_VALOR, CX_OBS, CX_OPERACAO) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtDescricao.Text)+', '+QuotedStr(fSituacao)+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(mmObs.Text)+', ''M'')');
             ExecSQL;
          end;
          fConvertValor;
          ShortDateFormat := 'dd/mm/yyyy';
          btnLimparClick(Self);
          Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          Saldo;
       end
       else begin
          Application.MessageBox('O campo Código não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCaixa.btnSelecionarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If rdgSituacao.ItemIndex <> -1 then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With dmEnterprise.zqEnterprise do begin
             If CheckBox1.Checked = False then begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(cx_valor) from caixa where cx_data = '+QuotedStr(DateToStr(dtpData.Date))+' and cx_situacao = '+QuotedStr(fSituacao)+'');
                Active := True;
                If FieldByName('sum(cx_valor)').AsString <> '' then begin
                   edtVlTotal.Text := FieldByName('sum(cx_valor)').AsString;
                   edtVlTotal.Text := FormatCurr(',0.00', StrToFloat(edtVlTotal.Text));
                end
                else begin
                   edtVlTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('Select * from caixa where cx_data = '+QuotedStr(DateToStr(dtpData.Date))+' and cx_situacao = '+QuotedStr(fSituacao)+' order by cx_descricao, cx_valor');
                Active := True;
             end
             else begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(cx_valor) from caixa where cx_data between '+QuotedStr(DateToStr(dtpData.Date))+' and '+QuotedStr(DateToStr(dtpData.Date+StrToInt(edtDias.Text)-1))+' and cx_situacao = '+QuotedStr(fSituacao)+'');
                Active := True;
                If FieldByName('sum(cx_valor)').AsString <> '' then begin
                   edtVlTotal.Text := FieldByName('sum(cx_valor)').AsString;
                   edtVlTotal.Text := FormatCurr(',0.00', StrToFloat(edtVlTotal.Text));
                end
                else begin
                   edtVlTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('Select * from caixa where cx_data between '+QuotedStr(DateToStr(dtpData.Date))+' and '+QuotedStr(DateToStr(dtpData.Date+StrToInt(edtDias.Text)-1))+' and cx_situacao = '+QuotedStr(fSituacao)+' order by cx_descricao, cx_valor');
                Active := True;
             end;
             dmEnterprise.dsEnterprise.Enabled := True;
             Open;
             (FieldByName('cx_valor') as TNumericField).DisplayFormat := ',0.00';
             DBGrid1.Columns.Items[0].FieldName := FieldByName('cx_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('cx_data').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('cx_descricao').FieldName;
             DBGrid1.Columns.Items[3].FieldName := FieldByName('cx_valor').FieldName;
             DBGrid1.Columns.Items[4].FieldName := FieldByName('cx_situacao').FieldName;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
       end
       else begin
          Application.MessageBox('Selecione a Situação do caixa para consultar!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          rdgSituacao.SetFocus;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCaixa.DBGrid1DblClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       edtCod.Text := DBGrid1.SelectedField.Text;
       DBGrid1.DataSource.Enabled := False;
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from caixa where cx_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          edtCod.Text := FieldByName('cx_cod').AsString;
          dtpData.Date := FieldByName('cx_data').AsDateTime;
          edtDescricao.Text := FieldByName('cx_descricao').AsString;
          edtValor.Text := FieldByName('cx_valor').AsString;
          mmObs.Text := FieldByName('cx_obs').AsString;
          If FieldByName('cx_situacao').AsString = 'ENTRADA' then begin
             rdgSituacao.ItemIndex := 0;
          end
          else begin
             rdgSituacao.ItemIndex := 1;
          end;
       end;
       edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
       dtpData.SetFocus;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCaixa.btnAtualizarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       If edtCod.Text <> '' then begin
          fConvertValor;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update caixa set CX_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', CX_DESCRICAO = '+QuotedStr(edtDescricao.Text)+', CX_VALOR = '+QuotedStr(edtValor.Text)+', CX_SITUACAO = '+QuotedStr(fSituacao)+', CX_OBS = '+QuotedStr(mmObs.Text)+' where CX_COD = '+QuotedStr(edtCod.Text)+'');
             ExecSQL;
             fConvertValor;
             Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             Saldo;
          end;
       end
       else begin
          Application.MessageBox('O campo Nome não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCaixa.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If edtCod.Text <> '' then begin
          If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from caixa where cx_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
             end;
             btnLimparClick(Self);
             Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             Saldo;
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

procedure TfrmCaixa.edtValorExit(Sender: TObject);
begin
    edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
end;

procedure TfrmCaixa.Saldo;
var vEntrada, vSaida : Double;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from caixa where cx_situacao = ''ENTRADA''');
       Active := True;
       If dmEnterprise.zqEnterprise.RecordCount <> 0 then begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select sum(cx_valor) from caixa where cx_situacao = ''ENTRADA''');
          Active := True;
          vEntrada := FieldByName('sum(cx_valor)').AsFloat;
       end
       else begin
          vEntrada := 0;
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from caixa where cx_situacao = ''SAÍDA''');
       Active := True;
       If dmEnterprise.zqEnterprise.RecordCount <> 0 then begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select sum(cx_valor) from caixa where cx_situacao = ''SAÍDA''');
          Active := True;
          vSaida := FieldByName('sum(cx_valor)').AsFloat;
       end
       else begin
          vSaida := 0;
       end;
       edtSaldo.Text := FloatToStr(vEntrada-vSaida);
    end;
    If StrToFloat(edtSaldo.Text) > 0 then begin
       edtSaldo.Color := clMoneyGreen;
    end
    else begin
       edtSaldo.Color := $002F34F0;
    end;
    edtSaldo.Text := FormatCurr(',0.00', StrToFloat(edtSaldo.Text));
end;

procedure TfrmCaixa.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    If DBGrid1.DataSource.Enabled = True then begin
       DBGrid1.Hint := 'Para editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid1.Hint := '';
    end;
end;

procedure TfrmCaixa.rdgSituacaoClick(Sender: TObject);
begin
    edtDescricao.SetFocus;
end;

procedure TfrmCaixa.CheckBox1Click(Sender: TObject);
begin
    If CheckBox1.Checked = True then begin
       dtpData.SetFocus;
       edtDias.Value := 31;
       edtDias.Visible := True;
       lblDias.Visible := True;
    end
    else begin
       edtDias.Visible := False;
       lblDias.Visible := False;
    end;
end;

procedure TfrmCaixa.dtpDataCloseUp(Sender: TObject);
begin
    If CheckBox1.Checked = True then begin
       edtDias.SetFocus;
    end;
end;

end.
