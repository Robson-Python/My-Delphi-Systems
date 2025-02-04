unit ClientesPosVenda_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmClientePosVenda = class(TForm)
    GroupBox1: TGroupBox;
    lblCategoria: TLabel;
    cbxCategoria: TComboBox;
    mkePlaca: TMaskEdit;
    lblPlaca: TLabel;
    edtChassi: TLabeledEdit;
    edtCor: TLabeledEdit;
    lblAnoFab: TLabel;
    mkeAnoFab: TMaskEdit;
    cbxMes: TComboBox;
    speAno: TSpinEdit;
    lblAno: TLabel;
    lblMes: TLabel;
    lblEmissaoNF: TLabel;
    dtpEmissaoNf: TDateTimePicker;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    dsCliPv: TDataSource;
    edtCodPosVenda: TEdit;
    lblCodRetorno: TLabel;
    btnDataContatos: TBitBtn;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    edtModelo: TLabeledEdit;
    GroupBox2: TGroupBox;
    edtCodCli: TEdit;
    lblCodCli: TLabel;
    cbxCliente: TComboBox;
    lblCliente: TLabel;
    lblCpf: TLabel;
    edtEndereco: TLabeledEdit;
    edtCidade: TLabeledEdit;
    lblContato1: TLabel;
    mkeContato1: TMaskEdit;
    mkeContato2: TMaskEdit;
    lblContato2: TLabel;
    mkeCpf: TMaskEdit;
    Edit1: TEdit;
    edtUf: TLabeledEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Data_Contato;
    procedure btnDataContatosClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbxClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblCpfClick(Sender: TObject);
    procedure mkeCpfKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientePosVenda: TfrmClientePosVenda;

implementation

{$R *.dfm}

uses Contato_dm;

function Ano(Data:TDateTime): String;
{Retorna uma data por extenso}
var
//  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := '01';
  Meses [2] := '02';
  Meses [3] := '03';
  Meses [4] := '04';
  Meses [5] := '05';
  Meses [6] := '06';
  Meses [7] := '07';
  Meses [8] := '08';
  Meses [9] := '09';
  Meses [10]:= '10';
  Meses [11]:= '11';
  Meses [12]:= '12';
  DecodeDate (Data, Ano, Mes, Dia);
//  NoDia := DayOfWeek (Data);
  Result := IntToStr(Ano);
end;

function fBuscaPosVenda() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select cp_cod from clientes_pv order by cp_cod desc');
       Active := True;
       fBuscaPosVenda := FieldByName('cp_cod').AsInteger;
    end;
end;

function fBuscaContato() : Integer;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ct_cod from contatos_pv order by ct_cod desc');
       Active := True;
       fBuscaContato := FieldByName('ct_cod').AsInteger;
    end;
end;

function CpfCnpj() : String;
var valor : String;
    tamanho, i, Count : Integer;
begin
    valor := frmClientePosVenda.Edit1.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    Count := i;
    end;
    If Count = 14 then begin
       frmClientePosVenda.mkeCpf.EditMask := '000.000.000-00;1;_';
       frmClientePosVenda.lblCpf.Caption := 'CPF';
    end
    else begin
       frmClientePosVenda.mkeCpf.EditMask := '00.000.000/0000-00;1;_';
       frmClientePosVenda.lblCpf.Caption := 'CNPJ';
    end;
end;

procedure TfrmClientePosVenda.btnAtualizarClick(Sender: TObject);
begin
    If edtCodPosVenda.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update clientes_pv set CP_CATEGORIA = '+QuotedStr(cbxCategoria.Text)+', CP_MODELO = '+QuotedStr(edtModelo.Text)+', CP_PLACA = '+QuotedStr(mkePlaca.Text)+', CP_CHASSI = '+QuotedStr(edtChassi.Text)+', CP_COR = '+QuotedStr(edtCor.Text)+', CP_ANO_FAB_MOD = '+QuotedStr(mkeAnoFab.Text)+', CP_MES = '+QuotedStr(cbxMes.Text)+', CP_ANO = '+QuotedStr(speAno.Text)+', CP_DT_NOTAFISCAL = '+QuotedStr(DateToStr(dtpEmissaoNf.Date))+' where CP_COD = '+QuotedStr(edtCodPosVenda.Text)+'');
          ExecSQL;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       Application.MessageBox('Registro Atualizado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Nome não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmClientePosVenda.btnDataContatosClick(Sender: TObject);
begin
    DBGrid2.Visible := True;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ct_contato, ct_data, ct_realizado from contatos_pv where cp_cod = '+QuotedStr(edtCodPosVenda.Text)+'');
       Active := True;
       dsCliPv.Enabled := True;
       DBGrid2.Columns.Items[0].FieldName := FieldByName('ct_contato').FieldName;
       DBGrid2.Columns.Items[1].FieldName := FieldByName('ct_data').FieldName;
       DBGrid2.Columns.Items[2].FieldName := FieldByName('ct_realizado').FieldName;
    end;
    Panel4.Caption := 'Contatos a serem feitos para o Cliente';
    btnDataContatos.Enabled := False;
end;

procedure TfrmClientePosVenda.btnDeletarClick(Sender: TObject);
begin
    If edtCodPosVenda.Text <> '' then begin
        If Application.MessageBox('Excluir Registro?','Contato - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
           With dmContato.fdqContato do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from contatos_pv where cp_cod = '+ QuotedStr(edtCodPosVenda.Text)+'');
              ExecSQL;
              Active := False;
              SQL.Clear;
              SQL.Add('Delete from clientes_pv where cp_cod = '+ QuotedStr(edtCodPosVenda.Text)+'');
              ExecSQL;
           end;
           btnLimparClick(Self);
           Application.MessageBox('Registro Excluido com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
        end;
     end
     else begin
        Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
     end;
end;

procedure TfrmClientePosVenda.btnInserirClick(Sender: TObject);
begin
    If edtCodPosVenda.Text <> '' then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into clientes_pv (CP_COD, C_COD, CP_CATEGORIA, CP_MODELO, CP_PLACA, CP_CHASSI, CP_COR, CP_ANO_FAB_MOD, CP_MES, CP_ANO, CP_DT_NOTAFISCAL) Values ('+QuotedStr(edtCodPosVenda.Text)+', '+QuotedStr(edtCodCli.Text)+', '+QuotedStr(cbxCategoria.Text)+', '+QuotedStr(edtModelo.Text)+', '+QuotedStr(mkePlaca.Text)+', '+QuotedStr(edtChassi.Text)+', '+QuotedStr(edtCor.Text)+', '+QuotedStr(mkeAnoFab.Text)+', '+QuotedStr(cbxMes.Text)+', '+QuotedStr(speAno.Text)+', '+QuotedStr(DateToStr(dtpEmissaoNf.Date))+')');
          ExecSQL;
       end;
       Data_Contato;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       btnLimparClick(Self);
       Application.MessageBox('Registro Efetuado com Sucesso!','MyContatos - Sucesso',MB_OK+MB_ICONINFORMATION);
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmClientePosVenda.btnLimparClick(Sender: TObject);
begin
    dsCliPv.Enabled := False;
    edtCodPosVenda.Clear; edtCodCli.Clear; edtEndereco.Clear; edtChassi.Clear; edtCor.Clear; edtModelo.Clear; mkeCpf.Clear; edtCidade.Clear; edtUf.Clear;
    cbxCliente.Text := ''; cbxCategoria.Text := ''; cbxMes.Text := '';
    mkePlaca.Clear; mkeAnoFab.Clear; mkeContato1.Clear; mkeContato2.Clear;
    dtpEmissaoNf.Date := Date;
    speAno.Text := Ano(Date);
    btnDataContatos.Enabled := False;
    DBGrid2.Visible := False;
    Panel4.Caption := 'Dados do Cliente';
    cbxCliente.SetFocus;
end;

procedure TfrmClientePosVenda.btnNovoClick(Sender: TObject);
var nNovo : Integer;
begin
    nNovo := fBuscaPosVenda + 1;
    edtCodPosVenda.Text := IntToStr(nNovo);
    cbxCategoria.SetFocus;
end;

procedure TfrmClientePosVenda.btnSairClick(Sender: TObject);
begin
    dmContato.fdqContato.SQL.Clear;
    Close;
end;

procedure TfrmClientePosVenda.btnSelecionarClick(Sender: TObject);
begin
    DBGrid2.Visible := False;
    Panel4.Caption := 'Dados do Cliente';
    If cbxCliente.Text <> '' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select CP.cp_cod, C.c_nome, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, CP.cp_dt_notafiscal from Clientes_PV CP, Clientes C where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and C.c_cod = CP.c_cod order by C.C_nome, CP.cp_dt_notafiscal desc');
          Active := True;
          dsCliPv.Enabled := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('cp_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('c_nome').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('cp_categoria').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('cp_modelo').FieldName;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('cp_placa').FieldName;
          DBGrid1.Columns.Items[5].FieldName := FieldByName('cp_dt_notafiscal').FieldName;
          FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       end;
    end
    else begin
       Application.MessageBox('Selecione o Cliente para consultar!','MyContatos - Atenção',MB_OK+MB_ICONWARNING);
       cbxCliente.SetFocus;
    end;
end;

procedure TfrmClientePosVenda.cbxClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from clientes where c_nome = '+QuotedStr(cbxCliente.Text)+'');
          Active := True;
          edtCodCli.Text := FieldByName('c_cod').AsString;
          Edit1.Text := FieldByName('c_cpf').AsString;
          edtEndereco.Text := FieldByName('c_endereco').AsString;
          edtCidade.Text := FieldByName('c_cidade').AsString;
          edtUf.Text := FieldByName('c_uf').AsString;
          mkeContato1.Text := FieldByName('c_contato1').AsString;
          mkeContato2.Text := FieldByName('c_contato2').AsString;
          CpfCnpj;
          mkeCpf.Text := Edit1.Text;
       end;
       btnNovoClick(Self);
       dsCliPv.Enabled := False;
    end;
end;

procedure TfrmClientePosVenda.DBGrid1DblClick(Sender: TObject);
begin
    btnLimparClick(Sender);
    edtCodPosVenda.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select CP.*, C.c_nome from Clientes_pv CP, clientes C where CP.cp_cod = '+QuotedStr(edtCodPosVenda.Text)+' and CP.c_cod = C.c_cod');
       Active := True;
       edtCodCli.Text := FieldByName('c_cod').AsString;
       cbxCliente.Text := FieldByName('c_nome').AsString;
       cbxCategoria.Text := FieldByName('cp_categoria').AsString;
       edtModelo.Text := FieldByName('cp_modelo').AsString;
       mkePlaca.Text := FieldByName('cp_placa').AsString;
       edtChassi.Text := FieldByName('cp_chassi').AsString;
       edtCor.Text := FieldByName('cp_cor').AsString;
       mkeAnoFab.Text := FieldByName('cp_ano_fab_mod').AsString;
       cbxMes.Text := FieldByName('cp_mes').AsString;
       speAno.Text := FieldByName('cp_ano').AsString;
       dtpEmissaoNf.Date := FieldByName('cp_dt_notafiscal').AsDateTime;
    end;
    btnDataContatos.Enabled := True;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from clientes where c_nome = '+QuotedStr(cbxCliente.Text)+'');
       Active := True;
       edtCodCli.Text := FieldByName('c_cod').AsString;
       Edit1.Text := FieldByName('c_cpf').AsString;
       edtEndereco.Text := FieldByName('c_endereco').AsString;
       edtCidade.Text := FieldByName('c_cidade').AsString;
       edtUf.Text := FieldByName('c_uf').AsString;
       mkeContato1.Text := FieldByName('c_contato1').AsString;
       mkeContato2.Text := FieldByName('c_contato2').AsString;
       CpfCnpj;
       mkeCpf.Text := Edit1.Text;
    end;
    btnSelecionarClick(Self);
end;

procedure TfrmClientePosVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nLinha : Integer;
begin
    nLinha := DBGrid1.DataSource.DataSet.RecNo;
    If odd(nLinha) then begin
       DBGrid1.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid1.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmClientePosVenda.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nLinha : Integer;
begin
    nLinha := DBGrid2.DataSource.DataSet.RecNo;
    If odd(nLinha) then begin
       DBGrid2.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid2.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmClientePosVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    btnSairClick(Self);
end;

procedure TfrmClientePosVenda.FormCreate(Sender: TObject);
begin
     With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxCliente.Items.Add(FieldByName('c_nome').AsString);
          Next;
       end;
    end;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select m_modelo from motos order by m_modelo');
       Active := True;
       while not Eof do begin
          cbxCategoria.Items.Add(FieldByName('m_modelo').AsString);
          Next;
       end;
    end;
    dsCliPv.Enabled := False;
    dtpEmissaoNf.Date := Date;
    speAno.Text := Ano(Date);
end;

procedure TfrmClientePosVenda.lblCpfClick(Sender: TObject);
begin
    mkeCpf.Clear;
    if lblCpf.Caption = 'CPF' then begin
       lblCpf.Caption := 'CNPJ';
       mkeCpf.EditMask := '00.000.000/0000-00;1;_';
    end
    else begin
       lblCpf.Caption := 'CPF';
       mkeCpf.EditMask := '000.000.000-00;1;_';
    end;
    mkeCpf.SetFocus;
end;

procedure TfrmClientePosVenda.mkeCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from clientes where c_cpf = '+QuotedStr(mkeCpf.Text)+'');
          Active := True;
          if dmContato.fdqContato.RecordCount <> 0 then begin
             edtCodCli.Text := FieldByName('c_cod').AsString;
             cbxCliente.Text := FieldByName('c_nome').AsString;
             mkeCpf.Text := FieldByName('c_cpf').AsString;
             edtEndereco.Text := FieldByName('c_endereco').AsString;
             edtUf.Text := FieldByName('c_uf').AsString;
             edtCidade.Text := FieldByName('c_cidade').AsString;
             mkeContato1.Text := FieldByName('c_contato1').AsString;
             mkeContato2.Text := FieldByName('c_contato2').AsString;
             btnNovoClick(Self);
          end
          else begin
             ShowMessage('Não existe cadastro registrado para este CPF/CNPJ ou o mesmo é invalido.');
          end;
       end;
    end;
end;

procedure TfrmClientePosVenda.Data_Contato;
var nNovo, vCount, vContato, vDiaSemana : Integer;
    vData : TDate;
begin
    nNovo := 0;
    vCount := 0;
    vContato := 0;
    vData := dtpEmissaoNf.Date;
    vDiaSemana := DayOfWeek(vData);
    While vCount <> 18 do begin
       nNovo := fBuscaContato + 1;
       vCount := vCount + 1;
       vContato := vContato + 1;
       vDiaSemana := DayOfWeek(vData + 60);
       if vDiaSemana = 1 then begin
          vData := vData + 61;
       end;
       if vDiaSemana = 2 then begin
          vData := vData + 60;
       end;
       if vDiaSemana = 3 then begin
          vData := vData + 60;
       end;
       if vDiaSemana = 4 then begin
          vData := vData + 60;
       end;
       if vDiaSemana = 5 then begin
          vData := vData + 60;
       end;
       if vDiaSemana = 6 then begin
          vData := vData + 63;
       end;
       if vDiaSemana = 7 then begin
          vData := vData + 62;
       end;
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into contatos_pv (CT_COD, CP_COD, CT_CONTATO, CT_DATA, CT_REALIZADO) Values ('+QuotedStr(IntToStr(nNovo))+', '+QuotedStr(edtCodPosVenda.Text)+', '+QuotedStr(IntToStr(vContato))+', '+QuotedStr(DateToStr(vData))+', ''NÃO'')');
          ExecSQL;
       end;
    end;
end;

end.
