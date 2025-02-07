unit Manutencao_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, DateUtils;

type
  TfrmManutencao = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    lblVeiculo: TLabel;
    lblMot: TLabel;
    edtCodMan: TLabeledEdit;
    cbxMot: TComboBox;
    cbxVeic: TComboBox;
    edtPlaca: TLabeledEdit;
    GroupBox2: TGroupBox;
    dtpDtServ: TDateTimePicker;
    lblDtServ: TLabel;
    lblVenc: TLabel;
    dtpVenc: TDateTimePicker;
    edtKmIni: TLabeledEdit;
    edtKmFin: TLabeledEdit;
    edtQtd: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    cbxServ: TComboBox;
    edtObs: TLabeledEdit;
    lblServ: TLabel;
    RadioGroup1: TRadioGroup;
    btnCons: TSpeedButton;
    lblDias: TLabel;
    Label1: TLabel;
    cbxRev: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edtKmIniEnter(Sender: TObject);
    procedure edtVlUniExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure cbxMotExit(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencao: TfrmManutencao;

implementation

uses Carro_Comando_dm, ADODB, Principal_frm, TodasManut_frm;

{$R *.dfm}

function fBuscaCodMan() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from manutencao');
       Active := True;
       fBuscaCodMan := FieldByName('ultimo').AsInteger;
    end;
end;

function fBuscaCpf() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cpf from motoristas where nome = '+QuotedStr(frmManutencao.cbxMot.Text)+'');
       Active := True;
       fBuscaCpf:= FieldByName('cpf').AsString;
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

function sStatus() : String;
begin
    If frmManutencao.RadioGroup1.ItemIndex = 1 then
       sStatus := 'VENCIDO'
    else
       sStatus := 'ATIVO'
end;

procedure TfrmManutencao.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.Active := False;
    Close;
end;

procedure TfrmManutencao.btnLimparClick(Sender: TObject);
begin
    edtCodMan.Clear; edtCodMan.Clear; edtPlaca.Clear; edtKmIni.Text := '0'; edtKmFin.Text := '0'; edtQtd.Text := '0'; edtVlTot.Text := '0'; edtObs.Clear; edtVlUni.Text := '0'; cbxRev.Clear;
    cbxMot.Clear; cbxVeic.Clear; cbxServ.Text := '';
    dtpDtServ.Date := Date; dtpVenc.Date := Date;
    RadioGroup1.ItemIndex := -1;
    If dtpVenc.Color = clRed then begin
       dtpVenc.Color := clWindow;
       lblDias.Visible := False;
    end;
    FormCreate(Sender);
    cbxVeic.SetFocus;
end;

procedure TfrmManutencao.FormCreate(Sender: TObject);
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
       SQL.Add('Select * from motoristas order by nome');
       Active := True;
       while not Eof do begin
          cbxMot.Items.Add(FieldByName('nome').AsString);
          Next;
       end;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from fornecedores order by fn_nome');
       Active := True;
       while not Eof do begin
          cbxRev.Items.Add(FieldByName('fn_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmManutencao.FormShow(Sender: TObject);
begin
    dtpDtServ.Date := Date;
    dtpVenc.Date := Date;
    edtKmIni.Text := '0'; edtKmFin.Text := '0'; edtQtd.Text :='0'; edtVlUni.Text := '0'; edtVlTot.Text := '0';
    cbxVeic.SetFocus;
end;

procedure TfrmManutencao.btnInserirClick(Sender: TObject);
var nNovo : Integer;
    cCpf, sSit : String;
begin
    nNovo := fBuscaCodMan + 1;
    cCpf := fBuscaCpf;
    sSit := sStatus;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    edtCodMan.Text := IntToStr(nNovo);
    fConvertVlUni;
    fConvertVlTot;
    fConvertQtd;
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into manutencao (MT_COD, PLACA, CPF, MT_MANUT, MT_LOJA, MT_DTSERV, MT_DTVENC, MT_KMINI, MT_KMFIN, MT_QTD, MT_VLUNI, MT_VLTOT, MT_OBS, MT_SIT) Values ('+QuotedStr(edtCodMan.Text)+', '+QuotedStr(edtPlaca.Text)+', '+QuotedStr(cCpf)+', '+QuotedStr(cbxServ.Text)+', '+QuotedStr(cbxRev.Text)+', '+QuotedStr(DateToStr(dtpDtServ.Date))+', '+QuotedStr(DateToStr(dtpVenc.Date))+', '+QuotedStr(edtKmIni.Text)+', '+QuotedStr(edtKmFin.Text)+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlUni.Text)+', '+QuotedStr(edtVlTot.Text)+', '+QuotedStr(edtObs.Text)+', '+QuotedStr(sSit)+')');
          ExecSQL;
          ShortDateFormat := 'dd/mm/yyyy';
          fConvertVlUni;
          fConvertVlTot;
          fConvertQtd;
          Application.MessageBox('Registro Efetuado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmManutencao.edtKmIniEnter(Sender: TObject);
begin
     With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select km_fin from carros where placa = '+QuotedStr(edtPlaca.Text)+'');
       Active := True;
       edtKmIni.Text := FieldByName('km_fin').AsString;
    end;
end;

procedure TfrmManutencao.edtVlUniExit(Sender: TObject);
var vQtd, vVlUni : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vVlUni := StrToFloat(edtVlUni.Text);
    edtVlTot.Text := FloatToStr(vQtd * vVlUni);
    edtVlTot.Text := FormatFloat('0.##', (StrToFloat(edtVlTot.Text)));
    edtVlUni.Text := FormatCurr('0.00', StrToFloat(edtVlUni.Text));
    edtVlTot.Text := FormatCurr('0.00', StrToFloat(edtVlTot.Text));
end;

procedure TfrmManutencao.btnSelecionarClick(Sender: TObject);
begin
    ActiveControl := nil;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros, motoristas, manutencao where carros.placa = '+QuotedStr(edtPlaca.Text)+' and manutencao.mt_manut = '+QuotedStr(cbxServ.Text)+' and manutencao.mt_sit = ''ATIVO'' and carros.placa = manutencao.placa and motoristas.cpf = manutencao.cpf');
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxVeic.SetFocus;
       end
       else begin
          edtCodMan.Text := FieldByName('mt_cod').AsString;
          cbxMot.Text := FieldByName('nome').AsString;
          cbxServ.Text := FieldByName('mt_manut').AsString;
          cbxRev.Text := FieldByName('mt_loja').AsString;
          dtpDtServ.Date := FieldByName('mt_dtserv').AsDateTime;
          dtpVenc.Date := FieldByName('mt_dtvenc').AsDateTime;
          edtKmIni.Text := FieldByName('mt_kmini').AsString;
          edtKmFin.Text := FieldByName('mt_kmfin').AsString;
          edtQtd.Text := FieldByName('mt_qtd').AsString;
          edtVlUni.Text := FieldByName('mt_vluni').AsString;
          edtVlTot.Text := FieldByName('mt_vltot').AsString;
          edtObs.Text := FieldByName('mt_obs').AsString;
          edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
          edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
          If FieldByName('mt_sit').AsString = 'ATIVO' then
             RadioGroup1.ItemIndex := 0
          else
             RadioGroup1.ItemIndex := 1;
          end;
          If edtCodMan.Text <> '' then begin
             If dtpVenc.Date < Now then begin
                dtpVenc.Color := clRed;
                Application.MessageBox('Este serviço está vencido! Providencie a regularização o mais breve possível para evitar futuros transtornos com seu veículo.','Carro Comando - Aviso',MB_OK+MB_ICONWARNING);
                lblDias.Caption := 'Vencida há '+IntToStr(DaysBetween(dtpVenc.Date,Now))+ 'dias';
                lblDias.Visible := True;
             end
             else begin
                lblDias.Visible := False;
                dtpVenc.Color := clWindow;
             end;
          end;
       end;
       cbxVeic.SetFocus;
end;

procedure TfrmManutencao.btnAtualizarClick(Sender: TObject);
var cCpf, sSit : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       cCpf := fBuscaCpf;
       sSit := sStatus;
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       fConvertVlUni;
       fConvertVlTot;
       fConvertQtd;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update manutencao set MT_COD = '+QuotedStr(edtCodMan.Text)+', PLACA = '+QuotedStr(edtPlaca.Text)+', CPF = '+QuotedStr(cCpf)+', MT_MANUT = '+QuotedStr(cbxServ.Text)+', MT_LOJA = '+QuotedStr(cbxRev.Text)+', MT_DTSERV = '+QuotedStr(DateToStr(dtpDtServ.Date))+', MT_DTVENC = '+QuotedStr(DateToStr(dtpVenc.Date))+', MT_KMINI = '+QuotedStr(edtKmIni.Text)+', MT_KMFIN = '+QuotedStr(edtKmFin.Text)+', MT_QTD = '+QuotedStr(edtQtd.Text)+', MT_VLUNI = '+QuotedStr(edtVlUni.Text)+', MT_VLTOT = '+QuotedStr(edtVlTot.Text)+', MT_OBS = '+QuotedStr(edtObs.Text)+', MT_SIT = '+QuotedStr(sSit)+' where mt_cod = '+QuotedStr(edtCodMan.Text)+'');
          ExecSQL;
       end;
       fConvertVlUni;
       fConvertVlTot;
       fConvertQtd;
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

procedure TfrmManutencao.btnDeletarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If Application.MessageBox('Excluir Registro?','Carro Comando - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from manutencao where mt_cod = '+ QuotedStr(edtCodMan.Text)+'');
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

procedure TfrmManutencao.cbxMotExit(Sender: TObject);
begin
    cbxServ.SetFocus;
end;

procedure TfrmManutencao.cbxVeicExit(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select placa from carros where modelo = '+QuotedStr(cbxVeic.Text)+'');
       Active := True;
       edtPlaca.Text := FieldByName('placa').AsString;
    end;
end;

procedure TfrmManutencao.btnConsClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmTodasManut, frmTodasManut);
      frmTodasManut.ShowModal;
    Finally
         frmTodasManut.Free;
    end;
end;

end.
