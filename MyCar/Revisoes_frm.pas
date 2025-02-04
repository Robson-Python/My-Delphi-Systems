unit Revisoes_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls;

type
  TfrmRevisoes = class(TForm)
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
    edtServico: TLabeledEdit;
    Label1: TLabel;
    mmoRelatorio: TMemo;
    rdgStatus: TRadioGroup;
    GroupBox2: TGroupBox;
    lblVeiculo: TLabel;
    edtCod: TLabeledEdit;
    cbxVeic: TComboBox;
    edtCodVeic: TLabeledEdit;
    Shape3: TShape;
    Shape2: TShape;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    btnImprimir: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbxVeicChange(Sender: TObject);
    procedure cbxVeicExit(Sender: TObject);
    procedure cbxVeicKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure rdgStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRevisoes: TfrmRevisoes;

implementation

uses Carro_Comando_dm, Revisoes_qrp;

{$R *.dfm}

function fBuscaCodRevisao() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_cod from revisao order by r_cod desc');
       Active := True;
       fBuscaCodRevisao := FieldByName('r_cod').AsInteger;
    end;
end;

function vStatus() : String;
begin
    If frmRevisoes.rdgStatus.ItemIndex = 0 then
       vStatus := 'SIM'
    else
       vStatus := 'NÃO'
end;

procedure TfrmRevisoes.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmRevisoes.btnNovoClick(Sender: TObject);
var nNovo: Integer;
begin
    btnLimparClick(Self);
    nNovo := fBuscaCodRevisao + 1;
    edtCod.Text := IntToStr(nNovo);
    cbxVeic.SetFocus;
end;

procedure TfrmRevisoes.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    edtCod.Clear; edtCodVeic.Clear; edtServico.Clear;
    cbxVeic.Text := '';
    mmoRelatorio.Clear;
    rdgStatus.ItemIndex := -1;
    dmCarroComando.zqCarro.SQL.Clear;
    cbxVeic.SetFocus;
end;

procedure TfrmRevisoes.btnInserirClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into revisao (R_COD, C_COD, R_SERVICO, R_RELATORIO, R_STATUS) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtCodVeic.Text)+', '+QuotedStr(edtServico.Text)+', '+QuotedStr(mmoRelatorio.Text)+', '+QuotedStr(vStatus)+')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       end;
       edtCod.Clear; edtCodVeic.Clear; edtServico.Clear;
       mmoRelatorio.Clear;
       rdgStatus.ItemIndex := -1;
       btnSelecionarClick(Self);
    end
    else begin
       Application.MessageBox('O campo código não pode estar vazio!','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmRevisoes.btnSelecionarClick(Sender: TObject);
begin
    ActiveControl := nil;
    If cbxVeic.Text <> '' then begin
       If rdgStatus.ItemIndex = -1 then begin
          Application.MessageBox('Por favor, selecione o serviço executado (Sim ou Não)!','MyCar - Atenção',MB_OK+MB_ICONINFORMATION);
          rdgStatus.Buttons[0].SetFocus;
       end
       else begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from revisao where c_cod = '+QuotedStr(edtCodVeic.Text)+' and r_status = '+QuotedStr(vStatus)+' order by r_cod');
             Active := True;
             DBGrid1.DataSource.Enabled := True;
             DBGrid1.Columns.Items[0].FieldName := FieldByName('r_cod').FieldName;
             DBGrid1.Columns.Items[1].FieldName := FieldByName('r_servico').FieldName;
             DBGrid1.Columns.Items[2].FieldName := FieldByName('r_status').FieldName;
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo Veículo não pode ser vazio! Selecione um veículo para consultar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmRevisoes.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update revisao set r_servico = '+QuotedStr(edtServico.Text)+', r_relatorio = '+QuotedStr(mmoRelatorio.Text)+', r_status = '+QuotedStr(vStatus)+' where r_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
       end;
       Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
       btnSelecionarClick(Self);
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um veículo para atualizar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmRevisoes.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from revisao where r_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             edtCod.Clear; edtCodVeic.Clear; edtServico.Clear;
             mmoRelatorio.Clear;
             rdgStatus.ItemIndex := -1;
             btnSelecionarClick(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um veículo para atualizar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmRevisoes.btnImprimirClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TqrpRevisao, qrpRevisao);
      btnSelecionarClick(Self);
      qrpRevisao.qrlCodVeiculo.Caption := edtCodVeic.Text;
      qrpRevisao.qrlVeiculo.Caption := cbxVeic.Text;
      qrpRevisao.Preview;
    Finally
         qrpRevisao.Free;
    end;
end;

procedure TfrmRevisoes.cbxVeicChange(Sender: TObject);
begin
    If cbxVeic.Text <> '' then begin
        With dmCarroComando.zqCarro do begin
           Active := False;
           SQL.Clear;
           SQL.Add('Select c_cod from carros where c_mmodelo = '+QuotedStr(cbxVeic.Text)+'');
           Active := True;
           edtCodVeic.Text := FieldByName('c_cod').AsString;
        end;
    end;
end;

procedure TfrmRevisoes.cbxVeicExit(Sender: TObject);
begin
    If edtCodVeic.Text = '' then begin
        With dmCarroComando.zqCarro do begin
           Active := False;
           SQL.Clear;
           SQL.Add('Select c_cod from carros where c_mmodelo = '+QuotedStr(cbxVeic.Text)+'');
           Active := True;
           edtCodVeic.Text := FieldByName('c_cod').AsString;
        end;
    end;
    If edtCod.Text <> '' then begin
       edtServico.SetFocus;
    end;
end;

procedure TfrmRevisoes.cbxVeicKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN then begin
       btnSelecionarClick(Self);
    end;
end;

procedure TfrmRevisoes.FormCreate(Sender: TObject);
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

procedure TfrmRevisoes.FormShow(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    cbxVeic.SetFocus;
end;

procedure TfrmRevisoes.DBGrid1DblClick(Sender: TObject);
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from revisao where r_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
       edtServico.Text := FieldByName('r_servico').AsString;
       mmoRelatorio.Text := FieldByName('r_relatorio').AsString;
       If FieldByName('r_status').AsString = 'SIM' then begin
          rdgStatus.ItemIndex := 0
       end
       else begin
          rdgStatus.ItemIndex := 1;
       end;
    end;
    btnSelecionarClick(Self);
    edtServico.SetFocus;
end;

procedure TfrmRevisoes.rdgStatusClick(Sender: TObject);
begin
    cbxVeicExit(Self);
end;

end.
