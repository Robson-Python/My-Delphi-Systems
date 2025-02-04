unit Maquinas_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DBGrids, DBCtrls;

type
  TfrmMaquinas = class(TForm)
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
    edtCodigo: TLabeledEdit;
    cbxMaquina: TComboBox;
    edtCodSetor: TLabeledEdit;
    edtSetor: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtCodSetorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMaquinas: TfrmMaquinas;

implementation

uses Carro_Comando_dm, ADODB, DB, Principal_frm;

{$R *.dfm}

function fBuscaCodMaq() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Count(*) as ultimo from maquinas');
       Active := True;
       fBuscaCodMaq := FieldByName('ultimo').AsInteger;
    end;
end;

procedure TfrmMaquinas.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmMaquinas.FormShow(Sender: TObject);
begin
    cbxMaquina.SetFocus
end;

procedure TfrmMaquinas.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from maquinas order by m_descricao');
       Active := True;
       while not Eof do begin
          cbxMaquina.Items.Add(FieldByName('m_descricao').AsString);
          Next;
       end;
    end;
end;

procedure TfrmMaquinas.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodMaq + 1;
    edtCodigo.Text := IntToStr(nNovo);
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into maquinas (m_cod, m_descricao, s_cod) values ('+QuotedStr(edtCodigo.Text)+', '+QuotedStr(cbxMaquina.Text)+', '+QuotedStr(edtCodSetor.Text)+')');
       ExecSQL;
    end;
    Application.MessageBox('Registro Efetuado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
    btnLimparClick(Sender);
end;

procedure TfrmMaquinas.btnLimparClick(Sender: TObject);
begin
    edtCodigo.Clear;
    edtCodSetor.Clear;;
    edtSetor.Clear;
    cbxMaquina.Clear;
    FormCreate(Sender);
    cbxMaquina.SetFocus;
end;

procedure TfrmMaquinas.btnSelecionarClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select maquinas.*, setores.s_descricao from maquinas, setores where maquinas.s_cod = setores.s_cod and maquinas.m_descricao = '+ QuotedStr(cbxMaquina.Text)+'');
       Active := True;
       If RecordCount = 0 then begin
          Application.MessageBox('Registro não encontrado...','Controle de Toras - Informação',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxMaquina.SetFocus;
       end
       else begin
          edtCodigo.Text := FieldByName('m_cod').AsString;
          cbxMaquina.Text := FieldByName ('m_descricao').AsString;
          edtCodSetor.Text := FieldByName ('s_cod').AsString;
          edtSetor.Text := FieldByName('s_descricao').AsString;
       end;
    end;
end;

procedure TfrmMaquinas.btnAtualizarClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update maquinas set m_cod = '+ QuotedStr(edtCodigo.Text)+', m_descricao = '+ QuotedStr(cbxMaquina.Text)+', s_cod = '+QuotedStr(edtCodSetor.Text)+' where m_cod = '+ QuotedStr(edtCodigo.Text)+'');
       ExecSQL;
       Application.MessageBox('Registro Atualizado com Sucesso!','Controle de Toras - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnSelecionarClick(Sender);
    end;
end;

procedure TfrmMaquinas.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If Application.MessageBox('Excluir Registro?','Controle de Toras - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from maquinas where m_cod = '+ QuotedStr(edtCodigo.Text)+'');
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
end;

procedure TfrmMaquinas.edtCodSetorExit(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select s_descricao from setores where s_cod = '+QuotedStr(edtCodSetor.Text)+'');
       Active := True;
       edtSetor.Text := FieldByName('s_descricao').AsString;
    end;
end;

end.
