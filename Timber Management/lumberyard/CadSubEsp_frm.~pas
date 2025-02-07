unit CadSubEsp_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Mask, DateUtils,
  ExtDlgs, Jpeg;

type
  TfrmCadEspecie = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    lblNome: TLabel;
    edtId: TLabeledEdit;
    cbxDescricao: TComboBox;
    edtNomeCientifico: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cbxDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEspecie: TfrmCadEspecie;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

{$R *.dfm}

function fBuscaIdEspecie() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from especie');
       Active := True;
       fBuscaIdEspecie := FieldByName('ultimo').AsInteger;
    end;
end;


procedure TfrmCadEspecie.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadEspecie.btnLimparClick(Sender: TObject);
begin
    edtId.Clear; edtNomeCientifico.Clear;
    cbxDescricao.Clear;
    FormCreate(Sender);
    FormShow(Sender);
end;

procedure TfrmCadEspecie.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from especie order by descricao');
       Active := True;
       while not Eof do begin
          cbxDescricao.Items.Add(FieldByName('descricao').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadEspecie.FormShow(Sender: TObject);
begin
    cbxDescricao.SetFocus;
end;

procedure TfrmCadEspecie.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaIdEspecie + 1;
    edtId.Text := IntToStr(nNovo);
    If cbxDescricao.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into especie (id, descricao, nomeCientifico) values ('+QuotedStr(edtId.Text)+', '+QuotedStr(cbxDescricao.Text)+', '+QuotedStr(edtNomeCientifico.Text)+')');
             ExecSQL;
             Application.MessageBox('Registro Efetuado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
//       end
//       else begin
//          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Madeira Fácil - Atenção',MB_OK+MB_ICONSTOP);
//       end;
    end
    else begin
       Application.MessageBox('O campo Nome do Produto não pode ser vazio!','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadEspecie.btnSelecionarClick(Sender: TObject);
begin
    If cbxDescricao.Text <> '' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from especie where descricao = '+ QuotedStr(cbxDescricao.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Controle de Toras - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxDescricao.SetFocus;
          end
          else begin
             edtId.Text := FieldByName ('id').AsString;
             cbxDescricao.Text := FieldByName ('descricao').AsString;
             edtNomeCientifico.Text := FieldByName ('nomeCientifico').AsString;
           end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o produto.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadEspecie.cbxDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Sender);
end;

procedure TfrmCadEspecie.btnAtualizarClick(Sender: TObject);
begin
    If edtId.Text <> '' then begin
//       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update especie set id = '+ QuotedStr(edtId.Text)+', descricao = '+ QuotedStr(cbxDescricao.Text)+', nomeCientifico = '+ QuotedStr(edtNomeCientifico.Text)+' where id = '+ QuotedStr(edtId.Text)+'');
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
       Application.MessageBox('O campo Código não pode ser vazio! Selecione um produto para atualizar dados.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadEspecie.btnDeletarClick(Sender: TObject);
begin
    If edtId.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Controle de Toras - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from especie where id = '+ QuotedStr(edtId.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                cbxDescricao.Clear;
                FormCreate(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Controle de Toras - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode ser vazio! Selecione um produto para poder deletar.','Controle de Toras - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

end.
