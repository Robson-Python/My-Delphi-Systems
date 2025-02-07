unit Servicos_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, ComCtrls, Jpeg;

type
  TfrmServicos = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbxServico: TComboBox;
    edtValor: TLabeledEdit;
    mmObs: TMemo;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    cbxCliente: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    mmoDescricao: TMemo;
    edtVlOutros: TLabeledEdit;
    edtVlTotalServico: TLabeledEdit;
    edtDesconto: TLabeledEdit;
    rdgStatus: TRadioGroup;
    Label5: TLabel;
    dtpData: TDateTimePicker;
    Label6: TLabel;
    mmoObsOrdem: TMemo;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBNavigator2: TDBNavigator;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dtpIni: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Label11: TLabel;
    edtCodCli: TEdit;
    rdgConsultar: TRadioGroup;
    Label7: TLabel;
    edtCodOrdem: TEdit;
    Label12: TLabel;
    edtCod: TEdit;
    btnImprimir: TSpeedButton;
    Label13: TLabel;
    edtServico: TEdit;
    Label14: TLabel;
    edtVlServico: TEdit;
    edtTotal: TEdit;
    Label28: TLabel;
    CheckBox1: TCheckBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure cbxServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtVlTotalServicoEnter(Sender: TObject);
    procedure cbxClienteChange(Sender: TObject);
    procedure cbxClienteExit(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Foto;
    procedure PageControl1Change(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Caixa;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServicos: TfrmServicos;

implementation

uses Enterprise_dm, DB, OrdemServico_qrp, Principal_frm;

{$R *.dfm}

function fBuscaCodSevico() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select s_cod from servicos order by s_cod desc');
       Active := True;
       fBuscaCodSevico := FieldByName('s_cod').AsInteger;
    end;
end;

function fBuscaCodOrdem() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select os_cod from ordem_servico order by os_cod desc');
       Active := True;
       fBuscaCodOrdem := FieldByName('os_cod').AsInteger;
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

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmServicos.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmServicos.edtValor.Text := valor;
end;

function fConvertValorOrdem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmServicos.edtVlServico.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmServicos.edtVlServico.Text := valor;
end;

function fConvertVlOutros() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmServicos.edtVlOutros.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmServicos.edtVlOutros.Text := valor;
end;

function fConvertDesconto() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmServicos.edtDesconto.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmServicos.edtDesconto.Text := valor;
end;

function fConvertVlTotal() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmServicos.edtVlTotalServico.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmServicos.edtVlTotalServico.Text := valor;
end;

function fStatus () : String;
begin
    If frmServicos.rdgStatus.ItemIndex = 0 then begin
       fStatus := 'SIM';
    end
    else begin
       fStatus := 'NÃO';
    end;
end;

procedure TfrmServicos.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmServicos.btnLimparClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       edtCod.Clear; cbxServico.Text := ''; edtValor.Text := '0,00';
       mmObs.Clear;
       dmEnterprise.dsEnterprise.Enabled := False;
       cbxServico.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       edtCodOrdem.Clear; edtVlServico.Text := '0,00'; edtVlTotalServico.Text := '0,00';
       edtVlOutros.Text := '0,00'; edtDesconto.Text := '0,00'; edtCodCli.Clear; edtServico.Clear;
       cbxCliente.Text := '';
       rdgStatus.ItemIndex := -1;
       dtpData.Date := Date;
       mmoDescricao.Clear; mmoObsOrdem.Clear;
       cbxCliente.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       rdgConsultar.ItemIndex := -1;
       CheckBox1.Checked := False;
       edtTotal.Text := '0,00';
       dtpIni.Date := Date -15;
       dtpFim.Date := Date +15;
       dmEnterprise.dsEnterprise.Enabled := False;
    end;
end;

procedure TfrmServicos.FormCreate(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select s_servico from servicos order by s_servico');
       Active := True;
       while not Eof do begin
          cbxServico.Items.Add(FieldByName('s_servico').AsString);
          Next;
       end;
    end;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxCliente.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmServicos.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    If PageControl1.ActivePage = TabSheet1 then  begin
       btnLimparClick(Sender);
       nNovo := fBuscaCodSevico + 1;
       edtCod.Text := IntToStr(nNovo);
       cbxServico.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       btnLimparClick(Sender);
       nNovo := fBuscaCodOrdem + 1;
       edtCodOrdem.Text := IntToStr(nNovo);
       edtVlServico.Text := edtValor.Text;
       edtServico.Text := cbxServico.Text;
       cbxCliente.SetFocus;
    end;
end;

procedure TfrmServicos.btnInserirClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
          If edtCod.Text <> '' then begin
             fConvertValor;
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Insert into servicos (S_COD, S_SERVICO, S_VALOR, S_OBS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxServico.Text)+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(mmObs.Text)+')');
                ExecSQL;
             end;
             fConvertValor;
             btnLimparClick(Self);
             cbxServico.Clear;
             FormCreate(Self);
             Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             Application.MessageBox('O campo Código não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       If edtCodOrdem.Text <> '' then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          fConvertValorOrdem;
          fConvertVlOutros;
          fConvertDesconto;
          fConvertVlTotal;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into ordem_servico (OS_COD, S_COD, C_COD, OS_DATA, OS_APLICACAO, OS_DESCRICAO, OS_VALOR, OS_VLOUTROS, OS_DESCONTO, OS_VLTOTAL, OS_STATUS, OS_OBS) values ('+QuotedStr(edtCodOrdem.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodCli.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtServico.Text)+', '+QuotedStr(mmoDescricao.Text)+', '+QuotedStr(edtVlServico.Text)+', '+QuotedStr(edtVlOutros.Text)+', '+QuotedStr(edtDesconto.Text)+', '+QuotedStr(edtVlTotalServico.Text)+', '+QuotedStr(fStatus)+', '+QuotedStr(mmoObsOrdem.Text)+')');
             ExecSQL;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertValorOrdem;
          fConvertVlOutros;
          fConvertDesconto;
          fConvertVlTotal;
          If fStatus = 'SIM' then begin
             Caixa;
          end;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
       end
       else begin
          Application.MessageBox('O campo Código não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end;
end;

procedure TfrmServicos.btnSelecionarClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from servicos order by s_servico');
          Active := True;
          dmEnterprise.dsEnterprise.Enabled := True;
          Open;
          (FieldByName('s_valor') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('s_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('s_servico').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('s_valor').FieldName;
       end;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       If rdgConsultar.ItemIndex = 1 then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With dmEnterprise.zqEnterprise do begin
             If CheckBox1.Checked = False then begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(os_vltotal) from Clientes C, ordem_servico OS where OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod');
                Active := True;
                If FieldByName('sum(os_vltotal)').AsString <> '' then begin
                   edtTotal.Text := FieldByName('sum(os_vltotal)').AsString;
                   edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
                end
                else begin
                   edtTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('Select OS.os_cod, C.c_nome, OS.os_data, OS.os_aplicacao, OS.os_vltotal, OS.os_status from Clientes C, ordem_servico OS where OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod order by C.c_nome');
                Active := True;
             end
             else begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(os_vltotal) from Clientes C, ordem_servico OS where OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod and os_status = ''NÃO''');
                Active := True;
                If FieldByName('sum(os_vltotal)').AsString <> '' then begin
                   edtTotal.Text := FieldByName('sum(os_vltotal)').AsString;
                   edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
                end
                else begin
                   edtTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('Select OS.os_cod, C.c_nome, OS.os_data, OS.os_aplicacao, OS.os_vltotal, OS.os_status from Clientes C, ordem_servico OS where OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod and os_status = ''NÃO'' order by C.c_nome');
                Active := True;
             end;
             dmEnterprise.dsEnterprise.Enabled := True;
             Open;
             (FieldByName('os_vltotal') as TNumericField).DisplayFormat := ',0.00';
             DBGrid2.Columns.Items[0].FieldName := FieldByName('os_cod').FieldName;
             DBGrid2.Columns.Items[1].FieldName := FieldByName('os_data').FieldName;
             DBGrid2.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
             DBGrid2.Columns.Items[3].FieldName := FieldByName('os_aplicacao').FieldName;
             DBGrid2.Columns.Items[4].FieldName := FieldByName('os_vltotal').FieldName;
             DBGrid2.Columns.Items[5].FieldName := FieldByName('os_status').FieldName;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
       If rdgConsultar.ItemIndex = 0 then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With dmEnterprise.zqEnterprise do begin
             If CheckBox1.Checked = False then begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(os_vltotal) from Clientes C, ordem_servico OS where C.c_cod = '+QuotedStr(edtCodCli.Text)+' and OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod');
                Active := True;
                If FieldByName('sum(os_vltotal)').AsString <> '' then begin
                   edtTotal.Text := FieldByName('sum(os_vltotal)').AsString;
                   edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
                end
                else begin
                   edtTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('Select OS.os_cod, C.c_nome, OS.os_data, OS.os_aplicacao, OS.os_vltotal, OS.os_status from Clientes C, ordem_servico OS where C.c_cod = '+QuotedStr(edtCodCli.Text)+' and OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod order by C.c_nome');
                Active := True;
             end
             else begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(os_vltotal) from Clientes C, ordem_servico OS where C.c_cod = '+QuotedStr(edtCodCli.Text)+' and OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod and os_status = ''NÃO''');
                Active := True;
                If FieldByName('sum(os_vltotal)').AsString <> '' then begin
                   edtTotal.Text := FieldByName('sum(os_vltotal)').AsString;
                   edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
                end
                else begin
                   edtTotal.Text := '0,00';
                end;
                Active := False;
                SQL.Clear;
                SQL.Add('Select OS.os_cod, C.c_nome, OS.os_data, OS.os_aplicacao, OS.os_vltotal, OS.os_status from Clientes C, ordem_servico OS where C.c_cod = '+QuotedStr(edtCodCli.Text)+' and OS.os_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = OS.c_cod and os_status = ''NÃO'' order by C.c_nome');
                Active := True;
             end;
             dmEnterprise.dsEnterprise.Enabled := True;
             Open;
             (FieldByName('os_vltotal') as TNumericField).DisplayFormat := ',0.00';
             DBGrid2.Columns.Items[0].FieldName := FieldByName('os_cod').FieldName;
             DBGrid2.Columns.Items[1].FieldName := FieldByName('os_data').FieldName;
             DBGrid2.Columns.Items[2].FieldName := FieldByName('c_nome').FieldName;
             DBGrid2.Columns.Items[3].FieldName := FieldByName('os_aplicacao').FieldName;
             DBGrid2.Columns.Items[4].FieldName := FieldByName('os_vltotal').FieldName;
             DBGrid2.Columns.Items[5].FieldName := FieldByName('os_status').FieldName;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
    end;
end;

procedure TfrmServicos.btnAtualizarClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
          If cbxServico.Text <> '' then begin
             With dmEnterprise.zqEnterprise do begin
                fConvertValor;
                Active := False;
                SQL.Clear;
                SQL.Add('Update servicos set s_servico = '+QuotedStr(cbxServico.Text)+', s_valor = '+QuotedStr(edtValor.Text)+', s_obs = '+QuotedStr(mmObs.Text)+' where s_cod = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
                fConvertValor;
                Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
          end
          else begin
             Application.MessageBox('O campo Nome não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
          If edtCodOrdem.Text <> '' then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             fConvertValorOrdem;
             fConvertVlOutros;
             fConvertDesconto;
             fConvertVlTotal;
             With dmEnterprise.zqEnterprise do begin
                fConvertValor;
                Active := False;
                SQL.Clear;
                SQL.Add('Update ordem_servico set OS_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', OS_APLICACAO = '+QuotedStr(edtServico.Text)+', OS_DESCRICAO = '+QuotedStr(mmoDescricao.Text)+', OS_VALOR = '+QuotedStr(edtVlServico.Text)+', OS_VLOUTROS = '+QuotedStr(edtVlOutros.Text)+', OS_DESCONTO = '+QuotedStr(edtDesconto.Text)+', OS_VLTOTAL = '+QuotedStr(edtVlTotalServico.Text)+', OS_STATUS = '+QuotedStr(fStatus)+', OS_OBS = '+QuotedStr(mmoObsOrdem.Text)+' where os_cod = '+QuotedStr(edtCodOrdem.Text)+'');
                ExecSQL;
                fConvertValorOrdem;
                fConvertVlOutros;
                fConvertDesconto;
                fConvertVlTotal;
                ShortDateFormat := 'dd/mm/yyyy';
                If fStatus = 'SIM' then begin
                   Caixa;
                end;
                Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
                If dtpData.Color = clRed then begin
                   dtpData.Color := clWindow;
                end;
             end;
          end
          else begin
             Application.MessageBox('O campo Código Ordem não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end;
end;

procedure TfrmServicos.btnDeletarClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
          If edtCod.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from ordem_servico where s_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from servicos where s_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                end;
                btnLimparClick(Self);
                cbxServico.Clear;
                FormCreate(Self);
                Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
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
    If PageControl1.ActivePage = TabSheet2 then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
          If edtCodOrdem.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from ordem_servico where os_cod = '+ QuotedStr(edtCodOrdem.Text)+'');
                   ExecSQL;
                end;
                btnLimparClick(Self);
                Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
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
end;

procedure TfrmServicos.FormShow(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    dtpData.Date := Date;
    dtpIni.Date := Date - 15;
    dtpFim.Date := Date + 15;
    cbxServico.SetFocus;
end;

procedure TfrmServicos.edtValorExit(Sender: TObject);
begin
    If edtValor.Text <> '' then
       edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
end;

procedure TfrmServicos.cbxServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       If PageControl1.ActivePage = TabSheet1 then begin
          dmEnterprise.dsEnterprise.Enabled := False;
          If cbxServico.Text <> '' then begin
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select * from servicos where s_servico = '+QuotedStr(cbxServico.Text)+'');
                Active := True;
                If dmEnterprise.zqEnterprise.RecordCount = 0 then begin
                   ShowMessage('Serviço não cadastrado.');
                end
                else begin
                   edtCod.Text := FieldByName('s_cod').AsString;
                   cbxServico.Text := FieldByName('s_servico').AsString;
                   edtValor.Text := FieldByName('s_valor').AsString;
                   mmObs.Text := FieldByName('s_obs').AsString;
                end;
                edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
             end;
          end
          else begin
             Application.MessageBox('O campo Serviço não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
    end;
end;

procedure TfrmServicos.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from servicos where s_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
       edtCod.Text := FieldByName('s_cod').AsString;
       cbxServico.Text := FieldByName('s_servico').AsString;
       edtValor.Text := FieldByName('s_valor').AsString;
       mmObs.Text := FieldByName('s_obs').AsString;
       edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
    end;
    cbxServico.SetFocus;
end;

procedure TfrmServicos.edtVlTotalServicoEnter(Sender: TObject);
var vUni, vOutros, vDesconto : Double;
begin
    vUni := StrToFloat(edtVlServico.Text);
    vOutros := StrToFloat(edtVlOutros.Text);
    vDesconto := StrToFloat(edtDesconto.Text);
    edtVlTotalServico.Text := FloatToStr((vUni+vOutros)-vDesconto);
    edtVlServico.Text := FormatCurr('0.00', StrToCurr(edtVlServico.Text));
    edtVlOutros.Text := FormatCurr('0.00', StrToCurr(edtVlOutros.Text));
    edtDesconto.Text := FormatCurr('0.00', StrToCurr(edtDesconto.Text));
    edtVlTotalServico.Text := FormatCurr('0.00', StrToCurr(edtVlTotalServico.Text));
end;

procedure TfrmServicos.cbxClienteChange(Sender: TObject);
begin
    If cbxCliente.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from clientes where c_nome = '+QuotedStr(cbxCliente.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
       end;
    end;
end;

procedure TfrmServicos.cbxClienteExit(Sender: TObject);
begin
    If edtCodCli.Text = '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select c_cod from clientes where c_nome = '+QuotedStr(cbxCliente.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
       end;
    end;
end;

procedure TfrmServicos.TabSheet2Enter(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    cbxCliente.SetFocus;
end;

procedure TfrmServicos.TabSheet3Enter(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
end;

procedure TfrmServicos.TabSheet1Enter(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    cbxServico.SetFocus;
end;

procedure TfrmServicos.DBGrid2DblClick(Sender: TObject);
begin
    edtCodOrdem.Text := DBGrid2.SelectedField.Text;
    DBGrid2.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select OS.*, C.c_nome from ordem_servico OS, clientes C where OS.os_cod = '+QuotedStr(edtCodOrdem.Text)+' and C.c_cod = OS.c_cod');
       Active := True;
       edtCodCli.Text := FieldByName('c_cod').AsString;
       cbxCliente.Text := FieldByName('c_nome').AsString;
       dtpData.Date := FieldByName('os_data').AsDateTime;
       edtServico.Text := FieldByName('os_aplicacao').AsString;
       mmoDescricao.Text := FieldByName('os_descricao').AsString;
       mmoObsOrdem.Text := FieldByName('os_obs').AsString;
       edtVlServico.Text := FieldByName('os_valor').AsString;
       edtVlOutros.Text := FieldByName('os_vloutros').AsString;
       edtDesconto.Text := FieldByName('os_desconto').AsString;
       edtVlTotalServico.Text := FieldByName('os_vltotal').AsString;
       If FieldByName('os_status').AsString = 'SIM' then
          rdgStatus.ItemIndex := 0
       else
          rdgStatus.ItemIndex := 1;
       edtVlServico.Text := FormatCurr('0.00', StrToCurr(edtVlServico.Text));
       edtVlOutros.Text := FormatCurr('0.00', StrToCurr(edtVlOutros.Text));
       edtDesconto.Text := FormatCurr('0.00', StrToCurr(edtDesconto.Text));
       edtVlTotalServico.Text := FormatCurr('0.00', StrToCurr(edtVlTotalServico.Text));
    end;
    edtTotal.Text := '0,00';
    TabSheet2.Show;
    btnImprimir.Font.Color := clGreen;
    If rdgStatus.ItemIndex = 1 then begin
       If dtpData.Date < Date then begin
          Application.MessageBox('Essa conta está vencida.','MyShop - Atenção',MB_OK+MB_ICONINFORMATION);
          dtpData.Color := clRed;
       end;
    end;
end;

procedure TfrmServicos.btnImprimirClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet2 then begin
       If edtCodOrdem.Text <> '' then begin
          Try
            Application.CreateForm(TqrpOrdemServico, qrpOrdemServico);
            With dmEnterprise.zqEnterprise do begin
               Active := False;
               SQL.Clear;
               SQL.Add('select OS.*, C.c_nome from ordem_servico OS, clientes C where OS.os_cod = '+QuotedStr(edtCodOrdem.Text)+' and C.c_cod = OS.c_cod');
               Active := True;
            end;
            Foto;
            qrpOrdemServico.Preview;
          Finally
               qrpOrdemServico.Free;
          end;
       end
       else begin
          Application.MessageBox('Selecione a Ordem de Serviço para imprimir!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end;
end;

procedure TfrmServicos.Foto;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With qrpOrdemServico.ZQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from registro');
       Active := True;
       fFoto := CreateBlobStream(FieldByName('r_foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          qrpOrdemServico.QRImage1.Picture.Assign(Jpeg);
       end
       else begin
          qrpOrdemServico.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
    end;
end;

procedure TfrmServicos.PageControl1Change(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet2 then begin
       btnImprimir.Font.Color := clGreen;
    end
    else begin
       btnImprimir.Font.Color := clRed;
    end;
end;

procedure TfrmServicos.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid1.DataSource.Enabled = True then begin
       DBGrid1.Hint := 'Para editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid1.Hint := '';
    end;
end;

procedure TfrmServicos.DBGrid2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid2.DataSource.Enabled = True then begin
       DBGrid2.Hint := 'Para editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid2.Hint := '';
    end;
end;

procedure TfrmServicos.Caixa;
var nNovo : Integer;
begin
    nNovo := fBuscaCodCaixa + 1;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertVlTotal;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into caixa (CX_COD, CX_DATA, CX_DESCRICAO, CX_SITUACAO, CX_VALOR, CX_OBS, CX_OPERACAO) values ('+IntToStr(nNovo)+', '+QuotedStr(DateToStr(Date))+', ''RECEBIMENTO DE PRESTAÇÃO DE SERVIÇO'', ''ENTRADA'', '+QuotedStr(edtVlTotalServico.Text)+', ''Sem Obs.'', ''A'')');
       ExecSQL;
    end;
    fConvertVlTotal;
    ShortDateFormat := 'dd/mm/yyyy';
end;

end.
