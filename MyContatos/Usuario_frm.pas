unit Usuario_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfrmUsuario = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    lblObs: TLabel;
    edtCargo: TLabeledEdit;
    mmoObs: TMemo;
    edtCodUser: TEdit;
    lblCodUser: TLabel;
    Label1: TLabel;
    cbxUsuario: TComboBox;
    RadioGroup1: TRadioGroup;
    edtSenha: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbxUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

uses Contato_dm;

function fBuscaCodUser() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select u_cod from usuario order by u_cod desc');
       Active := True;
       fBuscaCodUser := FieldByName('u_cod').AsInteger;
    end;
end;

function NivelAcesso () : String;
begin
    If frmUsuario.RadioGroup1.ItemIndex = 0 then begin
       NivelAcesso := 'ADMINISTRADOR';
    end;
    If frmUsuario.RadioGroup1.ItemIndex = 1 then begin
       NivelAcesso := 'AUDITORIA';
    end;
    If frmUsuario.RadioGroup1.ItemIndex = 2 then begin
       NivelAcesso := 'CLIENTES PARA PÓS VENDA';
    end;
    If frmUsuario.RadioGroup1.ItemIndex = 3 then begin
       NivelAcesso := 'OPERADOR';
    end;
    If frmUsuario.RadioGroup1.ItemIndex = 4 then begin
       NivelAcesso := 'PÓS VENDA';
    end;
end;

procedure TfrmUsuario.btnAtualizarClick(Sender: TObject);
begin
    If cbxUsuario.Text <> '' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update usuario set U_NOME = '+QuotedStr(cbxUsuario.Text)+', U_CARGO = '+QuotedStr(edtCargo.Text)+', U_NIVEL = '+QuotedStr(NivelAcesso)+', U_SENHA = '+QuotedStr(edtSenha.Text)+', U_OBS = '+QuotedStr(mmoObs.Text)+' where U_COD = '+QuotedStr(edtCodUser.Text)+'');
          ExecSQL;
       end;
       Application.MessageBox('Registro Atualizado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Nome não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmUsuario.btnDeletarClick(Sender: TObject);
begin
    If edtCodUser.Text <> '' then begin
        If Application.MessageBox('Excluir Registro?','MyContatos - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
           With dmContato.fdqContato do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from usuario where u_cod = '+ QuotedStr(edtCodUser.Text)+'');
              ExecSQL;
           end;
           btnLimparClick(Self);
           cbxUsuario.Clear;
           FormCreate(Self);
           Application.MessageBox('Registro Excluido com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
        end;
     end
     else begin
        Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
     end;
end;

procedure TfrmUsuario.btnInserirClick(Sender: TObject);
begin
    If edtCodUser.Text <> '' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into usuario (U_COD, U_NOME, U_CARGO, U_NIVEL, U_SENHA, U_OBS) values ('+QuotedStr(edtCodUser.Text)+', '+QuotedStr(cbxUsuario.Text)+', '+QuotedStr(edtCargo.Text)+', '+QuotedStr(NivelAcesso)+', '+QuotedStr(edtSenha.Text)+', '+QuotedStr(mmoObs.Text)+')');
          ExecSQL;
       end;
       btnLimparClick(Self);
       cbxUsuario.Clear;
       FormCreate(Self);
       Application.MessageBox('Registro Efetuado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmUsuario.btnLimparClick(Sender: TObject);
begin
    edtCodUser.Clear; edtCargo.Clear; edtSenha.Clear;
    cbxUsuario.Text := '';
    RadioGroup1.ItemIndex := -1;
    mmoObs.Clear;
    cbxUsuario.SetFocus;
end;

procedure TfrmUsuario.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    btnLimparClick(Sender);
    nNovo := fBuscaCodUser + 1;
    edtCodUser.Text := IntToStr(nNovo);
    cbxUsuario.SetFocus;
end;

procedure TfrmUsuario.btnSairClick(Sender: TObject);
begin
    dmContato.fdqContato.SQL.Clear;
    Close;
end;

procedure TfrmUsuario.btnSelecionarClick(Sender: TObject);
var vNivel : string;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from usuario where u_nome = '+QuotedStr(cbxUsuario.Text)+'');
       Active := True;
       edtCodUser.Text := FieldByName('u_cod').AsString;
       cbxUsuario.Text := FieldByName('u_nome').AsString;
       edtCargo.Text := FieldByName('u_cargo').AsString;
       edtSenha.Text := FieldByName('u_senha').AsString;
       mmoObs.Text := FieldByName('u_obs').AsString;
       vNivel := FieldByName('u_nivel').AsString;
       if vNivel = 'ADMINISTRADOR' then begin
          RadioGroup1.ItemIndex := 0;
       end;
       if vNivel = 'AUDITORIA' then begin
          RadioGroup1.ItemIndex := 1;
       end;
       if vNivel = 'CLIENTES PARA PÓS VENDA' then begin
          RadioGroup1.ItemIndex := 2;
       end;
       if vNivel = 'OPERADOR' then begin
          RadioGroup1.ItemIndex := 3;
       end;
       if vNivel = 'PÓS VENDA' then begin
          RadioGroup1.ItemIndex := 4;
       end;
    end;
    cbxUsuario.SetFocus;
end;

procedure TfrmUsuario.cbxUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then begin
       btnSelecionarClick(Sender);
    end;
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    btnSairClick(Self);
end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select u_nome from usuario order by u_nome');
       Active := True;
       while not Eof do begin
          cbxUsuario.Items.Add(FieldByName('u_nome').AsString);
          Next;
       end;
    end;
end;

end.
