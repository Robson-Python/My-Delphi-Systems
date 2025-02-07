unit Contas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, DateUtils;

type
  TfrmContas = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnCons: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    lblVeiculo: TLabel;
    edtCod: TLabeledEdit;
    cbxVeic: TComboBox;
    edtPlaca: TLabeledEdit;
    GroupBox2: TGroupBox;
    edtRef: TLabeledEdit;
    edtValor: TLabeledEdit;
    edtNfiscal: TLabeledEdit;
    cbxForn: TComboBox;
    lblMot: TLabel;
    lblVenc: TLabel;
    dtpVenc: TDateTimePicker;
    lblDias: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContas: TfrmContas;

implementation

uses Carro_Comando_dm, Principal_frm, ADODB, ContPagas_frm;

{$R *.dfm}

function fBuscaCnpj() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cnpj from fornecedores where fn_nome = '+QuotedStr(frmContas.cbxForn.Text)+'');
       Active := True;
       fBuscaCnpj:= FieldByName('cnpj').AsString;
    end;
end;

function fBuscaCodConta() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from Contas');
       Active := True;
       fBuscaCodConta := FieldByName('ultimo').AsInteger;
    end;
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

function sStatus() : String;
begin
    If frmContas.RadioGroup1.ItemIndex = 0 then
       sStatus := 'NÃO PAGO'
    else
       sStatus := 'PAGO'
end;

procedure TfrmContas.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmContas.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtPlaca.Clear; edtRef.Clear; edtValor.Text := '0'; edtNfiscal.Clear;
    cbxVeic.Clear; cbxForn.Clear;
    RadioGroup1.ItemIndex := - 1;
    If RadioButton1.Checked = True then begin
       RadioButton1.Checked := False;
       lblDias.Visible := False;
    end;
    FormCreate(Sender);
    cbxVeic.SetFocus;
end;

procedure TfrmContas.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros order by modelo');
       Active := True;
       while not Eof do begin
          cbxVeic.Items.Add(FieldByName('modelo').AsString);
          Next;
       end;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from fornecedores order by fn_nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('fn_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmContas.FormShow(Sender: TObject);
begin
    edtValor.Text := '0';
    dtpVenc.Date := Date;
    cbxVeic.SetFocus;
end;

procedure TfrmContas.btnInserirClick(Sender: TObject);
var nNovo : Integer;
    cCnpj, sSit : String;
begin
    nNovo := fBuscaCodConta + 1;
    cCnpj := fBuscaCnpj;
    sSit := sStatus;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    edtCod.Text := IntToStr(nNovo);
    fConvertValor;
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into Contas (CT_COD, PLACA, CNPJ, CT_NF, CT_VALOR, CT_REF, CT_VENC, CT_SIT) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtPlaca.Text)+', '+QuotedStr(cCnpj)+', '+QuotedStr(edtNfiscal.Text)+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(edtRef.Text)+', '+QuotedStr(DateToStr(dtpVenc.Date))+', '+QuotedStr(sSit)+')');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertValor;
          Application.MessageBox('Registro Efetuado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmContas.cbxVeicExit(Sender: TObject);
begin
    If edtNfiscal.Text = '' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select placa from carros where modelo = '+QuotedStr(cbxVeic.Text)+'');
          Active := True;
          edtPlaca.Text := FieldByName('placa').AsString;
       end;
       edtNfiscal.SetFocus;
    end;
end;

procedure TfrmContas.edtValorExit(Sender: TObject);
begin
    edtValor.Text := FormatFloat('0.##', (StrToFloat(edtValor.Text)));
    edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
end;

procedure TfrmContas.btnSelecionarClick(Sender: TObject);
begin
    ActiveControl := nil;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros, fornecedores, contas where carros.placa = '+QuotedStr(edtPlaca.Text)+' and contas.ct_nf = '+QuotedStr(edtNfiscal.Text)+' and ct_sit = ''NÃO PAGO'' and carros.placa = contas.placa and fornecedores.cnpj = contas.cnpj');
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxVeic.SetFocus;
       end
       else begin
          edtCod.Text := FieldByName('ct_cod').AsString;
          cbxForn.Text := FieldByName('fn_nome').AsString;
          edtNfiscal.Text := FieldByName('ct_nf').AsString;
          edtRef.Text := FieldByName('ct_ref').AsString;
          dtpVenc.Date := FieldByName('ct_venc').AsDateTime;
          edtValor.Text := FieldByName('ct_valor').AsString;
          edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
          If FieldByName('ct_sit').AsString = 'NÃO PAGO' then
             RadioGroup1.ItemIndex := 0
          else
             RadioGroup1.ItemIndex := 1;
          end;
       end;
       If RadioGroup1.ItemIndex = 0 then begin
          If dtpVenc.Date < Now then begin
             RadioButton1.Checked := True;
             Application.MessageBox('Este conta está vencida! Providencie o pagamento o mais breve possível para evitar futuros transtornos com seu veículo.','Carro Comando - Aviso',MB_OK+MB_ICONWARNING);
             lblDias.Caption := 'Há '+IntToStr(DaysBetween(dtpVenc.Date,Now))+ 'dias';
             lblDias.Visible := True;
          end
          else begin
             lblDias.Visible := False;
             RadioButton1.Checked := False;
          end;
       end;
       cbxVeic.SetFocus;
end;

procedure TfrmContas.btnAtualizarClick(Sender: TObject);
var cCnpj, sSit : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       cCnpj := fBuscaCnpj;
       sSit := sStatus;
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       fConvertValor;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update contas set ct_cod = '+QuotedStr(edtCod.Text)+', PLACA = '+QuotedStr(edtPlaca.Text)+', CNPJ = '+QuotedStr(cCnpj)+', CT_NF = '+QuotedStr(edtNfiscal.Text)+', CT_VALOR = '+QuotedStr(edtValor.Text)+', CT_REF = '+QuotedStr(edtRef.Text)+', CT_VENC = '+QuotedStr(DateToStr(dtpVenc.Date))+', CT_SIT = '+QuotedStr(sSit)+' where CT_COD = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       fConvertValor;
       ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
       If RadioGroup1.ItemIndex = 0 then begin
          btnSelecionarClick(Sender);
       end
       else begin
          btnLimparClick(Sender);
       end;
       cbxVeic.SetFocus;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmContas.btnDeletarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If Application.MessageBox('Excluir Registro?','Carro Comando - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from contas where ct_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmContas.btnConsClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConPagas, frmConPagas);
      frmConPagas.ShowModal;
    Finally
         frmConPagas.Free;
    end;
end;

end.
