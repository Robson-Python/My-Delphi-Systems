unit Produtos_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DBCtrls, Grids, DBGrids, ComCtrls, Jpeg,
  ExtDlgs;

type
  TfrmProdutos = class(TForm)
    Panel1: TPanel;
    btnSelecionar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    cbxProduto: TComboBox;
    mmObs: TMemo;
    edtCategria: TLabeledEdit;
    cbxUnidade: TComboBox;
    edtLucro: TLabeledEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtQtd: TLabeledEdit;
    mmoObsPedido: TMemo;
    edtVlPedido: TLabeledEdit;
    Label4: TLabel;
    dtpData: TDateTimePicker;
    edtVlTotalPedido: TLabeledEdit;
    btnCalculaLucro: TSpeedButton;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    DBNavigator2: TDBNavigator;
    edtDespesa: TLabeledEdit;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpIni: TDateTimePicker;
    Panel6: TPanel;
    Panel7: TPanel;
    DBNavigator3: TDBNavigator;
    Label8: TLabel;
    dtpFim: TDateTimePicker;
    Label9: TLabel;
    edtCod: TEdit;
    Label10: TLabel;
    edtCodPedido: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtEstoque: TEdit;
    lblValor: TLabel;
    edtValor: TEdit;
    edtConsultar: TEdit;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Label13: TLabel;
    edtTotal: TEdit;
    Label14: TLabel;
    edtConsultaValor: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure cbxProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtVlTotalPedidoEnter(Sender: TObject);
    procedure btnCalculaLucroClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbxProdutoSelect(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

uses Enterprise_dm, DB, ZDataset, Principal_frm;

{$R *.dfm}

function fBuscaCodProd() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_cod from produtos order by p_cod desc');
       Active := True;
       fBuscaCodProd := FieldByName('p_cod').AsInteger;
    end;
end;

function fBuscaCodPedido() : Integer;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select pd_cod from pedidos order by pd_cod desc');
       Active := True;
       fBuscaCodPedido := FieldByName('pd_cod').AsInteger;
    end;
end;

function fConvertValor() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmProdutos.edtValor.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmProdutos.edtValor.Text := valor;
end;

function fConvertValorPedido() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmProdutos.edtVlPedido.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmProdutos.edtVlPedido.Text := valor;
end;

function fConvertVlTotalPedido() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmProdutos.edtVlTotalPedido.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmProdutos.edtVlTotalPedido.Text := valor;
end;

function fConvertDespesa() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmProdutos.edtDespesa.Text;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '.' then
       valor[i] := ','
    else
       if valor[i] = ',' then
          valor[i] := '.';
    end;
    frmProdutos.edtDespesa.Text := valor;
end;

procedure TfrmProdutos.btnSairClick(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin;
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmProdutos.btnLimparClick(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    If PageControl1.ActivePage = TabSheet1 then begin
       edtCod.Clear; edtCategria.Clear; edtEstoque.Text := '0'; edtValor.Text := '0,00'; edtLucro.Text := '0';
       cbxProduto.Text := ''; cbxUnidade.Text := '';
       mmObs.Clear;
       Image1.Picture.Assign(nil);
       cbxProduto.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       edtCodPedido.Clear; edtQtd.Text := '0'; edtVlPedido.Text := '0,00'; edtVlTotalPedido.Text := '0,00'; edtDespesa.Text := '0,00'; edtTotal.Text := '0,00';
       dtpData.Date := Date;
       mmoObsPedido.Clear;
       dmEnterprise.dsEnterprise.Enabled := False;
       dtpData.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       edtConsultaValor.Text := '0,00';
       dtpIni.Date := Date - 15; dtpFim.Date := Date + 15;
       dmEnterprise.dsEnterprise.Enabled := False;
    end;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_nome from produtos order by p_nome');
       Active := True;
       while not Eof do begin
          cbxProduto.Items.Add(FieldByName('p_nome').AsString);
          Next;
       end;
       SQL.Clear;
       Active := False;
    end;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
var nNovoProd, nNovoPedido : Integer;
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       btnLimparClick(Sender);
       nNovoProd := fBuscaCodProd + 1;
       edtCod.Text := IntToStr(nNovoProd);
       cbxProduto.SetFocus;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       btnLimparClick(Self);
       dmEnterprise.dsEnterprise.Enabled := False;
       nNovoPedido := fBuscaCodPedido + 1;
       edtCodPedido.Text := IntToStr(nNovoPedido);
       edtQtd.SetFocus;
    end;
end;

procedure TfrmProdutos.btnInserirClick(Sender: TObject);
var vEstoque, vQtd, vAtual : Double;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If PageControl1.ActivePage = TabSheet1 then begin
          If edtCod.Text <> '' then begin
             fConvertValor;
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Insert into produtos (P_COD, P_NOME, P_CATEGORIA, P_UNMEDIDA, P_ESTOQUE, P_LUCRO, P_VLVENDA, P_OBS, P_FOTO) values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxProduto.Text)+', '+QuotedStr(edtCategria.Text)+', '+QuotedStr(cbxUnidade.Text)+', '+QuotedStr(edtEstoque.Text)+', '+QuotedStr(edtLucro.Text)+', '+QuotedStr(edtValor.Text)+', '+QuotedStr(mmObs.Text)+', '''')');
                ExecSQL;
             end;
             fConvertValor;
             btnLimparClick(Self);
             cbxProduto.Clear;
             FormCreate(Self);
             Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
          end
          else begin
             Application.MessageBox('O campo Código não pode estar vazio! Clique em Novo para criar um novo código.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet2 then begin
          vEstoque := StrToFloat(edtEstoque.Text);
          vQtd := StrToFloat(edtQtd.Text);
          vAtual := vQtd+vEstoque;
          If edtCod.Text <> '' then begin
             If edtCodPedido.Text <> '' then begin
                DateSeparator := '/';
                ShortDateFormat := 'yyyy-mm-dd';
                fConvertValorPedido;
                fConvertVlTotalPedido;
                fConvertDespesa;
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Insert into pedidos (PD_COD, P_COD, PD_DATA, PD_QTD, PD_VALOR, PD_DESPESA, PD_VLTOTAL, PD_OBS) values ('+QuotedStr(edtCodPedido.Text)+', '+QuotedStr(edtCod.Text)+', '+QuotedStr(DateToStr(dtpData.Date))+', '+QuotedStr(edtQtd.Text)+', '+QuotedStr(edtVlPedido.Text)+', '+QuotedStr(edtDespesa.Text)+', '+QuotedStr(edtVlTotalPedido.Text)+', '+QuotedStr(mmoObsPedido.Text)+')');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select avg(pd_valor) from pedidos where p_cod = '+QuotedStr(edtCod.Text)+'');
                   Active := True;
                   edtValor.Text := FieldByName('avg(pd_valor)').AsString;
                   fConvertValor;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Update produtos set p_estoque = '+QuotedStr(FloatToStr(vAtual))+', p_vlvenda = '+QuotedStr(edtValor.Text)+' where p_cod = '+QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   edtEstoque.Text := FloatToStr(vAtual);
                   fConvertValor;
                end;
                fConvertValorPedido;
                fConvertVlTotalPedido;
                fConvertDespesa;
                edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
                ShortDateFormat := 'dd/mm/yyyy';
                Application.MessageBox('Registro Efetuado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end
             else begin
                Application.MessageBox('O campo Código do Pedido não pode estar vazio! Clique em Novo para criar um novo código.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
             end;
          end
          else begin
             Application.MessageBox('Você precisa selecionar o produto para dar entrada do pedido!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
             TabSheet1.Show;
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmProdutos.btnSelecionarClick(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from produtos order by p_nome');
          Active := True;
          dmEnterprise.dsEnterprise.Enabled := True;
          Open;
          (FieldByName('p_vlvenda') as TNumericField).DisplayFormat := ',0.00';
          DBGrid1.Columns.Items[0].FieldName := FieldByName('p_cod').FieldName;
          DBGrid1.Columns.Items[1].FieldName := FieldByName('p_nome').FieldName;
          DBGrid1.Columns.Items[2].FieldName := FieldByName('p_estoque').FieldName;
          DBGrid1.Columns.Items[3].FieldName := FieldByName('p_vlvenda').FieldName;
       end;
    end;
    If PageControl1.ActivePage = TabSheet2 then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select sum(pd_vltotal) ''Total'' from pedidos where p_cod = '+QuotedStr(edtCod.Text)+'');
          Active := True;
          If FieldByName('Total').AsString <> '' then begin
             edtTotal.Text := FieldByName('Total').AsString;
             edtTotal.Text := FormatCurr(',0.00', StrToFloat(edtTotal.Text));
          end
          else begin
             edtTotal.Text := '0,00';
          end;
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from pedidos where p_cod = '+QuotedStr(edtCod.Text)+' order by pd_data desc');
          Active := True;
          dmEnterprise.dsEnterprise.Enabled := True;
          Open;
          (FieldByName('pd_valor') as TNumericField).DisplayFormat := ',0.00';
          (FieldByName('pd_vltotal') as TNumericField).DisplayFormat := ',0.00';
          (FieldByName('pd_despesa') as TNumericField).DisplayFormat := ',0.00';
          DBGrid2.Columns.Items[0].FieldName := FieldByName('pd_cod').FieldName;
          DBGrid2.Columns.Items[1].FieldName := FieldByName('pd_data').FieldName;
          DBGrid2.Columns.Items[2].FieldName := FieldByName('pd_qtd').FieldName;
          DBGrid2.Columns.Items[3].FieldName := FieldByName('pd_valor').FieldName;
          DBGrid2.Columns.Items[4].FieldName := FieldByName('pd_despesa').FieldName;
          DBGrid2.Columns.Items[5].FieldName := FieldByName('pd_vltotal').FieldName;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    If PageControl1.ActivePage = TabSheet3 then begin
       edtConsultaValor.Text := '0,00';
       If edtConsultar.Text = 'ENTRADAS' then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select sum(pd_vltotal) from pedidos where pd_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+'');
             Active := True;
             edtConsultaValor.Text := FieldByName('sum(pd_vltotal)').AsString;
             If edtConsultaValor.Text <> '' then begin
                edtConsultaValor.Text := FormatCurr(',0.00', StrToCurr(edtConsultaValor.Text));
             end
             else begin
                edtConsultaValor.Text := '0,00';
             end;
             Active := False;
             SQL.Clear;
             SQL.Add('Select P.p_nome ''Produto'', PD.pd_data ''Data'', PD.pd_qtd ''Qtd.'', PD.pd_valor ''Vl. Unit. R$'', PD.pd_despesa ''Despesa R$'', PD.pd_vltotal ''Vl. Total R$''  from produtos P, pedidos PD where pd_data between '+QuotedStr(DateToStr(dtpIni.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and P.p_cod = PD.p_cod order by P.p_nome, PD.pd_data');
             Active := True;
             DBGrid3.DataSource.Enabled := True;
             Open;
             (FieldByName('Vl. Unit. R$') as TNumericField).DisplayFormat := ',0.00';
             (FieldByName('Vl. Total R$') as TNumericField).DisplayFormat := ',0.00';
             (FieldByName('Despesa R$') as TNumericField).DisplayFormat := ',0.00';
             DBGrid3.Columns.Items[0].Width := 300;
             DBGrid3.Columns.Items[1].Width := 70;
             DBGrid3.Columns.Items[2].Width := 30;
             DBGrid3.Columns.Items[3].Width := 75;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheet1;
    dmEnterprise.dsEnterprise.Enabled := False;
    dtpData.Date := Date;
    dtpIni.Date := Date - 15;
    dtpFim.Date := Date + 15;
    cbxProduto.SetFocus;
end;

procedure TfrmProdutos.btnAtualizarClick(Sender: TObject);
var vEstoque, vQtd, vAtual : Double;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If PageControl1.ActivePage = TabSheet1 then begin
          If cbxProduto.Text <> '' then begin
             fConvertValor;
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update produtos set P_NOME = '+QuotedStr(cbxProduto.Text)+', P_CATEGORIA = '+QuotedStr(edtCategria.Text)+', P_UNMEDIDA = '+QuotedStr(cbxUnidade.Text)+', P_LUCRO = '+QuotedStr(edtLucro.Text)+', P_ESTOQUE = '+QuotedStr(edtEstoque.Text)+', P_VLVENDA = '+QuotedStr(edtValor.Text)+', P_OBS = '+QuotedStr(mmObs.Text)+' where P_COD = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
                fConvertValor;
                Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
          end
          else begin
             Application.MessageBox('O campo Nome não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet2 then begin
          If cbxProduto.Text <> '' then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             vEstoque := StrToFloat(edtEstoque.Text);
             vQtd := StrToFloat(edtQtd.Text);
             vAtual := vEstoque+vQtd;
             fConvertValorPedido;
             fConvertVlTotalPedido;
             fConvertDespesa;
             With dmEnterprise.zqEnterprise do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update pedidos set PD_DATA = '+QuotedStr(DateToStr(dtpData.Date))+', PD_QTD = '+QuotedStr(edtQtd.Text)+', PD_VALOR = '+QuotedStr(edtVlPedido.Text)+', PD_DESPESA = '+QuotedStr(edtDespesa.Text)+', PD_VLTOTAL = '+QuotedStr(edtVlTotalPedido.Text)+', PD_OBS = '+QuotedStr(mmoObsPedido.Text)+' where PD_COD = '+QuotedStr(edtCodPedido.Text)+'');
                ExecSQL;
                Active := False;
                SQL.Clear;
                SQL.Add('Update produtos set p_estoque = '+QuotedStr(FloatToStr(vAtual))+', p_vlvenda = '+QuotedStr(edtVlPedido.Text)+' where p_cod = '+QuotedStr(edtCod.Text)+'');
                ExecSQL;
                edtEstoque.Text := FloatToStr(vAtual);
                edtValor.Text := edtVlPedido.Text;
                fConvertValor;
                fConvertValorPedido;
                fConvertVlTotalPedido;
                fConvertDespesa;
                Application.MessageBox('Registro Atualizado com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
             edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
             ShortDateFormat := 'dd/mm/yyyy';
          end
          else begin
             Application.MessageBox('O campo Código do Pedido não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmProdutos.btnDeletarClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: Administrador' then begin
       If PageControl1.ActivePage = TabSheet1 then begin
          If edtCod.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from pedidos where p_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from produtos where p_cod = '+ QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                end;
                btnLimparClick(Self);
                cbxProduto.Clear;
                FormCreate(Self);
                Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
          end
          else begin
             Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
       If PageControl1.ActivePage = TabSheet2 then begin
          If edtCod.Text <> '' then begin
             If Application.MessageBox('Excluir Registro?','MyShop - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
                With dmEnterprise.zqEnterprise do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Delete from pedidos where pd_cod = '+ QuotedStr(edtCodPedido.Text)+'');
                   ExecSQL;
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Update produtos set p_estoque = '+QuotedStr(edtEstoque.Text)+' where p_cod = '+QuotedStr(edtCod.Text)+'');
                   ExecSQL;
                end;
                edtCodPedido.Clear; edtQtd.Text := '0'; dtpData.Date := Date; edtVlPedido.Text := '0,00'; edtVlTotalPedido.Text := '0,00';
                mmoObsPedido.Clear;
                Application.MessageBox('Registro Excluido com Sucesso!','MyShop - Sucesso',MB_OK+MB_ICONINFORMATION);
             end;
          end
          else begin
             Application.MessageBox('O campo código do pedido não pode ser vazio! Selecione um registro para poder excluir.','MyShop - Atenção',MB_OK+MB_ICONWARNING);
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é de Usuário. Você não tem permissão para executar esse comando. Contate o Administrador do Sistema.','MyShop - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmProdutos.cbxProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    If Key = VK_RETURN then begin
       If cbxProduto.Text <> '' then begin
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select * from produtos where p_nome = '+QuotedStr(cbxProduto.Text)+'');
             Active := True;
             If dmEnterprise.zqEnterprise.RecordCount = 0 then begin
                ShowMessage('Produto não cadastrado.');
             end
             else begin
                edtCod.Text := FieldByName('p_cod').AsString;
                cbxProduto.Text := FieldByName('p_nome').AsString;
                edtCategria.Text := FieldByName('p_categoria').AsString;
                cbxUnidade.Text := FieldByName('p_unmedida').AsString;
                edtEstoque.Text := FieldByName('p_estoque').AsString;
                edtValor.Text := FieldByName('p_vlvenda').AsString;
                edtLucro.Text := FieldByName('p_lucro').AsString;
                mmObs.Text := FieldByName('p_obs').AsString;
                fFoto := CreateBlobStream(FieldByName('p_foto'),bmRead);
                If fFoto.Size > 0 then begin
                   Jpeg := TJPEGImage.Create;
                   Jpeg.LoadFromStream(fFoto);
                   Image1.Picture.Assign(Jpeg);
                end
                else begin
                   Image1.Picture.Assign(nil);
                end;
                Jpeg.Free;
                fFoto.Destroy;
             end;
          end;
          edtValor.Text := FormatCurr('0.00', StrToFloat(edtValor.Text));
       end
       else begin
          Application.MessageBox('O campo Nome não pode estar vazio!','MyShop - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end;
end;

procedure TfrmProdutos.DBGrid1DblClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    edtCod.Text := DBGrid1.SelectedField.Text;
    DBGrid1.DataSource.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from produtos where p_cod = '+QuotedStr(edtCod.Text)+'');
       Active := True;
       edtCod.Text := FieldByName('p_cod').AsString;
       cbxProduto.Text := FieldByName('p_nome').AsString;
       edtCategria.Text := FieldByName('p_categoria').AsString;
       cbxUnidade.Text := FieldByName('p_unmedida').AsString;
       edtEstoque.Text := FieldByName('p_estoque').AsString;
       edtValor.Text := FieldByName('p_vlvenda').AsString;
       edtLucro.Text := FieldByName('p_lucro').AsString;
       mmObs.Text := FieldByName('p_obs').AsString;
       edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
       fFoto := CreateBlobStream(FieldByName('p_foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          Image1.Picture.Assign(Jpeg);
       end
       else begin
          Image1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
    end;
    cbxProduto.SetFocus;
end;

procedure TfrmProdutos.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid1.DataSource.Enabled = True then begin
       DBGrid1.Hint := 'Para editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid1.Hint := '';
    end;
end;

procedure TfrmProdutos.edtVlTotalPedidoEnter(Sender: TObject);
var vQtd, vVlUni, vDespesa, vTotal : Double;
begin
    vQtd := StrToFloat(edtQtd.Text);
    vVlUni := StrToFloat(edtVlPedido.Text);
    vDespesa := StrToFloat(edtDespesa.Text);
    edtVlTotalPedido.Text := FloatToStr((vQtd*vVlUni)+vDespesa);
    vTotal := StrToFloat(edtVlTotalPedido.Text);
    edtVlPedido.Text := FloatToStr(vTotal/vQtd);
    edtVlPedido.Text := FormatCurr('0.00', StrToCurr(edtVlPedido.Text));
    edtDespesa.Text := FormatCurr('0.00', StrToCurr(edtDespesa.Text));
    edtVlTotalPedido.Text := FormatCurr('0.00', StrToCurr(edtVlTotalPedido.Text));
end;

procedure TfrmProdutos.btnCalculaLucroClick(Sender: TObject);
var vLucro, vValor : Double;
begin
    vLucro := StrToFloat(edtLucro.Text);
    vValor := StrToFloat(edtValor.Text);
    edtValor.Text := FloatToStr((vValor*vLucro/100)+vValor);
    edtValor.Text := FormatCurr('0.00', StrToCurr(edtValor.Text));
end;

procedure TfrmProdutos.TabSheet1Show(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    cbxProduto.SetFocus;
end;

procedure TfrmProdutos.TabSheet2Show(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
    dtpData.SetFocus;
end;

procedure TfrmProdutos.TabSheet3Show(Sender: TObject);
begin
    dmEnterprise.dsEnterprise.Enabled := False;
end;

procedure TfrmProdutos.DBGrid2DblClick(Sender: TObject);
var vEstoque, vQtd : Double;
begin
    edtCodPedido.Text := DBGrid2.SelectedField.Text;
    dmEnterprise.dsEnterprise.Enabled := False;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from pedidos where pd_cod = '+QuotedStr(edtCodPedido.Text)+'');
       Active := True;
       dtpData.Date := FieldByName('pd_data').AsDateTime;
       edtQtd.Text := FieldByName('pd_qtd').AsString;
       edtVlPedido.Text := FieldByName('pd_valor').AsString;
       edtVlTotalPedido.Text := FieldByName('pd_vltotal').AsString;
       mmoObsPedido.Text := FieldByName('pd_obs').AsString;
       edtVlPedido.Text := FormatCurr('0.00', StrToCurr(edtVlPedido.Text));
       edtVlTotalPedido.Text := FormatCurr('0.00', StrToCurr(edtVlTotalPedido.Text));
    end;
    vEstoque := StrToFloat(edtEstoque.Text);
    vQtd := StrToFloat(edtQtd.Text);
    edtEstoque.Text := FloatToStr(vEstoque-vQtd);
end;

procedure TfrmProdutos.DBGrid2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    If DBGrid2.DataSource.Enabled = True then begin
       DBGrid2.Hint := 'Para editar ou excluir um registo dê um Duplo clique no registro selecionado';
    end
    else begin
       DBGrid2.Hint := '';
    end;
end;

procedure TfrmProdutos.cbxProdutoSelect(Sender: TObject);
begin
    cbxProduto.Hint := 'Tecle Enter para consultar esse Produto';
end;

procedure TfrmProdutos.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If edtCod.Text <> '' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.Assign(nil);
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          iImagem := OpenPictureDialog1.FileName;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select p_cod, p_foto from produtos where p_cod = '+QuotedStr(edtCod.Text)+'');
             Active := True;
             Edit;
             TBlobField(FieldByName('p_foto')).LoadFromFile(iImagem);
             Post;
          end;
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','MyShop - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmProdutos.btnRemoverClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update produtos set p_foto = null where p_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','MyShop - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

end.
