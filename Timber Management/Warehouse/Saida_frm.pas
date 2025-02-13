unit Saida_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, DateUtils, ExtDlgs, DB, ADODB, Jpeg;

type
  TfrmSaida = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtCod: TLabeledEdit;
    lblCli: TLabel;
    GroupBox3: TGroupBox;
    dtpDtEmiss: TDateTimePicker;
    lblDtEmiss: TLabel;
    cbxCli: TComboBox;
    edtQtd: TLabeledEdit;
    edtVlUni: TLabeledEdit;
    edtVlTot: TLabeledEdit;
    btnCons: TSpeedButton;
    Shape1: TShape;
    edtVlSaida: TLabeledEdit;
    mkeCpfj: TMaskEdit;
    lblCpfj: TLabel;
    cbxProd: TComboBox;
    lblProd: TLabel;
    edtCodProd: TLabeledEdit;
    DBGrid1: TDBGrid;
    btnIncluir: TBitBtn;
    RadioGroup1: TRadioGroup;
    btnImpressao: TSpeedButton;
    ADOQuery1: TADOQuery;
    btnAtualiza: TBitBtn;
    btnAtualizar: TSpeedButton;
    edtCodIten: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure cbxProdExit(Sender: TObject);
    procedure dtpDtEmissChange(Sender: TObject);
    procedure Itens;
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
    procedure AtualizaEstoque;
    procedure btnImpressaoClick(Sender: TObject);
    procedure Foto;
    procedure Nivel;
    procedure edtQtdExit(Sender: TObject);
    procedure edtVlUniExit(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtVlUniEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaida: TfrmSaida;

implementation

uses Carro_Comando_dm, Principal_frm, SelSaida_frm,
  ImprimeVenda_frm;

{$R *.dfm}

function fBuscaCodEntrada() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select sv_cod from saida order by sv_cod desc');
       Active := True;
       fBuscaCodEntrada := FieldByName('sv_cod').AsInteger;
    end;
end;

function fBuscaCodItem() : Integer;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select is_cod from itens_saida order by is_cod desc');
       Active := True;
       fBuscaCodItem := FieldByName('is_cod').AsInteger;
    end;
end;

function fConvertVlUni() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtVlUni.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtVlUni.Text := valor;
end;

function fConvertVlTot() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtVlTot.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtVlTot.Text := valor;
end;

function fConvertVlSaida() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtVlSaida.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtVlSaida.Text := valor;
end;

function fConvertQtd() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmSaida.edtQtd.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmSaida.edtQtd.Text := valor;
end;

function sSituacao() : String;
begin
    If frmSaida.RadioGroup1.ItemIndex = 0 then
       sSituacao := 'CONSUMO'
    else
       sSituacao := 'SERVI�O'
end;


procedure TfrmSaida.btnSairClick(Sender: TObject);
begin
    dmVendas.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmSaida.btnLimparClick(Sender: TObject);
begin
    edtCod.Clear; cbxCli.Clear; mkeCpfj.Clear; cbxProd.Clear; edtCodProd.Clear;
    RadioGroup1.ItemIndex := -1;
    FormShow(Sender);
    FormCreate(Sender);
    GroupBox3.Enabled := False;
    cbxCli.SetFocus;
    dmVendas.ADOQuery1.Active := False;
    btnAtualiza.Enabled := False;
end;

procedure TfrmSaida.FormShow(Sender: TObject);
begin
    dtpDtEmiss.Date := Date;
    edtQtd.Text := '0'; edtVlUni.Text := '0,00'; edtVlTot.Text := '0,00'; edtVlSaida.Text := '0,00';
    RadioGroup1.ItemIndex := -1;
    DBGrid1.DataSource.Enabled := False;
    cbxCli.SetFocus;
end;

procedure TfrmSaida.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from clientes order by c_nome');
       Active := True;
       while not Eof do begin
          cbxCli.Items.Add(FieldByName('c_nome').AsString);
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

procedure TfrmSaida.btnInserirClick(Sender: TObject);
var nNovo : Integer;
    Situacao : String;
begin
    If cbxCli.Text <> '' then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       nNovo := fBuscaCodEntrada + 1;
       edtCod.Text := IntToStr(nNovo);
       Situacao := sSituacao;
       fConvertVlUni;
       fConvertVlTot;
       fConvertVlSaida;
       fConvertQtd;
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.add('Insert into saida (SV_COD, C_CPFJ, SV_DT_EMISS, SV_TOT_SAIDA, SV_SITUACAO) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(mkeCpfj.Text)+', '+ QuotedStr(DateToStr(dtpDtEmiss.Date))+', '+QuotedStr(edtVlSaida.Text)+', '+QuotedStr(Situacao)+')');
          ExecSQL;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       fConvertVlUni;
       fConvertVlTot;
       fConvertVlSaida;
       fConvertQtd;
       Application.MessageBox('Registro Efetuado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
       GroupBox3.Enabled := True;
       cbxProd.SetFocus;
    end
    else begin
       Application.MessageBox('O campo Cliente n�o pode estar vazio!','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmSaida.cbxProdExit(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_cod from produtos where p_n_prod = '+QuotedStr(cbxProd.Text)+'');
       Active := True;
       edtCodProd.Text := FieldByName('p_cod').AsString;
//       edtVlUni.Text := FieldByName('p_vl_uni').AsString;
//       edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
       edtQtd.SetFocus;
    end;
    Itens;
    If btnIncluir.Enabled = False then
       btnIncluir.Enabled := True;
end;

procedure TfrmSaida.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Tem certeza que deseja Excluir os Registros?','Sistema Almoxarifado - Confirma��o de Exclus�o',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from itens_saida where is_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
          end;
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from saida where sv_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
          end;
          Application.MessageBox('Registro Deletado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          FormShow(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo C�digo n�o pode estar vazio!','Sistema Almoxarifado - Aten��o',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmSaida.btnIncluirClick(Sender: TObject);
var nNovo : Integer;
    vTotal, vTotalEnt : Double;
begin
    nNovo := fBuscaCodItem + 1;
    vTotal := StrToFloat(edtVlTot.Text);
    vTotalEnt := StrToFloat(edtVlSaida.Text);
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlSaida;
    fConvertQtd;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Insert into itens_saida (IS_COD, SV_COD, P_COD, IS_QTD, IS_VL_UNI, IS_VL_TOT) Values ('+IntToStr(nNovo)+', '+QuotedStr(edtCod.Text)+', '+ QuotedStr(edtCodProd.Text)+', '+ QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlUni.Text)+', '+QuotedStr(edtVlTot.Text)+')');
       ExecSQL;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlSaida;
    fConvertQtd;
    Application.MessageBox('Produto Incluido na Sa�da!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
    edtVlSaida.Text := FloatToStr(vTotal+vTotalEnt);
    edtVlSaida.Text := FormatFloat('0.##',(StrToFloat(edtVlSaida.Text)));
    edtVlSaida.Text := FormatCurr('0.00', StrToCurr(edtVlSaida.Text));
    fConvertVlSaida;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Update saida set sv_tot_saida = '+QuotedStr(edtVlSaida.Text)+' where sv_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       fConvertVlSaida;
       AtualizaEstoque;
    end;
    Itens;
    cbxProd.SetFocus;
    edtCodProd.Clear; edtQtd.Clear; edtVlUni.Clear; edtVlTot.Clear;
end;

procedure TfrmSaida.dtpDtEmissChange(Sender: TObject);
begin
    cbxCli.SetFocus;
end;

procedure TfrmSaida.Itens;
begin
    DBGrid1.DataSource.Enabled := True;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p.p_n_prod, p.p_uni_med, i.is_cod, i.p_cod, i.is_qtd, replace(format(i.is_vl_uni,2), ".",",") ''uni'', replace(format(i.is_vl_tot,2), ".",",") ''tot'' from produtos p, itens_saida i where p.p_cod = i.p_cod and i.sv_cod = '+QuotedStr(edtCod.Text)+' order by i.is_cod');
       Active := True;
       DBGrid1.Columns.Items[0].FieldName := FieldByName('is_cod').FieldName;
       DBGrid1.Columns.Items[1].FieldName := FieldByName('p_cod').FieldName;
       DBGrid1.Columns.Items[2].FieldName := FieldByName('p_n_prod').FieldName;
       DBGrid1.Columns.Items[3].FieldName := FieldByName('is_qtd').FieldName;
       DBGrid1.Columns.Items[4].FieldName := FieldByName('p_uni_med').FieldName;
       DBGrid1.Columns.Items[5].FieldName := FieldByName('uni').FieldName;
       DBGrid1.Columns.Items[6].FieldName := FieldByName('tot').FieldName;
    end;
end;

procedure TfrmSaida.RadioGroup1Click(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_cpfj from clientes where c_nome = '+QuotedStr(cbxCli.Text)+'');
       Active := True;
       mkeCpfj.Text := FieldByName('c_cpfj').AsString;
    end;
//    Application.MessageBox('Clique no Bot�o Inserir para criar a nova sa�da e lan�ar os produtos.','Madeira F�cil - Aviso',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmSaida.btnConsClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSelSaida, frmSelSaida);
      frmSelSaida.ShowModal;
    Finally
         frmSelSaida.Free;
    end;
end;

procedure TfrmSaida.AtualizaEstoque;
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
       Active := True;
       SQL.Clear;
       SQL.Add('Update produtos set p_qtd = '+FloatToStr(vQtdNovo - vQtdAtual)+' where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       ExecSQL;
       DecimalSeparator := ',';
    end;
end;

procedure TfrmSaida.btnImpressaoClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select SV.*, C.*, I_S.*, P.p_n_prod, P.p_uni_med from saida SV, clientes C, itens_saida I_S, produtos P where SV.c_cpfj = C.c_cpfj and SV.sv_cod = I_S.sv_cod and P.p_cod = I_S.p_cod and SV.sv_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmImprimeVenda, frmImprimeVenda);
      Foto;
      frmImprimeVenda.qrpVenda.Preview;
    Finally
         frmImprimeVenda.Free;
    end;
end;

procedure TfrmSaida.Foto;
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
          frmImprimeVenda.QRImage1.Picture.Assign(Jpeg);
          frmImprimeVenda.QRImage2.Picture.Assign(Jpeg);
       end
       else begin
          frmImprimeVenda.QRImage1.Picture.Assign(nil);
          frmImprimeVenda.QRImage2.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
    end;
end;

procedure TfrmSaida.Nivel;
var nNivel, nQtd : Double;
begin
    If edtQtd.Text <> '0' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select p_qtd, p_nivel from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
          Active := True;
          nNivel := FieldByName('p_nivel').AsFloat;
          nQtd := FieldByName('p_qtd').AsFloat;
          If nQtd <= nNivel then begin
             Application.MessageBox('A quantidade desse produto est� abaixo do n�vel de estoque!','Sistema Almoxarifado - Aviso',MB_OK+MB_ICONINFORMATION);
          end;
          If StrToFloat(edtQtd.Text) > nQtd then begin
             Application.MessageBox('A quantidade digitada para esse produto � maior do que a existente no estoque! Por favor, Digite um valor menor.','Sistema Almoxarifado - Aviso',MB_OK+MB_ICONINFORMATION);
             btnIncluir.Enabled := False;
             cbxProd.SetFocus;
          end;
          If nQtd = 0 then begin
             Application.MessageBox('A quantidade desse produto � 0! Retirada n�o autorizada...','Sistema Almoxarifado - Aviso',MB_OK+MB_ICONINFORMATION);
             btnIncluir.Enabled := False;
             cbxProd.SetFocus;
          end;
       end;
    end;
end;

procedure TfrmSaida.edtQtdExit(Sender: TObject);
begin
    Nivel;
end;

procedure TfrmSaida.edtVlUniExit(Sender: TObject);
var vQtd, vUnit : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vUnit := StrToFloat(edtVlUni.Text);
    edtVlTot.Text := FloatToStr(vQtd * vUnit);
    edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
    edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
    edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
end;

procedure TfrmSaida.btnAtualizarClick(Sender: TObject);
var Situacao : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    fConvertVlSaida;
    Situacao := sSituacao;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update saida set sv_dt_emiss = '+QuotedStr(DateToStr(dtpDtEmiss.Date))+', sv_situacao = '+QuotedStr(Situacao)+', sv_tot_saida = '+QuotedStr(edtVlSaida.Text)+', sv_situacao ='+QuotedStr(Situacao)+' where sv_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       fConvertVlSaida;
       Application.MessageBox('Registro Atualizado com Sucesso!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
       ShortDateFormat := 'dd/mm/yyyy';
       Itens;
    end;
end;

procedure TfrmSaida.btnAtualizaClick(Sender: TObject);
var vTotal, vTotalSaida : Double;
begin
    vTotal := StrToFloat(edtVlTot.Text);
    vTotalSaida := StrToFloat(edtVlSaida.Text);
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlSaida;
    fConvertQtd;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Update itens_saida set is_qtd = '+QuotedStr(edtQtd.Text)+', is_vl_uni = '+QuotedStr(edtVlUni.Text)+', is_vl_tot = '+QuotedStr(edtVlTot.Text)+' where is_cod = '+QuotedStr(edtCodIten.Text)+'');
       ExecSQL;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
    fConvertVlUni;
    fConvertVlTot;
    fConvertVlSaida;
    fConvertQtd;
    Application.MessageBox('Item Atualizado!','Sistema Almoxarifado - Sucesso',MB_OK+MB_ICONINFORMATION);
    edtVlSaida.Text := FloatToStr(vTotal+vTotalSaida);
    edtVlSaida.Text := FormatFloat('0.##',(StrToFloat(edtVlSaida.Text)));
    edtVlSaida.Text := FormatCurr('0.00', StrToCurr(edtVlSaida.Text));
    fConvertVlSaida;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.add('Update saida set sv_tot_saida = '+QuotedStr(edtVlSaida.Text)+' where sv_cod = '+QuotedStr(edtCod.Text)+'');
       ExecSQL;
       AtualizaEstoque;
       fConvertVlSaida;
    end;
    Itens;
    btnAtualiza.Enabled := False;
    edtCodProd.Clear; edtQtd.Clear; edtVlUni.Clear; edtVlTot.Clear;
end;

procedure TfrmSaida.DBGrid1DblClick(Sender: TObject);
begin
    edtCodIten.Text := DBGrid1.SelectedField.Text;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select I_S.*, P.p_n_prod, SV.sv_cod from itens_saida I_S, Produtos P, saida SV where P.p_cod = I_S.p_cod and SV.sv_cod = I_S.sv_cod and I_S.is_cod = '+QuotedStr(edtCodIten.Text)+'');
       Active := True;
       cbxProd.Text := FieldByName('p_n_prod').AsString;
       edtCodProd.Text := FieldByName('p_cod').AsString;
       edtQtd.Text := FieldByName('is_qtd').AsString;
       edtVlUni.Text := FieldByName('is_vl_uni').AsString;
       edtVlTot.Text := FieldByName('is_vl_tot').AsString;
       edtVlTot.Text := FormatFloat('0.##',(StrToFloat(edtVlTot.Text)));
       edtVlTot.Text := FormatCurr('0.00', StrToCurr(edtVlTot.Text));
       edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
    end;
//    dmVendas.DataSource1.Enabled := False;
    btnAtualiza.Enabled := True;
    edtQtd.SetFocus;
end;

procedure TfrmSaida.edtVlUniEnter(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select p_vl_uni from produtos where p_cod = '+QuotedStr(edtCodProd.Text)+'');
       Active := True;
       edtVlUni.Text := FieldByName('p_vl_uni').AsString;
       edtVlUni.Text := FormatCurr('0.00', StrToCurr(edtVlUni.Text));
    end;
end;

end.


