unit Motos_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmMotos = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbxMoto: TComboBox;
    edtCodMoto: TEdit;
    lblCodUser: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cbxMotoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMotos: TfrmMotos;

implementation

{$R *.dfm}

uses Contato_dm;

function fBuscaCodMoto() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select m_cod from motos order by m_cod desc');
       Active := True;
       fBuscaCodMoto := FieldByName('m_cod').AsInteger;
    end;
end;

procedure TfrmMotos.btnDeletarClick(Sender: TObject);
begin
    If edtCodMoto.Text <> '' then begin
        If Application.MessageBox('Excluir Registro?','MyContatos - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
           With dmContato.fdqContato do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from motos where m_cod = '+ QuotedStr(edtCodMoto.Text)+'');
              ExecSQL;
           end;
           btnLimparClick(Self);
           cbxMoto.Clear;
           FormCreate(Sender);
           Application.MessageBox('Registro Excluido com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
        end;
     end
     else begin
        Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
     end;
end;

procedure TfrmMotos.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaCodMoto + 1;
    edtCodMoto.Text := IntToStr(nNovo);
    If edtCodMoto.Text <> '' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into motos (M_COD, M_MODELO) values ('+QuotedStr(edtCodMoto.Text)+', '+QuotedStr(cbxMoto.Text)+')');
          ExecSQL;
       end;
       btnLimparClick(Self);
       cbxMoto.Clear;
       FormCreate(Sender);
       Application.MessageBox('Registro Efetuado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmMotos.btnLimparClick(Sender: TObject);
begin
    edtCodMoto.Clear;
    cbxMoto.Text := '';
end;

procedure TfrmMotos.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmMotos.cbxMotoChange(Sender: TObject);
begin
    If cbxMoto.Text <> '' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select m_cod from motos where m_modelo = '+QuotedStr(cbxMoto.Text)+'');
          Active := True;
          edtCodMoto.Text := FieldByName('m_cod').AsString;
       end;
    end;
end;

procedure TfrmMotos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    btnSairClick(Self);
end;

procedure TfrmMotos.FormCreate(Sender: TObject);
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select m_modelo from motos order by m_modelo');
       Active := True;
       while not Eof do begin
          cbxMoto.Items.Add(FieldByName('m_modelo').AsString);
          Next;
       end;
    end;
end;

end.
