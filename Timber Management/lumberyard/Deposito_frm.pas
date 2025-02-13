unit Deposito_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DBGrids, DBCtrls;

type
  TfrmDeposito = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtId: TLabeledEdit;
    cbxDescricao: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeposito: TfrmDeposito;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

{$R *.dfm}


function fBuscaIdDeposito() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from deposito');
       Active := True;
       fBuscaIdDeposito := FieldByName('ultimo').AsInteger;
    end;
end;

procedure TfrmDeposito.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmDeposito.FormShow(Sender: TObject);
begin
    cbxDescricao.SetFocus
end;

procedure TfrmDeposito.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from deposito order by descricao');
       Active := True;
       while not Eof do begin
          cbxDescricao.Items.Add(FieldByName('descricao').AsString);
          Next;
       end;
    end;
end;

procedure TfrmDeposito.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaIdDeposito + 1;
    edtId.Text := IntToStr(nNovo);
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into deposito (id, descricao) values ('+QuotedStr(edtId.Text)+', '+QuotedStr(cbxDescricao.Text)+')');
       ExecSQL;
    end;
    Application.MessageBox('Registro Efetuado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
    btnLimparClick(Sender);
end;

procedure TfrmDeposito.btnLimparClick(Sender: TObject);
begin
    edtId.Clear;
    cbxDescricao.Clear;
    FormCreate(Sender);
    cbxDescricao.SetFocus;
end;

procedure TfrmDeposito.btnSelecionarClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from deposito where descricao = '+ QuotedStr(cbxDescricao.Text));
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Registro n�o encontrado...','Controle de Toras - Informa��o',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxDescricao.SetFocus;
       end
       else begin
          edtId.Text := FieldByName('id').AsString;
          cbxDescricao.Text := FieldByName ('descricao').AsString;
       end;
    end;
end;

procedure TfrmDeposito.btnAtualizarClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update deposito set id = '+ QuotedStr(edtId.Text)+', descricao = '+ QuotedStr(cbxDescricao.Text)+' where id = '+ QuotedStr(edtId.Text)+'');
       ExecSQL;
       Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnSelecionarClick(Sender);
    end;
end;

procedure TfrmDeposito.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       If Application.MessageBox('Excluir Registro?','Controle de Toras - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from deposito where id = '+ QuotedStr(edtId.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             FormShow(Sender);
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Controle de Toras - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

end.
