unit CadFreteiro_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, Buttons;

type
  TfrmCadFreteiro = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtEnd: TLabeledEdit;
    edtBai: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    lblUf: TLabel;
    lblFone: TLabel;
    mkeFone: TMaskEdit;
    cbxFreteiro: TComboBox;
    lblForn: TLabel;
    lblObs: TLabel;
    mmObs: TMemo;
    mkeCnpj: TMaskEdit;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    edtVeiculo: TLabeledEdit;
    mkeCel: TMaskEdit;
    Label2: TLabel;
    edtCod: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure mmObsKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFreteiro: TfrmCadFreteiro;

implementation

uses Carro_Comando_dm, Principal_frm;

{$R *.dfm}

function fBuscaCodFreteiro() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from freteiros');
       Active := True;
       fBuscaCodFreteiro := FieldByName('ultimo').AsInteger;
    end;
end;

function sStatus() : String;
begin
    If frmCadFreteiro.RadioGroup1.ItemIndex = 1 then
       sStatus := 'PJ'
    else
       sStatus := 'PF'
end;

procedure TfrmCadFreteiro.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadFreteiro.btnLimparClick(Sender: TObject);
begin
    mkeCnpj.Clear; edtEnd.Clear; edtBai.Clear; edtCid.Clear; edtVeiculo.Clear; edtCod.Clear;
    cbxUf.Text := ''; mkeCnpj.EditMask := ''; cbxFreteiro.Clear; mkeCel.Clear;
    mkeFone.Clear; mmObs.Clear;
    RadioGroup1.ItemIndex := -1;
    FormCreate(Sender);
    dmVendas.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadFreteiro.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from freteiros order by fr_nome');
       Active := True;
       while not Eof do begin
          cbxFreteiro.Items.Add(FieldByName('fr_nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadFreteiro.FormShow(Sender: TObject);
begin
    mkeCnpj.SetFocus;
end;

procedure TfrmCadFreteiro.btnInserirClick(Sender: TObject);
var sTipo : String;
    nNovo : Integer;
begin
    sTipo := sStatus;
    nNovo := fBuscaCodFreteiro + 1;
    edtCod.Text := IntToStr(nNovo);
//    If mkeCnpj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into freteiros (FR_CPFJ, FR_NOME, FR_END, FR_BAIRRO, FR_CIDADE, FR_UF, FR_FONE, FR_CEL, FR_VEICULO, FR_OBS, FR_TIPO, FR_COD) Values ('+QuotedStr(mkeCnpj.Text)+', '+QuotedStr(cbxFreteiro.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtBai.Text)+', '+ QuotedStr(edtCid.Text)+', '+ QuotedStr(cbxUf.Text)+', '+ QuotedStr(mkeFone.Text)+', '+QuotedStr(mkeCel.Text)+', '+ QuotedStr(edtVeiculo.Text)+', '+QuotedStr(mmObs.Text)+', '+QuotedStr(sTipo)+', '+QuotedStr(edtCod.Text)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
//       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Madeira Fácil - Atenção',MB_OK+MB_ICONSTOP);
//      end;
//    end
//    else begin
//       Application.MessageBox('O campo CPF/CNPJ não pode estar vazio!','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
end;

procedure TfrmCadFreteiro.btnSelecionarClick(Sender: TObject);
begin
    If cbxFreteiro.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from freteiros where fr_nome = '+ QuotedStr(cbxFreteiro.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Controle de Toras - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxFreteiro.SetFocus;
          end
          else begin
             mkeCnpj.Text := FieldByName ('fr_cpfj').AsString;
             cbxFreteiro.Text := FieldByName ('fr_nome').AsString;
             edtVeiculo.Text := FieldByName ('fr_veiculo').AsString;
             edtEnd.Text := FieldByName ('fr_end').AsString;
             edtBai.Text := FieldByName ('fr_bairro').AsString;
             edtCid.Text := FieldByName ('fr_cidade').AsString;
             cbxUf.Text := FieldByName ('fr_uf').AsString;
             mkeFone.Text := FieldByName ('fr_fone').AsString;
             mkeCel.Text := FieldByName ('fr_cel').AsString;
             mmObs.Text := FieldByName ('fr_obs').AsString;
             edtCod.Text := FieldByName('fr_cod').AsString;
             If FieldByName('fr_tipo').AsString = 'PF' then begin
                RadioGroup1.ItemIndex := 0;
                mkeCnpj.Text := FieldByName ('fr_cpfj').AsString;
             end
             else begin
                RadioGroup1.ItemIndex := 1;
                mkeCnpj.Text := FieldByName ('fr_cpfj').AsString;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o Freteiro.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
    cbxFreteiro.SetFocus;
end;

procedure TfrmCadFreteiro.btnAtualizarClick(Sender: TObject);
var sTipo : String;
begin
    sTipo := sStatus;
    If mkeCnpj.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update freteiros set fr_cpfj = '+ QuotedStr(mkeCnpj.Text)+', fr_nome = '+ QuotedStr(cbxFreteiro.Text)+', fr_veiculo = '+ QuotedStr(edtVeiculo.Text)+', fr_end = '+ QuotedStr(edtEnd.Text)+', fr_bairro = '+ QuotedStr(edtBai.Text)+', fr_cidade = '+ QuotedStr(edtCid.Text)+', fr_uf = '+ QuotedStr(cbxUf.Text)+', fr_fone = '+ QuotedStr(mkeFone.Text)+', fr_obs = '+QuotedStr(mmObs.Text)+', fr_tipo = '+QuotedStr(sTipo)+' where fr_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnSelecionarClick(Sender);
          end;
       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Madeira Fácil - Atenção',MB_OK+MB_ICONSTOP);
//       end;
//    end
    else begin
       Application.MessageBox('O campo CPF/CNPJ não pode ser vazio! Selecione um Freteiro para atualizar dados.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFreteiro.btnDeletarClick(Sender: TObject);
begin
    If mkeCnpj.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Controle de Toras - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from freteiros where fr_cod = '+ QuotedStr(edtCod.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Controle de Toras - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo CNPJ não pode ser vazio! Selecione um Freteiro para poder deletar.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadFreteiro.mmObsKeyPress(Sender: TObject; var Key: Char);
begin
    Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadFreteiro.RadioGroup1Click(Sender: TObject);
begin
    If RadioGroup1.ItemIndex = 0 then begin
       mkeCnpj.Clear;
       mkeCnpj.EditMask := '';
       mkeCnpj.EditMask := '000.000.000-00';
    end
    else begin
       mkeCnpj.Clear;
       mkeCnpj.EditMask := '';
       mkeCnpj.EditMask := '00.000.000/0000-00'
    end;
    mkeCnpj.SetFocus;
end;

end.
