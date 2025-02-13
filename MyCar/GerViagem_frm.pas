unit GerViagem_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, DateUtils;

type
  TfrmGerViagem = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnCons: TSpeedButton;
    GroupBox1: TGroupBox;
    lblVeiculo: TLabel;
    lblMot: TLabel;
    edtCodViag: TLabeledEdit;
    cbxMot: TComboBox;
    cbxVeic: TComboBox;
    edtPlaca: TLabeledEdit;
    GroupBox2: TGroupBox;
    lblSaida: TLabel;
    lblCheg: TLabel;
    edtKmIni: TLabeledEdit;
    edtKmFin: TLabeledEdit;
    edtKmPerc: TLabeledEdit;
    edtOrig: TLabeledEdit;
    edtDest: TLabeledEdit;
    edtDescr: TLabeledEdit;
    edtTempo: TLabeledEdit;
    edtObs: TLabeledEdit;
    dtpHSaida: TDateTimePicker;
    dtpHCheg: TDateTimePicker;
    dtpDtViag: TDateTimePicker;
    lblDtViag: TLabel;
    dtpDtChegada: TDateTimePicker;
    lblDtChegada: TLabel;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    RadioGroup1: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edtKmFinExit(Sender: TObject);
    procedure AtualizaCarros;
    procedure edtKmIniExit(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure dtpHChegExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cbxMotExit(Sender: TObject);
    procedure dtpHSaidaExit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerViagem: TfrmGerViagem;

implementation

uses Carro_Comando_dm, ADODB, TdasViag_frm, Principal_frm;

{$R *.dfm}

function fBuscaCodViag() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from viagens');
       Active := True;
       fBuscaCodViag := FieldByName('ultimo').AsInteger;
    end;
end;

function fBuscaCpf() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cpf from motoristas where nome = '+QuotedStr(frmGerViagem.cbxMot.Text)+'');
       Active := True;
       fBuscaCpf:= FieldByName('cpf').AsString;
    end;
end;

function sStatus() : String;
begin
    If frmGerViagem.RadioGroup1.ItemIndex = 1 then
       sStatus := 'FINALIZADO'
    else
       sStatus := 'ATIVO'
end;

procedure TfrmGerViagem.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmGerViagem.btnLimparClick(Sender: TObject);
begin
    edtCodViag.Clear; edtPlaca.Clear; edtKmIni.Text := '0'; edtKmFin.Text := '0'; edtKmPerc.Text := '0'; edtObs.Clear; edtDest.Clear; edtOrig.Clear; edtTempo.Text := '0'; edtDescr.Clear;
    cbxMot.Clear; cbxVeic.Clear;
    dtpDtViag.DateTime := Now;
    dtpDtChegada.DateTime := Now;
    dtpHSaida.Time := StrToTime('00:00:00');
    dtpHCheg.Time := StrToTime('00:00:00');
    FormCreate(Sender);
    cbxVeic.SetFocus;
    edtKmPerc.Color := clWindow;
    edtTempo.Color := clWindow;
    RadioGroup1.ItemIndex := -1;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmGerViagem.FormShow(Sender: TObject);
begin
    edtKmIni.Text := '0';
    edtKmFin.Text := '0';
    edtKmPerc.Text := '0';
    edtTempo.Text := '0';
    dtpDtViag.DateTime := Now;
    dtpDtChegada.DateTime := Now;
    cbxVeic.SetFocus;
end;

procedure TfrmGerViagem.FormCreate(Sender: TObject);
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
end;

procedure TfrmGerViagem.cbxVeicExit(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select placa from carros where modelo = '+QuotedStr(cbxVeic.Text)+'');
       Active := True;
       edtPlaca.Text := FieldByName('placa').AsString;
    end;
    cbxMot.SetFocus;
end;

function fBuscaStatus() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select viag_sit, placa from viagens where viag_sit = ''ATIVO'' and placa = '+QuotedStr(frmGerViagem.edtPlaca.Text)+'');
       Active := True;
       fBuscaStatus := FieldByName('viag_sit').AsString;
    end;
end;

procedure TfrmGerViagem.btnInserirClick(Sender: TObject);
var nNovo : Integer;
    cCpf, sSit : String;
begin
    nNovo := fBuscaCodViag + 1;
    cCpf := fBuscaCpf;
    sSit := sStatus;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    edtCodViag.Text := IntToStr(nNovo);
    If fBuscaStatus <> 'ATIVO' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.add('Insert into viagens (cod_viag, placa, cpf, dt_viag, viag_km_ini, viag_km_fin, viag_km_perc, obs, saida, chegada, tempo, origem, destino, descr, dt_cheg, viag_sit) Values ('+QuotedStr(edtCodViag.Text)+','+QuotedStr(edtPlaca.Text)+','+ QuotedStr(cCpf)+','+QuotedStr(DateToStr(dtpDtViag.Date))+','+ QuotedStr(edtKmIni.Text)+', '+QuotedStr(edtKmFin.Text)+', '+QuotedStr(edtKmPerc.Text)+', '+QuotedStr(edtObs.Text)+', '+QuotedStr(TimeToStr(dtpHSaida.Time))+', '+QuotedStr(TimeToStr(dtpHCheg.Time))+', '+QuotedStr(edtTempo.Text)+', '+QuotedStr(edtOrig.Text)+', '+QuotedStr(edtDest.Text)+', '+QuotedStr(edtDescr.Text)+', '+QuotedStr(DateToStr(dtpDtChegada.Date))+', '+QuotedStr(sSit)+')');
          ExecSQL;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Efetuado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnLimparClick(Sender);
    end
    else begin
       Application.MessageBox('Existe uma viagem ativa no sistema para este ve�culo. Fa�a a baixa dessa viagem para cadastrar um nova viagem.','Carro Comando - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmGerViagem.edtKmFinExit(Sender: TObject);
var vFin, vIni : Double;
begin
    If edtKmFin.Text <> '0' then begin
       vIni := StrToFloat(edtKmIni.Text);
       vFin := StrToFloat(edtKmFin.Text);
       edtKmPerc.Text := FloatToStr(vFin - vIni);
       edtKmPerc.Color := clInfoBk;
       edtObs.SetFocus;
    end
    else begin
       edtObs.SetFocus;
    end;
end;

procedure TfrmGerViagem.AtualizaCarros;
var vKmIni, vKmFin, vKmPerc : Double;
begin
    vKmFin := StrToFloat(edtKmFin.Text);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select km_ini from carros where placa = '+QuotedStr(edtPlaca.Text)+'');
       Active := True;
       vKmIni := FieldByName('km_ini').AsFloat;
       vKmPerc := vKmFin - vKmIni
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update carros set km_fin = '+QuotedStr(edtKmFin.Text)+', km_parc = '+FloatToStr(vKmPerc)+' where placa = '+QuotedStr(edtPlaca.Text)+'');
       ExecSQL;
    end;
end;

procedure TfrmGerViagem.edtKmIniExit(Sender: TObject);
begin
    If edtKmIni.Text = '0' then
       Application.MessageBox('A Kilometragem Inicial � = 0! Essa deve ser a 1� viagem do seu ve�culo. Fa�a o registro da 1� viagem na tela de Cadastro de Ve�culos. As posteriores fa�a aqui.','Carro Comando - Informa��o',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmGerViagem.btnDeletarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       If Application.MessageBox('Excluir Registro?','Carro Comando - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from viagens where cod_viag = '+ QuotedStr(edtCodViag.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmGerViagem.btnConsClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       Try
         Application.CreateForm(TfrmTdasViag, frmTdasViag);
         frmTdasViag.ShowModal;
       Finally
            frmTdasViag.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmGerViagem.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmGerViagem.dtpHChegExit(Sender: TObject);
var time : String;
begin
    time := TimeToStr(dtpHCheg.Time);
    If time <> '00:00:00' then begin
       dtpDtChegada.Time := dtpHCheg.Time;
       edtTempo.Text := IntToStr(HoursBetween(dtpDtViag.DateTime,dtpDtChegada.DateTime));
       edtTempo.Color := clInfoBk;
       edtKmFin.SetFocus;
    end
    else begin
       edtObs.SetFocus;
    end;
end;

procedure TfrmGerViagem.btnSelecionarClick(Sender: TObject);
begin
    ActiveControl := nil;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros, motoristas, viagens where carros.placa = '+QuotedStr(edtPlaca.Text)+' and viagens.viag_sit = ''ATIVO'' and carros.placa = viagens.placa and motoristas.cpf = viagens.cpf');
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informa��o',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxVeic.SetFocus;
       end
       else begin
          edtCodViag.Text := FieldByName('cod_viag').AsString;
          cbxMot.Text := FieldByName('nome').AsString;
          edtDescr.Text := FieldByName('descr').AsString;
          dtpDtViag.Date := FieldByName('dt_viag').AsDateTime;
          dtpHSaida.Time := FieldByName('saida').AsDateTime;
          edtOrig.Text := FieldByName('origem').AsString;
          edtKmIni.Text := FieldByName('viag_km_ini').AsString;
          edtKmPerc.Text := FieldByName('viag_km_perc').AsString;
          dtpHCheg.Date := FieldByName('dt_cheg').AsDateTime;
          dtpHCheg.Time := FieldByName('chegada').AsDateTime;
          edtDest.Text := FieldByName('destino').AsString;
          edtKmFin.Text := FieldByName('viag_km_fin').AsString;
          edtTempo.Text := FieldByName('tempo').AsString;
          edtObs.Text := FieldByName('obs').AsString;
          If FieldByName('viag_sit').AsString = 'ATIVO' then
             RadioGroup1.ItemIndex := 0
          else
             RadioGroup1.ItemIndex := 1;
          end;
       end;
       edtKmPerc.Color := clInfoBk;
       edtTempo.Color := clInfoBk;
       dtpDtViag.Time := dtpHSaida.Time;
       dtpDtChegada.Time := dtpHCheg.Time;
       edtDescr.SetFocus;
end;

procedure TfrmGerViagem.cbxMotExit(Sender: TObject);
begin
    edtDescr.SetFocus;
end;

procedure TfrmGerViagem.dtpHSaidaExit(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select km_fin from carros where placa = '+QuotedStr(edtPlaca.Text)+'');
       Active := True;
       edtKmIni.Text := FieldByName('km_fin').AsString;
///       edtDest.SetFocus;
    end;
end;

procedure TfrmGerViagem.RadioGroup1Click(Sender: TObject);
begin
    If RadioGroup1.ItemIndex = 1 then begin
      edtDest.Enabled := True;
      lblCheg.Enabled := True;
      dtpHCheg.Enabled := True;
      lblDtChegada.Enabled := True;
      dtpDtChegada.Enabled := True;
      dtpHCheg.Enabled := True;
      edtTempo.Enabled := True;
      edtKmPerc.Enabled := True;
      edtKmFin.Enabled := True;
      edtDest.SetFocus;
    end
    else begin
      edtOrig.SetFocus;
      edtDest.Enabled := False;
      lblCheg.Enabled := False;
      dtpDtChegada.Enabled := False;
      dtpHCheg.Enabled := False;
      lblDtChegada.Enabled := False;
      dtpHCheg.Enabled := False;
      edtTempo.Enabled := False;
      edtKmPerc.Enabled := False;
      edtKmFin.Enabled := False;
    end;
end;

procedure TfrmGerViagem.btnAtualizarClick(Sender: TObject);
var cCpf, sSit : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       cCpf := fBuscaCpf;
       sSit := sStatus;
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update viagens set COD_VIAG = '+QuotedStr(edtCodViag.Text)+', PLACA = '+QuotedStr(edtPlaca.Text)+', CPF = '+QuotedStr(cCpf)+', DT_VIAG = '+QuotedStr(DateToStr(dtpDtViag.Date))+', VIAG_KM_INI = '+QuotedStr(edtKmIni.Text)+', VIAG_KM_FIN = '+QuotedStr(edtKmFin.Text)+', VIAG_KM_PERC = '+QuotedStr(edtKmPerc.Text)+', OBS = '+QuotedStr(edtObs.Text)+', SAIDA = '+QuotedStr(TimeToStr(dtpHSaida.Time))+', CHEGADA = '+QuotedStr(TimeToStr(dtpHCheg.Time))+', TEMPO = '+QuotedStr(edtTempo.Text)+', ORIGEM = '+QuotedStr(edtOrig.Text)+', DESTINO = '+QuotedStr(edtDest.Text)+', DESCR = '+QuotedStr(edtDescr.Text)+', DT_CHEG = '+QuotedStr(DateToStr(dtpDtChegada.Date))+', VIAG_SIT = '+QuotedStr(sSit)+' where cod_viag = '+QuotedStr(edtCodViag.Text)+'');
          ExecSQL;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
       AtualizaCarros;
       If RadioGroup1.ItemIndex = 0 then begin
          btnSelecionarClick(Sender);
       end
       else begin
          btnLimparClick(Sender);
          RadioGroup1Click(Sender);
       end;
       cbxVeic.SetFocus;
       cbxVeic.SetFocus;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

end.


