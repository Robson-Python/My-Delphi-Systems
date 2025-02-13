unit CompraVenda_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Mask, StdCtrls, Buttons;

type
  TfrmCompraVenda = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    lblUf: TLabel;
    lblRest: TLabel;
    lblCep: TLabel;
    lblCel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtEnd: TLabeledEdit;
    edtBai: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    edtMail: TLabeledEdit;
    mmoObs: TMemo;
    mkeCep: TMaskEdit;
    mkeCel: TMaskEdit;
    dtpData: TDateTimePicker;
    mkeCpf: TMaskEdit;
    GroupBox2: TGroupBox;
    lblVeiculo: TLabel;
    edtCod: TLabeledEdit;
    cbxVeic: TComboBox;
    edtCodVeiculo: TLabeledEdit;
    edtValor: TLabeledEdit;
    edtKm: TLabeledEdit;
    mkeFone: TMaskEdit;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    edtNome: TLabeledEdit;
    btnPessoa: TSpeedButton;
    Edit1: TEdit;
    btnImprimir: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cbxVeicChange(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompraVenda: TfrmCompraVenda;

implementation

uses Carro_Comando_dm, DB, ZDataset, ZAbstractRODataset, CompraVenda_qrp;

{$R *.dfm}

function fBuscaCodCompraVenda() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cv_cod from compra_venda order by cv_cod desc');
       Active := True;
       fBuscaCodCompraVenda := FieldByName('cv_cod').AsInteger;
    end;
end;

function vControle() : String;
begin
    If frmCompraVenda.RadioGroup1.ItemIndex = 0 then
       vControle := 'COMPRA'
    else
       vControle := 'VENDA'
end;

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCompraVenda.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCompraVenda.edtValor.Text := valor;
end;

function CpfCnpj() : String;
var valor : String;
    tamanho, i, Count : Integer;
begin
    valor := frmCompraVenda.Edit1.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    Count := i;
    end;
    If Count = 14 then begin
       frmCompraVenda.mkeCpf.EditMask := '000.000.000-00;1;_';
       frmCompraVenda.btnPessoa.Caption := 'F';
    end
    else begin
       frmCompraVenda.mkeCpf.EditMask := '00.000.000/0000-00;1;_';
       frmCompraVenda.btnPessoa.Caption := 'J';
    end;
end;

procedure TfrmCompraVenda.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmCompraVenda.btnNovoClick(Sender: TObject);
var nNovo: Integer;
begin
    btnLimparClick(Self);
    nNovo := fBuscaCodCompraVenda + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxVeic.SetFocus;
end;

procedure TfrmCompraVenda.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtCodVeiculo.Clear; edtValor.Text := '0,00'; edtKm.Clear; edtNome.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtMail.Clear;
    mkeCep.Clear; mkeCel.Clear; mkeCpf.Clear; mkeFone.Clear;
    cbxVeic.Text := ''; cbxUf.Text := '';
    dtpData.Date := Date;
    mmoObs.Clear;
    RadioGroup1.ItemIndex := -1;
    edtNome.EditLabel.Caption := 'Nome';
    cbxVeic.SetFocus;
    dmCarroComando.zqCarro.SQL.Clear;
end;

procedure TfrmCompraVenda.FormShow(Sender: TObject);
begin
    dtpData.Date := Date;
    cbxVeic.SetFocus;
end;

procedure TfrmCompraVenda.FormCreate(Sender: TObject);
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

procedure TfrmCompraVenda.cbxVeicChange(Sender: TObject);
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

procedure TfrmCompraVenda.btnInserirClick(Sender: TObject);
begin
    If edtCodVeiculo.Text <> '' then begin
       If edtCod.Text <> '' then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          fConvertValor;
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into compra_venda(CV_COD, C_COD, CV_DATA, CV_VALOR, CV_KM, CV_NOME, CV_CPF, CV_ENDERECO, CV_BAIRRO, CV_CIDADE, CV_UF, CV_CEP, CV_FONE, CV_CELULAR, CV_MAIL, CV_TIPO, CV_OBS) Values ('+QuotedStr(edtCod.Text)+', '+ QuotedStr(edtCodVeiculo.Text)+', '+ QuotedStr(DateToStr(dtpData.Date))+', '+ QuotedStr(edtValor.Text)+', '+QuotedStr(edtKm.Text)+', '+QuotedStr(edtNome.Text)+', '+QuotedStr(mkeCpf.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtBai.Text)+', '+ QuotedStr(edtCid.Text)+', '+ QuotedStr(cbxUf.Text)+', '+ QuotedStr(mkeCep.Text)+', '+QuotedStr(mkeFone.Text)+', '+ QuotedStr(mkeCel.Text)+', '+ QuotedStr(edtMail.Text)+', '+ QuotedStr(vControle)+', '+QuotedStr(mmoObs.Text)+')');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Self);
             fConvertValor;
          end;
       end
       else begin
          Application.MessageBox('O campo c�digo n�o pode ser vazio!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
       end;
    end
    else begin
       Application.MessageBox('Ve�culo ainda n�o cadastro. Fa�a o cadastro do v�iculo na tela Cadastro de Ve�culos!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCompraVenda.edtValorExit(Sender: TObject);
begin
    edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
end;

procedure TfrmCompraVenda.btnSelecionarClick(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
       If RadioGroup1.ItemIndex = -1 then begin
          Application.MessageBox('Por favor, selecione o tipo de Registro para consultar!','MyCar - Aten��o',MB_OK+MB_ICONINFORMATION);
          RadioGroup1.Buttons[0].SetFocus;
       end
       else begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from compra_venda where c_cod = '+QuotedStr(edtCodVeiculo.Text)+' and cv_tipo = '+QuotedStr(vControle)+'');
             Active := True;
             If RecordCount = 0 then begin
                Application.MessageBox('Registro n�o encontrado...','MyCar - Informa��o',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Self);
             end
             else begin
                edtCod.Text := FieldByName ('cv_cod').AsString;
                dtpData.Date := FieldByName ('cv_data').AsDateTime;
                edtValor.Text := FieldByName ('cv_valor').AsString;
                edtKm.Text := FieldByName ('cv_km').AsString;
                edtNome.Text := FieldByName ('cv_nome').AsString;
                Edit1.Text := FieldByName ('cv_cpf').AsString;
                edtEnd.Text := FieldByName ('cv_endereco').AsString;
                edtBai.Text := FieldByName ('cv_bairro').AsString;
                edtCid.Text := FieldByName ('cv_cidade').AsString;
                cbxUf.Text := FieldByName ('cv_uf').AsString;
                mkeCep.Text := FieldByName ('cv_cep').AsString;
                mkeFone.Text := FieldByName ('cv_fone').AsString;
                mkeCel.Text := FieldByName ('cv_celular').AsString;
                edtMail.Text := FieldByName ('cv_mail').AsString;
                mmoObs.Text := FieldByName ('cv_obs').AsString;
                If FieldByName('cv_tipo').AsString = 'COMPRA' then begin
                   RadioGroup1.ItemIndex := 0;
                end
                else begin
                   RadioGroup1.ItemIndex := 1;
                end;
                CpfCnpj;
                mkeCpf.Text := Edit1.Text;
                edtValor.Text := FormatCurr(',0.00', StrToCurr(edtValor.Text));
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o ve�culo para consultar.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCompraVenda.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update compra_venda set CV_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', CV_KM = '+QuotedStr(edtKm.Text)+', CV_NOME = '+QuotedStr(edtNome.Text)+', CV_CPF = '+QuotedStr(mkeCpf.Text)+', CV_ENDERECO = '+QuotedStr(edtEnd.Text)+', CV_BAIRRO = '+QuotedStr(edtBai.Text)+', CV_CIDADE = '+QuotedStr(edtCid.Text)+', CV_UF = '+QuotedStr(cbxUf.Text)+', CV_CEP = '+QuotedStr(mkeCep.Text)+', CV_FONE = '+QuotedStr(mkeFone.Text)+', CV_CELULAR = '+QuotedStr(mkeCel.Text)+', CV_MAIL = '+QuotedStr(edtMail.Text)+', CV_TIPO = '+QuotedStr(vControle)+', CV_OBS = '+QuotedStr(mmoObs.Text)+' where cv_cod = '+ QuotedStr(edtCod.Text)+'');
          ExecSQL;
          If edtValor.Focused then begin
             fConvertValor;
             Active := False;
             SQL.Clear;
             SQL.Add('Update compra_venda set CV_VALOR = '+QuotedStr(edtValor.Text)+' where cv_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             fConvertValor;
             cbxVeic.SetFocus;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnSelecionarClick(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode ser vazio! Selecione um ve�culo para atualizar dados.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCompraVenda.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from compra_venda where cv_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo c�digo n�o pode ser vazio! Selecione um ve�culo para poder excluir.','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCompraVenda.btnPessoaClick(Sender: TObject);
begin
    If btnPessoa.Caption = 'F' then begin
       mkeCpf.EditMask := '00.000.000/0000-00;1;_';
       btnPessoa.Caption := 'J';
       btnPessoa.Hint := 'Pessoa Jur�dica';
    end
    else begin
       mkeCpf.EditMask := '000.000.000-00;1;_';
       btnPessoa.Caption := 'F';
       btnPessoa.Hint := 'Pessoa F�sica';
    end;
end;

procedure TfrmCompraVenda.btnImprimirClick(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
       Try
         Application.CreateForm(TqrpCompraVenda, qrpCompraVenda);
         btnSelecionarClick(Self);
         qrpCompraVenda.qrlVeiculo.Caption := cbxVeic.Text;
         qrpCompraVenda.qrlNome.Caption := edtNome.EditLabel.Caption+':';
         qrpCompraVenda.Preview;
       Finally
            qrpCompraVenda.Free;
       end;
    end
    else begin
       Application.MessageBox('Selecione o Ve�culo para imprimir!','MyCar - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCompraVenda.RadioGroup1Click(Sender: TObject);
begin
    If RadioGroup1.ItemIndex = 0 then begin
       edtNome.EditLabel.Caption := 'Nome do Vendedor';
    end
    else begin
       edtNome.EditLabel.Caption := 'Nome do Comprador';
    end;
    dtpData.SetFocus;
end;

procedure TfrmCompraVenda.cbxVeicExit(Sender: TObject);
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
    RadioGroup1.Buttons[0].SetFocus;
end;

end.
