unit GerComb_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask;

type
  TfrmGerComb = class(TForm)
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
    lblCatg: TLabel;
    lblDtAbst: TLabel;
    edtCod: TLabeledEdit;
    cbxMot: TComboBox;
    dtpDtAbast: TDateTimePicker;
    cbxVeic: TComboBox;
    edtPlaca: TLabeledEdit;
    GroupBox2: TGroupBox;
    lblTipo: TLabel;
    edtMarca: TLabeledEdit;
    cbxTipo: TComboBox;
    edtKmIni: TLabeledEdit;
    edtKmFin: TLabeledEdit;
    edtQtd: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    edtKmPerc: TLabeledEdit;
    edtMed: TLabeledEdit;
    btnConsulta: TSpeedButton;
    Shape1: TShape;
    edtCatg: TEdit;
    Label1: TLabel;
    cbxPosto: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edtVlUniExit(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure edtKmFinExit(Sender: TObject);
    procedure edtKmPercExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure cbxMotExit(Sender: TObject);
    procedure edtVlTotExit(Sender: TObject);
    procedure edtKmIniExit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerComb: TfrmGerComb;

implementation

uses Carro_Comando_dm, ADODB, Types, StrUtils, MaskUtils, DB,
  AbastFinal_frm, Principal_frm;

{$R *.dfm}

function fBuscaCodComb() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from combustivel');
       Active := True;
       fBuscaCodComb := FieldByName('ultimo').AsInteger;
    end;
end;

function fBuscaCodGer() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from gerencial');
       Active := True;
       fBuscaCodGer := FieldByName('ultimo').AsInteger;
    end;
end;

function fConvertVlUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmGerComb.edtVlUni.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmGerComb.edtVlUni.Text := valor;
end;


function fConvertVlTot() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmGerComb.edtVlTot.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmGerComb.edtVlTot.Text := valor;
end;

function fConvertMedia() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmGerComb.edtMed.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmGerComb.edtMed.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmGerComb.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmGerComb.edtQtd.Text := valor;
end;

function fCpf() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cpf from motoristas where nome = '+QuotedStr(frmGerComb.cbxMot.Text)+'');
       Active := True;
       fCpf := FieldByName('cpf').AsString;
    end;
end;

function fCodCat() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cod_categ from categoria where nome_categ = '+QuotedStr(frmGerComb.edtCatg.Text)+'');
       Active := True;
       fCodCat := FieldByName('cod_categ').AsInteger;
    end;
end;

function sStatus() : String;
begin
    If frmGerComb.RadioGroup1.ItemIndex = 1 then
       sStatus := 'FINALIZADO'
    else
       sStatus := 'ATIVO'
end;

function fBuscaTudo() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros, motoristas, categoria, gerencial, combustivel where carros.placa = '+QuotedStr(frmGerComb.edtPlaca.Text)+' and combustivel.comb_status = ''ATIVO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = combustivel.ger_cod');
       Active := True;
       fBuscaTudo := FieldByName('ger_cod').AsInteger;
    end;
end;

function fBuscaTudo2() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros, motoristas, categoria, gerencial, combustivel where carros.placa = '+QuotedStr(frmGerComb.edtPlaca.Text)+' and combustivel.comb_status = ''ATIVO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = combustivel.ger_cod');
       Active := True;
       fBuscaTudo2 := FieldByName('cod_categ').AsInteger;
    end;
end;

function fBuscaStatus() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select combustivel.comb_status, gerencial.placa from combustivel, gerencial where comb_status = ''ATIVO'' and gerencial.placa = '+QuotedStr(frmGerComb.edtPlaca.Text)+' and combustivel.ger_cod = gerencial.ger_cod');
       Active := True;
       fBuscaStatus := FieldByName('comb_status').AsString;
    end;
end;

procedure TfrmGerComb.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmGerComb.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtPlaca.Clear; cbxPosto.Clear; edtMarca.Clear; edtKmIni.Text := '0'; edtKmFin.Text := '0'; edtMed.Text := '0'; edtQtd.Text := '0'; edtVlUni.Text := '0'; edtVlTot.Text := '0'; edtKmPerc.Text := '0';
    cbxMot.Clear; cbxVeic.Clear;
    dtpDtAbast.Date := Date;
    RadioGroup1.ItemIndex := -1;
    FormCreate(Sender);
    cbxVeic.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmGerComb.FormShow(Sender: TObject);
begin
    RadioGroup1.ItemIndex := -1;
    dtpDtAbast.Date := Date;
    edtKmIni.Text := '0'; edtKmFin.Text := '0'; edtMed.Text := '0'; edtQtd.Text := '0'; edtVlUni.Text := '0'; edtVlTot.Text := '0'; edtKmPerc.Text := '0';
    cbxVeic.SetFocus;
end;

procedure TfrmGerComb.FormCreate(Sender: TObject);
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
          cbxPosto.Items.Add(FieldByName('fn_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmGerComb.btnInserirClick(Sender: TObject);
var cCpf, vStatus : String;
    cCodCat, cCodGer, nNovo : Integer;
begin
    cCpf := fCpf;
    cCodCat := fCodCat;
    cCodGer := fBuscaCodGer + 1;
    nNovo := fBuscaCodComb + 1;
    vStatus := sStatus;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertVlUni;
    fConvertVlTot;
    fConvertMedia;
    fConvertQtd;
    fBuscaStatus;
    If fBuscaStatus <> 'ATIVO' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into gerencial (ger_cod, placa, cpf, cod_categ, dt_reg) Values ('+IntToStr(cCodGer)+', '+QuotedStr(edtPlaca.Text)+', '+ QuotedStr(cCpf)+', '+IntToStr(cCodCat)+', '+ QuotedStr(DateToStr(dtpDtAbast.Date))+')');
          ExecSQL;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into combustivel (comb_cod, ger_cod, posto, comb_marca, comb_tipo, comb_qtd, comb_vl_uni, comb_vl_tot, comb_km_ini, comb_km_fin, comb_med, comb_status, comb_km_perc) Values ('+IntToStr(nNovo)+', '+IntToStr(cCodGer)+','+ QuotedStr(cbxPosto.Text)+', '+QuotedStr(edtMarca.Text)+', '+ QuotedStr(cbxTipo.Text)+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlUni.Text)+', '+QuotedStr(edtVlTot.Text)+', '+QuotedStr(edtKmIni.Text)+', '+QuotedStr(edtKmFin.Text)+', '+QuotedStr(edtMed.Text)+', '+QuotedStr(vStatus)+', '+QuotedStr(edtKmPerc.Text)+')');
          ExecSQL;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       fConvertVlUni;
       fConvertVlTot;
       fConvertMedia;
       fConvertQtd;
       Application.MessageBox('Registro Efetuado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnLimparClick(Sender);
    end
    else begin
       Application.MessageBox('Existe um abastecimento ativo no sistema para este veículo. Faça a baixa desse abastecimento para cadastrar um novo abastecimento.','Carro Comando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmGerComb.edtVlUniExit(Sender: TObject);
var vQtd, vVlUni : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vVlUni := StrToFloat(edtVlUni.Text);
    edtVlTot.Text := FloatToStr(vQtd * vVlUni);
    edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
    edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
    edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
end;

procedure TfrmGerComb.cbxVeicExit(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select placa from carros where modelo = '+QuotedStr(cbxVeic.Text)+'');
       Active := True;
       edtPlaca.Text := FieldByName('placa').AsString;
    end;
end;

procedure TfrmGerComb.edtKmFinExit(Sender: TObject);
var vKmIni, vKmFin : Double;
begin
    vKmIni := StrToFloat(edtKmIni.Text);
    vKmFin := StrToFloat(edtKmFin.Text);
    edtKmPerc.Text := FloatToStr(vKmFin - vKmIni);
end;

procedure TfrmGerComb.edtKmPercExit(Sender: TObject);
var vKmPerc, vQtd : Double;
begin
    vKmPerc := StrToFloat(edtKmPerc.Text);
    vQtd := StrToFloat(edtQtd.Text);
    edtMed.Text := FloatToStr(vKmPerc/vQtd);
    edtMed.Text := FormatFloat('0.##',(StrToFloat(edtMed.Text)));
end;

procedure TfrmGerComb.btnSelecionarClick(Sender: TObject);
begin
    ActiveControl := nil;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros, motoristas, categoria, gerencial, combustivel where carros.placa = '+QuotedStr(edtPlaca.Text)+' and combustivel.comb_status = ''ATIVO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = combustivel.ger_cod');
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxVeic.SetFocus;
       end
       else begin
          edtCod.Text := FieldByName('comb_cod').AsString;
          dtpDtAbast.Date := FieldByName('dt_reg').AsDateTime;
          cbxMot.Text := FieldByName('nome').AsString;
          edtCatg.Text := FieldByName('nome_categ').AsString;
          cbxPosto.Text := FieldByName('posto').AsString;
          edtMarca.Text := FieldByName('comb_marca').AsString;
          cbxTipo.Text := FieldByName('comb_tipo').AsString;
          edtQtd.Text := FieldByName('comb_qtd').AsString;
          edtVlUni.Text := FieldByName('comb_vl_uni').AsString;
          edtVlTot.Text := FieldByName('comb_vl_tot').AsString;
          edtKmIni.Text := FieldByName('comb_km_ini').AsString;
          edtKmFin.Text := FieldByName('comb_km_fin').AsString;
          edtKmPerc.Text := FieldByName('comb_km_perc').AsString;
          edtMed.Text := FieldByName('comb_med').AsString;
          edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
          edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
          If FieldByName('comb_status').AsString = 'ATIVO' then
             RadioGroup1.ItemIndex := 0
          else
             RadioGroup1.ItemIndex := 1;
          end;
       end;
end;

procedure TfrmGerComb.btnAtualizarClick(Sender: TObject);
var cCodGer, cCodCat : Integer;
    cCpf, vStatus : String;
begin
     If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       cCodGer := fBuscaTudo;
       cCodCat := fBuscaTudo2;
       cCpf := fCpf;
       vStatus := sStatus;
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       fConvertVlUni;
       fConvertVlTot;
       fConvertMedia;
       fConvertQtd;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update gerencial set ger_cod = '+IntToStr(cCodGer)+', placa = '+QuotedStr(edtPlaca.Text)+', cpf = '+QuotedStr(cCpf)+', cod_categ = '+IntToStr(cCodCat)+', dt_reg = '+QuotedStr(DateToStr(dtpDtAbast.Date))+' where ger_cod = '+IntToStr(cCodGer)+'');
          ExecSQL;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update combustivel set comb_cod = '+QuotedStr(edtCod.Text)+', ger_cod = '+IntToStr(cCodGer)+', posto = '+QuotedStr(cbxPosto.Text)+', comb_marca = '+QuotedStr(edtMarca.Text)+', comb_tipo = '+QuotedStr(cbxTipo.Text)+', comb_qtd = '+QuotedStr(edtQtd.Text)+', comb_vl_uni = '+QuotedStr(edtVlUni.Text)+', comb_vl_tot = '+QuotedStr(edtVlTot.Text)+', comb_km_ini = '+QuotedStr(edtKmIni.Text)+', comb_km_fin = '+QuotedStr(edtKmFin.Text)+', comb_med = '+QuotedStr(edtMed.Text)+', comb_status = '+QuotedStr(vStatus)+', comb_km_perc = '+QuotedStr(edtKmPerc.Text)+' where comb_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       If RadioGroup1.ItemIndex = 0 then begin
          ShortDateFormat := 'dd/mm/yyyy';
          btnSelecionarClick(Sender);
          Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
          cbxVeic.SetFocus;
       end
       else begin
          ShortDateFormat := 'dd/mm/yyyy';
          btnLimparClick(Sender);
          edtKmFin.Enabled := False;
          edtKmPerc.Enabled := False;
          edtMed.Enabled := False;
          Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmGerComb.btnDeletarClick(Sender: TObject);
var cCodGer : Integer;
begin
    cCodGer := fBuscaTudo;
    If Application.MessageBox('Tem certeza que deseja Excluir os Registros? Se confirmar você apagará todos os dados refentes a esse veículo','Carro Comando - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Delete from combustivel where comb_cod  = '+ QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Delete from gerencial where ger_cod = '+IntToStr(cCodGer)+'');
          ExecSQL;
       end;
       Application.MessageBox('Registro Deletado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnLimparClick(Sender);
    end;
end;

procedure TfrmGerComb.btnConsultaClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       Try
         Application.CreateForm(TfrmAbastFinal, frmAbastFinal);
         frmAbastFinal.ShowModal;
       Finally
            frmAbastFinal.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmGerComb.cbxMotExit(Sender: TObject);
begin
    If cbxPosto.Text = '' then
       cbxPosto.SetFocus;
end;

procedure TfrmGerComb.edtVlTotExit(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select km_fin from carros where placa = '+QuotedStr(edtPlaca.Text)+'');
       Active := True;
       edtKmIni.Text := FieldByName('km_fin').AsString;
    end;
end;

procedure TfrmGerComb.edtKmIniExit(Sender: TObject);
begin
    If edtKmFin.Enabled = True then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select km_fin from carros where placa = '+QuotedStr(edtPlaca.Text)+'');
          Active := True;
          edtKmFin.Text := FieldByName('km_fin').AsString;
       end;
    end;
end;

procedure TfrmGerComb.RadioGroup1Click(Sender: TObject);
begin
    If RadioGroup1.ItemIndex = 1 then begin
       edtKmPerc.Enabled := True;
       edtMed.Enabled := True;
       edtKmFin.Enabled := True;
       edtKmIni.SetFocus;
    end
    else begin
       edtKmPerc.Enabled := False;
       edtMed.Enabled := False;
       edtKmFin.Enabled := False;
    end;
end;

end.
