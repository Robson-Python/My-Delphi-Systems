unit GerPecas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, DateUtils, ExtDlgs;

type
  TfrmGerPecas = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtCod: TLabeledEdit;
    lblVeiculo: TLabel;
    lblMot: TLabel;
    cbxMot: TComboBox;
    lblCatg: TLabel;
    cbxCatg: TComboBox;
    GroupBox2: TGroupBox;
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    edtKmIni: TLabeledEdit;
    edtKmFin: TLabeledEdit;
    edtMarc: TLabeledEdit;
    edtModel: TLabeledEdit;
    lblAplic: TLabel;
    cbxAplic: TComboBox;
    dtpDtComp: TDateTimePicker;
    lblDtComp: TLabel;
    edtGart: TLabeledEdit;
    Label1: TLabel;
    dtpDtReg: TDateTimePicker;
    lblDtReg: TLabel;
    cbxVeic: TComboBox;
    edtPlaca: TLabeledEdit;
    edtKmUso: TLabeledEdit;
    edtCodPec: TEdit;
    edtCodCus: TEdit;
    edtCodCat: TEdit;
    edtCpf: TEdit;
    dtpDtTroc: TDateTimePicker;
    lblTroc: TLabel;
    edtQtd: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    btnCons: TSpeedButton;
    Shape1: TShape;
    Label2: TLabel;
    cbxLoja: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtVlUniExit(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
    procedure edtKmFinExit(Sender: TObject);
    procedure dtpDtTrocCloseUp(Sender: TObject);
    procedure edtVlTotExit(Sender: TObject);
    procedure edtKmIniExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbxCatgExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerPecas: TfrmGerPecas;

implementation

uses Carro_Comando_dm, DB, ADODB, PecFin_frm, Principal_frm;

{$R *.dfm}

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


function fBuscaCodPec() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from pecas_servicos');
       Active := True;
       fBuscaCodPec := FieldByName('ultimo').AsInteger;
    end;
end;


function fBuscaCodCus() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from custos');
       Active := True;
       fBuscaCodCus := FieldByName('ultimo').AsInteger;
    end;
end;


function fConvertVlUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmGerPecas.edtVlUni.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmGerPecas.edtVlUni.Text := valor;
end;


function fConvertVlTot() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmGerPecas.edtVlTot.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmGerPecas.edtVlTot.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmGerPecas.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmGerPecas.edtQtd.Text := valor;
end;

procedure TfrmGerPecas.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmGerPecas.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtKmIni.Text := '0'; edtKmFin.Text := '0'; edtGart.Text := '0'; edtKmUso.Text := '0'; edtPlaca.Clear; edtMarc.Clear; cbxLoja.Clear; edtGart.Text := '0'; edtModel.Clear;
    edtQtd.Text := '0'; edtVlUni.Text := '0'; edtVlTot.Text := '0';
    dtpDtComp.Date := Date; dtpDtTroc.Date := Date; dtpDtReg.Date := Date;
    cbxVeic.Clear; cbxMot.Clear; cbxCatg.Clear; cbxAplic.Text := '';
    RadioGroup1.ItemIndex := -1;
    dtpDtTroc.Enabled := False;
    edtKmFin.Enabled := False;
    edtKmUso.Enabled := False;
    GroupBox2.Enabled := False;
    GroupBox3.Enabled := False;
    RadioGroup1.Enabled := False;
    FormCreate(Sender);
    cbxVeic.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmGerPecas.FormShow(Sender: TObject);
begin
    edtKmIni.Text := '0'; edtKmFin.Text := '0'; edtGart.Text := '0'; edtKmUso.Text := '0';
    edtQtd.Text := '0'; edtVlUni.Text := '0'; edtVlTot.Text := '0';
    dtpDtComp.Date := Date; dtpDtTroc.Date := Date; dtpDtReg.Date := Date;
    cbxVeic.SetFocus;
end;

procedure TfrmGerPecas.FormCreate(Sender: TObject);
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
       SQL.Add('Select * from categoria order by nome_categ');
       Active := True;
       while not Eof do begin
          cbxCatg.Items.Add(FieldByName('nome_categ').AsString);
          Next;
       end;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from fornecedores order by fn_nome');
       Active := True;
       while not Eof do begin
          cbxLoja.Items.Add(FieldByName('fn_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmGerPecas.btnInserirClick(Sender: TObject);
var nNovoGer, nNovoPec, nNovoCus, nKmIni : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select km_fin from carros where placa = '+QuotedStr(edtPlaca.Text)+'');
       Active := True;
       nKmIni := FieldByName('km_fin').AsInteger;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cpf from motoristas where nome = '+QuotedStr(cbxMot.Text)+'');
       Active := True;
       edtCpf.Text := FieldByName('cpf').AsString;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cod_categ from categoria where nome_categ = '+QuotedStr(cbxCatg.Text)+'');
       Active := True;
       edtCodCat.Text := FieldByName('cod_categ').AsString;
    end;
    nNovoGer := fBuscaCodGer + 1;
    nNovoPec := fBuscaCodPec + 1;
    nNovoCus := fBuscaCodCus + 1;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertVlUni;
    fConvertVlTot;
    fConvertQtd;
    edtCod.Text := IntToStr(nNovoGer);
    edtKmIni.Text := IntToStr(nKmIni);
    edtCodPec.Text := IntToStr(nNovoPec);
    edtCodCus.Text := IntToStr(nNovoCus);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into gerencial (ger_cod, placa, cpf, cod_categ, dt_reg) Values ('+QuotedStr(edtCod.Text)+','+QuotedStr(edtPlaca.Text)+','+ QuotedStr(edtCpf.Text)+','+QuotedStr(edtCodCat.Text)+','+ QuotedStr(DateToStr(dtpDtReg.Date))+')');
       ExecSQL;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into pecas_servicos (pec_cod, ger_cod, pec_marca, pec_model, aplic, loja, dt_compr, gart, stats) Values ('+QuotedStr(edtCodPec.Text)+','+QuotedStr(edtCod.Text)+','+ QuotedStr(edtMarc.Text)+','+QuotedStr(edtModel.Text)+','+ QuotedStr(cbxAplic.Text)+', '+QuotedStr(cbxLoja.Text)+', '+QuotedStr(DateToStr(dtpDtComp.Date))+', '+QuotedStr(edtGart.Text)+', '''')');
       ExecSQL;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into custos (cus_cod, pec_cod, qtd, vl_unit, vl_tot, cus_km_ini, cus_km_fin, km_perc, dt_troca) Values ('+QuotedStr(edtCodCus.Text)+','+IntToStr(nNovoPec)+','+ QuotedStr(edtQtd.Text)+','+QuotedStr(edtVlUni.Text)+','+QuotedStr(edtVlTot.Text)+', '+IntToStr(nKmIni)+', '+QuotedStr(edtKmFin.Text)+', '+QuotedStr(edtKmUso.Text)+', '+QuotedStr(DateToStr(dtpDtTroc.Date))+')');
       ExecSQL;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    fConvertVlUni;
    fConvertVlTot;
    fConvertQtd;
    Application.MessageBox('Registro Efetuado com Sucesso! Agora preencha os campos referentes a Categoria de Peças e Serviços e após o peenchimento, clique no Botão Atualizar para confirmar o registro.','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
    GroupBox2.Enabled := True;
    GroupBox3.Enabled := True;
    RadioGroup1.Enabled := True;
    edtMarc.SetFocus;
end;

procedure TfrmGerPecas.cbxVeicExit(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select placa from carros where modelo = '+QuotedStr(cbxVeic.Text)+'');
       Active := True;
       edtPlaca.Text := FieldByName('placa').AsString;
       cbxCatg.SetFocus;
    end;
end;

procedure TfrmGerPecas.btnAtualizarClick(Sender: TObject);
var sStatus : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       fConvertVlUni;
       fConvertVlTot;
       fConvertQtd;
       If RadioGroup1.ItemIndex = 0 then
          sStatus := 'FUNCIONANDO'
       else
          sStatus := 'TROCADO';
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update gerencial set ger_cod = '+QuotedStr(edtCod.Text)+', placa = '+QuotedStr(edtPlaca.Text)+', cpf = '+QuotedStr(edtCpf.Text)+', cod_categ = '+QuotedStr(edtCodCat.Text)+', dt_reg = '+QuotedStr(DateToStr(dtpDtReg.Date))+' where ger_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update pecas_servicos set pec_cod = '+QuotedStr(edtCodPec.Text)+', ger_cod = '+QuotedStr(edtCod.Text)+', pec_marca = '+QuotedStr(edtMarc.Text)+', pec_model = '+QuotedStr(edtModel.Text)+', aplic = '+QuotedStr(cbxAplic.Text)+', loja = '+QuotedStr(cbxLoja.Text)+', dt_compr = '+QuotedStr(DateToStr(dtpDtComp.Date))+', gart = '+QuotedStr(edtGart.Text)+', stats = '+QuotedStr(sStatus)+' where pec_cod = '+QuotedStr(edtCodPec.Text)+'');
          ExecSQL;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update custos set cus_cod = '+QuotedStr(edtCodCus.Text)+', pec_cod = '+QuotedStr(edtCodPec.Text)+', qtd = '+QuotedStr(edtQtd.Text)+', vl_unit = '+QuotedStr(edtVlUni.Text)+', vl_tot = '+QuotedStr(edtVlTot.Text)+', cus_km_ini = '+QuotedStr(edtKmIni.Text)+', cus_km_fin = '+QuotedStr(edtKmFin.Text)+', km_perc = '+QuotedStr(edtKmUso.Text)+', dt_troca = '+QuotedStr(DateToStr(dtpDtTroc.Date))+' where cus_cod = '+QuotedStr(edtCodCus.Text)+'');
          ExecSQL;
       end;
       If RadioGroup1.ItemIndex = 0 then begin
          ShortDateFormat := 'dd/mm/yyyy';
          btnSelecionarClick(Sender);
          btnInserir.Enabled := True;
          Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
       end
       else begin
          ShortDateFormat := 'dd/mm/yyyy';
          btnLimparClick(Sender);
          Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmGerPecas.RadioGroup1Click(Sender: TObject);
begin
    edtQtd.SetFocus;
    If RadioGroup1.ItemIndex = 1 then begin
       dtpDtTroc.Enabled := True;
       edtKmFin.Enabled := True;
       edtKmUso.Enabled := True;
       dtpDtTroc.Date := Date;
       edtKmIni.SetFocus;
    end
    else begin
       dtpDtTroc.Enabled := False;
       edtKmFin.Enabled := False;
       edtKmUso.Enabled := False;
    end;

end;

procedure TfrmGerPecas.btnSelecionarClick(Sender: TObject);
var cCodCat : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cod_categ from categoria where nome_categ = '+QuotedStr(cbxCatg.Text)+'');
       Active := True;
       cCodCat := FieldByName('cod_categ').AsInteger;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from carros, motoristas, categoria, gerencial, pecas_servicos, custos where categoria.cod_categ = '+IntToStr(cCodCat)+' and carros.placa = '+QuotedStr(edtPlaca.Text)+' and pecas_servicos.stats = ''FUNCIONANDO'' and carros.placa = gerencial.placa and motoristas.cpf = gerencial.cpf and categoria.cod_categ = gerencial.cod_categ and gerencial.ger_cod = pecas_servicos.ger_cod and pecas_servicos.pec_cod = custos.pec_cod');
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Nenhum registro encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
          cbxVeic.SetFocus;
          btnLimparClick(Sender);
       end
       else begin
          edtCod.Text := FieldByName('ger_cod').AsString;
          dtpDtReg.Date := FieldByName('dt_reg').AsDateTime;
          cbxMot.Text := FieldByName('nome').AsString;
          edtMarc.Text := FieldByName('pec_marca').AsString;
          edtModel.Text := FieldByName('pec_model').AsString;
          cbxAplic.Text := FieldByName('aplic').AsString;
          cbxLoja.Text := FieldByName('loja').AsString;
          dtpDtComp.Date := FieldByName('dt_compr').AsDateTime;
          edtGart.Text := FieldByName('gart').AsString;
          edtQtd.Text := FieldByName('qtd').AsString;
          edtVlUni.Text := FieldByName('vl_unit').AsString;
          edtVlTot.Text := FieldByName('vl_tot').AsString;
          edtKmIni.Text := FieldByName('cus_km_ini').AsString;
          edtKmFin.Text := FieldByName('cus_km_fin').AsString;
          edtKmUso.Text := FieldByName('km_perc').AsString;
          dtpDtTroc.Date := FieldByName('dt_troca').AsDateTime;
          edtCodPec.Text := FieldByName('pec_cod').AsString;
          edtCodCus.Text := FieldByName('cus_cod').AsString;
          edtCodCat.Text := FieldByName('cod_categ').AsString;
          edtCpf.Text := FieldByName('cpf').AsString;
          GroupBox2.Enabled := True;
          GroupBox3.Enabled := True;
          RadioGroup1.Enabled := True;
          edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
          edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
          If FieldByName('stats').AsString = 'FUNCIONANDO' then
             RadioGroup1.ItemIndex := 0
          else
             RadioGroup1.ItemIndex := 1;
          end;
       end;
end;

procedure TfrmGerPecas.edtVlUniExit(Sender: TObject);
var vQtd, vUnit : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vUnit := StrToFloat(edtVlUni.Text);
    edtVlTot.Text := FloatToStr(vUnit * vQtd);
    edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
    edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
    edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
end;

procedure TfrmGerPecas.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If Application.MessageBox('Tem certeza que deseja Excluir os Registros? Se confirmar você apagará todos os dados refentes a esse veículo','Carro Comando - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from custos where cus_cod = '+ QuotedStr(edtCodCus.Text)+'');
             ExecSQL;
          end;
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from pecas_servicos where pec_cod = '+ QuotedStr(edtCodPec.Text)+'');
             ExecSQL;
          end;
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from gerencial where ger_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
          end;
          Application.MessageBox('Registro Deletado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          FormShow(Sender);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmGerPecas.btnConsClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       Try
         Application.CreateForm(TfrmPecFin, frmPecFin);
         frmPecFin.ShowModal;
       Finally
            frmPecFin.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmGerPecas.edtKmFinExit(Sender: TObject);
var vKmIni, vKmFin : Double;
begin
    vKmIni := StrToFloat(edtKmIni.Text);
    vKmFin := StrToFloat(edtKmFin.Text);
    edtKmUso.Text := FloatToStr(vKmFin - vKmIni);
end;


procedure TfrmGerPecas.dtpDtTrocCloseUp(Sender: TObject);
begin
    edtKmIni.SetFocus;
end;

procedure TfrmGerPecas.edtVlTotExit(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select km_fin from carros where placa = '+QuotedStr(edtPlaca.Text)+'');
       Active := True;
       edtKmIni.Text := FieldByName('km_fin').AsString;
    end;
end;

procedure TfrmGerPecas.edtKmIniExit(Sender: TObject);
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

procedure TfrmGerPecas.FormActivate(Sender: TObject);
begin
    Application.MessageBox('Para começar, preencha os campos  na caixa "Dados do Veículo". Para inserir uma nova categoria, clique no Botão Inserir ou para selecionar uma categoria já cadastrada, clique no Botão Selecionar.','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmGerPecas.cbxCatgExit(Sender: TObject);
begin
    If cbxMot.Text = '' then begin
       Application.MessageBox('Se for inserir um novo registro preencha o campo Motorista e clique no Botão Inserir. Se for selecionar um registro já cadastrado clique no Botão Selecionar sem precisar preencher o campo Motorista.','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

end.
