unit CadFunc_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfrmCadFunc = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtCpf: TLabeledEdit;
    edtEnd: TLabeledEdit;
    edtBai: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    lblUf: TLabel;
    lblFone: TLabel;
    mkeFone: TMaskEdit;
    lblFax: TLabel;
    mkeCel: TMaskEdit;
    mkeCep: TMaskEdit;
    lblCep: TLabel;
    cbxFunc: TComboBox;
    lblForn: TLabel;
    edtSalario: TLabeledEdit;
    Label2: TLabel;
    memoObs: TMemo;
    Label3: TLabel;
    dtpDtRegistro: TDateTimePicker;
    dtpDtNasc: TDateTimePicker;
    Label1: TLabel;
    edtCargo: TLabeledEdit;
    edtNct: TLabeledEdit;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtSalarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFunc: TfrmCadFunc;

implementation

uses Carro_Comando_dm, Principal_frm;

{$R *.dfm}

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadFunc.edtSalario.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmCadFunc.edtSalario.Text := valor;
end;

procedure TfrmCadFunc.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadFunc.btnLimparClick(Sender: TObject);
begin
    edtCpf.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtSalario.Clear; memoObs.Clear;
    cbxFunc.Clear; cbxUf.Text := ''; edtSalario.Text := '0,00';
    mkeFone.Clear; mkeCel.Clear; mkeCep.Clear;
    dtpDtRegistro.Date := Date;
    FormCreate(Sender);
    cbxFunc.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadFunc.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from funcionarios order by f_nome');
       Active := True;
       while not Eof do begin
          cbxFunc.Items.Add(FieldByName('f_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadFunc.FormShow(Sender: TObject);
begin
    edtCpf.SetFocus;
    edtSalario.Text := '0,00';
end;

procedure TfrmCadFunc.btnInserirClick(Sender: TObject);
begin

    ShortDateFormat := 'yyyy-mm-dd';
    fConvertValor;
    If edtCpf.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into funcionarios (F_CPF, F_NOME, F_DTNASC, F_ENDERECO, F_BAIRRO, F_CIDADE, F_UF, F_FONE, F_CEL, F_CEP, F_CARGO, F_NCT, F_SALARIO, F_DTADMISSAO, F_OBS) values ('+QuotedStr(edtCpf.Text)+', '+QuotedStr(cbxFunc.Text)+', '+QuotedStr(DateToStr(dtpDtNasc.Date))+', '+QuotedStr(edtEnd.Text)+', '+QuotedStr(edtBai.Text)+', '+QuotedStr(edtCid.Text)+', '+QuotedStr(cbxUf.Text)+', '+QuotedStr(mkeFone.Text)+', '+QuotedStr(mkeCel.Text)+', '+QuotedStr(mkeCep.Text)+', '+QuotedStr(edtCargo.Text)+', '+QuotedStr(edtNct.Text)+', '+QuotedStr(edtSalario.Text)+', '+QuotedStr(DateToStr(dtpDtRegistro.date))+', '+QuotedStr(memoObs.Text)+')');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             fConvertValor;
             Application.MessageBox('Registro Efetuado com Sucesso!','Sys Point - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Omega - Aten��o',MB_OK+MB_ICONSTOP);
      end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode estar vazio!','Sys Point - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFunc.btnSelecionarClick(Sender: TObject);
begin
    If cbxFunc.Text <> '' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from funcionarios where f_nome = '+ QuotedStr(cbxFunc.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro n�o encontrado...','Sys Point - Informa��o',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxFunc.SetFocus;
          end
          else begin
             edtCpf.Text := FieldByName ('f_cpf').AsString;
             cbxFunc.Text := FieldByName ('f_nome').AsString;
             dtpDtNasc.date := FieldByName ('f_dtnasc').AsDateTime;
             edtEnd.Text := FieldByName ('f_endereco').AsString;
             edtBai.Text := FieldByName ('f_bairro').AsString;
             edtCid.Text := FieldByName ('f_cidade').AsString;
             cbxUf.Text := FieldByName ('f_uf').AsString;
             mkeCep.Text := FieldByName ('f_cep').AsString;
             mkeFone.Text := FieldByName ('f_fone').AsString;
             mkeCel.Text := FieldByName ('f_cel').AsString;
             edtCargo.Text := FieldByName ('f_cargo').AsString;
             edtNct.Text := FieldByName ('f_nct').AsString;
             edtSalario.Text := FieldByName ('f_salario').AsString;
             edtSalario.Text := FormatCurr(',0.00', StrToCurr(edtSalario.Text));
             dtpDtRegistro.Date := FieldByName ('f_dtadmissao').AsDateTime;
             memoObs.Text := FieldByName ('f_obs').AsString;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o Fucncion�rio.','Sys Point - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFunc.btnAtualizarClick(Sender: TObject);
begin
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertValor;
    If edtCpf.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update funcionarios set F_CPF = '+QuotedStr(edtCpf.Text)+', F_NOME = '+QuotedStr(cbxFunc.Text)+', F_ENDERECO = '+QuotedStr(edtEnd.Text)+', F_BAIRRO = '+QuotedStr(edtBai.Text)+', F_CIDADE = '+QuotedStr(edtCid.Text)+', F_UF = '+QuotedStr(cbxUf.Text)+', F_CEP = '+QuotedStr(mkeCep.Text)+', F_FONE = '+QuotedStr(mkeFone.Text)+', F_CEL = '+QuotedStr(mkeCel.Text)+', F_CARGO = '+QuotedStr(edtCargo.Text)+', F_DTNASC = '+QuotedStr(DateToStr(dtpDtNasc.Date))+', F_NCT = '+QuotedStr(edtNct.Text)+', F_SALARIO = '+QuotedStr(edtSalario.Text)+', F_DTADMISSAO = '+QuotedStr(DateToStr(dtpDtRegistro.Date))+', F_OBS = '+QuotedStr(memoObs.Text)+' where f_cpf = '+QuotedStr(edtCpf.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Atualizado com Sucesso!','Sys Point - Sucesso',MB_OK+MB_ICONINFORMATION);
             ShortDateFormat := 'dd/mm/yyyy';
             fConvertValor;
             btnSelecionarClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Sys Point - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode ser vazio! Selecione um Funcion�rio para atualizar dados.','Sys Point - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFunc.btnDeletarClick(Sender: TObject);
begin
    If edtCpf.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Sys Point - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from funcionarios where f_cpf = '+ QuotedStr(edtCpf.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Sys Point - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Sys Point - Aten��o',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode ser vazio! Selecione um Funcion�rio para poder deletar.','Sys Point - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFunc.edtSalarioExit(Sender: TObject);
begin
    edtSalario.Text := FormatFloat('0.##', (StrToFloat(edtSalario.Text)));
    edtSalario.Text := FormatCurr('0.00', StrToFloat(edtSalario.Text));
end;

end.
