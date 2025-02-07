unit Lavoura_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, Buttons, DBCtrls, Jpeg;

type
  TfrmLavoura = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    lblDtAquisi: TLabel;
    Label3: TLabel;
    edtCod: TLabeledEdit;
    edtQtd: TLabeledEdit;
    dtpData: TDateTimePicker;
    edtValorGasto: TLabeledEdit;
    dtpDataFinal: TDateTimePicker;
    edtProducao: TLabeledEdit;
    edtQtdProducao: TLabeledEdit;
    edtCusto: TLabeledEdit;
    GroupBox2: TGroupBox;
    edtCodItem: TLabeledEdit;
    edtProd: TLabeledEdit;
    edtQtdItem: TLabeledEdit;
    edtVlItem: TLabeledEdit;
    edtVlTotalItem: TLabeledEdit;
    DBGrid1: TDBGrid;
    btnIncluirItem: TBitBtn;
    btnAtualizaItem: TBitBtn;
    rdgSituacao: TRadioGroup;
    Label2: TLabel;
    btnImprimir: TSpeedButton;
    edtProduto: TEdit;
    btnExcluir: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnIncluirItemClick(Sender: TObject);
    procedure btnAtualizaItemClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtQtdProducaoExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Foto;
    procedure Imprimir;
    procedure edtVlItemExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLavoura: TfrmLavoura;

implementation

uses Carro_Comando_dm, ADODB, DB, BuscaRegistro_frm, ImprimeLavoura_frm,
  ConsultaLavoura_frm;

{$R *.dfm}

function fBuscaCodLavoura() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select l_cod from lavoura order by l_cod desc');
       Active := True;
       fBuscaCodLavoura := FieldByName('l_cod').AsInteger;
    end;
end;

function fBuscaCodItem() : Integer;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select il_cod from itens_lavoura order by il_cod desc');
       Active := True;
       fBuscaCodItem := FieldByName('il_cod').AsInteger;
    end;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLavoura.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLavoura.edtQtd.Text := valor;
end;

function fConvertVlGasto() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLavoura.edtValorGasto.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLavoura.edtValorGasto.Text := valor;
end;

function fConvertQtdProduzida() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLavoura.edtQtdProducao.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLavoura.edtQtdProducao.Text := valor;
end;

function fConvertCusto() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLavoura.edtCusto.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLavoura.edtCusto.Text := valor;
end;

function fConvertQtdItem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLavoura.edtQtdItem.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLavoura.edtQtdItem.Text := valor;
end;

function fConvertVlItem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLavoura.edtVlItem.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLavoura.edtVlItem.Text := valor;
end;

function fConvertVlTotalItem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmLavoura.edtVlTotalItem.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmLavoura.edtVlTotalItem.Text := valor;
end;

function sStatus () : String;
begin
    If frmLavoura.rdgSituacao.ItemIndex = 0 then
       sStatus := 'ATIVO'
    else
       sStatus := 'ENCERRADO';
end;

procedure TfrmLavoura.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmLavoura.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; edtProduto.Clear; edtProducao.Clear; edtCodItem.Clear; edtProd.Clear;
    FormShow(Sender);
    rdgSituacao.ItemIndex := -1;
    dtpData.SetFocus;
end;

procedure TfrmLavoura.FormShow(Sender: TObject);
begin
    edtValorGasto.Text := '0,00'; edtValorGasto.Text := '0,00'; edtVlItem.Text := '0,00'; edtVlTotalItem.Text := '0,00';
    edtQtdProducao.Text := '0'; edtCusto.Text := '0,00'; edtQtdItem.Text := '0'; edtQtd.Text := '0';
    dtpData.Date := Date - 15; dtpDataFinal.Date := Date + 15;
    DBGrid1.DataSource.Enabled := False;
    GroupBox2.Enabled := False;
    dtpData.SetFocus;
end;

procedure TfrmLavoura.btnInserirClick(Sender: TObject);
var nNovo : Integer;
    vStatus : String;
begin
    If edtProduto.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       nNovo := fBuscaCodLavoura + 1;
       edtCod.Text := IntToStr(nNovo);
       vStatus := sStatus;
       fConvertQtd;
       fConvertVlGasto;
       fConvertQtdProduzida;
       fConvertCusto;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into lavoura (L_COD, L_PLANTACAO, L_DTINICIO, L_DTFIM, L_QTD, L_VALOR, L_FINALIDADE, L_QTDFINALIDADE, L_CUSTOKILO, L_STATUS) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(edtProduto.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(DateToStr(dtpDataFinal.Date))+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtValorGasto.Text)+', '+QuotedStr(edtProducao.Text)+', '+QuotedStr(edtQtdProducao.Text)+', '+QuotedStr(edtCusto.Text)+', '+QuotedStr(vStatus)+')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
          fConvertQtd;
          fConvertVlGasto;
          fConvertQtdProduzida;
          fConvertCusto;
          GroupBox2.Enabled := True;
          edtProd.SetFocus;
       end;
    end
    else begin
       Application.MessageBox('O campo Produto Plantado não pode ser vazio!','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLavoura.btnAtualizarClick(Sender: TObject);
var vStatus : String;
begin
    If edtCod.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       vStatus := sStatus;
       fConvertQtd;
       fConvertVlGasto;
       fConvertQtdProduzida;
       fConvertCusto;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update lavoura set L_PLANTACAO = '+QuotedStr(edtProduto.Text)+', L_DTINICIO = '+QuotedStr(DateToStr(dtpData.Date))+', L_DTFIM = '+QuotedStr(DateToStr(dtpDataFinal.Date))+', L_QTD = '+QuotedStr(edtQtd.Text)+', L_VALOR = '+QuotedStr(edtValorGasto.Text)+', L_FINALIDADE = '+QuotedStr(edtProducao.Text)+', L_QTDFINALIDADE = '+QuotedStr(edtQtdProducao.Text)+', L_CUSTOKILO = '+QuotedStr(edtCusto.Text)+', L_STATUS = '+QuotedStr(vStatus)+' where l_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Application.MessageBox('Registro Atualizado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
          fConvertQtd;
          fConvertVlGasto;
          fConvertQtdProduzida;
          fConvertCusto;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select il_cod ''Código Item'', il_produto ''Produto'', replace(format(il_vlunit,3), ".", ",") ''Valor Unitário'', il_qtd ''Quantidade'', replace(format(il_vltotal,2), ".", ",") ''Valor Total'' from itens_lavoura '+
          'where l_cod = '+QuotedStr(edtCod.Text)+' order by il_produto');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('Código Item').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto').FieldName;
          DBGrid1.Columns.Items[1].Width := 150;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('Valor Unitário').FieldName;
          DBGrid1.Columns.Items[2].Width := 90;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('Quantidade').FieldName;
          DBGrid1.Columns.Items[3].Width := 80;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('Valor Total').FieldName;
          DBGrid1.Columns.Items[4].Width := 75;
       end;
    end
    else begin
       Application.MessageBox('Selecione um registro para atualizar!','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLavoura.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
      If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
         With dmCarroComando.ADOQuery1 do begin
            Active := False;
            SQL.Clear;
            SQL.Add('Delete from itens_lavoura where l_cod = '+ QuotedStr(edtCod.Text)+'');
            ExecSQL;
            Active := False;
            SQL.Clear;
            SQL.Add('Delete from lavoura where l_cod = '+ QuotedStr(edtCod.Text)+'');
            ExecSQL;
            Application.MessageBox('Registro Deletado com Sucesso!','Omega - Sucesso',MB_OK+MB_ICONINFORMATION);
            btnLimparClick(Sender);
            FormShow(Sender);
         end;
      end;
    end
    else begin
       Application.MessageBox('Selecione um registro para excluir!','Omega - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmLavoura.btnIncluirItemClick(Sender: TObject);
var nNovo : Integer;
    vQtdItem, vQtd, vItem, vTotal : Double;
begin
    nNovo := fBuscaCodItem + 1;
    edtCodItem.Text := IntToStr(nNovo);
    fConvertQtdItem;
    fConvertVlItem;
    fConvertVlTotalItem;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Insert into itens_lavoura (IL_COD, L_COD, IL_PRODUTO, IL_QTD, IL_VLUNIT, IL_VLTOTAL) Values ('+QuotedStr(edtCodItem.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(edtProd.Text)+', '+QuotedStr(edtQtdItem.Text)+', '+QuotedStr(edtVlItem.Text)+', '+QuotedStr(edtVlTotalItem.Text)+')');
       ExecSQL;
       fConvertQtdItem;
       fConvertVlItem;
       fConvertVlTotalItem;
       vQtdItem := StrToFloat(edtQtdItem.Text);
       vQtd := StrToFloat(edtQtd.Text);
       edtQtd.Text := FloatToStr(vQtdItem+vQtd);
       vItem := StrToFloat(edtVlTotalItem.Text);
       vTotal := StrToFloat(edtValorGasto.Text);
       edtValorGasto.Text := FloatToStr(vItem+vTotal);
       edtQtd.Text := FormatFloat('0.##',(StrToFloat(edtQtd.Text)));
       edtValorGasto.Text := FormatCurr('0.00', StrToCurr(edtValorGasto.Text));
       Application.MessageBox('Produto incluído!','Sys Point - Sucesso',MB_OK+MB_ICONINFORMATION);
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select il_cod ''Código Item'', il_produto ''Produto'', replace(format(il_vlunit,3), ".", ",") ''Valor Unitário'', il_qtd ''Quantidade'', replace(format(il_vltotal,2), ".", ",") ''Valor Total'' from itens_lavoura '+
          'where l_cod = '+QuotedStr(edtCod.Text)+' order by il_produto');
          Active := True;
          DBGrid1.DataSource.Enabled := True;
          DBGrid1.Columns.Items[0].FieldName := FieldByName('Código Item').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto').FieldName;
          DBGrid1.Columns.Items[1].Width := 150;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('Valor Unitário').FieldName;
          DBGrid1.Columns.Items[2].Width := 90;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('Quantidade').FieldName;
          DBGrid1.Columns.Items[3].Width := 80;
          DBGrid1.Columns.Items[4].FieldName := FieldByName('Valor Total').FieldName;
          DBGrid1.Columns.Items[4].Width := 75;
       end;
    end;
    edtCodItem.Clear; edtProd.Clear; edtVlItem.Text := '0,00'; edtQtdItem.Text := '0'; edtVlTotalItem.Text := '0,00';
    edtProd.SetFocus;
end;

procedure TfrmLavoura.btnAtualizaItemClick(Sender: TObject);
var vQtdItem, vQtd, vItem, vTotal : Double;
begin
    fConvertQtdItem;
    fConvertVlItem;
    fConvertVlTotalItem;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update itens_lavoura set il_qtd = '+QuotedStr(edtQtdItem.Text)+', il_vlunit = '+QuotedStr(edtVlItem.Text)+', il_vltotal = '+QuotedStr(edtVlTotalItem.Text)+' where il_cod = '+QuotedStr(edtCodItem.Text)+'');
       ExecSQL;
    end;
    fConvertQtdItem;
    fConvertVlItem;
    fConvertVlTotalItem;
    vQtdItem := StrToFloat(edtQtdItem.Text);
    vQtd := StrToFloat(edtQtd.Text);
    edtQtd.Text := FloatToStr(vQtdItem+vQtd);
    vItem := StrToFloat(edtVlTotalItem.Text);
    vTotal := StrToFloat(edtValorGasto.Text);
    edtValorGasto.Text := FloatToStr(vItem+vTotal);
    edtQtd.Text := FormatFloat('0.##',(StrToFloat(edtQtd.Text)));
    edtValorGasto.Text := FormatCurr('0.00', StrToCurr(edtValorGasto.Text));
    Application.MessageBox('Produto Atualizado!','Sys Point - Sucesso',MB_OK+MB_ICONINFORMATION);
    edtCodItem.Clear; edtProd.Clear; edtVlItem.Text := '0,00'; edtQtdItem.Text := '0'; edtVlTotalItem.Text := '0,00';
end;

procedure TfrmLavoura.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If odd(dmCarroComando.ADOQuery1.RecNo) then begin
       DBGrid1.Canvas.Font.Color:= clBlack;
       DBGrid1.Canvas.Brush.Color:= $00D4D4D4;
    end
    else begin
       DBGrid1.Canvas.Font.Color:= clBlack;
       DBGrid1.Canvas.Brush.Color:= clWhite;
    end;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

procedure TfrmLavoura.DBGrid1DblClick(Sender: TObject);
begin
    edtCodItem.Text := DBGrid1.SelectedField.Text;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select il_cod ''Código Item'', IL_PRODUTO ''Produto'', il_vlunit ''Valor Unitário'', il_qtd ''Quantidade'', il_vltotal ''Valor Total'' from itens_lavoura '+
       'where il_cod = '+QuotedStr(edtCodItem.Text)+'');
       Active := True;
       edtProd.Text := FieldByName('Produto').AsString;
       edtQtdItem.Text := FieldByName('Quantidade').AsString;
       edtVlItem.Text := FieldByName('Valor Unitário').AsString;
       edtVlTotalItem.Text := FieldByName('Valor Total').AsString;
       edtQtdItem.Text := FormatFloat('0.##',(StrToFloat(edtQtdItem.Text)));
       edtVlTotalItem.Text := FormatCurr('0.00', StrToCurr(edtVlTotalItem.Text));
       edtVlItem.Text := FormatCurr('0.000', StrToCurr(edtVlItem.Text));
    end;
    edtQtdItem.SetFocus;
end;

procedure TfrmLavoura.edtQtdProducaoExit(Sender: TObject);
var vGasto, vProduzido : Double;
begin
    vGasto := StrToFloat(edtValorGasto.Text);
    vProduzido := StrToFloat(edtQtdProducao.Text);
    edtCusto.Text := FloatToStr(vGasto/vProduzido);
    edtCusto.Text := FormatCurr('0.000', StrToCurr(edtCusto.Text));
end;

procedure TfrmLavoura.btnSelecionarClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsultaLavoura, frmConsultaLavoura);
      frmConsultaLavoura.ShowModal;
    Finally
         frmConsultaLavoura.Free;
    end;

end;

procedure TfrmLavoura.btnImprimirClick(Sender: TObject);
var vStatus : String;
begin
    vStatus := sStatus;
    Try
      Application.CreateForm(TqrpLavoura, qrpLavoura);
      Foto;
      Imprimir;
      qrpLavoura.qrlValor1.Caption := edtCod.Text;
      qrpLavoura.qrlValor2.Caption := DateToStr(dtpData.Date);
      qrpLavoura.qrlValor3.Caption := DateToStr(dtpDataFinal.Date);
      qrpLavoura.qrlValor5.Caption := edtProduto.Text;
      qrpLavoura.qrlValor6.Caption := edtQtd.Text;
      qrpLavoura.qrlValor7.Caption := edtValorGasto.Text;
      qrpLavoura.qrlValor7.Caption := FormatCurr(',0.00', StrToCurr(qrpLavoura.qrlValor7.Caption));
      qrpLavoura.qrlValor8.Caption := edtProducao.Text;
      qrpLavoura.qrlValor9.Caption := edtQtdProducao.Text;
      qrpLavoura.qrlValor10.Caption := edtCusto.Text;
      qrpLavoura.qrlValor10.Caption := FormatCurr('0.000', StrToCurr(qrpLavoura.qrlValor10.Caption));
      qrpLavoura.qrlValor4.Caption := sStatus;
      qrpLavoura.Preview;
    Finally
         qrpLavoura.Free;
    end;
end;

procedure TfrmLavoura.Foto;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario, foto from registro where codigo = 1');
       Active := True;
       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          qrpLavoura.QRImage1.Picture.Assign(Jpeg);
       end
       else begin
         qrpLavoura.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       qrpLavoura.qrlUsuario.Caption := FieldByName('usuario').AsString;
    end;
end;

procedure TfrmLavoura.Imprimir;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from lavoura where l_plantacao = '+QuotedStr(frmLavoura.edtProduto.Text)+'');
       Active := True;
       frmLavoura.edtCod.Text := FieldByName('l_cod').AsString;
       frmLavoura.dtpData.Date := FieldByName('l_dtinicio').AsDateTime;
       frmLavoura.dtpDataFinal.Date := FieldByName('l_dtfim').AsDateTime;
       frmLavoura.edtProduto.Text := FieldByName('l_plantacao').AsString;
       frmLavoura.edtQtd.Text := FieldByName('l_qtd').AsString;
       frmLavoura.edtValorGasto.Text := FieldByName('l_valor').AsString;
       frmLavoura.edtProducao.Text := FieldByName('l_finalidade').AsString;
       frmLavoura.edtQtdProducao.Text := FieldByName('l_qtdfinalidade').AsString;
       frmLavoura.edtCusto.Text := FieldByName('l_custokilo').AsString;
       frmLavoura.edtCusto.Text := FormatCurr('0.000', StrToCurr(frmLavoura.edtCusto.Text));
       frmLavoura.edtValorGasto.Text := FormatCurr('0.00', StrToCurr(frmLavoura.edtValorGasto.Text));
       frmLavoura.edtQtd.Text := FormatFloat('0.##',(StrToFloat(frmLavoura.edtQtd.Text)));
       frmLavoura.edtQtdProducao.Text := FormatFloat('0.##',(StrToFloat(frmLavoura.edtQtdProducao.Text)));
       If FieldByName('l_status').AsString = 'ATIVO' then
          frmLavoura.rdgSituacao.ItemIndex := 0
       else
          frmLavoura.rdgSituacao.ItemIndex := 1;
       end;
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select il_cod ''Código Item'', il_produto ''Produto'', replace(format(il_vlunit,3), ".", ",") ''Valor Unitário'', il_qtd ''Quantidade'', replace(format(il_vltotal,2), ".", ",") ''Valor Total'' from itens_lavoura '+
          'where l_cod = '+QuotedStr(frmLavoura.edtCod.Text)+' order by il_produto');
          Active := True;
          frmLavoura.DBGrid1.DataSource.Enabled := True;
          frmLavoura.DBGrid1.Columns.Items[0].FieldName := FieldByName('Código Item').FieldName;
          frmLavoura.DBGrid1.Columns.Items[1].FieldName := FieldByName('Produto').FieldName;
          frmLavoura.DBGrid1.Columns.Items[1].Width := 150;
          frmLavoura.DBGrid1.Columns.Items[2].FieldName := FieldByName('Valor Unitário').FieldName;
          frmLavoura.DBGrid1.Columns.Items[2].Width := 90;
          frmLavoura.DBGrid1.Columns.Items[3].FieldName := FieldByName('Quantidade').FieldName;
          frmLavoura.DBGrid1.Columns.Items[3].Width := 80;
          frmLavoura.DBGrid1.Columns.Items[4].FieldName := FieldByName('Valor Total').FieldName;
          frmLavoura.DBGrid1.Columns.Items[4].Width := 75;
      end;
    end;
procedure TfrmLavoura.edtVlItemExit(Sender: TObject);
var vQtd, vUni : Double;
begin
    vQtd := StrToFloat(edtQtdItem.Text);
    vUni := StrToFloat(edtVlItem.Text);
    edtVlTotalItem.Text := FloatToStr(vQtd*vUni);
    edtQtdItem.Text := FormatFloat('0.##',(StrToFloat(edtQtdItem.Text)));
    edtVlTotalItem.Text := FormatCurr('0.00', StrToCurr(edtVlTotalItem.Text));
    edtVlItem.Text := FormatCurr('0.000', StrToCurr(edtVlItem.Text));
end;

procedure TfrmLavoura.btnExcluirClick(Sender: TObject);
var vQtdGasto, vValorGasto, vQtd, vValor : Double;
begin
    If Application.MessageBox('Excluir Registro?','Omega - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
       vQtdGasto := StrToFloat(edtQtd.Text);
       vValorGasto := StrToFloat(edtValorGasto.Text);
       vQtd := StrToFloat(edtQtdItem.Text);
       vValor := StrToFloat(edtVlTotalItem.Text);
       edtQtd.Text := FloatToStr(vQtdGasto-vQtd);
       edtValorGasto.Text := FloatToStr(vValorGasto-vValor);
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Delete from itens_lavoura where il_cod = '+QuotedStr(edtCodItem.Text)+'');
          ExecSQL;
       end;
    end;
    btnAtualizarClick(Sender);
    edtCodItem.Clear; edtProd.Clear; edtQtdItem.Text := '0'; edtVlItem.Text := '0,00'; edtVlTotalItem.Text := '0,00';
end;

end.
