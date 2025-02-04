unit Entrada_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, DateUtils, ExtDlgs, DB, ADODB, Jpeg;

type
  TfrmEntrada = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtCod: TLabeledEdit;
    lblForn: TLabel;
    GroupBox3: TGroupBox;
    dtpDtEmiss: TDateTimePicker;
    lblDtEmiss: TLabel;
    cbxForn: TComboBox;
    edtQtd: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    btnCons: TSpeedButton;
    Shape1: TShape;
    edtNFiscal: TLabeledEdit;
    dtpDtEntrada: TDateTimePicker;
    lblDtEntrada: TLabel;
    edtVlEntr: TLabeledEdit;
    mkeCnpj: TMaskEdit;
    lblCnpj: TLabel;
    cbxProd: TComboBox;
    lblProd: TLabel;
    edtCodProd: TLabeledEdit;
    DBGrid1: TDBGrid;
    btnIncluir: TBitBtn;
    edtCodIten: TEdit;
    btnAtualiza: TBitBtn;
    btnAtualizar: TSpeedButton;
    ADOQuery1: TADOQuery;
    btnImpressao: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cbxFornExit(Sender: TObject);
    procedure edtVlUniExit(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure cbxProdExit(Sender: TObject);
    procedure dtpDtEmissChange(Sender: TObject);
    procedure Itens;
    procedure dtpDtEntradaExit(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
    procedure AtualizaEstoque;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
    procedure Foto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntrada: TfrmEntrada;

implementation

uses Carro_Comando_dm, Principal_frm, SelEntrada_frm,
  ImprimeCompra_frm;

{$R *.dfm}

function fBuscaCodEntrada() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ec_cod from entrada order by ec_cod desc');
       Active := True;
       fBuscaCodEntrada := FieldByName('ec_cod').AsInteger;
    end;
end;

function fBuscaCodItem() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select ie_cod from itens_entrada order by ie_cod desc');
       Active := True;
       fBuscaCodItem := FieldByName('ie_cod').AsInteger;
    end;
end;

function fConvertVlUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtVlUni.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtVlUni.Text := valor;
end;

function fConvertVlTot() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtVlTot.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtVlTot.Text := valor;
end;

function fConvertVlEnt() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtVlEntr.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtVlEntr.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmEntrada.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmEntrada.edtQtd.Text := valor;
end;

procedure TfrmEntrada.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmEntrada.btnLimparClick(Sender: TObject);
begin
    DBGrid1.DataSource.Enabled := False;
    edtCod.Clear; cbxForn.Clear; mkeCnpj.Clear; edtNFiscal.Clear; cbxProd.Clear; edtCodProd.Clear;
    FormShow(Sender);
    FormCreate(Sender);
    GroupBox3.Enabled := False;
    dmVendas.ADOQuery1.Active := False;
    dmVendas.DataSource1.Enabled := True;
    btnAtualiza.Enabled := False;
    cbxForn.SetFocus;
end;

procedure TfrmEntrada.FormShow(Sender: TObject);
begin
    dtpDtEmiss.Date := Date; dtpDtEntrada.Date := Date;
    edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlTot.Text := '0,00'; edtVlEntr.Text := '0,00';
    DBGrid1.DataSource.Enabled := False;
    dtpDtEmiss.SetFocus;
end;

procedure TfrmEntrada.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from fornecedores order by f_nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('f_nome').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from produtos order by p_n_prod');
       Active := True;
       while not Eof do begin
          cbxProd.Items.Add(FieldByName('p_n_prod').AsString);
          Next;
       end;
    end;
end;

procedure TfrmEntrada.btnInserirClick(Sender: TObject);
var nNovo : Integer;
begin
    If cbxForn.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       nNovo := fBuscaCodEntrada + 1;
       edtCod.Text := IntToStr(nNovo);
       fConvertVlUni;
       fConvertVlTot;
       fConvertVlEnt;
       fConvertQtd;
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.add('Insert into entrada (EC_COD, F_CNPJ, EC_DT_EMISS, EC_DT_ENTRADA, EC_N_NF, EC_VL_ENTRADA) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(mkeCnpj.Text)+', '+ QuotedStr(DateToStr(dtpDtEmiss.Date))+', '+ QuotedStr(DateToStr(dtpDtEntrada.Date))+', '+QuotedStr(edtNFiscal.Text)+', '+QuotedStr(edtVlEntr.Text)+')');
          ExecSQL;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       fConvertVlUni;
       fConvertVlTot;
       fConvertVlEnt;
       fConvertQtd;
       Application.MessageBox('Registro Efetuado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
       GroupBox3.Enabled := True;
       cbxProd.SetFocus;
    end
    else begin
       Application.MessageBox('O campo Fornecedor não pode estar vazio!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmEntrada.cbxFornExit(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select f_cnpj from fornecedores where f_nome = '+QuotedStr(cbxForn.Text)+'');
       Active := True;
       mkeCnpj.Text := FieldByName('f_cnpj').AsString;
       edtNFiscal.SetFocus;
    end;
end;

procedure TfrmEntrada.cbxProdExit(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_cod from produtos where p_n_prod = '+QuotedStr(cbxProd.Text)+'');
       Active := True;
       edtCodProd.Text := FieldByName('p_cod').AsString;
       edtQtd.SetFocus;
    end;
    Itens;
end;

procedure TfrmEntrada.edtVlUniExit(Sender: TObject);
var vQtd, vUnit : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vUnit := StrToFloat(edtVlUni.Text);
    edtVlTot.Text := FloatToStr(vUnit * vQtd);
    edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
    edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
    edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
end;

procedure TfrmEntrada.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Tem certeza que deseja Excluir os Registros?','Sistema Almoxarifado - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from itens_entrada where ec_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
          end;
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from entrada where ec_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
          end;
          Application.MessageBox('Registro Deletado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          FormShow(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;


procedure TfrmEntrada.btnIncluirClick(Sender: TObject);
var nNovo : Integer;
    vTotal, vTotalEnt : Double;
begin
    nNovo := fBuscaCodItem + 1;
    vTotal := StrToFloat(edtVlTot.Text);
    vTotalEnt := StrToFloat(edtVlEntr.Text);
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlEnt;
    fConvertQtd;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into itens_entrada (IE_COD, EC_COD, P_COD, IE_QTD, IE_VL_UNI, IE_VL_TOT) Values ('+IntToStr(nNovo)+', '+QuotedStr(edtCod.Text)+', '+ QuotedStr(edtCodProd.Text)+', '+ QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlUni.Text)+', '+QuotedStr(edtVlTot.Text)+')');
       ExecSQL;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlEnt;
    fConvertQtd;
    Application.MessageBox('Produto Incluido na Entrada!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
    edtVlEntr.Text := FloatToStr(vTotal+vTotalEnt);
    edtVlEntr.Text := FormatFloat('0.##',(StrToFloat(edtVlEntr.Text)));
    edtVlEntr.Text := FormatCurr('0.00', StrToCurr(edtVlEntr.Text));
    fConvertVlEnt;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Update entrada set ec_vl_entrada = '+QuotedStr(edtVlEntr.Text)+' where ec_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       AtualizaEstoque;
       fConvertVlEnt;
    end;
    Itens;
    cbxProd.SetFocus;
    edtCodProd.Clear; edtQtd.Clear; edtVlUni.Clear; edtVlTot.Clear;

end;

procedure TfrmEntrada.dtpDtEmissChange(Sender: TObject);
begin
    cbxForn.SetFocus;
end;

procedure TfrmEntrada.Itens;
begin
    DBGrid1.DataSource.Enabled := True;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p.p_n_prod, i.ie_cod, p.p_uni_med, i.p_cod, i.ie_qtd, replace(format(i.ie_vl_uni,2), ".",",") ''uni'', replace(format(i.ie_vl_tot,2), ".",",") ''tot'' from produtos p, itens_entrada i where p.p_cod = i.p_cod and ec_cod = '+QuotedStr(edtCod.Text)+' order by ie_cod');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('ie_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('p_cod').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('p_n_prod').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('ie_qtd').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('p_uni_med').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('uni').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('tot').FieldName;
    end;
end;

procedure TfrmEntrada.dtpDtEntradaExit(Sender: TObject);
begin
    Application.MessageBox('Clique no Botão Inserir para criar a nova entrada e lançar os produtos.','Sistema Almoxarifado - Aviso',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmEntrada.btnConsClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSelEntrada, frmSelEntrada);
      frmSelEntrada.ShowModal;
    Finally
         frmSelEntrada.Free;
    end;
end;

procedure TfrmEntrada.AtualizaEstoque;
var vQtdAtual, vQtdNovo : Double;
begin
    vQtdAtual := StrToFloat(edtQtd.Text);
    DecimalSeparator := '.';
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_qtd, p_vl_uni from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       Active := True;
       vQtdNovo := FieldByName('p_qtd').AsFloat;
       Active := False;
       SQL.Clear;
       SQL.Add('Update produtos set p_qtd = '+FloatToStr(vQtdNovo + vQtdAtual)+' where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       ExecSQL;
       DecimalSeparator := ',';
    end;
end;

procedure TfrmEntrada.DBGrid1DblClick(Sender: TObject);
begin
    edtCodIten.Text := DBGrid1.SelectedField.Text;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select IE.*, P.p_n_prod, EC.ec_cod from itens_entrada IE, Produtos P, entrada EC where P.p_cod = IE.p_cod and EC.ec_cod = IE.ec_cod and IE.ie_cod = '+QuotedStr(edtCodIten.Text)+'');
       Active := True;
       cbxProd.Text := FieldByName('p_n_prod').AsString;
       edtCodProd.Text := FieldByName('p_cod').AsString;
       edtQtd.Text := FieldByName('ie_qtd').AsString;
       edtVlUni.Text := FieldByName('ie_vl_uni').AsString;
       edtVlTot.Text := FieldByName('ie_vl_tot').AsString;
       edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
       edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
       edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
    end;
//    dmVendas.DataSource1.Enabled := False;
    btnAtualiza.Enabled := True;
    edtQtd.SetFocus;
end;

procedure TfrmEntrada.btnAtualizaClick(Sender: TObject);
var vTotal, vTotalEnt : Double;
begin
    vTotal := StrToFloat(edtVlTot.Text);
    vTotalEnt := StrToFloat(edtVlEntr.Text);
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlEnt;
    fConvertQtd;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Update itens_entrada set ie_qtd = '+QuotedStr(edtQtd.Text)+', ie_vl_uni = '+QuotedStr(edtVlUni.Text)+', ie_vl_tot = '+QuotedStr(edtVlTot.Text)+' where ie_cod = '+QuotedStr(edtCodIten.Text)+'');
       ExecSQL;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlEnt;
    fConvertQtd;
    Application.MessageBox('Item Atualizado!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
    edtVlEntr.Text := FloatToStr(vTotal+vTotalEnt);
    edtVlEntr.Text := FormatFloat('0.##',(StrToFloat(edtVlEntr.Text)));
    edtVlEntr.Text := FormatCurr('0.00', StrToCurr(edtVlEntr.Text));
    fConvertVlEnt;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Update entrada set ec_vl_entrada = '+QuotedStr(edtVlEntr.Text)+' where ec_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       AtualizaEstoque;
       fConvertVlEnt;
    end;
    Itens;
    btnAtualiza.Enabled := False;
    edtCodProd.Clear; edtQtd.Clear; edtVlUni.Clear; edtVlTot.Clear;
end;

procedure TfrmEntrada.btnAtualizarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertVlEnt;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update entrada set ec_dt_emiss = '+QuotedStr(DateToStr(dtpDtEmiss.Date))+', ec_n_nf = '+QuotedStr(edtNFiscal.Text)+', ec_dt_entrada = '+QuotedStr(DateToStr(dtpDtEntrada.Date))+', ec_vl_entrada = '+QuotedStr(edtVlEntr.Text)+' where ec_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       fConvertVlEnt;
       Application.MessageBox('Registro Atualizado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
       ShortDateFormat := 'dd/mm/yyyy';
       Itens;
    end;
end;

procedure TfrmEntrada.btnImpressaoClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select EC.*, F.*, IE.*, P.p_n_prod, P.p_uni_med from entrada EC, fornecedores F, itens_entrada IE, produtos P where EC.f_cnpj = F.f_cnpj and EC.ec_cod = IE.ec_cod and P.p_cod = IE.p_cod and EC.ec_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmReltCompra, frmReltCompra);
      Foto;
      frmReltCompra.qrpCompra.Preview;
    Finally
         frmReltCompra.Free;
    end;
end;

procedure TfrmEntrada.Foto;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    With ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from registro');
       Active := True;
       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          frmReltCompra.QRImage1.Picture.Assign(Jpeg);
//          frmReltCompra.QRImage2.Picture.Assign(Jpeg);
       end
       else begin
          frmReltCompra.QRImage1.Picture.Assign(nil);
//          frmReltCompra.QRImage2.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
    end;
end;


end.
