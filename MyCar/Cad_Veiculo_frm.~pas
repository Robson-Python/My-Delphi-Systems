unit Cad_Veiculo_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Mask, ExtDlgs, Jpeg;

type
  TfrmCadVeiculo = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    OpenPictureDialog1: TOpenPictureDialog;
    btnNovo: TSpeedButton;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lblUf: TLabel;
    lblCpf: TLabel;
    lblCep: TLabel;
    edtProp: TLabeledEdit;
    edtEnd: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    mkeCpf: TMaskEdit;
    mkeCep: TMaskEdit;
    lblModel: TLabel;
    lblAno: TLabel;
    lblComb: TLabel;
    edtCor: TLabeledEdit;
    edtRenavam: TLabeledEdit;
    edtCidEmplac: TLabeledEdit;
    cbxModel: TComboBox;
    mkeAno: TMaskEdit;
    cbxComb: TComboBox;
    edtCod: TLabeledEdit;
    Label1: TLabel;
    cbxEspecie: TComboBox;
    Label2: TLabel;
    cbxCategoria: TComboBox;
    edtCapacidade: TLabeledEdit;
    edtChassi: TLabeledEdit;
    mmoObsCarro: TMemo;
    Label3: TLabel;
    Shape2: TShape;
    Panel2: TPanel;
    Image1: TImage;
    btnFoto: TBitBtn;
    btnRemover: TBitBtn;
    edtCodProp: TLabeledEdit;
    mmoObsProp: TMemo;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    mkePlaca: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    mkePlacaAnt: TMaskEdit;
    btnAlbum: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cbxModelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure btnAlbumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVeiculo: TfrmCadVeiculo;

implementation

uses DateUtils, Principal_frm, Carro_Comando_dm, DB, ZDataset,
  Photobook_frm;

{$R *.dfm}

function fBuscaCodCarro() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_cod from carros order by c_cod desc');
       Active := True;
       fBuscaCodCarro := FieldByName('c_cod').AsInteger;
    end;
end;

function fBuscaCodProp() : Integer;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_cod from proprietario order by p_cod desc');
       Active := True;
       fBuscaCodProp := FieldByName('p_cod').AsInteger;
    end;
end;

function vStatus () : String;
begin
    If frmCadVeiculo.RadioGroup1.ItemIndex = 0 then
       vStatus := 'SIM'
    else
       vStatus := 'NÃO'
end;

procedure TfrmCadVeiculo.btnSairClick(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       SQL.Clear;
       Active := False;
    end;
    Close;
end;

procedure TfrmCadVeiculo.btnLimparClick(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheet1;
    edtCod.Clear; edtCor.Clear; edtCapacidade.Clear; mkePlaca.Clear; mkePlacaAnt.Clear; edtRenavam.Clear; edtChassi.Clear; edtCidEmplac.Clear; edtCodProp.Clear; edtProp.Clear; edtEnd.Clear; edtBairro.Clear; edtCid.Clear;
    cbxModel.Text := ''; cbxEspecie.Text := ''; cbxComb.Text := ''; cbxCategoria.Text := ''; cbxUf.Text := '';
    mkeCpf.Clear; mkeCep.Clear; mkeAno.Clear;
    mmoObsCarro.Clear; mmoObsProp.Clear;
    RadioGroup1.ItemIndex := -1;
    Image1.Picture.Assign(nil);
    cbxModel.SetFocus;
    dmCarroComando.zqCarro.SQL.Clear;
end;

procedure TfrmCadVeiculo.FormShow(Sender: TObject);
begin
    cbxModel.SetFocus;
end;

procedure TfrmCadVeiculo.FormCreate(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros order by c_mmodelo');
       Active := True;
       while not Eof do begin
          cbxModel.Items.Add(FieldByName('c_mmodelo').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadVeiculo.btnInserirClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into carros (C_COD, C_MMODELO, C_ANO, C_ESP_TIPO, C_COMBS, C_CATEG, C_COR, C_CAPACIDADE, C_PLACA, C_PLACA_ANT, C_RENAV, C_CHASSI, C_CID_PL, C_FOTO, C_OBS) Values ('+QuotedStr(edtCod.Text)+', '+QuotedStr(cbxModel.Text)+', '+ QuotedStr(mkeAno.Text)+', '+ QuotedStr(cbxEspecie.Text)+', '+ QuotedStr(cbxComb.Text)+', '+ QuotedStr(cbxCategoria.Text)+', '+ QuotedStr(edtCor.Text)+', '+ QuotedStr(edtCapacidade.Text)+', '+ QuotedStr(mkePlaca.Text)+', '+ QuotedStr(mkePlacaAnt.Text)+', '+ QuotedStr(edtRenavam.Text)+', '+ QuotedStr(edtChassi.Text)+', '+ QuotedStr(edtCidEmplac.Text)+', '''', '+QuotedStr(mmoObsCarro.Text)+')');
          ExecSQL;
          Active := False;
          SQL.Clear;
          SQL.Add('Insert into proprietario (P_COD, C_COD, P_NOME, P_CPF, P_ENDERECO, P_BAIRRO, P_CIDADE, P_UF, P_CEP, P_STATUS, P_OBS) Values ('+QuotedStr(edtCodProp.Text)+', '+QuotedStr(edtCod.Text)+', '+ QuotedStr(edtProp.Text)+', '+ QuotedStr(mkeCpf.Text)+', '+ QuotedStr(edtEnd.Text)+', '+ QuotedStr(edtBairro.Text)+', '+ QuotedStr(edtCid.Text)+', '+ QuotedStr(cbxUf.Text)+', '+ QuotedStr(mkeCep.Text)+', '+ QuotedStr(vStatus)+', '+ QuotedStr(mmoObsProp.Text)+')');
          ExecSQL;
          Application.MessageBox('Registro Efetuado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnLimparClick(Sender);
          cbxModel.Clear;
          FormCreate(Self);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode estar vazio!','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If cbxModel.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from carros, proprietario where c_mmodelo = '+ QuotedStr(cbxModel.Text)+' and carros.c_cod = proprietario.c_cod');
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','MyCar - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxModel.SetFocus;
          end
          else begin
             edtCod.Text := FieldByName ('C_COD').AsString;
             cbxModel.Text := FieldByName ('C_MMODELO').AsString;
             mkeAno.Text := FieldByName ('C_ANO').AsString;
             cbxEspecie.Text := FieldByName ('C_ESP_TIPO').AsString;
             cbxComb.Text := FieldByName ('C_COMBS').AsString;
             cbxCategoria.Text := FieldByName ('C_CATEG').AsString;
             edtCor.Text := FieldByName ('C_COR').AsString;
             edtCapacidade.Text := FieldByName ('C_CAPACIDADE').AsString;
             mkePlaca.Text := FieldByName ('C_PLACA').AsString;
             mkePlacaAnt.Text := FieldByName ('C_PLACA_ANT').AsString;
             edtRenavam.Text := FieldByName ('C_RENAV').AsString;
             edtChassi.Text := FieldByName ('C_CHASSI').AsString;
             edtCidEmplac.Text := FieldByName ('C_CID_PL').AsString;
             mmoObsCarro.Text := FieldByName ('C_OBS').AsString;
             edtCodProp.Text := FieldByName ('P_COD').AsString;
             edtProp.Text := FieldByName ('P_NOME').AsString;
             mkeCpf.Text := FieldByName ('P_CPF').AsString;
             edtEnd.Text := FieldByName ('P_ENDERECO').AsString;
             edtBairro.Text := FieldByName ('P_BAIRRO').AsString;
             edtCid.Text := FieldByName ('P_CIDADE').AsString;
             cbxUf.Text := FieldByName ('P_UF').AsString;
             mkeCep.Text := FieldByName ('P_CEP').AsString;
             mmoObsProp.Text := FieldByName ('P_OBS').AsString;
             If FieldByName('p_status').AsString = 'SIM' then
                RadioGroup1.ItemIndex := 0
             else
                RadioGroup1.ItemIndex := 1;
             fFoto := CreateBlobStream(FieldByName('c_foto'),bmRead);
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
    end
    else begin
       Application.MessageBox('Selcione um Veículo para  consultar.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.cbxModelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Sender);
end;

procedure TfrmCadVeiculo.btnAtualizarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update carros set C_MMODELO = '+QuotedStr(cbxModel.Text)+', C_ANO = '+QuotedStr(mkeAno.Text)+', C_ESP_TIPO = '+QuotedStr(cbxEspecie.Text)+', C_COMBS = '+QuotedStr(cbxComb.Text)+', C_CATEG = '+QuotedStr(cbxCategoria.Text)+', C_COR = '+QuotedStr(edtCor.Text)+', C_CAPACIDADE = '+QuotedStr(edtCapacidade.Text)+', C_PLACA = '+QuotedStr(mkePlaca.Text)+', C_PLACA_ANT = '+QuotedStr(mkePlacaAnt.Text)+', C_RENAV = '+QuotedStr(edtRenavam.Text)+', C_CHASSI = '+QuotedStr(edtChassi.Text)+', C_CID_PL = '+QuotedStr(edtCidEmplac.Text)+', C_OBS = '+QuotedStr(mmoObsCarro.Text)+' where c_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Active := False;
          SQL.Clear;
          SQL.Add('Update proprietario set P_NOME = '+QuotedStr(edtProp.Text)+', P_CPF = '+QuotedStr(mkeCpf.Text)+', P_ENDERECO = '+QuotedStr(edtEnd.Text)+', P_BAIRRO = '+QuotedStr(edtBairro.Text)+', P_CIDADE = '+QuotedStr(edtCid.Text)+', P_UF = '+QuotedStr(cbxUf.Text)+', P_CEP = '+QuotedStr(mkeCep.Text)+', P_STATUS = '+QuotedStr(vStatus)+', P_OBS = '+QuotedStr(mmoObsProp.Text)+' where c_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Application.MessageBox('Registro Atualizado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
          btnSelecionarClick(Sender);
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode ser vazio! Selecione um veículo para atualizar dados.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.btnDeletarClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       If Application.MessageBox('Excluir Registro?','MyCar - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from album where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from revisao where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from pecas where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from manutencao where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from contas where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from compra_venda where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from proprietario where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Active := False;
             SQL.Clear;
             SQL.Add('Delete from carros where c_cod = '+ QuotedStr(edtCod.Text)+'');
             ExecSQL;
             Application.MessageBox('Registro Deletado com Sucesso!','MyCar - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxModel.Clear;
             FormCreate(Self);
             FormShow(Self);
          end;
       end;
    end
    else begin
       Application.MessageBox('O campo Código não pode ser vazio! Selecione um veículo para poder excluir.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If edtCod.Text <> '' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.Assign(nil);
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          iImagem := OpenPictureDialog1.FileName;
          With dmCarroComando.zqCarro do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select c_cod, c_foto from carros where c_cod = '+QuotedStr(edtCod.Text)+'');
             Active := True;
             Edit;
             TBlobField(FieldByName('c_foto')).LoadFromFile(iImagem);
             Post;
          end;
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','MyCar - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmCadVeiculo.btnRemoverClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       With dmCarroComando.zqCarro do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update carros set c_foto = null where c_cod = '+QuotedStr(edtCod.Text)+'');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','MyCar - Atenção',MB_OK+MB_ICONERROR);
    end;
end;

procedure TfrmCadVeiculo.btnNovoClick(Sender: TObject);
var nNovoCarro, nNovoProp : Integer;
begin
    btnLimparClick(Sender);
    nNovoCarro := fBuscaCodCarro + 1;
    edtCod.Text := IntToStr(nNovoCarro);
    nNovoProp := fBuscaCodProp + 1;
    edtCodProp.Text := IntToStr(nNovoProp);
    cbxModel.SetFocus;
end;

procedure TfrmCadVeiculo.TabSheet2Enter(Sender: TObject);
begin
    edtProp.SetFocus
end;

procedure TfrmCadVeiculo.btnAlbumClick(Sender: TObject);
begin
    If edtCod.Text <> '' then begin
       Try
         Application.CreateForm(TfrmPhotobook, frmPhotobook);
         frmPhotobook.ShowModal;
       Finally
            frmPhotobook.Free;
       end;
    end
    else begin
       Application.MessageBox('O campo código não pode ser vazio! Selecione um registro para visualizar o álbum.','MyCar - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

end.
